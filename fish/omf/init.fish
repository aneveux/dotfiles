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

set -xg JAVA_OPTS '-Xms128m -Xmx256m'
set -xg DOCKER_DEFAULT tcp://127.0.0.1:2375 
set -xg DOCKER_HOST $DOCKER_DEFAULT

set -xg ANSIBLE_VAULT_PASSWORD_FILE ~/.ansible-vault/default_vault_pass

set -xg EDITOR vim
set -xg MANPAGER 'less -X'

abbr setclip "xclip -selection c"
abbr getclip "xclip -selection c -o"