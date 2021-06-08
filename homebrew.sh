#!/usr/bin/env bash

declare -a brews=("ack"
                  "bat"
                  "exa"
                  "fd"
                  "fontconfig"
                  "fzf"
                  "git"
                  "gnupg"
                  "graphviz"
                  "imagemagick"
                  "neovim"
                  "openssl"
                  "ripgrep"
                  "the_silver_searcher"
                  "tmux"
                  "yarn"
                  "z"
                  "zsh"
                  "zsh-completions"
                  )

declare -a casks=("keybase"
                  "firefox"
                  "google-chrome"
                  "slack"
                  "spectacles"
                  "visual-studio-code"
                  )

# Install CommandLineTools
if ! [ -d "/Library/Developer/CommandLineTools" ]; then
    sudo xcode-select --install
else
    echo "Bootstrap.sh => CommandLineTools already installed."
fi

# Install Homebrew
if ! hash brew 2>/dev/null; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew analytics off
else
    echo "Bootstrap.sh => Homebrew already installed."
fi

# Install brews
for brew in "${brews[@]}"
do
   brew install "$brew"
done

# Install casks
for cask in "${casks[@]}"
do
   brew cask install "$cask"
done

# Update, Upgrade and Clean Up
brew update
brew upgrade -all
brew cleanup