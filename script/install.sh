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

for file in ~/.vim/script/script/*
do
	if [ ! -L ~/.bin/$(basename $file) ]; then
		echo "link file: $(basename $file)"
		ln -s ~/.vim/script/script/$(basename $file) ~/.bin/$(basename $file)
	fi
done

echo "done"

echo -n "Setup environment..."
# setup ~/.bashrc and root bashrc
cat $nailVim/script/alias >> ~/.bashrc
#sudo cat $nailVim/script/rootAlias >> /etc/bash.bashrc
echo "done"
echo "please execute \"source ~/.bashrc\" and then enjoy it !!"
