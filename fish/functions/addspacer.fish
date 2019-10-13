function addspacer --description 'Add spacer icon to Dock'
    defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}'
    killall Dock
end

