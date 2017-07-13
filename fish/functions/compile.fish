function compile --description "Compile a maven or gradle project"
  set -l path

  set -q $argv[1]
  if test $status -eq 0
    set path (pwd)
  else
    set path "$HOME/git/$argv[1]"
  end
  set -e argv[1]

  colorize blue -iu "Compile $path"

  if test -f "$path/pom.xml"
    mvn -f $path/pom.xml clean install
  else if test -f $path/build.gradle
    set -l cmd
    if test -f "$path/gradlew"
      set cmd "$path/gradlew"
    else
      set cmd "gradle"
    end
    eval "$cmd -b $path/build.gradle clean compileKotlin compileJava"
  else if test -f "$path/package.json"
    echo "NPM project, nothing to compile"
  end
end
