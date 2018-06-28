#!/bin/sh

# thanks to thoughtbot laptop script
fancy_echo() {
  local fmt="$1"; shift
  printf "\n$fmt\n" "$0"
}

if [ ! $DOTFILES_DIR ]; then
  fancy_echo "DOTFILES_DIR is not set"
fi

UNAME="$(uname -s)"

echo "     e    e                                    ,e,               ,e,                    "
echo "    d8b  d8b       /~~~8e   e88~~\\       d88~\\  \"  888-~88e-~88e  \"   ~~~d88P  e88~~8e  "
echo "   d888bdY88b          88b d888    ____ C888   888 888  888  888 888    d88P  d888  88b "
echo "  / Y88Y Y888b    e88~-888 8888          Y88b  888 888  888  888 888   d88P   8888__888 "
echo " /   YY   Y888b  C888  888 Y888           888D 888 888  888  888 888  d88P    Y888    , "
echo "/          Y888b  \"88_-888  \"88__/      \\_88P  888 888  888  888 888 d88P___   \"88___/  "
echo ""
echo ""
# get user input to find where the dotfiles are stored
echo "Enter the dotfiles directory --"
printf "> " && read dotfiles_dir

echo "Let's start with your system password, please..."
sudo -v
export DOTFILES_DIR=$dotfiles_dir

# add the env var to bashrc
echo "export DOTFILES_DIR=\"$dotfiles_dir\"" >> ~/.bashrc

xcode-select -p
if [ $? == 0 ]; then
  fancy_echo "XCode Command Line Tools found. Continuing.."
else
  fancy_echo "Installing xcode command line tools, this could take some time.."
  xcode-select --install
fi

# install Homebrew package manager
if [ ! -f /usr/local/bin/brew -a "$UNAME" == "Darwin" ]; then
  fancy_echo "Homebrew not found.. installing Homebrew"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  fancy_echo "Homebrew detected"
  fancy_echo "Updating brew"
  brew update
fi

# install zsh and set as shell
# only if not found
if [ ! $SHELL == "/bin/zsh" ]; then
  fancy_echo "downloading zsh"
  brew install zsh zsh-completions zsh-autosuggestions

  fancy_echo "setting zsh as default shell"
  chsh -s $(which zsh)
else
  fancy_echo "zsh already set as system shell"
fi

brew tap thoughtbot/formulae
BREW_INSTALL_LIST=( "coreutils" "elixir" "fontconfig" "git" "gpg2" "gpg-agent" "imagemagick" "mongodb" "neovim" "neovim-dot-app" "openssl" "postgresql" "puma/puma/puma-dev" "python@2" "python3" "qt" "qt5" "reattach-to-user-namespace" "ranger" "ssh-copy-id" "the_silver_searcher" "tmux" "yarn" "rcm" "z" "fzf" "keith/formulae/reminders-cli" "antigen" "cheat" "ripgrep" "crystal-lang" "zsh-autosuggestions" "clojure" )

# list of installs from brew
for cask in ${BREW_INSTALL_LIST[@]}
do
  if brew list | grep "$cask" > /dev/null; then
    fancy_echo "$cask already installed"
  else
    echo ""
    echo "$cask not found, installing via homebrew"
    brew install $cask
  fi
done

# run rcup dotfiles install
if brew list | grep "rcm" > /dev/null; then
  rcup -v -v -v -v -d $DOTFILES_DIR
fi

# tap caskroom for nerd-fonts
brew tap caskroom/fonts
OSX_APPS_LIST=( "firefox" "slack" "vlc" "alfred" "iterm2" "spectacle" "spotify" "graphiql" "docker" "dropbox" "font-firacode-nerd-font" "licecap")

for app in ${OSX_APPS_LIST[@]}
do
  if brew cask list | grep $app; then
    fancy_echo "$app already installed"
  else
    echo ""
    echo "$app not found, installing via brew cask"
    brew cask install $app
  fi
done

# start google chrome downloading in the background
(nohup brew cask install google-chrome &>/dev/null &)
(nohup brew cask install google-chrome-canary &>/dev/null &)

# install universal ctags
if brew list | grep "universal-ctags"; then
  fancy_echo "Universal ctags already installed"
