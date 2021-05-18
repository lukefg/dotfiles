#!/bin/bash

echo "Symlinking configurations to ${HOME}..."

for DOTFILE in $(find "$(pwd)/config/linked")
do
	if [ -f ${DOTFILE} ] # is a file
	then
		DOTFILE_BASENAME=$(basename "${DOTFILE}") # check if there already is one in HOME
		if [ -f "${HOME}/${DOTFILE_BASENAME}" ] # file already exists in target location
		then
			if [ -L "${HOME}/${DOTFILE_BASENAME}" ] # that file is a symlink
			then
				MESSAGE_PREFIX="${DOTFILE_BASENAME} is already symlinked to HOME."
			else
				MESSAGE_PREFIX="${DOTFILE_BASENAME} is already a file in HOME."
			fi
			read -p "${MESSAGE_PREFIX} Are you sure? [yN] " RESPONSE # -p inline prompt
			case $RESPONSE in
				[Yy]* ) ;;
				* ) echo "Canceling. Retry later."; unset RESPONSE; return 1;;
			esac
		fi

		echo "Linking $(basename "${DOTFILE}") to home..."
		ln -fs "${DOTFILE}" "${HOME}" # -s: symbolic; -f: if it already exists, replace it
	fi
done

unset DOTFILE
unset DOTFILE_BASENAME
unset MESSAGE_PREFIX
unset RESPONSE

return 0