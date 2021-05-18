#!/bin/bash
# Bash is the default shell for Ubuntu, Raspbian, and macOS pre-Catalina. Still included in Catalina+

CLONE_DIR="$HOME/Repos/git"

echo "Bootstrapping new machine..."

while true
do
	read -p "Is this a [p]ersonal or [w]ork machine? " RESPONSE
	case $RESPONSE in
		[Pp]* ) echo "This is a personal machine."; break;;
		[Ww]* ) echo "This is a work machine."; INSTALL_WORK=0; break;;
		* ) echo "Need a response starting with P or W. Try again.";;
	esac
done

if [ ${INSTALL_WORK} ]
then
	read -p "Install Choices package? [yN] " RESPONSE
	case $RESPONSE in
		[Yy]* ) echo "Will install Choices requirements."; INSTALL_CHOICES=0;;
		* ) echo "Will not install Choices requirements.";
	esac
	read -p "Install 3D package? [yN] " RESPONSE
	case $RESPONSE in
		[Yy]* ) echo "Will install 3D requirements."; INSTALL_3D=0;;
		* ) echo "Will not install 3D requirements.";
	esac
	read -p "Install 1001 package? [yN] " RESPONSE
	case $RESPONSE in
		[Yy]* ) echo "Will install 1001 requirements."; INSTALL_1001=0;;
		* ) echo "Will not install 1001 requirements.";
	esac
else
	read -p "Install gaming package? [yN] " RESPONSE
	case $RESPONSE in
		[Yy]* ) echo "Will install gaming requirements."; INSTALL_GAMING=0;;
		* ) echo "Will not install gaming requirements.";
	esac
	read -p "Install music production package? [yN] " RESPONSE
	case $RESPONSE in
		[Yy]* ) echo "Will install music production requirements."; INSTALL_MUSIC=0;;
		* ) echo "Will not install music production requirements.";
	esac
fi

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
