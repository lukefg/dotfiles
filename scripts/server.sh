#!/bin/bash

# Create ~/Sites if it doesn't exist
if [ ! -d "${HOME}/Sites" ]
then
    echo "${YELLOW}No ~/Sites directory detected. Creating one..."
    mkdir -p "${HOME}/Sites"
fi

