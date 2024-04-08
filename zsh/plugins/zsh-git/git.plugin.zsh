function git {
  if [[ $# -gt 0 ]]; then
    command git "$@"
  else
    command git status
  fi
}

alias g='git'
alias ga='git add'
alias gcl='git clone --recurse-submodules'
alias gl='git pull'
alias gp='git push'
alias grs='git restore'
alias gs='git status'
