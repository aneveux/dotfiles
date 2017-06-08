function colorize --description="Colorize a text then reset to normal color"

  set current_arr "set_color_arg"

  for arg in $argv
    switch $arg
      case '-*'
        set $current_arr $$current_arr $arg
      case '*'
        if set -q color
          set echo_arg $echo_arg $arg
        else
          set color $arg
          set current_arr "echo_arg"
        end
    end
  end

  switch $color
    # Force bright for standard color
    case 'black'
    case 'red'
    case 'green'
    case 'yellow'
    case 'blue'
    case 'magenta'
    case 'cyan'
    case 'white'
      set color br$color
    case '*'
      # if color is a variable name, use it
      if set -q $color
        set color $$color
      end
  end

  # also force bold (look better with my color scheme)
  set_color --bold $set_color_arg $color
  echo $echo_arg
  set_color normal
end
