#!/bin/fish

set -l cmd $argv[1]
set -l project $argv[2]

test -d $project/.git
  or exit 0

clear
colorize blue -n "======= "
colorize -u blue -n (basename "$project")
colorize blue " ======="

echo
git -C $project $cmd

echo
colorize blue 'starting interactive shell'
cd $project
fish -i
