function project --description "go into a project folder"
  if test -d ~/git/$argv[1] 
    cd ~/git/$argv[1]
  end
end
