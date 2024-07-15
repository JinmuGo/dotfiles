### INIT

autoload -Uz compinit && compinit
export PATH=$HOME/bin:/usr/local/bin:/opt/bin:/opt/homebrew/bin:$PATH:$HOME/.local/bin
export FPATH=/opt/homebrew/bin/eza:$FPATH
export PATH=$HOME/goinfre/node/bin:$PATH

defaults write -g ApplePressAndHoldEnabled -bool false

export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Check that the function `starship_zle-keymap-select()` is defined.
# xref: https://github.com/starship/starship/issues/3418
type starship_zle-keymap-select >/dev/null || \
  {
    eval "$(starship init zsh)"
  }

### ZSH HOME
export ZSH=$HOME/.config/zsh
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

source $ZSH/functions/index.zsh
### EDITOR
export EDITOR="/opt/homebrew/bin/nvim"

### ---- history config -------------------------------------
export HISTFILE=$ZSH/.zsh_history

# How many commands zsh will load to memory.
export HISTSIZE=10000

# How many commands history will save on file.
export SAVEHIST=10000

# History won't save duplicates.
setopt HIST_IGNORE_ALL_DUPS

# History won't show duplicates on search.
setopt HIST_FIND_NO_DUPS

# auto cd
setopt AUTO_CD

#### bindkey

bindkey '  ' autosuggest-accept
bindkey ";3D" backward-word
bindkey ";3C" forward-word

