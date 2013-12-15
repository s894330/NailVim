#!/bin/bash
# purpose:
#	1. install nail customization vim environment

nailVim=NailVim

echo -n "Setup vim..."

# backup user original setting first
cp ~/.vimrc ~/.vimrc_backup
cp ~/.vim ~/.vim_backup
rm -rf ~/.vimrc ~/.vim

# extract bundle files
cd $nailVim
tar -xf zipFile/bundle.tar.bz2
cd ..

# setup ~/.vim
cp -a $nailVim ~/.vim

# setup ~/.vimrc
ln -s ~/.vim/vimrc ~/.vimrc

# setup ~/.bin
mkdir ~/.bin
ln -s ~/.vim/script/vim.sh ~/.bin/vim.sh
ln -s ~/.vim/script/BackgroundUpdateCScope.sh ~/.bin/BackgroundUpdateCScope.sh
ln -s ~/.vim/script/gencscopectag ~/.bin/gencscopectag

# setup ~/.bashrc
cat $nailVim/script/alias >> ~/.bashrc
source ~/.bashrc

echo "done"
echo "enjoy VIM !!"
