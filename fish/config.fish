function fish_prompt
    echo -n "["(date +'%H:%M')" "
    set_color $fish_color_cwd; echo -n (prompt_pwd); set_color normal
    echo -n "] » "
end

set -x PATH $PATH /usr/local/sbin
set -x PATH $PATH $HOME/.bin

# Go
set -x GOPATH "$HOME/go"
set -x PATH $PATH /usr/local/go/bin $GOPATH/bin
