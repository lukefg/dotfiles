#!/bin/sh

echo "Symlinking configurations to ${HOME}..."

for DOTFILE in $(find "${REPO_DIR}/config/linked")
do
	if [ -f ${DOTFILE} ]
	then

		# check if there already is one: a real file, or a symlink
		DOTFILE_BASENAME=$(basename "${DOTFILE}")
		if [ -f "${HOME}/${DOTFILE_BASENAME}" ]
		then
			if [ -L "${HOME}/${DOTFILE_BASENAME}" ]
			then
				MESSAGE_PREFIX="${DOTFILE_BASENAME} is already symlinked to HOME."
			else
				MESSAGE_PREFIX="${DOTFILE_BASENAME} is already a file in HOME."
			fi

			while true
			do
				read -p "${MESSAGE_PREFIX} Are you sure? [yN] " RESPONSE
				case $RESPONSE in
					[Yy]* ) break;;
					* ) echo "Canceling. Retry later."; return 1;;
				esac
			done
		fi

		echo "Linking $(basename "${DOTFILE}") to home..."
		# ln -fs "${DOTFILE}" "${HOME}"
	fi
done


unset DOTFILE
unset DOTFILE_BASENAME
unset MESSAGE_PREFIX

return 0