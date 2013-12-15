NailVim
=======

Purpose:
    1. let vim become a powerful editor

Tested OS:
	1. Ubuntu 11.10 64bit
	2. Ubutnu 12.04.3 64 bit

Installation:
	1. sudo apt-get install vim cscope git	
    2. git clone https://github.com/s894330/NailVim.git
    3. sudo dpkg -i NailVim/zipFile/exuberant-ctags_5.8-2_amd64.deb
    4. ./NailVim/script/install.sh
    5. source ~/.bashrc

    
    mv NailVim ~/.vim
    rm -rf ~/.vimrc

Create symlinks:

    ln -s ~/.vim/vimrc ~/.vimrc
    ln -s ~/.vim/gvimrc ~/.gvimrc

Switch to the `~/.vim` directory, and fetch submodules:

    cd ~/.vim
    git submodule init
    git submodule update

Note:
List of plugins which not controlled by git submodule:
    taglist -- added at 2013/12/1 by Nail
    trinity -- added at 2013/12/1 by Nail
