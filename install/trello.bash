#!/bin/bash
if hash gem 2> /dev/null; then
	if [[ !$(gem list | grep 3llo) ]]; then
		gem install 3llo
	fi
fi	     
