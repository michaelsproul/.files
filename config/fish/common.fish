# ~/Applications
set -gx PATH ~/.local/bin ~/Applications $PATH

# Vim
set -gx EDITOR vim

# Safe mv and cp.
alias mv "mv -i"
alias cp "cp -i"

# Python
set -gx PYTHONSTARTUP "$HOME/.pyrc.py"
set -gx PYTHONDONTWRITEBYTECODE 1

# Rust
alias ru=rustup
set -gx PATH ~/.cargo/bin $PATH
