#!/bin/bash

# Install XCode Developer Tools
xcode-select —install
# Install OhMyZsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
# Install NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
# Install brew packages
brew install starship\
    chamber\
    httpie\
    ack\
    pyenv\
    pyenv-virtualenv\
    tree\
    wget\
    python3\
    awscli\
    coreutils\
    unix2dos

# Add Casks to Brew
brew tap caskroom/cask

# Install Casks Apps
brew cask install google-chrome\
    visual-studio-code\
    slack\
    spotify\
    microsoft-teams\
    muzzle\
    rocket\
    vanilla

# Install OhMyZsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Modify .zshrc
echo -e 'eval "$(starship init zsh)"' >> ~/.zshrc
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.zshrc
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv virtualenv-init -)"\nfi' >> ~/.zshrc
echo -e 'syntax on' >> ~/.vimrc
echo -e 'export PATH="/usr/local/sbin:$PATH"' >> ~/.zshrc

# Prepare directories for files to be populated
mkdir -p ~/.ssh
mkdir -p ~/.config
mkdir -p ~/.aws

cp files/starship.toml ~/.config/
