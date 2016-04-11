function color
    if math (count $argv) "< 2" > /dev/null
        echo "Usage: color [<set_color options>] <color> <text>"
        return
    end

	set -l colopts $argv[1..-2]
    set -l text $argv[-1]
    echo -s (set_color $colopts) "$text" (set_color normal)
end
