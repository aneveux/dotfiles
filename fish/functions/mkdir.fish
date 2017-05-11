function mkdir -d "Add -g to mkdir to goto the created dir"
  set -l mkdir_args
  set -l goto 0
  for arg in $argv
    switch $arg
      case '-g'
        set goto 1
      case '*'
        set mkdir_args $mkdir_args $arg
    end
  end

  command mkdir $mkdir_args
  set -l mkdir_status $status
  if test $goto -eq 1 -a $mkdir_status = 0
    switch $argv[(count $argv)]
      case '-*'

      case '*'
        cd $argv[(count $argv)]
        return $status
    end
  end
  return $mkdir_status
end
