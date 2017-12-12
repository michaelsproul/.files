function fake_mac
    sudo ifconfig en0 ether $1
end
