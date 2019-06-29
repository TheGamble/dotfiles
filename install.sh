#!/bin/bash

#get the essentials
sudo apt update
sudo apt -y upgrade
sudo apt install -y git zsh curl unzip

#git and link dotfiles
cd ~
git clone https://github.com/TheGamble/dotfiles .dotfiles
ln -s .dotfiles/.nanorc .nanorc

#oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
rm .zshrc
ln -s .dotfiles/.zshrc .zshrc

#nano highlighting
curl https://raw.githubusercontent.com/scopatz/nanorc/master/install.sh | sh

#change shell
sudo chsh -s $(which zsh) $USER
