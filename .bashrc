#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# if [[ $DISPLAY ]]; then
#     # If not running interactively, do not do anything
#     [[ $- != *i* ]] && return
#     if [[ -z "$TMUX" ]]; then
#         tmux attach -t Main || tmux new -s Main
#     fi
# fi

eval "$(starship init bash)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Prepending TexLive to PATH
export PATH=/usr/local/texlive/2023/bin/x86_64-linux:$PATH
