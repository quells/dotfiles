function myip --description 'Current external IP address'
    echo (dig +short myip.opendns.com @resolver1.opendns.com)
end

