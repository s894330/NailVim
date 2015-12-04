NailVim
=======

Purpose:

    1. let vim become a powerful editor
    2. backup all my working environment

Tested OS:

	1. Ubuntu 11.10 64 bit
	2. Ubuntu 12.04.3 64 bit
	3. Ubuntu 14.04.1 64 bit
	4. Ubuntu 14.04.3 64 bit

Installation:

	1. sudo apt-get install vim-gnome cscope ctags git astyle compizconfig-settings-manager compiz-plugins-extra synaptic stardict geany putty meld filezilla claws-mail openjdk-7-jdk bison gcc-multilib g++-multilib gperf libxml2-utils make python-networkx zlib1g-dev:i386 zip kernel-package libncurses5-dev tree gitk git-email sparse indent aptitude liblz-dev curl git-core gparted roxterm terminator pcmanx-gtk2 fonts-arphic-ukai ibus-chewing android-tools-adb wine flex libssl-dev libexpat1-dev libexpat1-dev:i386 bless gitstats bin86
	2. cd /opt
	3. git clone https://github.com/s894330/NailVim.git
	4. cd NailVim
	5. ./script/install.sh
	6. source ~/.bashrc

Usage:

	1. go into project root path
	2. type "gencscopectag" to generate database (one project doing once)
	3. type "vi" to start use
