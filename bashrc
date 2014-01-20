#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Enable 256 colour support
if [ $COLORTERM == "gnome-terminal" ]
then
	export TERM="xterm-256color"
fi

# Coloured commands
alias ls='ls --color=auto'
alias grep='/usr/bin/grep --color=auto'
export GREP_COLORS='mt=01;36:ms=01;36:mc=01;36'

# Make cp and mv safe by default
alias mv='/usr/bin/mv -i'
alias cp='/usr/bin/cp -i'

# Personal binaries
export PATH=~/Applications:~/Applications/scripts:$PATH

# Err...
export EDITOR="vim"

function prompt() {
	local BLACK="\[\033[0;30m\]"
	local BLACKBOLD="\[\033[1;30m\]"
	local RED="\[\033[0;31m\]"
	local REDBOLD="\[\033[1;31m\]"
	local GREEN="\[\033[0;32m\]"
	local GREENBOLD="\[\033[1;32m\]"
	local YELLOW="\[\033[0;33m\]"
	local YELLOWBOLD="\[\033[1;33m\]"
	local BLUE="\[\033[0;34m\]"
	local BLUEBOLD="\[\033[1;34m\]"
	local PURPLE="\[\033[0;35m\]"
	local PURPLEBOLD="\[\033[1;35m\]"
	local CYAN="\[\033[0;36m\]"
	local CYANBOLD="\[\033[1;36m\]"
	local WHITE="\[\033[0;37m\]"
	local WHITEBOLD="\[\033[1;37m\]"
	export PS1="$GREENBOLD\u$WHITE: $BLUEBOLD\W $WHITE$ "
}
prompt

# Python Stuff
# ============

# No __pycache__ folders
export PYTHONDONTWRITEBYTECODE=1

# Include /usr/local/ libraries
export PYTHONPATH=$PYTHONPATH:/usr/local/lib/python2.7:/usr/local/lib/python2.7/site-packages

# Git Stuff
# =========

# Git line counter
function lc() {
	if [ -d .git ]
	then
		git diff --stat `git hash-object -t tree /dev/null` -- $@
	else
		echo "Not in the root of a git repo"
	fi
}

# Android tools
export PATH=$PATH:~/Applications/adt/sdk/platform-tools
