function lssh --description "ls a remote directory through SSH"
	set -l parts (string split : $argv[1])
	
	switch (count $parts) 
		case '2';
			ssh $parts[1] "ls -Al $parts[2]"
		case '*';
			echo "parameter needed as host:directory"
	end
end
