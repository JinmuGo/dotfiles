### INIT

autoload -Uz compinit && compinit
export PATH=$HOME/bin:/usr/local/bin:/opt/bin:/opt/homebrew/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH

export FPATH=/opt/homebrew/bin/eza:$FPATH
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Check that the function `starship_zle-keymap-select()` is defined.
# xref: https://github.com/starship/starship/issues/3418
type starship_zle-keymap-select >/dev/null || \
  {
    eval "$(starship init zsh)"
  }

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jinmugo/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/jinmugo/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jinmugo/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/jinmugo/google-cloud-sdk/completion.zsh.inc'; fi

### ZSH HOME
export ZSH=$HOME/.config/zsh
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

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
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jinmugo/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/jinmugo/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jinmugo/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/jinmugo/google-cloud-sdk/completion.zsh.inc'; fi
