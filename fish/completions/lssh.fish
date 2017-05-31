function __fish_complete_lssh
	set -l token (commandline -t)
	fish -c "complete -C\"scp $token\""
end

complete -x -c lssh -a '(__fish_complete_lssh)'
