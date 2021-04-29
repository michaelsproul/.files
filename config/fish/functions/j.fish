function j
    set matches (git grep "\(fn $argv[1]\|struct $argv[1]\|enum $argv[1]\|type $argv[1]\|trait $argv[1]\)" :/)
    set match_parts (string split --max 2 : $matches[1])
    set file $match_parts[1]
    set line $match_parts[2]
    vim +$line $file
end

