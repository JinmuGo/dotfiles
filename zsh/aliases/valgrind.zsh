alpine()
{
	local image_name="$USER""_alpine"
	local volume_host=$HOME
	local volume_container=/home/$USER

	if ! docker info > /dev/null 2>&1; then
		echo -n "You need the Docker daemon. Do you want to run it? [y/n] "
		read yn
		case $yn in
			[Yy]* )
				local avail=$(df ~ | grep $HOME | awk '{print $4}')
				local require=$(bc <<< "2*1024*1024")
				if ! bc <<< "$avail < $require"; then
					echo "No space left on device at least 2GB"
					return 1
				fi
				open -a docker
				echo "Docker daemon waiting..."
				until docker info > /dev/null 2>&1; do sleep 1; done
				;;
			*)
				return 1
				;;
		esac
	fi
	case "$1" in
		clean)
			if docker image rm -f $image_name; then
				return 1
			fi
			docker builder prune -af
			;;

		build)
			docker build -t $image_name - << EOF
FROM alpine:latest

ENV LANG=C.UTF-8

RUN apk update \
		&& apk upgrade \
		&& apk add --no-cache \
				man-db \
				man-pages-posix \
				vim \
				git \
				gcc \
				g++ \
				make \
				valgrind \
				pipx \
				bash \
		&& pipx install norminette \
		&& pipx ensurepath \
		&& { \
				echo 'alias vi="vim"'; \
				echo 'alias ls="ls -F"'; \
				echo 'alias norm="norminette -R CheckForbiddenSourceHeader"'; \
				echo 'alias valgrind="valgrind --leak-check=full"'; \
		   } >> /etc/profile

WORKDIR $volume_container
CMD ["/bin/ash", "-l"]
EOF
			echo "custom image $image_name build success!"
			echo "Run '$0 exec [source_home]'"
			;;

		exec)
			if [ ! -z "$2" ]; then
				if [ ! -d "$2" ]; then
					echo "no such directory: $2"
					return 1
				fi
				cd "$2" && volume_host=$(pwd); cd -
			fi
			docker run \
				-u 0 \
				-it \
				--rm \
				-v $volume_host:$volume_container \
				-v $HOME/.vimrc:/root/.vimrc \
				$image_name
			;;
		*)
			echo "Usage: $0 [clean | build | exec]"
			echo "    $ $0 clean"
			echo "    $ $0 build"
			echo "    $ $0 exec [source_home]"
			return 1
		;;
	esac
}
