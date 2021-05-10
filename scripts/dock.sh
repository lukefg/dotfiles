#!/bin/sh

echo "Re-ordering the Dock..."

defaults write com.apple.dock persistent-apps -array

# Finder cannot be removed
echo "Finder.app included by default."

# Terminal is in /System
echo "Adding system applications: Terminal.app..."
defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/System/Applications/Utilities/Terminal.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"

# Non-system apps
for APP in "Fork" "GitHub Desktop" "Trello" "Jira" "Bear" "Firefox" "Slack" "Postman" "Visual Studio Code" "Visual Studio" "Unity Hub" "Android Studio" "Xcode" "Spotify" "Ableton Live 11 Standard"
do
    APP_LOCATION="/Applications/${APP}.app"
    if [ -d "${APP_LOCATION}" ]
    then
        echo "Adding ${APP_LOCATION}..."
        ENTRY="<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>${APP_LOCATION}</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
        defaults write com.apple.dock persistent-apps -array-add "${ENTRY}"
    else
        echo "Warning: Cannot find ${APP_LOCATION}. Skipping..."
    fi    
done

echo "Reloading Dock..."
killall Dock
echo "Done"
return 0