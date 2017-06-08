#!/bin/bash
test -f /var/lib/pacman/db.lck && sudo rm /var/lib/pacman/db.lck
sudo -E pacman-mirrors -g -c France
sudo -E pacman -Syu
