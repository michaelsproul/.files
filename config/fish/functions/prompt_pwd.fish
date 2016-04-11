function prompt_pwd
	basename (echo $PWD | sed -e "s|$HOME|~|")
end
