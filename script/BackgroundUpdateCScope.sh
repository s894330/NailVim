#!/bin/bash
# background update cscope

cscopeFile="cscope.out"
errFile="errMsg"

# check if cscope.out is exist
if [ -f $cscopeFile ]; then
	while true ; do
		sleep 45
		stat1=$(stat -c %y $cscopeFile)		
		cscope -bCkR >/dev/null 2>&1
		stat2=$(stat -c %y $cscopeFile)		
		if [ "$stat1" != "$stat2" ];then
			sleep 3
			vim --servername $1 --remote-expr "ResetCscope()" 1>/dev/null 2>$errFile
		else
			# codebase not change, only check if vim server is still alive			
			vim --servername $1 --remote-expr "Echo()" 1>/dev/null 2>$errFile
		fi

		# if got error, exit anyway
		if [ -s $errFile ]; then
			#echo "vim not exist, exit"
			rm -rf $errFile
			exit
		fi
	done
fi
