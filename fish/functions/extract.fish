function extract --description="Extract an archive (.tar.bz2, .tar.gz, *.tgz, *.bz2, *.rar, *.gz, *.tar, *.tbz2, *.Z, *.zip, *.jar, *.7z)"
  switch $argv[1]
    case '-h' '--help'
      echo "Extract an archive (.tar.bz2, .tar.gz, *.tgz, *.bz2, *.rar, *.gz, *.tar, *.tbz2, *.Z, *.zip, *.jar, *.7z)"
      return 0
  end

  if test -f $argv[1]
    switch $argv[1]
      case '*.tar.bz2';          tar xjf $argv[1]
      case '*.tar.gz' '*.tgz';   tar xzf $argv[1]
      case '*.bz2';              bunzip2 $argv[1]
      case '*.rar';              unrar x $argv[1]
      case '*.gz';               gunzip $argv[1]
      case '*.tar';              tar xf $argv[1]
      case '*.tbz2';             tar xjf $argv[1]
      case '*.Z';                uncompress $argv[1]
      case '*.zip' '*.jar';      unzip $argv[1]
      case '*.7z';               7z x $argv[1]
      case '*';                  echo "'$argv[1]' cannot be extracted (.tar.bz2, .tar.gz, *.tgz, *.bz2, *.rar, *.gz, *.tar, *.tbz2, *.Z, *.zip, *.jar, *.7z)"
    end
  else
    echo "'$argv[1]' is not a valid file"
  end
end
