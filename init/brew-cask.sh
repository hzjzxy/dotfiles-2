#!/bin/bash
# Install Caskroom

brew tap caskroom/cask
brew install brew-cask
brew tap caskroom/versions

# Install packages

apps=(
dropbox
firefox
google-chrome
slack
spotify
alacritty
notion
evernote
visual-studio-code
zoomus
typora
postman
postgresql
# dbeaver-community
)

brew cask install "${apps[@]}"

# Quick Look Plugins (https://github.com/sindresorhus/quick-look-plugins)
# brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql qlimagesize webpquicklook suspicious-package
