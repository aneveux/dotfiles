#!/bin/bash
test -d $HOME/.oh-my-zsh/ || (cd && sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)")
