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

echo "Setup vim..."

# backup user original setting first
if ! [ -f ~/.vimrc_backup ]; then
	echo "backup .vimrc"
	$CP ~/.vimrc ~/.vimrc_backup
fi

if ! [ -d ~/.vim_backup ]; then
	echo "backup .vim"
	$CP ~/.vim ~/.vim_backup
fi
$RM ~/.vimrc ~/.vim

# extract bundle files
echo "extract bundle files"
$RM bundle
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

# setup config
for file in ~/.vim/config/*
do
	if [ ! -L ~/.config/$(basename $file) ]; then
		echo "link file: $(basename $file)"
		$LN ~/.vim/config/$(basename $file) ~/.config/$(basename $file)
	fi
done

echo "Setup environment..."
if [ -f ~/.bashrc_backup ]; then
	echo "restore ~/.bashrc"
	$CP ~/.bashrc_backup ~/.bashrc
else
	echo "backup ~/.bashrc"
	$CP ~/.bashrc ~/.bashrc_backup
fi

# setup ~/.bashrc
$CD ~/.vim
echo "apply alias into ~/.bashrc"
cat script/alias >> ~/.bashrc

echo "done!!"
echo ""
echo "============================================================="
echo "please apply script/rootAlias into /etc/bash.bashrc manually"
echo "please execute \"source ~/.bashrc\" and then enjoy it !!"
echo "============================================================="
echo ""
