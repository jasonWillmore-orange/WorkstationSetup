#!/bin/bash

PCKG_MANAGER=apt


# Install Linuxbrew
if test ! $(which brew)
then
    echo "  Installing Homebrew for you."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
fi

# Ensure that brew is running and functioning correctly
brew doctor

# Update any existing homebrew recipes
brew update

# Upgrade any already installed formulae
brew upgrade --all

# Install cask
brew tap caskroom/cask

# Install git
brew install git

echo "Please type in your full name, ie. Rowdy McFlurry: \c"
read fullName
echo "The username you entered is: $fullName"
git config --global user.name $fullName

echo "Please type in your email: \c"
read email
echo "The username you entered is: $email"
git config --global user.email $email

brew install git-lfs


# Install Languages and frameworks
brew install node
brew install python
brew install swift

# Install command-line tools
brew install vim
brew install tree
