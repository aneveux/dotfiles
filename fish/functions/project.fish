function project -a project_name --description "Interact with your projects"
  set -l path

  # Erase the first parameter as it's the project_name
  set -e argv[1]

  if test -d "$HOME/git/$project_name"
    set path "$HOME/git/$project_name"
  end

  set -q $argv[1]
  if test $status -eq 0
    colorize -iu blue "goto $path"
    cd $path
  else
    colorize -iu blue "In $path -> $argv"
    fish -c "cd $path; and $argv"
  end
end
