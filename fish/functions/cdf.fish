function cdf --description 'Change working directory to frontmost Finder window directory'
    set target (osascript $HOME/.bin/FrontFinderWindowPath.scpt)

    if test $target = "No Finder window found"
        echo $target
    else
        cd $target
        echo (pwd)
    end
end
