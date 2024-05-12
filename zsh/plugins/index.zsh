### --- plug-in ------------------------------------------------

ZSH_PLUGINS=$ZSH/plugins

source $ZSH_PLUGINS/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH_PLUGINS/zsh-git/git.plugin.zsh
source $ZSH_PLUGINS/zsh-tmux/tmux.plugin.zsh
source $ZSH_PLUGINS/zsh-docker/zsh-docker.plugin.zsh
source $ZSH_PLUGINS/zsh-docker-compose/docker-compose.plugin.zsh
source $ZSH_PLUGINS/zsh-fzf/fzf.plugin.zsh
source $ZSH_PLUGINS/zsh-history-substring-search/zsh-history-substring-search.zsh
source $ZSH_PLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


fpath=($ZSH_PLUGINS/zsh-completions/src $fpath)
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

