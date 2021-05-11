#!/bin/bash

echo "Symlinking configurations to ${HOME}..."

for DOTFILE in $(find "$(pwd)/config/linked")
do
	if [ -f ${DOTFILE} ] # file exists
	then

		# check if there already is one in HOME
		DOTFILE_BASENAME=$(basename "${DOTFILE}")
		if [ -f "${HOME}/${DOTFILE_BASENAME}" ] # file exists
		then
			if [ -L "${HOME}/${DOTFILE_BASENAME}" ] # is symlink
			then
				MESSAGE_PREFIX="${DOTFILE_BASENAME} is already symlinked to HOME."
			else
				MESSAGE_PREFIX="${DOTFILE_BASENAME} is already a file in HOME."
			fi

			while true
			do
				read -p "${MESSAGE_PREFIX} Are you sure? [yN] " RESPONSE
				# -p inline prompt
				case $RESPONSE in
					[Yy]* ) break;;
					* ) echo "Canceling. Retry later."; unset RESPONSE; return 1;;
				esac
			done
		fi

		echo "Linking $(basename "${DOTFILE}") to home..."
		ln -fs "${DOTFILE}" "${HOME}"
		# -s: symbolic
		# -f: if it already exists, replace it
	fi
done

unset DOTFILE
unset DOTFILE_BASENAME
unset MESSAGE_PREFIX
unset RESPONSE

return 0