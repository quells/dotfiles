function path --description 'List $PATH entries with newlines instead of spaces'
    echo $PATH | tr ' ' '\n'
end

