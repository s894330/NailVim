#!/bin/bash
# purpose:
#	1. package all files stored in bundle/ because github will not auto sync
#      them when git clone NailVim

echo -n "packaging bundle plugins..."

tar cjvf zipFile/bundle.tar.bz2 bundle/ 2>&1 >/dev/null

echo "done"
