#!/bin/zsh

for FILE in `find ${HOME}/Repos/git/dotfiles/config/sourced`
do
	if [ -f "${FILE}" ]
	then
		echo "Sourcing ${FILE}..."
		source "${FILE}"
	fi
done