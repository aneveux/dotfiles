function log_error --description='Display a message without changing the status of the previous command'
	set -l __status $status
	set_color brred
  echo $argv >&2
	set_color normal
  return $__status
end
