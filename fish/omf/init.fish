# In my configuration, init.fish contains:
# - Every theme related variable
# - Every key-bindings configuration
# - Some local scripts to load while fish is starting
# - All my exports and shortcuts

# Reset to default key bindings (I don't like the vim stuff in my shell)

fish_default_key_bindings

# Load some local functions and variables

load-local

# All my custom exports for environment variables.

# SDK Man Exports for all binaries to be in the PATH
set -xg PATH $PATH (find $HOME/.sdkman/candidates/*/current/bin -maxdepth 0)

# Manual Exports for all binaries from SDK Man
# Not taken into account by fish shell by default apparently
# So doing that manually here :)

set -xg JAVA_HOME $HOME/.sdkman/candidates/java/current/
set -xg MAVEN_HOME $HOME/.sdkman/candidates/maven/current/
set -xg GRADLE_HOME $HOME/.sdkman/candidates/gradle/current/
set -xg KOTLIN_HOME $HOME/.sdkman/candidates/kotlin/current/
set -xg SCALA_HOME $HOME/.sdkman/candidates/scala/current/

# Java related stuff

set -xg JAVA_OPTS '-Xms128m -Xmx256m'

# Docker related stuff

set -xg DOCKER_DEFAULT tcp://127.0.0.1:2375
set -xg DOCKER_HOST $DOCKER_DEFAULT

# Ansible related stuff

set -xg ANSIBLE_VAULT_PASSWORD_FILE ~/.ansible-vault/default_vault_pass

# Having gems in the PATH now

set -xg PATH $PATH (ruby -rubygems -e 'puts Gem.user_dir')/bin

# All the abbreviations I'm using for fish.

# Easy clipboard management

abbr setclip "xclip -selection c"
abbr getclip "xclip -selection c -o"

# Easy navigation

abbr dl "cd ~/Downloads"
abbr dotfiles "cd ~/dotfiles"
abbr dt "cd ~/Desktop"
abbr g "cd ~/git"
abbr tools "cd ~/tools"

function ...
  cd ../..
end

function ....
  cd ../../..
end

function .....
  cd ../../../..
end

function ......
  cd ../../../../..
end
