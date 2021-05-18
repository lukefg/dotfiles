#!/bin/bash

echo "Executing some additional steps..."

# Set up Xcode CLT
echo "Checking if Xcode Command Line Tools need installation..."
if [ -d $(xcode-select -p) ]
then
	echo "Xcode Command Line Tools directory detected. Skipping install."
else
	echo "No Xcode Command Line Tools directory detected. Installing..."
	xcode-select --install
fi

# Accept Xcode license
echo "Please accept Xcode license..."
sudo xcodebuild -license accept

echo "Revealing user Library folder..."
chflags nohidden ~/Library

# PYTHON
echo "Downloading pip as Python package manager..."
python3 -m pip --version
if [ $? -eq 0 ]
then
	curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
	python3 get-pip.py
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

rm get-pip.py

return 0