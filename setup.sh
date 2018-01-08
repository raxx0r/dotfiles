defaults write -g ApplePressAndHoldEnabled -bool false
defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 1

# Remap caps to escape

# 1. install seil (brew?)
# 2. set no action in system settings 
# 3. set mapping in seil
# read more here: https://pqrs.org/osx/karabiner/seil.html.en
/Applications/Seil.app/Contents/Library/bin/seil
