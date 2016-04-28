function short_pwd
    echo $PWD | sed "s|$HOME|~|g"
end
