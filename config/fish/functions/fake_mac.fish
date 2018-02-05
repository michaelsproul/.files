function fake_mac
    echo $argv[1]
    sudo ifconfig en0 ether $argv[1]
end
