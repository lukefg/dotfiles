#!/bin/sh

echo "Symlinking configurations to ${HOME}..."

for DOTFILE in $(find "${REPO_DIR}/config/linked")
do
	if [ -f ${DOTFILE} ]
	then
		echo "Linking $(basename "${DOTFILE}") to home..."
		# ln -sv
	fi
done

return 0