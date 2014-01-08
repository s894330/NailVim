#!/bin/bash
# purpose:
#	1. background update cscope.out database

# include variables
myDIR=$(dirname $(readlink -f $0))
vimTMP=".vimTmp"
source $myDIR/../variable.sh

touch $errFile
while true
do
	sleep 3	# update interval
	stat1=$(stat -c %y $cscopeFile)		
	cscope -bCkR >/dev/null 2>&1
	stat2=$(stat -c %y $cscopeFile)		
	if [ "$stat1" != "$stat2" ];then	# cscope.out is updated, reset cscope connection
		sleep 3	# prevent no cscope connection error
		vim --servername $1 --remote-expr "ResetCscope()" 1>/dev/null 2>$errFile
	else
		# codebase not change, only check if vim server is still alive			
		vim --servername $1 --remote-expr "Echo()" 1>/dev/null 2>$errFile
	fi

	# if got error, exit anyway
	if [ -s $errFile ]; then
		# modify Session.vim file		
		sed '/setlocal colorcolumn=81/d' < $PWD/.vimSession/Session.vim > $vimTMP && mv $vimTMP $PWD/.vimSession/Session.vim
		
		#echo "vim not exist, exit"
		rm -rf $errFile	
				
		exit
	fi
done
