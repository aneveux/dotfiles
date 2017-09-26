function load-local --description="Loads local fish functions that cannot be shared."
	set local $HOME/dotfiles/local/fish
	if test -d $local 
		for f in (ls $local)
			source $local/$f
		end
	end
end