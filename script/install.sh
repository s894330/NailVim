#!/bin/bash
# purpose:
#	1. install nail customization vim environment

nailVim=NailVim

echo -n "Setup vim..."

# backup user original setting first
if [ -f ~/.vimrc ]; then
	cp ~/.vimrc ~/.vimrc_backup
fi

if [ -d ~/.vim ]; then
	cp -a ~/.vim ~/.vim_backup
fi
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
if [ ! -d ~/.bin ]; then
	mkdir ~/.bin
fi

if [ ! -L ~/.bin/vim.sh ]; then
	ln -s ~/.vim/script/vim.sh ~/.bin/vim.sh
	ln -s ~/.vim/script/BackgroundUpdateCScope.sh ~/.bin/BackgroundUpdateCScope.sh
	ln -s ~/.vim/script/gencscopectag ~/.bin/gencscopectag
fi

# setup ~/.bashrc
cat $nailVim/script/alias >> ~/.bashrc
source ~/.bashrc

echo "done"
echo "enjoy VIM !!"
