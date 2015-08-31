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

	1. sudo apt-get install vim-gnome cscope ctags git astyle compizconfig-settings-manager compiz-plugins-extra synaptic stardict geany putty meld filezilla claws-mail openjdk-7-jdk bison gcc-multilib g++-multilib gperf libxml2-utils make python-networkx zlib1g-dev:i386 zip kernel-package libncurses5-dev tree gitk git-email sparse indent aptitude uuid uuid-dev zlib1g-dev liblz-dev liblzo2-2 liblzo2-dev lzop curl git-core gparted
	2. git clone https://github.com/s894330/NailVim.git
	(deprecate)3. sudo dpkg -i zipFile/exuberant-ctags_5.8-2_amd64.deb
	4. ./script/install.sh
	5. git submodule init
	6. git submodule update
	7. source ~/.bashrc

Apply patch:
	1. cd ~/.vim
	2. go into bundle -> "each bundle"
	3. type "git am <patches under "patch_bundle" folder>" if there is corresponding patches

Usage:

	1. go into project root path
	2. type "gencscopectag" to generate database (one project doing once)
	3. type "vi" to start use
