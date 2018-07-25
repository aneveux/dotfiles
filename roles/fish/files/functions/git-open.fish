function git-open
	if not git rev-parse
		echo "ERROR: No git repository found"; and return (false);
	end

	set -l git_url (git config --get remote.origin.url)
	set -l git_domain (echo $git_url | awk -v FS="(@|:)" '{print $2}')
	set -l git_branch (git rev-parse --abbrev-ref HEAD 2>/dev/null)

	switch $git_url
		case 'https://*'
			set -l repo (string replace -r ".git\$" "" -- $repo) # strip trailing .git
			set url $git_domain/$repo/tree/$git_branch
		case 'git@*'
			set -l repo (string replace -r ".*:" "" -- $git_url) # strip hostname
			set -l repo (string replace -r ".git\$" "" -- $repo) # strip trailing .git
			set url "https://$git_domain/$repo/tree/$git_branch"
		case '*'
			echo "ERROR: Remote origin is invalid"; and return (false);
	end
	open $url
end