function git-report --description 'Show a git report with branch status'

  set -l path "."
  if test (count $argv) -eq 1
    set path $argv[1]
  end

  git -C $path fetch --prune > /dev/null ^ /dev/null
  or return $status

  # set -l remotes (git remote -v | awk '{print $1}' | sort | uniq)

  # set -l remote_branches (git -C $path branch -r | awk '{print $1}' | cut -f2 -d'/')

  set -l current_branch (git currentbranch)
  set -l local_revision (git rev-list --max-count=1 $current_branch)
  # TODO remove hard coded origin
  set -l remote_revision (git rev-list --max-count=1 origin/$current_branch ^ /dev/null)
  or set -l remote_revision ''


  for local_branch in (git -C $path branch -vv | cut -c3-)
    # echo $local_branch
    set -l matches (string match -r '^(.*?\s+)[a-f0-9]+\s(\[.*?\])?.*$' $local_branch)

    set -l branch_name (string trim $matches[2])

    if test "$branch_name" = "$current_branch"
      colorize white -n "<FS>"
      echo -n (string repeat -n (math (string length "$matches[2]") - 3) ' ')
      if test "$local_revision" = "$remote_revision"
        and git status | grep 'nothing to commit' >/dev/null ^/dev/null
        colorize green 'OK'
      else
        colorize 'B404AE' 'Dirty'
      end
    end

    # echo the 'raw' string because it contains the padding for alignment
    echo -n "$matches[2] "

    if test (count $matches) -ge 3
      #echo $matches[3]
      set -l branch_status (string match -r '^\[.*: (.+)\]$' $matches[3])
      if test $status -eq 0
        set branch_status $branch_status[2]
        switch $branch_status
          case 'gone'
            colorize red "Can be deleted"
          case 'ahead *'
            colorize blue "Branch is ahead"
          case 'behind *'
            colorize red "Branch is behind"
          case '*'
            colorize yellow $branch_status
        end
      else
        colorize green 'OK'
      end
    else
      colorize 'FE642E' "Branch haven't been pushed"
    end

    # set -l local_revision (git -C $path rev-list --max-count=1 $branch_name)
    #
    # # TODO remove hard coded origin
    # set -l remote_revision (git -C $path rev-list --max-count=1 origin/$branch_name)
    #
    # if test $local_revision = $remote_revision
    #   colorize green "OK"
    # else
    #   colorize 'B404AE' "Dirty"
    # end

  end
end
