ZSH="$HOME/.config/zsh"

source $ZSH/init.zsh

source $ZSH/plugins/index.zsh

source $ZSH/aliases/custom.aliases.zsh
source $ZSH/aliases/valgrind.zsh

source $HOME/.config/scripts/init.sh
source $HOME/.config/scripts/pnpm.sh

# pnpm
export PNPM_HOME="/Users/jgo/goinfre/node/bin"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
