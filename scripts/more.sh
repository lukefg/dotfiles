#!/bin/bash

echo "Executing some additional steps..."

# Accept Xcode license
if [ -d "/Applications/Xcode.app" ]
then 
	echo "${CYAN}Please accept Xcode license...${RESET}"
	sudo xcodebuild -license accept
fi

# This no longer works in Mojave and later.
#echo "Revealing user Library folder..."
#chflags nohidden ~/Library

# PYTHON
echo "Checking for pip installation..."
python3 -m pip --version
if [ $? -eq 0 ]
then
	echo "${GREEN}Found.${RESET}"
else
	echo "${YELLOW}Not found. Downloading pip as Python package manager...${RESET}"
	curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
	python3 get-pip.py
	rm get-pip.py
	python3 -m pip install --upgrade pip
	python3 -m pip install requests
	python3 -m pip install boto3
fi

# =========================
# === SUPERUSER SECTION ===
# =========================

# echo "Requesting superuser privileges..."
# sudo -v
# echo "Keeping sudo alive until done..."
# while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo "Turning off startup chime..."
sudo nvram StartupMute=%01

echo "Setting computer name and local hostname..."
echo "Currently, computer name is $(scutil --get ComputerName), and local hostname is $(scutil --get LocalHostName)"
read -p "${CYAN}What should this computer's name and hostname be? [Leave empty to skip] ${RESET}" RESPONSE
TRIMMED=$(echo $RESPONSE | xargs)
if [ -z ${TRIMMED} ]
then
	echo "${RED}Skipping. Try again later.${RESET}"
else
	echo "${YELLOW}Setting computer and host names to ${TRIMMED}...${RESET}"
	sudo scutil --set ComputerName "${TRIMMED}"
	sudo scutil --set LocalHostName "${TRIMMED}"
fi

# Create screenshots directory
SCREENSHOTS_DIR="${HOME}/Desktop/Screenshots"
if [ ! -d "${SCREENSHOTS_DIR}" ]
then
	echo "Creating ${SCREENSHOTS_DIR} to hold screenshots..."
	mkdir "${SCREENSHOTS_DIR}"
fi

unset RESPONSE TRIMMED SCREENSHOTS_DIR

return 0