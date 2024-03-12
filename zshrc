export ZSH="$HOME/.oh-my-zsh"
export VI_MODE_SET_CURSOR=true
# export KEYTIMEOUT=1

ZSH_THEME="bira"

plugins=(git z zsh-autosuggestions zsh-vi-mode)

source $ZSH/oh-my-zsh.sh

alias vim="nvim"

function acp() {
  git add .
  git commit -m "$1"
  git push
}