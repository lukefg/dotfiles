#!/bin/bash

echo "Checking for hidden folder..."
HIDDEN_DIR="${HOME}/.pixelberry"
if [ -d "${HIDDEN_DIR}" ]
then
    echo "Found."
else
    echo "Not found. Creating..."
    mkdir "${HIDDEN_DIR}"
fi

echo "Looking for closet config..."
CONFIG_NAME="sheets_client_secret.json"
CLOSET_PATH="${HOME}/Dropbox/Sync/Pixelberry"
if [ -f "${HIDDEN_DIR}/${CONFIG_NAME}" ]
then
    echo "Already exists in hidden folder."
else
    if [ -f "${CLOSET_PATH}/${CONFIG_NAME}" ]
    then
        echo "Found. Copying to hidden folder..."
        cp "${CLOSET_PATH}" "${HIDDEN_DIR}"
    else
        echo "Not found. Place the config in Dropbox."
    fi
fi

unset HIDDEN_DIR
unset CONFIG_NAME
unset CLOSET_PATH

# echo "Looking for Choices repos..." @TODO
# login, svn the repos, then symlink them to Desktop

# @TODO Download test rig app and move to Desktop






