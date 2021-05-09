#!/bin/sh

echo "Updating Homebrew..."
brew update
echo "Upgrading any pre-existing Homebrew packages or apps..."
brew upgrade

echo "Executing Brewfile..."
brew bundle --file scripts/Brewfile
# Automatically installs the bundle "tap" on first run

echo "Checking if everything was installed..."
brew bundle check --file scripts/Brewfile
if [ $? -eq 0 ]
then
	echo "Success!"
else
	echo "Something's missing. Retry later."
	return 1
fi

return 0

