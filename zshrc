export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="bira"

plugins=(git z zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

function acp() {
  git add .
  git commit -m "$1"
  git push
}