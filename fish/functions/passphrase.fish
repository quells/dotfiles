function passphrase --description 'Generate new passphrase'
    echo (tr -cs A-Za-z '\n' < $HOME/.bin/words.txt | gshuf --random-source=/dev/random -n6)
end

