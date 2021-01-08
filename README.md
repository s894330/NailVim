NailVim
=======

Purpose:
    1. let vim become a powerful editor
    2. backup all my working environment

Running OS:
	1. Ubuntu 14.04.1 64 bit

Installation:
	1. (for 1404) sudo apt-get install vim-gnome cscope ctags git astyle compizconfig-settings-manager compiz-plugins-extra synaptic stardict geany putty meld filezilla bison gperf make zip tree gitk sparse indent aptitude liblz-dev curl git-core gparted roxterm terminator pcmanx-gtk2 fonts-arphic-ukai flex bless gitstats bin86 bochs bochs-x bochs-sdl nasm xscreensaver android-tools-adb android-tools-fastboot graphviz cflow gawk partclone tftp-hpa intltool libtool cppcheck texinfo kolourpaint4 gcc-arm-linux-gnueabi cmake openssh-server build-essential remmina
	1. (for 1804) sudo apt-get install vim-gnome cscope ctags git synaptic stardict geany meld bison gperf make zip tree gitk aptitude curl gparted terminator pcmanx-gtk2 fonts-arphic-ukai flex bless gitstats gawk kolourpaint4 cmake openssh-server build-essential remmina partclone python3-venv adb flake8
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
