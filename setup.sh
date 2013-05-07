#! /bin/sh


cd $(dirname $0)
pwd

echo "\nBackup old directories:"
mv -iv ~/Library/Developer/Xcode/UserData ~/Library/Developer/Xcode/UserData$RANDOM.bak
mv -iv ~/Library/Developer/Xcode/Templates ~/Library/Developer/Xcode/Templates$RANDOM.bak

echo "\nCreat link to new directories:"
ln -hfsv "$PWD/Templates" "$PWD/UserData" ~/Library/Developer/Xcode

echo "\nBackup old IDETextKeyBindingSet:"
sudo mv -iv  /Applications/Xcode.app/Contents/Frameworks/IDEKit.framework/Versions/A/Resources/IDETextKeyBindingSet.plist IDETextKeyBindingSet/IDETextKeyBindingSet.plist

echo "\nCreat IDETextKeyBindingSet link:"
sudo ln -hfsv "$PWD/IDETextKeyBindingSet/IDETextKeyBindingSet.plist" "/Applications/Xcode.app/Contents/Frameworks/IDEKit.framework/Versions/A/Resources/IDETextKeyBindingSet.plist"

echo "\nSetup end."