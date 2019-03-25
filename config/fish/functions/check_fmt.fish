function check_fmt
    cargo fmt --all -- --check; and echo "Formatting OK"; or echo "Changes required"
end
