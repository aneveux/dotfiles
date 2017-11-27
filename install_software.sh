#!/bin/sh

# Basics
sudo -E pacman -S --needed yaourt

# Window Manager
sudo -E pacman -S --needed i3-theme-dark i3-gaps i3lock lxappearance-gtk3 rofi

# Terminal
sudo -E pacman -S --needed zsh zsh-completions fish thefuck terminator termite
chsh -s /usr/bin/fish

# Utils
sudo -E pacman -S --needed acpi cowsay diff-so-fancy dmenu dropbox dunst feh filezilla firefox gnupg gpa htop httpie keepassxc lolcat nitrogen pacli playerctl ranger sysstat termite thunderbird tmux tree w3m workrave xclip

# Tooling
sudo -E pacman -S --needed ansible corkscrew docker docker-compose docker-machine git jq pgadmin4 python qutebrowser ruby ruby-docs tig

# Editors
sudo -E pacman -S --needed atom cherrytree mousepad vim

# Themes
sudo -E pacman -S --needed numix-manjaro-themes numix-reborn-icon-themes

# AUR
yaourt --needed --noconfirm -S franz-bin i3blocks-git keybase-bin ruby-jekyll ruby-jekyll-gist ruby-jekyll-paginate ruby-jekyll-sitemap ruby-jekyll-watch signal spotify vivaldi xflux
