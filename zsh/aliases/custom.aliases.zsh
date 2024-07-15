### --- custom-alias ------------------------------------------------

#alias cat="bat"
alias vi="nvim"
alias ls="ls"
alias sz="source $ZSH/.zshrc"

### CD
alias ~="cd ~"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias ic="cd /Users/jinmugo/Library/Mobile\ Documents/com~apple~CloudDocs"
alias obsi="$HOME/obs_jgo/"
alias muta="$HOME/obs_jgo/Atlas/Maps/mutaee_obsi/"
alias blog="$HOME/Programming/blog/"
alias conf="$HOME/.config/"
alias cuvi="$HOME/Programming/42cuvi"

### VIM
alias viz="vi $ZSH/.zshrc"
alias viza="vi $ZSH/aliases/custom.aliases.zsh"
alias vizpi="vi $ZSH/plugins/index.zsh"
alias vizi="vi $ZSH/init.zsh"
alias viw="vi $HOME/.config/wezterm/wezterm.lua"
alias vin="vi $HOME/.config/nvim/init.vim"
alias vit="vi $HOME/.config/tmux/tmux.conf"
alias vitr="vi $HOME/.config/tmux/tmux.reset.conf"
alias vil="vi $HOME/.config/lvim/config.lua"
alias vist="vi $HOME/.config/starship/starship.toml"
alias vis="vi $HOME/.ssh/config"

### GIT
alias vig="vi ~/.gitconfig"
alias gd="git diff"
alias gpf="git push -f"
alias gds="git diff --staged"
alias gls="git logs"
alias gsa="git submodule add"
alias gf="git fetch"

# LS
alias l="ls"
alias ll="ls -l"
alias la="ls -a"
alias lla="ls -al"

### MAKE
alias ma="make all"
alias mr="make re"
alias mb="make bonus"
alias cp="cp -i"
alias rm="rm -i"
alias rf="rm -f"
alias md="make dev"
alias ma="make all"
alias mc="make clean"
alias mf="make fclean"
alias mr="make re"
alias mdr="make dre"
alias mfm="make format"

### NPM
alias nrb="npm run build"
alias nrd="npm run dbuild"
alias nrl="npm run lint"
alias nrd="npm run dev"
alias nrs="npm run start"
alias nrf="npm run format"
alias ni="npm i"
alias pi="ssh jgopi"
alias ssa="ssh assets.jgo.me"

### zsh-history-substring-search.zsh
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

function lt {
  local level=${1:-2}

  eza --tree --level=${level} --long --color=always | less -R
}

function a() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
