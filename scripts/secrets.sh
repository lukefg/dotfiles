#!/bin/sh

DROPBOX_SYNC="${HOME}/Dropbox/Sync"

echo "Searching for required Dropbox folder (not expected for fresh install)..."
if [ -d "${DROPBOX_SYNC}" ]
then
    echo "Found!"
else
    echo "${DROPBOX_SYNC} not found."
    while true
    do
        echo "Log in to Dropbox and retrieve the Sync/ folder, then type 'Continue'."
        echo "Opening Dropbox.app..."
        open -a "Dropbox"
        read -p "Continue/Skip? " RESPONSE
        case $RESPONSE in
            [Cc]* ) break;;
            * ) echo "Skipping. Retry later."; return 1;;
        esac
        if [ -d "${DROPBOX_SYNC}" ]
        then
            echo "Found!"
            break;
        else
            echo "${DROPBOX_SYNC} still not found. Try again."
        fi
    done
fi

echo "Setting up Alfred..."
osascript -e 'tell application "Alfred" to quit'
ALFRED_SYNC_FOLDER="${DROPBOX_SYNC}/Apps/Alfred"
if [ -d "${ALFRED_SYNC_FOLDER}/Alfred.alfredpreferences" ]
then
    echo "Found Alfred preferences. Syncing..."
    defaults write com.runningwithcrayons.Alfred-Preferences syncfolder -string "${ALFRED_SYNC_FOLDER}"
    open -a "Alfred 4"
else
    echo "Could not find Alfred preferences. Skipping..."
fi

echo "Setting up BetterTouchTool..."
echo "Telling BTT to quit..."
killall BetterTouchTool
BTT_LICENSE_SOURCE="${DROPBOX_SYNC}/Apps/BetterTouchTool/license.bettertouchtool"
BTT_LICENSE_TARGET="${HOME}/Library/Application Support/BetterTouchTool/bettertouchtool.bttlicense"
if [ -f "${BTT_LICENSE_SOURCE}" ]
then
    echo "License found. Copying to ~/Library/Application Support/..."
    cp "${BTT_LICENSE_SOURCE}" "${BTT_LICENSE_TARGET}"
else
    echo "License not found. Make sure ${BTT_LICENSE_SOURCE} exists and try again later."
fi
open -a "BetterTouchTool"

unset DROPBOX_SYNC
unset ALFRED_SYNC_FOLDER
unset BTT_LICENSE_SOURCE
unset BTT_LICENSE_TARGET
unset RESPONSE

return 0

