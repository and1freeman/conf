#!/bin/bash

# yarn
echo "Installing yarn.."
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt update
sudo apt install yarn

# dev
echo "Installing utils.."
sudo apt install vim curl git vifm fzf cmdtest
sudo apt-get install xclip ripgrep unzip

mkdir -p ~/.vim/undodir

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# node
echo "Installing node.."
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs

# java
echo "Installing java for android.."
sudo apt install default-jre default-jdk
