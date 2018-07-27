#                    /)
#           /\___/\ ((
#           \`@_@'/  ))
#           {_:Y:.}_//
# ----------{_}^-'{_}-------------------------
# ZSH Aliases.
#

# -----------------------------------------------------------
# navigation
# -----------------------------------------------------------

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias -- -='cd -'

# -----------------------------------------------------------
# shortcuts
# -----------------------------------------------------------

alias d='cd ~/Dropbox'
alias dl='cd ~/Downloads'
alias dt='cd ~/Desktop'
alias g='cd ~/git'
alias tools='cd ~/tools'

# -----------------------------------------------------------
# ls aliases
# -----------------------------------------------------------

alias l='ls -lF --color=auto'
alias la='ls -laF --color=auto'
alias ls='ls -l --color=auto'
alias ll='ls -Al --color=auto'

# -----------------------------------------------------------
# grep aliases
# -----------------------------------------------------------

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# -----------------------------------------------------------
# tools aliases
# -----------------------------------------------------------

alias vi='vim'
alias compose='docker-compose'
alias cat='bat'

# -----------------------------------------------------------
# misc aliases
# -----------------------------------------------------------

alias cp='cp -i'
alias df='df -h'
alias free='free -m'
alias setclip='xclip -selection c'
alias getclip='xclip -selection c -o'
alias commit='gitmoji -c'
