#! /bin/sh


cd $(dirname $0)
pwd

echo "\nBackup old directories:"
mv -iv ~/Library/Developer/Xcode/UserData ~/Library/Developer/Xcode/UserData$RANDOM.bak
mv -iv ~/Library/Developer/Xcode/Templates ~/Library/Developer/Xcode/Templates$RANDOM.bak

echo "\nCreat link to new directories:"
ln -hfsv "$PWD/Templates" "$PWD/UserData" ~/Library/Developer/Xcode

echo "\nSetup end."