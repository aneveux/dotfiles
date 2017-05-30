function __fish_complete_lssh
	set -l parts (string split : $argv[1])
	switch (count $parts) 
		case '2';
			set -l path (string split -r -m1 / $parts[2])
			ssh $parts[1] "ls -l $path"
		case '*';
	end
end

complete -x -c lssh -a '(__fish_complete_lssh)'
