#!/usr/local/bin/zsh

defaults write com.apple.finder AppleShowAllFiles -bool true
defaults write com.apple.finder FinderSounds -bool no
defaults write com.apple.dock persistent-others -array-add '{tile-data={}; tile-type="spacer-tile";}'
defaults write com.apple.desktopservices DSDontWriteNetworkStores true

killall Dock
