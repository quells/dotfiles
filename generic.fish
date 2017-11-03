function fish_prompt
    echo -n "["(date +'%H:%M')" "
    set_color $fish_color_cwd; echo -n (prompt_pwd); set_color normal
    echo -n "] » "
end

function manc --description 'Manual pages with color'
    set -x LESS_TERMCAP_mb (printf "\e[1;31m")
    set -x LESS_TERMCAP_md (printf "\e[1;31m")
    set -x LESS_TERMCAP_me (printf "\e[0m")
    set -x LESS_TERMCAP_se (printf "\e[0m")
    set -x LESS_TERMCAP_so (printf "\e[1;44;33m")
    set -x LESS_TERMCAP_ue (printf "\e[0m")
    set -x LESS_TERMCAP_us (printf "\e[1;32m")
    command man $argv[1]
end

function speedtest --description 'Test downlink speed'
    wget -O /dev/null http://speedtest.wdc01.softlayer.com/downloads/test10.zip
end

function myip --description 'Current external IP address'
    echo (curl --silent http://icanhazip.com)
end

function lips --description 'List local and external IP addresses'
    for interface in (networksetup -listallhardwareports | awk "/^Device: /{print \$2}" | sort)
        set ip (ipconfig getifaddr $interface)
        [ "$ip" != "" ]; and echo "$interface: $ip"; or echo "$interface: inactive"
    end
    set ext_ip (dig +short myip.opendns.com @resolver1.opendns.com)
    [ "$ext_ip" != "" ]; and echo "ext: $ext_ip"; or echo "ext: inactive"
end

function hex2rgb --description 'Convert hex string to rgb() string'
    set hex (echo "$argv[1]" | tr "[:lower:]" "[:upper:]" | perl -pe "s|^\#(.*)\$|\$1|g")
    if echo "$hex" | grep -q -E "^[A-F0-9]{3}\$"
        set hex (echo "$hex" | perl -pe "s|(.)|\$1\$1|g")
    end
    if echo "$hex" | grep -q -E "^[A-F0-9]{6}\$"
        set r (echo -s (string split "" -- $hex)[1..2])
        set g (echo -s (string split "" -- $hex)[3..4])
        set b (echo -s (string split "" -- $hex)[5..6])
        printf "rgb(%d,%d,%d)" 0x$r 0x$g 0x$b
    else
        echo -n "$argv[1]"
    end
end

function passphrase --description 'Generate new passphrase'
    echo (tr -cs A-Za-z '\n' < $HOME/.bin/words.txt | gshuf --random-source=/dev/random -n6)
end

function cleanpath --description 'Remove duplicate entries in $PATH'
    set uniq_path (echo $PATH | tr " " "\n" | sort | uniq)
    set -x PATH
    for dir in $uniq_path
        set -x PATH $PATH $dir
    end
end

set -x PATH $PATH /usr/local/sbin

set -x GOPATH "$HOME/go"
set -x PATH $PATH /usr/local/go/bin $GOPATH/bin
