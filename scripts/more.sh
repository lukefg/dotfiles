#!/bin/sh

echo "Executing some additional steps..."

echo "Checking if Xcode Command Line Tools need installation..."
xcode-select -p
if [ $? -eq 0 ]
then
	echo "Xcode Command Line Tools directory detected. Skipping install."
else
	echo "No Xcode Command Line Tools directory detected. Installing..."
	xcode-select --install
fi

return 0