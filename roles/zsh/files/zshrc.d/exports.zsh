#                    /)
#           /\___/\ ((
#           \`@_@'/  ))
#           {_:Y:.}_//
# ----------{_}^-'{_}-------------------------
# ZSH Exports.
#

# -----------------------------------------------------------
# system exports
# -----------------------------------------------------------

export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'

export MANPAGER='most'
export PAGER='most'
export SHELL='/usr/bin/zsh'

export BROWSER='brave'
export EDITOR='vim'
export VISUAL='vim'
export TEXT_EDITOR='vim'

# -----------------------------------------------------------
# java exports
# -----------------------------------------------------------

export JAVA_OPTS='-Xms128m -Xmx256m'

# -----------------------------------------------------------
# path
# -----------------------------------------------------------

typeset -U PATH path
path=("$HOME/.local/bin" "$HOME/bin" "$HOME/.cargo/bin" "$path[@]" "$(ruby -e 'puts Gem.user_dir')/bin")
export PATH

export GPG_TTY=$TTY
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

if asdf current java > /dev/null 2>&1
then
    export JAVA_HOME=$(asdf where java)
fi