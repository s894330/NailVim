NailVim
=======

Vim config used by Nail

Important:    
    before you follow the installation steps, backup ~/.vimrc, ~/.vim first

Installation:

    git clone git@github.com:s894330/NailVim.git
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
