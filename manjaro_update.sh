#!/bin/zsh
sudo pacman-mirrors -g -c France
sudo test -f /var/lib/pacman/db.lck && sudo rm /var/lib/pacman/db.lck
sudo pacman -Syu
