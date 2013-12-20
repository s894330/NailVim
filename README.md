NailVim
=======

Purpose:
    1. let vim become a powerful editor
    2. backup all my working environment

Tested OS:
	1. Ubuntu 11.10 64bit
	2. Ubutnu 12.04.3 64 bit

Installation:
	1. sudo apt-get install vim-gnome cscope git astyle
	2. git clone https://github.com/s894330/NailVim.git
	3. sudo dpkg -i NailVim/zipFile/exuberant-ctags_5.8-2_amd64.deb
	4. ./NailVim/script/install.sh
	5. source ~/.bashrc

Usage:
	1. go into project root path
	2. type "gencscopectag" to generate database (one project doing once)
	3. type "vi" to start use
