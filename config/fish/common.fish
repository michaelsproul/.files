# ~/Applications
set -gx PATH ~/.local/bin ~/Applications $PATH

# Vim
set -gx EDITOR vim

# Python
set -gx PYTHONSTARTUP "$HOME/.pyrc.py"
set -gx PYTHONDONTWRITEBYTECODE 1

# Rust
alias ru=rustup
set -x CARGO_INCREMENTAL 1
