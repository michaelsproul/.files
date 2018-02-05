function git_branch_cleanup
    for branch in (git branch --merged | grep -v 'master' | sed 's/ //g')
        git branch -d $branch
    end
end
