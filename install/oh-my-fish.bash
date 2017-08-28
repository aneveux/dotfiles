#!/bin/bash
test -d $HOME/.local/share/omf || (cd && curl -L https://get.oh-my.fish | fish)
