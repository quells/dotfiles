function f --description 'Open new Finder window with working directory'
    open -F (fallback $argv ".")
end

