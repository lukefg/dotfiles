#!/bin/bash

function check_brewfile() {

	if [ -z $1 ]
	then
		echo "${RED}ERROR: check_brewfile() needs an argument.${RESET}"
		return 1
	fi

	if [ ! -r $1 ]
	then
		echo "${RED}ERROR: $1 is not readable.${RESET}"
		return 2
	fi

	echo "Checking if everything in $1 is installed already..."
	brew bundle check --file="$1"
	if [ $? -eq 0 ]
	then
		echo "${GREEN}Success!${RESET}"
	else
		echo "${YELLOW}Something's missing from $1. Brewing...${RESET}"
		brew bundle --file="$1"
	fi
}

BREWFILE_DIR="scripts/brewfiles"

echo "Updating Homebrew..."
brew update
echo "Upgrading any pre-existing Homebrew packages or apps..."
brew upgrade

echo "Changing working directory to ${BREWFILE_DIR}..."
cd ${BREWFILE_DIR}
echo "Executing Brewfiles based on requirements..."

check_brewfile Brewfile
check_brewfile Brewfile-dev
check_brewfile Brewfile-fonts
test $INSTALL_GAMING && check_brewfile Brewfile-mine-gaming
test $INSTALL_MUSIC && check_brewfile Brewfile-mine-music
test $INSTALL_WORK && check_brewfile Brewfile-work
test $INSTALL_CHOICES && check_brewfile Brewfile-work-choices

echo "Cleaning up..."
brew cleanup
echo "Done"

cd ../.. # To dotfiles root

unset BREWFILE_DIR FILE

return 0
