#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Establish the machine type, for customisation purposes
if [ -e "$HOME/.machine_type" ]
then
	export MACHINE_TYPE=`cat ~/.machine_type`
else
	export MACHINE_TYPE="server"
fi

# Enable 256 colour support
export TERM="xterm-256color"

# Enable coloured commands
alias ls='ls --color=auto'
alias grep='grep --color=auto'
export GREP_COLORS='mt=01;36:ms=01;36:mc=01;36'

# Make cp and mv safe by default
alias mv='mv -i'
alias cp='cp -i'

# Add personal binaries to the path
export PATH=~/Applications:~/Applications/scripts:$PATH

# Editor setup
if [ $MACHINE_TYPE == "server" ]
then
	export EDITOR="nano"
else
	export EDITOR="vim"
fi

# Coloured prompt
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

	if [ $MACHINE_TYPE == "server"  -o $MACHINE_TYPE == "uni" ]
	then
		export PS1="[${GREENBOLD}\u@\h${WHITE}: ${BLUEBOLD}\W${WHITE} ] $ "
	else
		export PS1="${GREENBOLD}michael${WHITE}: ${BLUEBOLD}\W${WHITE} $ "
	fi
}
prompt

# Proxy config
if [ $MACHINE_TYPE == "uni" ]
then
	export HTTP_PROXY=web-cache.usyd.edu.au:8080
	export FTP_PROXY=$HTTP_PROXY
fi

# Python
# ======

export PYTHONSTARTUP="~/.pyrc.py"
export PYTHONDONTWRITEBYTECODE=1

# Git
# ===

# Git line counter
function lc() {
	if [ -d .git ]
	then
		git diff --stat `git hash-object -t tree /dev/null` -- $@
	else
		echo "Not in the root of a git repo"
	fi
}

# Android
# =======

if [ $MACHINE_TYPE == "desktop" ]
then
	export PATH=~/Applications/adt/sdk/platform-tools:$PATH
fi

# Ruby
# ====

if hash rbenv 2> /dev/null
then
	eval "$(rbenv init -)"
fi

# Gurboi
# ======
if [ $MACHINE_TYPE == "desktop" ]
then
	export HOSTNAME="michael-desktop" # lol
	export GUROBI_HOME="/opt/gurobi562"
	export PATH="${PATH}:${GUROBI_HOME}/bin"
	export LD_LIBRARY_PATH="${GUROBI_HOME}/lib"
fi
