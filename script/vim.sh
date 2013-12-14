#!/bin/bash

# bash
# No ttyctl, so we need to save and then restore terminal settings
vim()
{
	# save ttyctl setting
    local STTYOPTS="$(stty --save)"
    stty stop '' -ixoff -ixon

    # generate unique server id
    ServerID=$RANDOM

    # call background update cscope script
    command BackgroundUpdateCScope.sh $ServerID &

    # call vim
    command vim --servername $ServerID $@
    
    # restore ttyctl setting
    stty "$STTYOPTS"
}

vim $@
