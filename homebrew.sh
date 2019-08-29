#!/usr/bin/env bash

declare -a brews=("ack"
                  "bat"
                  "exa"
                  "fd"
                  "fontconfig"
                  "fzf"
                  "git"
                  "gnupg"
                  "go"
                  "graphviz"
                  "imagemagick"
                  "neovim"
                  "node"
                  "openssl"
                  "python3"
                  "ripgrep"
                  "terraform"
                  "terraform_landscape"
                  "the_silver_searcher"
                  "tmux"
                  "yarn"
                  "z"
                  "zsh"
                  "zsh-completions"
                  )

declare -a casks=("alacritty"
                  "keybase"
                  "firefox"
                  "google-chrome"
                  "slack"
                  "docker"
                  "spectacles"
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