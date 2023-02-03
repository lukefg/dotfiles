#!/bin/zsh

for FILE in $(find ${HOME}/Repos/git/dotfiles/config/sourced)
do
	if [ -f "${FILE}" ]
	then
		# echo "Sourcing ${FILE}..."
		source "${FILE}"
	fi
done

# Load pure prompt
fpath+=("$(brew --prefix)/share/zsh/site-functions")
autoload -U promptinit; promptinit
prompt pure

# === ADDED AUTOMATICALLY ===

