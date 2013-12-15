#!/bin/bash
# purpose:
#	1. enable ctrl+<key> in vim
#	2. prevent multi vim instance in the same project

# include variables
myDIR=$(dirname $(readlink -f $0))
source $myDIR/variable.sh

# check if cscope.out is exist
if [ -f $cscopeFile ]; then	# this is a project folder
	if [ -f $errFile ]; then	# there is other vim occupy this project
		echo "there is other vim occupy this project, please close it first!!"
		exit		
	fi
	
	# generate unique server id
	ServerID=$RANDOM

	# call background update cscope script
	BackgroundUpdateCScope.sh $ServerID &
fi

# save ttyctl setting
STTYOPTS="$(stty --save)"
stty stop '' -ixoff -ixon

# call vim
vim --servername $ServerID $@
   
# restore ttyctl setting
stty "$STTYOPTS"
