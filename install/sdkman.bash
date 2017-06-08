#!/bin/bash
type sdk > /dev/null 2> /dev/null || (cd && curl -s "https://get.sdkman.io" | bash)
