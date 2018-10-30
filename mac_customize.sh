#!/usr/local/bin/zsh

defaults write com.apple.finder AppleShowAllFiles -bool true
defaults write com.apple.finder FinderSounds -bool no
defaults write com.apple.dock persistent-others -array-add '{tile-data={}; tile-type="spacer-tile";}'
defaults write com.apple.desktopservices DSDontWriteNetworkStores true

killall Finder
killall Dock

# customize development environments
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install git openssl tmux coreutils

# loading for terminal environment configuration
# after install, 
#   * load profile on terminal settings. if folder hidden, push 'command + shift + .'
#   * add entry for .zshrc.local to "alias ls='gls --color=auto"
git clone https://github.com/tomislav/osx-terminal.app-colors-solarized.git ~/.osx-terminal.app-colors-solarized
git clone https://github.com/seebi/dircolors-solarized.git ~/.dircolors-solarized
