#!/bin/sh

BREWFILE_DIR="scripts/brewfiles"
MY_BREWFILES="Brewfile Brewfile-mine-gaming Brewfile-mine-music Brewfile-work"

echo "Updating Homebrew..."
brew update
echo "Upgrading any pre-existing Homebrew packages or apps..."
brew upgrade

echo "Executing Brewfiles..."
echo "Changing working directory to ${BREWFILE_DIR}..."
cd ${BREWFILE_DIR}
for FILE in ${MY_BREWFILES}
do
	echo "Now starting: ${FILE}..."
	brew bundle --file="${FILE}"
	# Automatically installs the bundle "tap" on first run

	echo "Checking if everything was installed..."
	brew bundle check --file="${FILE}"
	if [ $? -eq 0 ]
	then
		echo "Success!"
	else
		echo "Something's missing from ${FILE}. Exiting. Retry later."
		cd ../.. # To dotfiles root
		return 1
	fi
done

echo "Cleaning up..."
brew cleanup
echo "Done"

cd ../.. # To dotfiles root

unset BREWFILE_DIR
unset MY_BREWFILES
unset FILE

return 0

