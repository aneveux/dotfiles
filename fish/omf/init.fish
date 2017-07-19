set -xg JAVA_OPTS '-Xms128m -Xmx256m'
set -xg DOCKER_DEFAULT tcp://127.0.0.1:2375 
set -xg DOCKER_HOST $DOCKER_DEFAULT

set -xg ANSIBLE_VAULT_PASSWORD_FILE ~/.ansible-vault/default_vault_pass

abbr setclip "xclip -selection c"
abbr getclip "xclip -selection c -o"

abbr dl "cd ~/Downloads"
abbr dotfiles "cd ~/dotfiles"

# bobthefish options
set -g theme_powerline_fonts yes
set -g theme_nerd_fonts yes
set -g theme_display_docker_machine yes
set -g theme_display_vi no
set -g theme_display_date yes
set -g theme_color_scheme gruvbox

fish_default_key_bindings