#!/bin/bash
test -d $HOME/.spf13-vim-3/ || (cd && curl http://j.mp/spf13-vim3 -L -o - | sh)
