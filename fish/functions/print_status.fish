function print_status --description="Print a line with OK/KO status then the message. Does'nt change the status."
	set current_status $status

  if test (count $argv) -eq 0
    set argv[1] "(No message provided)"
  end

  echo -n "["
  test $current_status -eq 0
   and colorize green -n "OK"
   or colorize red -n "KO"
  echo -n "] "
	# This will handle the -n or -e or --whatever
  echo $argv

  # Print "debug" info should not change the status of the last command
  return $current_status
end
