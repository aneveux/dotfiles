export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'

export MANPAGER='most'
export PAGER='most'
export SHELL='/usr/bin/zsh'

export BROWSER='firefox'
export EDITOR='nvim'
export VISUAL='nvim'
export TEXT_EDITOR='nvim'

# -----------------------------------------------------------
# java exports
# -----------------------------------------------------------

export JAVA_OPTS='-Xms128m -Xmx256m'

# -----------------------------------------------------------
# path
# -----------------------------------------------------------

typeset -U PATH path
path=("$HOME/.local/bin" "$HOME/bin" "$HOME/.cargo/bin" "$HOME/.local/share/JetBrains/Toolbox/scripts" "$path[@]" "$(ruby -e 'puts Gem.user_dir')/bin")
export PATH

export GPG_TTY=$TTY
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

if asdf current java > /dev/null 2>&1
then
    export JAVA_HOME=$(asdf where java)
fi
