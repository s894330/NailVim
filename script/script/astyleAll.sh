#!/bin/bash

COMMAND="astyle --style=java --indent=spaces=4 --attach-namespaces --attach-classes --indent-preproc-define --indent-col1-comments --min-conditional-indent=0 --max-instatement-indent=40 --break-blocks --pad-oper --pad-header --unpad-paren --delete-empty-lines --align-pointer=name --align-reference=name --remove-brackets --convert-tabs --close-templates --break-after-logical"
RM="rm -rf"
LOG_FILE="format.log"

echo "===== begin C/CPP/Java file format ====="
echo "" > $LOG_FILE

find $pwd -name "*.h" -type f |
    while read file
    do        
        $COMMAND $file >> $LOG_FILE
        $RM $file.orig        
    done

find $pwd -name "*.c" -type f |
    while read file
    do        
        $COMMAND $file >> $LOG_FILE
        $RM $file.orig        
    done

find $pwd -name "*.cpp" -type f |
    while read file
    do        
        $COMMAND $file >> $LOG_FILE
        $RM $file.orig        
    done

find $pwd -name "*.java" -type f |
    while read file
    do        
        $COMMAND $file >> $LOG_FILE
        $RM $file.orig        
    done

echo "=====  end C/CPP/Java file file format ====="
