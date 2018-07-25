function log_info -d "Display a message without changing the status of the previous command"
	set -l __status $status
	echo $argv
  return $__status
end
