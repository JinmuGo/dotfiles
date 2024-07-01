### --- plug-in ------------------------------------------------
local ZSH_PLUGINS=$ZSH/plugins

source $ZSH_PLUGINS/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH_PLUGINS/zsh-git/git.plugin.zsh
source $ZSH_PLUGINS/zsh-tmux/tmux.plugin.zsh
source $ZSH_PLUGINS/zsh-docker/zsh-docker.plugin.zsh
source $ZSH_PLUGINS/zsh-docker-compose/docker-compose.plugin.zsh
source $ZSH_PLUGINS/zsh-fzf/fzf.plugin.zsh
source $ZSH_PLUGINS/zsh-history-substring-search/zsh-history-substring-search.zsh
source $ZSH_PLUGINS/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source $ZSH_PLUGINS/zsh-kubectl/kubectl.plugin.zsh

eval "$(zoxide init zsh)"

fpath=($ZSH_PLUGINS/zsh-completions/src $fpath)

