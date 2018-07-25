function project -a project --description "Interact with your projects"
  set -l path
  set PROJECTS $HOME/git
  # Erase the first parameter as it's the project
  set -e argv[1]

  for project_dir in $PROJECTS
    if test -d "$project_dir/$project"
      set path "$project_dir/$project"
      break
    end
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