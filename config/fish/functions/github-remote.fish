function github-remote
    set user $argv[1]
    set reponame (basename (git rev-parse --show-toplevel))
    git remote add $user "git@github.com:$user/$reponame.git"
end
