function github-remote
    set user $argv[1]
    set reponame (basename (git config --get remote.origin.url) .git)
    git remote add $user "git@github.com:$user/$reponame.git"
end
