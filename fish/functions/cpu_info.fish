function cpu_info --description 'Show CPU SKU and speed'
    echo (sysctl -n machdep.cpu.brand_string)
end

