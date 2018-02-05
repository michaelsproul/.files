function prompt_pwd
    # NOTE: Add `basename (..)` for short path
    echo $PWD | sed -e "s|$HOME|~|"
end
