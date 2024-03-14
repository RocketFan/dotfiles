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

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/$USER/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/$USER/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/$USER/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/$USER/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

