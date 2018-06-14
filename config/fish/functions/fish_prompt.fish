function fish_prompt
    echo -e -n -s (color -o green $USER) ": " (color -o blue (prompt_pwd)) " > "
end
