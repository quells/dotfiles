function timemachine --description 'Change power throttle for Time Machine'
    switch $argv[1]
    case "fast"
        sudo sysctl debug.lowpri_throttle_enabled=0
    case "slow"
        sudo sysctl debug.lowpri_throttle_enabled=1
    end
end

