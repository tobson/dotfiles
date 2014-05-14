# Disable auto rotate and scale when printing with Preview.app
defaults write com.apple.Preview PVImagePrintingScaleMode 0
defaults write com.apple.Preview PVImagePrintingAutoRotate 0

# Disable Dashboard
defaults write com.apple.dashboard mcx-disabled -bool true

# Don’t show Dashboard as a Space
defaults write com.apple.dock dashboard-in-overlay -bool true

# Don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false
