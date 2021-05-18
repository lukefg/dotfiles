#!/bin/bash

function check_brewfile() {

	if [ -z $1 ]
	then
		echo "ERROR: check_brewfile() needs an argument."
		return 1
	fi

	if [ ! -r $1 ]
	then
		echo "ERROR: $1 is not readable."
		return 2
	fi

	echo "Checking if everything in $1 is installed already..."
	brew bundle check --file="$1"
	if [ $? -eq 0 ]
	then
		echo "Success!"
	else
		echo "Something's missing from $1. Brewing..."
		brew bundle --file="$1"
	fi
}

BREWFILE_DIR="scripts/brewfiles"
MY_BREWFILES="Brewfile Brewfile-mine-gaming Brewfile-mine-music Brewfile-work"

echo "Updating Homebrew..."
brew update
echo "Upgrading any pre-existing Homebrew packages or apps..."
brew upgrade

echo "Changing working directory to ${BREWFILE_DIR}..."
cd ${BREWFILE_DIR}
echo "Executing Brewfiles based on requirements..."

check_brewfile Brewfile
test $INSTALL_GAMING && check_brewfile Brewfile-mine-gaming
test $INSTALL_MUSIC && check_brewfile Brewfile-mine-music
test $INSTALL_WORK && check_brewfile Brewfile-work
test $INSTALL_CHOICES && check_brewfile Brewfile-work-choices
test $INSTALL_3D && check_brewfile Brewfile-work-3d
test $INSTALL_1001 && check_brewfile Brewfile-work-1001

echo "Cleaning up..."
brew cleanup
echo "Done"

cd ../.. # To dotfiles root

unset BREWFILE_DIR
unset MY_BREWFILES
unset FILE

return 0

