function fish_prompt
    echo -n '['
    echo -n (date +'%H:%M')
    echo -n ' '
    set_color $fish_color_cwd
    echo -n (prompt_pwd)
    set_color normal
    echo -n '] » '
end

function man --wraps man --description 'Manual pages with color'
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

function passphrase --description 'Generate new passphrase'
    echo (tr -cs A-Za-z '\n' < $HOME/.bin/words.txt | gshuf --random-source=/dev/random -n6)
end

set -x PATH $PATH /usr/local/sbin

set -x GOPATH "$HOME/go"
set -x PATH $PATH /usr/local/go/bin $GOPATH/bin
