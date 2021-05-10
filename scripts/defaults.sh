#!/bin/sh

echo "Modifying macOS preferences..."

echo "Closing System Preferences..."
osascript -e 'tell application "System Preferences" to quit'

# echo "Requesting superuser privileges..."
# sudo -v
# echo "Keeping sudo alive until done..."
# while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &







APPS="" # @TODO
echo "Killing all affected applications..."
for APP in $APPS;
do
    echo "Killing ${APP}..."
    killall "${APP}"
done

echo "Done. Note: Some changes require a logout/restart to take effect."


return 0