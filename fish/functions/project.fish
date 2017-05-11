function project --description "go into a project folder"
  if test -d ~/IdeaProjects/$argv[1] 
    cd ~/IdeaProjects/$argv[1]
  else
    cd ~/git/$argv[1]
  end
end
