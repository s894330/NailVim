#!/bin/bash
# purpose:
#	1. install nail customization vim environment

echo -n "Setup vim..."

# backup user original setting first
cp ~/.vimrc ~/.vimrc_backup
cp ~/.vim ~/.vim_backup
rm -rf ~/.vimrc ~/.vim

# extract bundle files
tar -xf zipFile/bundle.tar.bz2

# setup ~/.vim
cd ..
cp NailVim ~/.vim
cd NailVim

# setup ~/.vimrc
ln -s ~/.vim/vimrc ~/.vimrc

# setup ~/.bin
mkdir ~/.bin
ln -s ~/.vim/script/vim.sh ~/.bin/vim.sh
ln -s ~/.vim/script/BackgroundUpdateCScope.sh ~/.bin/BackgroundUpdateCScope.sh
ln -s ~/.vim/script/gencscopectag ~/.bin/gencscopectag

# setup ~/.bashrc
cat script/alias >> ~/.bashrc
source ~/.bashrc

echo "done"
echo "enjoy VIM !!"
