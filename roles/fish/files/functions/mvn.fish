function mvn -d "Add -p to maven to build the specified project"
  set -l mvn_args

  while count $argv > /dev/null
  set -l arg $argv[1]
    switch $arg
      case '-p'
        set -e argv[1]
	set mvn_args $mvn_args "-f" "$HOME/git/$argv[1]/pom.xml"
      case '*'
        set mvn_args $mvn_args $arg
    end
  set -e argv[1]
  end

  command mvn $mvn_args
end
