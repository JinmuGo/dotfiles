#!/bin/bash

################
# system setup #
################

# keyboard repeat speed
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 10

# keyboard access for all controls
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# undisplay iterm quit message
defaults write com.googlecode.iterm2 PromptOnQuit -bool false

which brew >/dev/null
if [ $? -eq 0 ]
then
  echo "\x1b[32;4mBrew already installed. Skipping...\033[m"
else
  echo "\x1b[32;4mInstalling Brew\033[m"
  # install neovim & brew
  cd ~/goinfre && mkdir homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew
  eval "$(homebrew/bin/brew shellenv)"
  brew update --force --quiet
  chmod -R go-w "$(brew --prefix)/share/zsh"
fi

#####################################
# link cache directories to goinfre #
#####################################

echo "\x1b[32;4mLinking cache directories to ~/goinfre\033[m"

TARGET=(
  "Caches"
  "ApplicationSupport/Code/Cache"
  "ApplicationSupport/Code/CachedData"
  "ApplicationSupport/Code/CachedExtensions"
  "ApplicationSupport/Code/CachedExtensionVSIXs"
  "ApplicationSupport/Code/Code Cache"
  "ApplicationSupport/VSCodium/Cache"
  "ApplicationSupport/VSCodium/CachedData"
  "ApplicationSupport/VSCodium/CachedExtensions"
  "ApplicationSupport/VSCodium/CachedExtensionVSIXs"
  "ApplicationSupport/VSCodium/Code Cache"
  "ApplicationSupport/Slack/Cache"
  "ApplicationSupport/Slack/CachedData"
  "ApplicationSupport/Slack/Service Worker/CacheStorage"
  "ApplicationSupport/Slack/Service Worker/ScriptCache"
)

for ((i = 0; i < ${#TARGET[@]}; i++)); do
  mkdir -p "$HOME/goinfre/${TARGET[$i]}" 2>/dev/null
  rm -rf "$HOME/Library/${TARGET[$i]}" 2>/dev/null
  ln -s "$HOME/goinfre/${TARGET[$i]}" "$HOME/Library/${TARGET[$i]}" 2>/dev/null
done
