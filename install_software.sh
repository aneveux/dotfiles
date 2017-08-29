#!/bin/sh

# Basics
sudo -E pacman -S --needed yaourt

# Window Manager
sudo -E pacman -S --needed  i3-theme-dark i3-wm i3blocks i3lock lxappearance-gtk3 rofi

# Terminal
sudo -E pacman -S --needed zsh zsh-completions fish thefuck terminator termite
chsh -s /usr/bin/fish

# Utils
sudo -E pacman -S --needed acpi compton cowsay dropbox dunst feh filezilla firefox gnupg gpa htop httpie keepassxc lolcat nitrogen playerctl ranger sysstat thunderbird tmux tree w3m workrave xclip

# Tooling
sudo -E pacman -S --needed ansible corkscrew docker docker-compose docker-machine git jq pgadmin3 ruby ruby-docs

# Editors
sudo -E pacman -S --needed atom cherrytree gvim vim 

# Themes
sudo -E pacman -S --needed numix-manjaro-themes numix-reborn-icon-themes

# AUR
yaourt --needed --noconfirm -S franz-bin ruby-jekyll ruby-jekyll-gist ruby-jekyll-paginate ruby-jekyll-sitemap ruby-jekyll-watch signal spotify xflux
