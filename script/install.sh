#!/bin/bash
# purpose:
#	1. install nail customization vim environment

nailVim=NailVim
RM="rm -rf"
CP="cp -a"
CD="cd"
TARX="tar -xf"
LN="ln -s"
MKDIR="mkdir"

sudo echo "Setup vim..."

# backup user original setting first
echo "backup .vimrc"
if [ -f ~/.vimrc ]; then
	$RM ~/.vimrc_backup
	$CP ~/.vimrc ~/.vimrc_backup
fi

echo "backup .vim"
if [ -d ~/.vim ]; then
	$RM ~/.vim_backup
	$CP ~/.vim ~/.vim_backup
fi
$RM ~/.vimrc ~/.vim

# extract bundle files
echo "extract bundle files"
$TARX zipFile/bundle.tar.bz2
$CD ..

# setup ~/.vim
$CP $nailVim ~/.vim

# setup ~/.vimrc
$LN ~/.vim/vimrc ~/.vimrc

# setup ~/.bin
if [ ! -d ~/.bin ]; then
	$MKDIR ~/.bin
fi

for file in ~/.vim/script/script/*
do
	if [ ! -L ~/.bin/$(basename $file) ]; then
		echo "link file: $(basename $file)"
		$LN ~/.vim/script/script/$(basename $file) ~/.bin/$(basename $file)
	fi
done

echo "init git submodule"
$CD ~/.vim
git submodule init
git submodule update
$CD bundle/SrcExpl
git am ../../patch_bundle/SrcExpl/0001-normal-the-screen.patch
git am --abort
$CD ../..

echo "Setup environment..."
if [ -f ~/.bashrc_backup ]; then
	$CP ~/.bashrc_backup ~/.bashrc
else
	$CP ~/.bashrc ~/.bashrc_backup
fi
# setup ~/.bashrc and root bashrc
cat script/alias >> ~/.bashrc
sudo cat script/rootAlias >> /etc/bash.bashrc

echo "done!!"
echo "please execute \"source ~/.bashrc\" and then enjoy it !!"
