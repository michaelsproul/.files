function fish_prompt
    if [ -n "$SSH_CLIENT" -o -n "$SSH_TTY" ]
        echo -e -n -s (color brgreen $USER) "@" (color yellow $hostname) ": " (color brblue (prompt_pwd)) " > "
    else
        echo -e -n -s (color -o green $USER) ": " (color -o blue (prompt_pwd)) " > "
    end
end
