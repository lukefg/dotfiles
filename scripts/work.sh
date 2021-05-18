#!/bin/bash

CONFIG_NAME="sheets_client_secret.json"
HIDDEN_DIR="${HOME}/.pixelberry"
CLOSET_PATH="${HOME}/Dropbox/Sync/Pixelberry"

echo "Checking for hidden folder..."
if [ -d "${HIDDEN_DIR}" ]
then
    echo "Found."
else
    echo "Not found. Creating..."
    mkdir "${HIDDEN_DIR}"
fi

echo "Looking for closet config..."
if [ -f "${HIDDEN_DIR}/${CONFIG_NAME}" ]
then
    echo "Already exists in hidden folder." # @TODO Order on this is odd. First check if its in the right spot.
else
    if [ -f "${CLOSET_PATH}/${CONFIG_NAME}" ]
    then
        echo "Found. Copying to hidden folder..."
        cp "${CLOSET_PATH}/${CONFIG_NAME}" "${HIDDEN_DIR}"
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






