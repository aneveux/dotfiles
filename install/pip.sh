#!/bin/bash
if !type pip > /dev/null 2> /dev/null ; then
	curl -O https://bootstrap.pypa.io/get-pip.py && sudo python get-pip.py && rm get-pip.py
fi
