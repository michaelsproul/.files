function fish_prompt
    echo -n -s (color -o green $USER) ": " (color 1fa (prompt_pwd)) " > "
end
