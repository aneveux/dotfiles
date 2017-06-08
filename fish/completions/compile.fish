function __complete_comp --description "build autocompletion for project command"
  find ~/git/ -name 'pom.xml' -type f -printf '%P\n' | xargs -n1 dirname | awk '{print $0 "\tMVN"}'
  find ~/git/ -name 'build.gradle' -type f -printf '%P\n' | xargs -n1 dirname | awk '{print $0 "\tGR"}'
  find ~/git/ -maxdepth 3 -mindepth 1 -name 'package.json' -type f -printf '%P\n' | xargs -n1 dirname | awk '{print $0 "\tNPM"}'
end

complete -c comp -x -a '(__complete_comp)'
