function sys-docker --description 'Start the docker daemon'
  if set -q argv[1]
	  set cmd $argv[1]
	else
	  set cmd "start"
	end
	sudo systemctl $cmd docker
end
