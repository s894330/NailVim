NailVim
=======

Purpose:
    1. let vim become a powerful editor
    2. backup all my working environment

Running OS:
	1. Ubuntu 14.04.1 64 bit

Installation:
<<<<<<< HEAD

	1. sudo apt-get install vim-gnome cscope ctags git astyle compizconfig-settings-manager compiz-plugins-extra synaptic stardict geany putty meld filezilla claws-mail openjdk-7-jdk bison gcc-multilib g++-multilib gperf libxml2-utils make python-networkx zip kernel-package libncurses5-dev tree gitk git-email sparse indent aptitude liblz-dev curl git-core gparted roxterm terminator pcmanx-gtk2 fonts-arphic-ukai ibus-chewing flex libssl-dev libexpat1-dev bless gitstats bin86 bochs bochs-x bochs-sdl libxrandr-dev libsdl1.2-dev nasm libswitch-perl xscreensaver android-tools-adb android-tools-fastboot graphviz cflow gawk partclone tftp-hpa intltool libtool libjson0 libjson0-dev cppcheck texinfo libxml2-dev kolourpaint4 libsdl2-2.0-0 libssh2-1-dev gcc-arm-linux-gnueabi cmake
	2. set git config
		git config --global user.email "<your mail>"
		git config --global user.name "<your name"
	2. cd /opt
	3. git clone https://github.com/s894330/NailVim.git
	4. cd NailVim
	5. ./script/install.sh
	6. source ~/.bashrc

Usage:
	1. go into project root path
	2. type "gencscopectag" to generate database (one project doing once)
	3. type "vi" to start use
