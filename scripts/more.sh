#!/bin/sh

echo "Executing some additional steps..."

echo "Checking if Xcode Command Line Tools need installation..."
xcode-select -p
if [ $? -eq 0 ]
then
	echo "Xcode Command Line Tools directory detected. Skipping install."
else
	echo "No Xcode Command Line Tools directory detected. Installing..."
	xcode-select --install
fi

echo "Revealing user Library folder..."
chflags nohidden ~/Library

# =========================
# === SUPERUSER SECTION ===
# =========================

# echo "Requesting superuser privileges..."
# sudo -v
# echo "Keeping sudo alive until done..."
# while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo "Turning off startup chime..."
sudo nvram StartupMute=%01

return 0