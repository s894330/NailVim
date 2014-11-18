NailVim
=======

Purpose:

    1. let vim become a powerful editor
    2. backup all my working environment

Tested OS:

	1. Ubuntu 11.10 64 bit
	2. Ubuntu 12.04.3 64 bit
	3. Ubuntu 14.04.1 64 bit

Installation:

	1. sudo apt-get install cscope ctags git astyle
	2. git clone https://github.com/s894330/NailVim.git
	(deprecate)3. sudo dpkg -i zipFile/exuberant-ctags_5.8-2_amd64.deb
	4. ./script/install.sh
	5. source ~/.bashrc

Apply patch:
	1. cd ~/.vim
	2. go into bundle -> "each bundle"
	3. type "git am <patches under "patch_bundle" folder>" if there is corresponding patches

Usage:

	1. go into project root path
	2. type "gencscopectag" to generate database (one project doing once)
	3. type "vi" to start use
