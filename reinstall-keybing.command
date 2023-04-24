#! /bin/zsh
set -euo pipefail

cd $(dirname $0)
echo "Current dir is \"$PWD\"\n"

# Detect Xcode install path
# http://apple.stackexchange.com/a/219508/65417
if type xcode-select >&- && xpath=$( xcode-select --print-path ) &&
   test -d "$xpath" && test -x "$xpath" ; then
   echo "Detect Xcode at path: ${xpath}"
else
   echo "Skip install: Seems Xcode not instaled, try execute xcode-select --install."
   exit 2
fi

# Check Xcode content path
XcodeContentPath="$(dirname $xpath)"
case "$XcodeContentPath" in
  *".app/Contents")
    # echo "xcode ptah is ok"
  ;;
  *"Library"*)
    echo "Seems Xcode path not set correctly, try execute xcode-select --switch <Xcode.app path>" 
    exit 2
  ;;
  *)
    echo "Unexcept Xcode path: $XcodeContentPath"
    exit 2
  ;;
esac

echo "\nCreat Backup directories:"
Date=$(date "+%Y-%m-%d %H.%M.%S")
BackupDir="$PWD/Backup/$Date"
mkdir -pv "$BackupDir"

echo "\nCreat link to new directories:"
ln -hfsv "$PWD/Templates" "$PWD/UserData" "$HOME/Library/Developer/Xcode"

FileKeybindSource="$XcodeContentPath/Frameworks/IDEKit.framework/Versions/A/Resources/IDETextKeyBindingSet.plist"
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

echo "\nSetup successful."