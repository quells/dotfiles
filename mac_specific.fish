function cdf --description 'Change working directory to frontmost Finder window directory'
    set target (osascript /Users/kwells/Dropbox/Dev/AppleScript/FrontFinderWindowPath.scpt)

    if test $target = "No Finder window found"
        echo $target
    else
        cd $target
        echo (pwd)
    end
end

function f --description 'Open new Finder window with working directory'
    if count $argv > /dev/null
        open -a Finder $argv[1]
    else
        open -a Finder "./"
    end
end

function manf --description 'Open formatted manual page in Preview'
    man -t $argv[1] | open -a /Applications/Preview.app -f
end

function addspacer --description 'Add spacer icon to Dock'
    defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}'
    killall Dock
end

function togblu --description 'Turn Bluetooth on and off to reconnect devices'
    blueutil power 0
    sleep 1
    blueutil power 1
end

function kicklaunch --description 'Kick LaunchServices in the pants'
    /System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -seed -r
end

function timemachine --description 'Change power throttle for Time Machine'
    switch $argv[1]
    case "fast"
        sudo sysctl debug.lowpri_throttle_enabled=0
    case "slow"
        sudo sysctl debug.lowpri_throttle_enabled=1
    end
end

function cpu_info --description 'Show CPU SKU and speed'
    echo (sysctl -n machdep.cpu.brand_string)
end