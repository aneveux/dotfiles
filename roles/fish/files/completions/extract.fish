function __complete_extract
  set input (commandline -ct)

  function filter -a file description
    test -f $file
    and echo -e "$file\t$description"
  end

  for f in $input*
    switch $f
      case '*.tar.bz2';          filter $f "tar xjf"
      case '*.tar.gz' '*.tgz';   filter $f "tar xzf"
      case '*.bz2';              filter $f "bunzip2"
      case '*.rar';              filter $f "unrar"
      case '*.gz';               filter $f "gunzip"
      case '*.tar';              filter $f "tar xf"
      case '*.tbz2';             filter $f "tar xjf"
      case '*.Z';                filter $f "uncompress"
      case '*.zip' '*.jar';      filter $f "unzip"
      case '*.7z';               filter $f "7z x"
      case '*';                  test -d $f; and echo -e "$f/\tdir"
    end
  end
end

complete -c extract -x -a '(__complete_extract)'