else
  brew install --HEAD universal-ctags/universal-ctags/universal-ctags
fi

# install mpapis public key used to verify rvm install package
if ! gpg --list-keys | grep "409B6B1796C275462A1703113804BB82D39DC0E3" > /dev/null; then
  gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
fi

# install rvm for ruby version management
rvm -v > /dev/null
if [[ $? != 0 ]]; then
  \curl -sSL https://get.rvm.io | bash -s stable --ruby
else
  rvm get head
  rvm reload
fi

# Load RVM into a shell session *as a function*
if [[ -s "$HOME/.rvm/scripts/rvm" ]] ; then
  # First try to load from a user install
  source "$HOME/.rvm/scripts/rvm"
elif [[ -s "/usr/local/rvm/scripts/rvm" ]] ; then
  # Then try to load from a root install
  source "/usr/local/rvm/scripts/rvm"
else
  printf "ERROR: An RVM installation was not found.\n"
fi

# check for rvm usability
rvm -v > /dev/null
if [[ $? != 0 ]]; then
  fancy_echo "rvm requires a new shell session to work.\nPlease close all shell windows and begin this script again."
  exit
fi

# install latest stable ruby
rvm install ruby --latest

# tell rvm to use latest stable ruby
rvm use ruby --latest

# Install Gems
GEM_INSTALL_LIST=( "bundler" "jekyll" "rubocop" "tmuxinator" "sass" "rails" "neovim" "guard" "language_server" "reek" "rails_best_practices" )

for gem in ${GEM_INSTALL_LIST[@]}
do
  if gem list | grep $gem > /dev/null; then
    fancy_echo "$gem already installed"
  else
    echo ""
    echo "$gem not found, installing via rubygems"
    gem install $gem
  fi
done

# javascript typescript language server
if [ ! -d /usr/local/bin/javascript-typescript-langserver ]; then
  fancy_echo "installing javascript language server"
  npm install javascript-typescript-langserver -g
  npm install typescript -g
else
  fancy_echo "Javascript Langserver already installed"
fi

# add neovim npm package
npm install -g neovim

# install vundle for vim plugin management
if [ ! -f $HOME/.dotfiles/config/nvim/bundle/Vundle.vim ]; then
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim
fi

# install dein for vim plugin management
if [ ! -f $HOME/.config/nvim/dein ]; then
  mkdir ~/dotfiles_temp
  curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > ~/dotfiles_temp/installer.sh
  sh ~/dotfiles_temp/installer.sh ~/.config/nvim/dein
fi

# neovim python systems
pip2 install neovim
pip3 install neovim

# start vim and run plugin install function
nvim -u "NONE" -c ":silent source ~/.dotfiles/config/nvim/init.vim" -c ":silent PluginInstall" -c ":silent UpdateRemotePlugins" +qa!

fancy_echo "Installing Language Client Neovim Binary"
sh ~/.config/nvim/bundle/LanguageClient-neovim/install.sh

if [ -d ${HOME}/ranger/ ]; then
  fancy_echo "Installing Ranger File Browser"
  git clone git://git.savannah.nongnu.org/ranger.git ~/ranger
fi

# move ranger to usable position
mv ~/.ranger ~/ranger

# marker command line command palette
$DOTFILES_DIR/marker/install.py

# MacOS {{{
# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# hide all icons from the desktop
defaults write com.apple.finder CreateDesktop false

# Prevent Photos from opening automatically when devices are plugged in
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Finder: show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true

# Enable subpixel font rendering on non-Apple LCDs
defaults write NSGlobalDomain AppleFontSmoothing -int 2

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# Dock shows only active apps
defaults write com.apple.dock static-only -bool true; killall Dock

# Visualize CPU usage in the Activity Monitor Dock icon
defaults write com.apple.ActivityMonitor IconType -int 5

# Show all processes in Activity Monitor
defaults write com.apple.ActivityMonitor ShowCategory -int 0

# Sort Activity Monitor results by CPU usage
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0

# Show the ~/Library folder.
chflags nohidden ~/Library

for $app in "Calendar" "Contacts" "Dock" "Finder" "SystemUIServer"; do
  killall "${app}" &> /dev/null
done
# }}}

# Personal, info to not put in public
. $DOTFILES_DIR/.personal_setup.sh

