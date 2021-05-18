#!/bin/bash
# Bash is the default shell for Ubuntu, Raspbian, and macOS pre-Catalina. Still included in Catalina+

CLONE_DIR="$HOME/Repos/git"

echo "Bootstrapping new machine..."

# First, check Software Update
echo "Running Software Update..."
softwareupdate --all --install

# Set up Homebrew
echo "Checking for Homebrew installation..."
brew --version
if [ $? -eq 0 ]
then
	echo "Homebrew installation detected."
else
	echo "Homebrew installation not detected. Installing..."
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Set up git
echo "Checking for git installation..."
git --version
if [ $? -eq 0 ]
then
	echo "Git installation detected."
else
	echo "Git installation not detected. Installing..."
	brew install git
fi

# Prepare to clone the dotfiles repo
if [ -d "${CLONE_DIR}" ]
then
	echo "Intended parent directory for repo ${CLONE_DIR} exists."
else
	echo "Making directories at ${CLONE_DIR} as repo parent..."
	mkdir -p "${CLONE_DIR}"
	# -p creates intermediary directories as necessary
	# Doesn't throw a "File exists"
fi

echo "Changing working directory to ${CLONE_DIR}..."
cd ${CLONE_DIR}

echo "Checking if repo already exists..."
if [ -d "dotfiles" ]
then
	echo "Directory by name of dotfiles already exists here. Skipped cloning."
else
	echo "No pre-existing version found. Cloning dotfiles repo..."
	git clone "https://github.com/lukefg/dotfiles.git"
fi

echo "Changing working directory to ${CLONE_DIR}/dotfiles/..."
cd dotfiles

# Run shell scripts in scripts/ in a specific order
for ARG in brew linker defaults more secrets work
do
	SCRIPT="scripts/${ARG}.sh"
	if [ -f "${SCRIPT}" ]
	then
		echo "Executing ${SCRIPT}..."
		source "${SCRIPT}"
	else
		echo "Could not find ${SCRIPT}. Skipping. Try again later."
	fi
done

echo "All done! Some changes require restart/logout to take effect."

unset CLONE_DIR
unset ARG
unset SCRIPT

exit 0
