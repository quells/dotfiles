function kicklaunch --description 'Kick LaunchServices in the pants'
    /System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -seed -r
end

