#!/bin/bash
if !type pip > /dev/null 2> /dev/null ; then
	curl -s https://bootstrap.pypa.io/get-pip.py | python
fi
