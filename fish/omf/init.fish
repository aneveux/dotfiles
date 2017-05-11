set -xg VISUAL vim
set -xg LC_ALL en_US.UTF-8
set -xg GPG_TTY (tty)

# sdkman
set -xg PATH $PATH (find ~/.sdkman/candidates/*/current/bin -maxdepth 0)

begin
    set --local AUTOJUMP_PATH /usr/share/autojump/autojump.fish
    if test -e $AUTOJUMP_PATH
        source $AUTOJUMP_PATH
    end
end
