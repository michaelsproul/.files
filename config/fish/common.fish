# ~/Applications
set -gx PATH ~/.local/bin ~/Applications $PATH

# Vim
set -gx EDITOR vim

# Python
set -gx PYTHONSTARTUP "$HOME/.pyrc.py"
set -gx PYTHONDONTWRITEBYTECODE 1
