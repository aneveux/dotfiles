function __complete_project --description "build autocompletion for project command"
  set last_char (string sub -s -1 (commandline -p))
  set cmd_line (commandline -po)
  set PROJECTS $HOME/git/
  if begin
    test (count $cmd_line) -eq 1
    or test (count $cmd_line) -eq 2 -a "$last_char" != " "
    end
    for project_dir in $PROJECTS
      find $project_dir -name 'pom.xml' -type f -printf '%P\n' | xargs -n1 dirname ^ /dev/null | awk '{print $0 "\tMVN"}'
      find $project_dir -name 'build.gradle' -type f -printf '%P\n' | xargs -n1 dirname ^ /dev/null | awk '{print $0 "\tGR"}'
      find $project_dir -maxdepth 3 -mindepth 1 -name 'package.json' -type f -printf '%P\n' | xargs -n1 dirname ^ /dev/null | awk '{print $0 "\tNPM"}'
    end
  else
    set project $cmd_line[2]
    if test (count $cmd_line) -eq 2
      for project_dir in $PROJECTS
        if test -d "$project_dir/$project"
          if test -f "$project_dir/$project/pom.xml"
            echo "mvn"
          else if test -f "$project_dir/$project/build.gradle"
            if test -f "$project_dir/$project/gradlew"
              echo -e "./gradlew\tWrapper"
              echo -e "$project_dir/$project/gradlew\tWrapper"
            end
            echo "gradle"
          else if test -f "$project_dir/$project/package.json"
            echo "npm"
          end
          if test -d $project_dir/$project/.git
            echo "git"
          end
          break
        end
      end
    else
      for project_dir in $PROJECTS
        if test -d "$project_dir/$project"
          if test "$last_char" = " "
            fish -c "cd $project_dir/$project; and complete -C\"$cmd_line[3..-1] \""
          else
            fish -c "cd $project_dir/$project; and complete -C\"$cmd_line[3..-1]\""
          end
          break
        end
      end
    end
  end
end

complete -c project -x -a '(__complete_project)'