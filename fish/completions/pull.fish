function __complete_pull --description "build autocompletion for build command"
  find ~/git/ -name '.git' -type d -printf '%P\n' | xargs -n1 dirname | awk '{print $0 "\tGIT"}' 
end

complete -c pull -x -a '(__complete_pull)'
