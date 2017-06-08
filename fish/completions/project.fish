function __complete_project --description "build autocompletion for project command"
  set -l last_char (string sub -s -1 (commandline -p))
  set -l cmd_line (commandline -po)
  #echo (count $cmd_line)>&2
  if test (count $cmd_line) -eq 2 -a "$last_char" != " "
    find $HOME/git/ -name 'pom.xml' -type f -printf '%P\n' | xargs -n1 dirname | awk '{print $0 "\tMVN"}'
    find $HOME/git/ -name 'build.gradle' -type f -printf '%P\n' | xargs -n1 dirname | awk '{print $0 "\tGR"}'
    find $HOME/git/ -maxdepth 3 -mindepth 1 -name 'package.json' -type f -printf '%P\n' | xargs -n1 dirname | awk '{print $0 "\tNPM"}'
  else
    set -l project $cmd_line[2]
    #echo "$project">&2
    if test (count $cmd_line) -eq 2
      if test -f "$HOME/git/$project/pom.xml"
        echo "mvn"
      end
      if test -f "$HOME/git/$project/build.gradle"
        if test -f "$HOME/git/$project/gradlew"
          echo -e "./gradlew\tWrapper"
          echo -e "$HOME/git/$project/gradlew\tWrapper"
        end
        echo "gradle"
      end
      if test -d $HOME/git/$project/.git
        echo "git"
      end
    else
      #echo "$cmd_line|" >&2
      #echo "$cmd_line[3..-1]|" >&2
      if test "$last_char" = " "
        fish -c "cd $HOME/git/$project; and complete -C\"$cmd_line[3..-1] \""
      else
        fish -c "cd $HOME/git/$project; and complete -C\"$cmd_line[3..-1]\""
      end
    end
  end
end

complete -c project -x -a '(__complete_project)'
