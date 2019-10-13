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

