function upsource-tunnel -d "Creates a tunnel to our upsource instance on specified port... Cause hello proxies..."
	  if set -q argv[1]
	    set port $argv[1]
	  else
	    set port "12345"
	  end
	ssh -f bastion -L $port:oddev001s.sys.meshcore.net:8080 -N
end