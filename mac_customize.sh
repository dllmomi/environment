#!/usr/local/bin/zsh

defaults write com.apple.finder AppleShowAllFiles -bool true
defaults write com.apple.finder FinderSounds -bool no
defaults write com.apple.dock persistent-others -array-add '{tile-data={}; tile-type="spacer-tile";}'
defaults write com.apple.desktopservices DSDontWriteNetworkStores true

killall Dock

# configuration environment for terminal
brew install coreutils
git clone https://github.com/tomislav/osx-terminal.app-colors-solarized.git ~/.osx-terminal.app-colors-solarized    # loading for terminal environment configuration
git clone https://github.com/seebi/dircolors-solarized.git ~/.dircolors-solarized    # after install, add entry for .zshrc.local to "alias ls='gls --color=auto"
