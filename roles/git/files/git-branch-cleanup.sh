#!/bin/sh

git branch --merged | grep -E -v "(^\*|master)" | xargs git branch -d
git fetch --prune origin
git fetch --prune aneveux

git branch -r --merged | grep -E -v "(^\*|master)" | xargs -n 1 git push --delete aneveux