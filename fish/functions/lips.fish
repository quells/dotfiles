function lips --description 'List local and external IP addresses'
    for interface in (networksetup -listallhardwareports | awk "/^Device: /{print \$2}" | sort)
        set ip (ipconfig getifaddr $interface)
        [ "$ip" != "" ]; and echo "$interface: $ip"; or echo "$interface: inactive"
    end
    set ext_ip (dig +short myip.opendns.com @resolver1.opendns.com)
    [ "$ext_ip" != "" ]; and echo "ext: $ext_ip"; or echo "ext: inactive"
end

