#!/bin/bash
# Bash is the default shell for Ubuntu, Raspbian, and macOS pre-Catalina. Still included in Catalina+

RESET=$(tput sgr0)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
CYAN=$(tput setaf 6)

CLONE_DIR="$HOME/Repos/git"

if [ "${TERM_PROGRAM}" = "iTerm.app" ]
then
	echo "${RED}Please use a terminal other than iTerm. This process makes changes to it.${RESET}"
	exit 1
fi

echo "Bootstrapping new machine..."

while true
do
	read -p "${CYAN}Is this a [p]ersonal or [w]ork machine? ${RESET}" RESPONSE
	case $RESPONSE in
		[Pp]* ) echo "This is a personal machine."; break;;
		[Ww]* ) echo "This is a work machine."; INSTALL_WORK=0; break;;
		* ) echo "${RED}Need a response starting with P or W. Try again.${RESET}";;
	esac
done

if [ ${INSTALL_WORK} ]
then
	read -p "${CYAN}Install Choices bundle? [yN] ${RESET}" RESPONSE
	case $RESPONSE in
		[Yy]* ) echo "Will install Choices requirements."; INSTALL_CHOICES=0;;
		* ) echo "Will not install Choices requirements.";
	esac
else
	read -p "${CYAN}Install gaming bundle? [yN] ${RESET}" RESPONSE
	case $RESPONSE in
		[Yy]* ) echo "Will install gaming requirements."; INSTALL_GAMING=0;;
		* ) echo "Will not install gaming requirements.";
	esac
	read -p "${CYAN}Install music production bundle? [yN] ${RESET}" RESPONSE
	case $RESPONSE in
		[Yy]* ) echo "Will install music production requirements."; INSTALL_MUSIC=0;;
		* ) echo "Will not install music production requirements.";
	esac
fi

# First, check Software Update
echo "Running Software Update..."
softwareupdate --all --install

# Get Xcode CLT - Homebrew will want them anyway
echo "Checking if Xcode Command Line Tools need installation..."
if [ -d $(xcode-select -p) ]
then
	echo "${GREEN}Xcode Command Line Tools detected. Skipping install.${RESET}"
else
	echo "${YELLOW}No Xcode Command Line Tools directory detected. Installing...${RESET}"
	xcode-select --install
fi

# Set up Homebrew
echo "Checking for Homebrew installation..."
brew --version
if [ $? -eq 0 ]
then
	echo "${GREEN}Homebrew installation detected.${RESET}"
else
	echo "${YELLOW}Homebrew installation not detected. Installing...${RESET}"
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Set up git
echo "Checking for git installation..."
git --version
if [ $? -eq 0 ]
then
	echo "${GREEN}Git installation detected.${RESET}"
else
	echo "${YELLOW}Git installation not detected. Installing...${RESET}"
	brew install git
fi

# Prepare to clone the dotfiles repo
if [ -d "${CLONE_DIR}" ]
then
	echo "${GREEN}Intended parent directory for repo ${CLONE_DIR} exists.${RESET}"
else
	echo "${YELLOW}Making directories at ${CLONE_DIR} as repo parent...${RESET}"
	mkdir -p "${CLONE_DIR}"
	# -p creates intermediary directories as necessary
	# Doesn't throw a "File exists"
fi

echo "Changing working directory to ${CLONE_DIR}..."
cd ${CLONE_DIR}

echo "Checking if repo already exists..."
if [ -d "dotfiles" ]
then
	echo "${GREEN}Directory by name of dotfiles already exists here. Skipped cloning.${RESET}"
else
	echo "${YELLOW}No pre-existing version found. Cloning dotfiles repo...${RESET}"
	git clone "https://github.com/lukefg/dotfiles.git"
fi

echo "Changing working directory to ${CLONE_DIR}/dotfiles/..."
cd dotfiles

echo "Fast-forwarding to latest..."
git pull --ff-only origin main

# Run shell scripts in scripts/ in a specific order
for ARG in brew linker more secrets defaults server
do
	SCRIPT="scripts/${ARG}.sh"
	if [ -f "${SCRIPT}" ]
	then
		echo "${YELLOW}Executing ${SCRIPT}...${RESET}"
		source "${SCRIPT}"
	else
		echo "${RED}WARNING: Could not find ${SCRIPT}. Skipping. Try again later.${RESET}"
	fi
done

WORK_SCRIPT="scripts/work.sh"
if [ ${INSTALL_WORK} ]
then
	if [ -r "${WORK_SCRIPT}" ]
	then
		echo "${YELLOW}Executing ${WORK_SCRIPT}...${RESET}"
		source "${WORK_SCRIPT}"
	else
		echo "${RED}ERROR: Could not find ${WORK_SCRIPT}. Skipping. Try again later.${RESET}"
	fi
fi

echo "All done!"
echo "Some apps can't be installed programmatically. See manual-install.txt for the list."

read -p "${CYAN}Some changes require restart/logout to take effect. Do you want to restart now? [yN] ${RESET}" RESPONSE
case $RESPONSE in
	[Yy]* ) sudo shutdown -r now;;
	* ) ;;
esac

unset CLONE_DIR ARG SCRIPT
unset INSTALL_GAMING INSTALL_MUSIC INSTALL_WORK INSTALL_CHOICES INSTALL_3D INSTALL_1001
unset RESET RED GREEN YELLOW CYAN

exit 0
