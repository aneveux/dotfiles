#!/bin/bash
function install_fira {
	for type in Bold Light Medium Regular Retina; do
	    wget -O ~/.fonts/FiraCode-${type}.ttf \
	    "https://github.com/tonsky/FiraCode/blob/master/distr/ttf/FiraCode-${type}.ttf?raw=true";
	done

	fc-cache -f
}

test -e ~/.fonts/FiraCode-Regular.ttf || install_fira