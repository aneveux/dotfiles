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

export GPG_TTY=$(tty)

export BROWSER='firefox'
export EDITOR='vim'
export VISUAL='vim'
export POWERLINE_CONFIG_COMMAND='powerline-config'

# -----------------------------------------------------------
# java exports
# -----------------------------------------------------------

export JAVA_OPTS='-Xms128m -Xmx256m'

# -----------------------------------------------------------
# docker exports
# -----------------------------------------------------------

export DOCKER_HOST='tcp://127.0.0.1:2375'

# -----------------------------------------------------------
# ansible exports
# -----------------------------------------------------------

export ANSIBLE_VAULT_PASSWORD_FILE=~/.ansible-vault/default_vault_pass

# -----------------------------------------------------------
# path
# -----------------------------------------------------------

export PATH="~/.local/bin:${PATH}"
export PATH="${PATH}:$(ruby -e 'puts Gem.user_dir')/bin"

# -----------------------------------------------------------
# spaceship theme options
# -----------------------------------------------------------

export SPACESHIP_PROMPT_SEPARATE_LINE=false
export SPACESHIP_PROMPT_ADD_NEWLINE=false
