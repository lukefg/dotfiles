#!/bin/bash

# ===============
# === DROPBOX ===
# ===============

DROPBOX_SYNC="${HOME}/Dropbox/Sync"

echo "Searching for required Dropbox folder (not expected for fresh install)..."
if [ -d "${DROPBOX_SYNC}" ]
then
    echo "${GREEN}Found!${RESET}"
else
    echo "${YELLOW}${DROPBOX_SYNC} not found.${RESET}"
    while true
    do
        echo "Log in to Dropbox and retrieve the Sync/ folder, then type 'Continue'."
        echo "Opening Dropbox.app now..."
        open -a "Dropbox"
        read -p "${CYAN}[C]ontinue/[S]kip? ${RESET}" RESPONSE
        case $RESPONSE in
            [Cc]* ) break;;
            * ) echo "Skipping. Retry later."; return 1;; # @TODO I think this is busted
        esac
        if [ -d "${DROPBOX_SYNC}" ]
        then
            echo "${GREEN}Found!${RESET}"
            break;
        else
            echo "${RED}${DROPBOX_SYNC} still not found. Try again.${RESET}"
        fi
    done
fi

echo "Setting up Alfred..."
echo "Telling Alfred to quit..."
osascript -e 'tell application "Alfred" to quit'
ALFRED_SYNC_FOLDER="${DROPBOX_SYNC}/Apps/Alfred"
if [ -d "${ALFRED_SYNC_FOLDER}/Alfred.alfredpreferences" ]
then
    echo "${YELLOW}Found Alfred preferences. Syncing...${RESET}"
    defaults write com.runningwithcrayons.Alfred-Preferences syncfolder -string "${ALFRED_SYNC_FOLDER}"
    open -a "Alfred 4"
else
    echo "${RED}Could not find Alfred preferences. Skipping...${RESET}"
fi

echo "Setting up BetterTouchTool..."
echo "Telling BTT to quit..."
killall BetterTouchTool
BTT_LICENSE_SOURCE="${DROPBOX_SYNC}/Apps/BetterTouchTool/license.bettertouchtool"
BTT_LICENSE_TARGET="${HOME}/Library/Application Support/BetterTouchTool/bettertouchtool.bttlicense"
if [ -f "${BTT_LICENSE_SOURCE}" ]
then
    echo "${YELLOW}License found. Copying to ~/Library/Application Support/...${RESET}"
    cp "${BTT_LICENSE_SOURCE}" "${BTT_LICENSE_TARGET}"
else
    echo "${RED}License not found. Make sure ${BTT_LICENSE_SOURCE} exists and try again later.${RESET}"
fi
echo "Relaunching BetterTouchTool..."
open -a "BetterTouchTool"

echo "Setting up Moom..."
echo "Telling Moom to quit..."
killall "Moom"
MOOM_PREFS="${DROPBOX_SYNC}/Apps/Moom/copied.plist"
if [ -f "${MOOM_PREFS}" ]
then
    echo "${YELLOW}Moom plist found in Dropbox. Importing to defaults...${RESET}"
    defaults import com.manytricks.Moom "${MOOM_PREFS}"
else
    echo "${RED}Moom settings could not be found. From source Mac, export them to ${MOOM_PREFS} and try again later.${RESET}"
fi
echo "Relaunching Moom..."
open -a "Moom"

unset DROPBOX_SYNC ALFRED_SYNC_FOLDER BTT_LICENSE_SOURCE BTT_LICENSE_TARGET RESPONSE MOOM_PREFS

return 0

