set -xg SHELL /usr/bin/fish
set -xg VISUAL vim
set -xg MANPAGER 'less'
set -xg LC_ALL en_US.UTF-8
set -xg GPG_TTY (tty)

# sdkman
set -xg PATH $PATH (find $HOME/.sdkman/candidates/*/current/bin -maxdepth 0)

set -xg JAVA_HOME $HOME/.sdkman/candidates/java/current/
set -xg MAVEN_HOME $HOME/.sdkman/candidates/maven/current/
set -xg GRADLE_HOME $HOME/.sdkman/candidates/gradle/current/
set -xg KOTLIN_HOME $HOME/.sdkman/candidates/kotlin/current/
set -xg SCALA_HOME $HOME/.sdkman/candidates/scala/current/

begin
    set --local AUTOJUMP_PATH /usr/share/autojump/autojump.fish
    if test -e "$AUTOJUMP_PATH"
        source $AUTOJUMP_PATH
    end
end

# Bare bind statements in config.fish won't have any effect because it is sourced before the default keybindings are setup
