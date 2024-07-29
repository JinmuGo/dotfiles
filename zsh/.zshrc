ZSH="$HOME/.config/zsh"

source $ZSH/init.zsh

source $ZSH/plugins/index.zsh

source $ZSH/aliases/custom.aliases.zsh
source $ZSH/aliases/valgrind.zsh

# pnpm
export PNPM_HOME="/Users/jinmugo/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
