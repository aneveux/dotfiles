# Keeping some general purpose environment variables here.
# Will keep all "system-related" variables in that file.

set -xg SHELL /usr/bin/fish
set -xg VISUAL vim
set -xg EDITOR vim
set -xg MANPAGER 'less'
set -xg LC_ALL en_US.UTF-8
set -xg GPG_TTY (tty)
set -xg FISH_HOME $HOME/.config/fish/

begin
    set --local AUTOJUMP_PATH /usr/share/autojump/autojump.fish
    if test -e "$AUTOJUMP_PATH"
        source $AUTOJUMP_PATH
    end
end

# Bare bind statements in config.fish won't have any effect because it is sourced before the default keybindings are setup
