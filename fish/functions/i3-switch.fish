function i3-switch

  set json (i3-msg -t get_tree | jq -M -r -c '.nodes[]
               | {
                   name:.name,
                   workspace:.nodes[] | select(.type=="con") | .nodes[] | {
                     name:.name,
                     id:.id,
                     window: recurse(.nodes[]) | {
                       name:.name?,
                       class:.window_properties.class,
                       id:.id?,
                       urgent:.urgent
                     }
                   }
                 }
               | select(.workspace.id != .workspace.window.id and .workspace.window.name != null)')

  set max_id (echo $json | jq '.workspace.window.id | tostring | length' | sort -nr | head -1)
  set max_workspace_name (echo $json | jq '.workspace.name | length' | sort -nr | head -1)
  set max_window_class (echo $json | jq '.workspace.window.class | length' | sort -nr | head -1)
  set max_window_name (echo $json | jq '.workspace.window.name | length' | sort -nr | head -1)

  set choice (for window_json in $json
    set workspace_name (echo $window_json | jq -r '.workspace.name')
    set id (echo $window_json | jq -r '.workspace.window.id')
    set window_class (echo $window_json | jq -r '.workspace.window.class')
    set window_name (echo $window_json | jq -r '.workspace.window.name')
    set urgent (echo $window_json | jq -r '.workspace.window.urgent')

    set pad_id (math $max_id - (string length $id) + 1)
    set pad_workspace_name (math $max_workspace_name - (string length $workspace_name) + 3)
    set pad_window_class (math $max_window_class - (string length $window_class) + 1)
    set pad_window_name (math $max_window_name - (string length $window_name) + 1)

    test "$urgent" = "true"
      and set separator "# "
      or set separator "| "

    echo -sn "$id" (string repeat -n $pad_id " ") $separator
    echo -sn "$workspace_name" (string repeat -n $pad_workspace_name " ") $separator
    echo -sn "$window_class" (string repeat -n $pad_window_class " ") $separator
    echo -sn "$window_name" (string repeat -n $pad_window_name " ") $separator
    echo
  end | dmenu -i -l 10 | awk '{print $1}')
  #rofi -dmenu -p 'switch '
  #dmenu -i -l 10

  if test -n "$choice"
    i3-msg "[con_id=$choice] focus" > /dev/null ^ /dev/null
  end

end
