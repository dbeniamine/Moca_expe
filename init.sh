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

echo "Patching MemProf scipts"
cd MemProf/scripts
git apply ../../MemProf.patch
cd ../..

echo "Patching MemProfTun scipts"
cd MemProfTun/scripts
git apply ../../MemProf.patch
cd ../..

echo "Patching MemProfTun module"
cd MemProf/module
git apply ../../MemProfTun.patch
cd ../..


echo "Patching Mitos"
cd Mitos
git apply ../Mitos.patch
cd ..

echo "You're all set !"
echo "See Readme.md for more informations"
