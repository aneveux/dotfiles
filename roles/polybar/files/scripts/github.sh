#!/bin/sh
notifications=$(gh api notifications | jq '. | length')
echo " $notifications"