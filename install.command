#! /bin/sh


cd $(dirname $0)
pwd

echo "\nCreat Backup directories:"
Date=$(date "+%Y-%m-%d %H.%M.%S")
BackupDir="$PWD/Backup/$Date"
mkdir -pv "$BackupDir"

echo "\nBackup old directories:"
mv -v "$HOME/Library/Developer/Xcode/UserData" "$BackupDir/"
mv -v "$HOME/Library/Developer/Xcode/Templates" "$BackupDir/"

echo "\nCreat link to new directories:"
ln -hfsv "$PWD/Templates" "$PWD/UserData" "$HOME/Library/Developer/Xcode"

FileKeybindSource="/Applications/Xcode.app/Contents/Frameworks/IDEKit.framework/Versions/A/Resources/IDETextKeyBindingSet.plist"
FileKeybindDestination="$PWD/IDETextKeyBindingSet/IDETextKeyBindingSet.plist"
FileKeybindBak="$BackupDir/IDETextKeyBindingSet.plist"
# echo $FileKeybindDestination

if [ -f "$FileKeybindDestination" ]
then
	echo "\nIDETextKeyBindingSet exist, backup the original file..."
	sudo mv -iv "$FileKeybindSource" "$FileKeybindBak"
else
	echo "\nOur IDETextKeyBindingSet not exist, treat the original file as new config..."
	sudo mv -iv "$FileKeybindSource" "$FileKeybindDestination"
fi

echo "\nCreat IDETextKeyBindingSet link:"
sudo ln -hfsv "$FileKeybindDestination" "$FileKeybindSource"

echo "\nSetup end."