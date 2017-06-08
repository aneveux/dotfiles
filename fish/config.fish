set -xg SHELL /usr/bin/fish
set -xg VISUAL vim
set -xg MANPAGER 'less -X'
set -xg LC_ALL en_US.UTF-8
set -xg GPG_TTY (tty)

# sdkman
set -xg PATH $PATH (find $HOME/.sdkman/candidates/*/current/bin -maxdepth 0)

begin
    set --local AUTOJUMP_PATH /usr/share/autojump/autojump.fish
    if test -e "$AUTOJUMP_PATH"
        source $AUTOJUMP_PATH
    end
end

# Bare bind statements in config.fish won't have any effect because it is sourced before the default keybindings are setup
