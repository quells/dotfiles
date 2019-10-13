function togblu --description 'Turn Bluetooth on and off to reconnect devices'
    blueutil power 0
    sleep 1
    blueutil power 1
end

