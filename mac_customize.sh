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
echo "alias ls='gls --color=auto'" >> ~/.zshrc.local

# install anyenv
git clone https://github.com/riywo/anyenv ~/.anyenv
echo 'export PATH="$HOME/.anyenv/bin:$PATH"' >> ~/.zshrc.local
echo 'eval "$(anyenv init - zsh)"' >> ~/.zshrc.local
exec $SHELL -l

# install for nvim environments
brew install python nvim
pip3 install --user --upgrade neovim
echo "alias vi='nvim'"
exec $SHELL -l
mkdir ~/.eskk

# zsh environments
mkdir -p ~/.zsh/workspace
mkdir -p ~/.zsh/plugins
