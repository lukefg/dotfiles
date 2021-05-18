#!/bin/bash

CONFIG_NAME="sheets_client_secret.json"
HIDDEN_DIR="${HOME}/.pixelberry"
CLOSET_PATH="${HOME}/Dropbox/Sync/Pixelberry"

echo "Checking for hidden folder..."
if [ -d "${HIDDEN_DIR}" ]
then
    echo "${GREEN}Found.${RESET}"
else
    echo "${RED}Not found. Creating...${RESET}"
    mkdir "${HIDDEN_DIR}"
fi

echo "Looking for closet config..."
if [ -f "${HIDDEN_DIR}/${CONFIG_NAME}" ]
then
    echo "${GREEN}Already exists in hidden folder.${RESET}"
else
    if [ -f "${CLOSET_PATH}/${CONFIG_NAME}" ]
    then
        echo "${YELLOW}Found. Copying to hidden folder...${RESET}"
        cp "${CLOSET_PATH}/${CONFIG_NAME}" "${HIDDEN_DIR}"
    else
        echo "${RED}Not found. Place the config in Dropbox and try again later.${RESET}"
    fi
fi

unset HIDDEN_DIR CONFIG_NAME CLOSET_PATH

# echo "Looking for Choices repos..." @TODO
# login, svn the repos, then symlink them to Desktop

# @TODO Download test rig app and move to Desktop






