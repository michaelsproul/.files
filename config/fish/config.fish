# ~/Applications
set -gx PATH ~/Applications $PATH

# Vim
set -gx EDITOR vim

# Python
set -gx PYTHONSTARTUP "$HOME/.pyrc.py"
set -gx PYTHONDONTWRITEBYTECODE 1

# Coq
set coq_dir /Applications/CoqIDE_8.4pl5.app/Contents
set -gx PATH $coq_dir/Resources/bin $coq_dir/MacOS $PATH

# Postgres
set PGHOME ~/Applications/postgres
set PGDATA $PGHOME/data
set PGHOST $PGDATA
set PGPORT 5432
set -gx PATH $PGHOME/bin $PATH
