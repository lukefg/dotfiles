#!/bin/bash

echo "Executing some additional steps..."

# Set up Xcode CLT
echo "Checking if Xcode Command Line Tools need installation..."
if [ -d $(xcode-select -p) ]
then
	echo "${GREEN}Xcode Command Line Tools directory detected. Skipping install.${RESET}"
else
	echo "${YELLOW}No Xcode Command Line Tools directory detected. Installing...${RESET}"
	xcode-select --install
fi

# Accept Xcode license
echo "${CYAN}Please accept Xcode license...${RESET}"
sudo xcodebuild -license accept

echo "Revealing user Library folder..."
chflags nohidden ~/Library

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
	python3 -mpip install requests
	python3 -mpip install boto3

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
	scutil --set ComputerName "${TRIMMED}"
	scutil --set LocalHostName "${TRIMMED}"
fi

unset RESPONSE TRIMMED

return 0