#!/bin/bash

# Create folderes for dev work
mkdir -pv $HOME/Dev
mkdir -pv $HOME/Training
mkdir -pv $HOME/Testing

# Set up zsh and oh-my-zsh
touch ~/.zshrc
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
zsh --version
upgrade_oh_my_zsh

# Creates /Users/$username/Screenshots and changes the default folder for screenshots
mkdir -pv $HOME/Screenshots/
defaults write com.apple.screencapture location /Users/$username/screenshots/ && killall SystemUIServer

# This script installs Homebrew for OSX as well as Casks for Brew

read -p "Press any key to continue… " -n1 -s
echo '\n'

xcode-select --install

# Check that Homebrew is installed and install if not
if test ! $(which brew)
then
  echo "  Installing Homebrew for you."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
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

# Color code Git information in the terminal 
git config --global color.ui true

echo "Please type in your full name, ie. Rowdy McFlurry: \c"
read fullName
echo "The username you entered is: $fullName"
git config --global user.name $fullName

echo "Please type in your email: \c"
read email
echo "The username you entered is: $email"
git config --global user.email $email

# Install and tell git to use the github recommended gitignore for macOS
curl https://raw.githubusercontent.com/github/gitignore/master/Global/macOS.gitignore -o ~/.gitignore
git config --global core.excludesfile ~/.gitignore_global

####### TERMINAL APPLICATIONS #######
brew install git-lfs
brew install mas  # A simple command line interface for the Mac App Store. Designed for scripting and automation.

# Install languages and frameworks
brew install node
brew install nvm
brew install python

# Install command-line tools
brew install tree
brew install fzf
brew install ack
brew install vim
brew install youtube-dl  # Download YouTube videos from the command-line
brew install watchman  # A file system watcher utility, helps manage large npm applications

####### GUI APPLICATIONS #######

# Mac App Store Applications
mas install 425264550 # Blackmagic Disk Speed Test (3.1)
# mas install 490192174 # Battery Health (6.1)
# mas install 417375580 # BetterSnapTool (1.9)
# mas install 409183694 # Keynote (8.2)
# mas install 405399194 # Kindle (1.23.3)
# mas install 926036361 # LastPass (4.1.0)
# mas install 425424353 # The Unarchiver (4.0.0)
mas install 1085114709 # Parallels Desktop Lite (1.3.3)
# mas install 490152466 # iBooks Author (2.6.1)
mas install 961632517 # Be Focused Pro (1.7.4)
# mas install 409203825 # Numbers (5.2)
mas install 497799835 # Xcode (10.0)
# mas install 409201541 # Pages (7.2)
mas install 865500966 # feedly (1.1)
# mas install 408981434 # iMovie (10.1.9)
# mas install 939343785 # Icon Set Creator (1.1.11)
mas install 568434047 # Todo Cloud (3.0.7)
# mas install 913724705 # Disk Care (1.5.1)
mas install 1014850245 # Monit (1.2.1)
# mas install 803453959 # Slack (3.3.2)
# mas install 715768417 # Microsoft Remote Desktop (8.0.30030)
mas upgrade

# Install all the Quick Look Plugins
brew cask install qlcolorcode  # 
brew cask install qlstephen  #
brew cask install qlmarkdown  # 
brew cask install quicklook-json  # 
brew cask install qlimagesize  # 
brew cask install webpquicklook  # 
brew cask install suspicious-package  # 
brew cask install quicklookase  # 
brew cask install qlvideo  # 
brew cask install quicklook-csv

# Dev Applications
brew cask install azure-data-studio
brew cask install cheatsheet
brew cask install clipy
brew cask install docker
brew cask install dotnet-sdk
# brew cask install dropbox
brew cask install firefox
brew cask install gfxcardstatus
brew cask install github
brew cask install gitkraken
brew cask install google-chrome
brew cask install firefox-developer-edition
brew cask install iterm2
brew cask install latexian
brew cask install macdown
brew cask install macmediakeyforwarder
# brew cask install paste
brew cask install postman
brew cask install slack
brew cask install spectacle
brew cask install spotify
# brew cask install superduper
brew cask install transmission
brew cask install visual-studio-code
brew cask install vlc
brew cask install webstorm


# Home/Productivity/Utility Applications
brew cask install appcleaner
# brew cask install beamer # Stream directly from your Mac to Apple TV and Chromecast
brew cask install caffeine
brew cask install coconutbattery
brew cask install little-snitch
brew cask install the-unarchiver


# Create the useful 'brewery' alias
cat << EOF >> ~/.bash_profile
alias brewery="brew update && brew upgrade && brew cask update && brew cask upgrade && brew doctor && brew cleanup"
EOF

# Manually add VS Code to your path
cat << EOF >> ~/.bash_profile
# Add Visual Studio Code (code)
export PATH="\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
EOF

# Remove brew cruft
brew cleanup

# Set up eslint globally for React
npm i eslint eslint-config-airbnb eslint-plugin-import eslint-plugin-jsx-a11y eslint-plugin-react -g

# Alternatively, set up eslint without React
# npm i eslint eslint-config-airbnb-base eslint-plugin-import

# SET UP USER CONFIG FILES

# Copy the vimrc config file
cp ./vim-config ~/.vimrc

# Create a default lintrc config file
touch ~/.eslintrc
echo >> ~/.eslintrc <<EOL
{
 “extends”: “airbnb”,
 “env”: {
 “node”: true,
 “es6”: true,
 “browser”: true
 },
 “rules”: { }
}
EOL

cat ~/.eslintrc
