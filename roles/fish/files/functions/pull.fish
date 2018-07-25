function pull --description "git pull a project"
  set -l path
 
  set -q $argv[1]
  if test $status -eq 0
    set path (pwd)
  else
    set path "$HOME/git/$argv[1]"
  end
  set -e argv[1]
 
  echo "git pull $path"

  git -C $path pull $argv
end
