#!/bin/bash
if !type ansible-vault > /dev/null 2> /dev/null ; then
	pip install ansible-vault
fi
