#!/bin/bash
archiveurl="TODO"
echo "Retrieving submodules"
git submodule init
git submodule update
echo "Retrieving jessie environment (might be slow)"
wget $archiveurl
if [ $? -ne 0 ]
then
    echo "It seems to be an issue with wget, please download the archive;
    $archiveurl on the root of this repository"
fi
echo "Patching MemProf module"
cd Memprof/module
sed -i 's/\(int max_cnt_op =\).*;/\1 0x1FFFF0;/' mod-memprof.c
cd -
echo "You're all set !"
