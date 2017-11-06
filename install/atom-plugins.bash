#!/bin/bash
plugins=(atom-beautify atom-jinja2 autoclose-html busy-signal clipboard-plus color-picker docblockr editorconfig file-icons fonts git-plus highlight-selected intentions isotope-ui language-ansible language-fish-shell linter linter-ui-default merge-conflicts monokai pigments project-manager ssh-config todo-show)
for plugin in "${plugins[@]}"
do
	if ! test -f $HOME/.atom/packages/$plugin; then
		apm install $plugin
	fi
done
