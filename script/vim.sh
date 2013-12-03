#!/bin/bash

# bash
# No ttyctl, so we need to save and then restore terminal settings
vim()
{
    local STTYOPTS="$(stty --save)"
    stty stop '' -ixoff
    echo "executing file: $@"
    command vim "$@"
    stty "$STTYOPTS"
}

vim $1
