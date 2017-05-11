function __fish_complete_project
  find ~/IdeaProjects/ \( -name 'build.gradle' -o -name 'pom.xml' \) -type f -printf '%P\n' | xargs -n1 dirname | awk '{print $0 "\tIJ"}'
  find ~/git/ \( -name 'build.gradle' -o -name 'pom.xml' \) -type f -printf '%P\n' | xargs -n1 dirname | awk '{print $0 "\tIJ"}'
end

complete -x -c project -a '(__fish_complete_project)'
