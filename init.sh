#!/bin/bash
archiveurl="https://zenodo.org/record/44754/files/jessie.tgz"
echo "Retrieving submodules"
git submodule init
git submodule update
echo "Retrieving jessie environment (might be slow)"
wget $archiveurl
if [ $? -ne 0 ]
then
    echo "It seems to be an issue with wget, please download the archive;
    '$archiveurl' to the root of this repository"
fi
echo "Patching MemProf module"
cd MemProf/module
sed -i 's/\(int max_cnt_op =\).*;/\1 0x1FFFF0;/' mod-memprof.c
cd -
echo "You're all set !"
