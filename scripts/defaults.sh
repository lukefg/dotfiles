#!/bin/bash

echo "Modifying macOS preferences..."

echo "Closing System Preferences..."
osascript -e 'tell application "System Preferences" to quit'

echo "System Preferences > General > Appearance: Dark"
defaults write -globalDomain AppleInterfaceStyle -string Dark

echo "System Preferences > General > Accent color: Purple"
defaults write -globalDomain AppleAccentColor -int 5

echo "System Preferences > General > Highlight color: Purple"
defaults write -globalDomain AppleHighlightColor -string "0.968627 0.831373 1.000000 Purple"

echo "System Preferences > General > Sidebar icon size: Medium"
defaults write -globalDomain NSTableViewDefaultSizeMode -int 2

echo "System Preferences > General > Allow wallpaper tinting in windows"
defaults write -globalDomain AppleReduceDesktopTinting -bool false

echo "System Preferences > General > Show scroll bars: When scrolling"
defaults write -globalDomain AppleShowScrollBars -string WhenScrolling

echo "System Preferences > General > Click in the scroll bar to: Jump to spot"
defaults write -globalDomain AppleScrollerPagingBehavior -bool true


echo "System Preferences > General > Prefer new document tabs: Always"
defaults write -globalDomain AppleWindowTabbingMode -string always

echo "System Preferences > General > Ask to keep changes when closing: Yes"
defaults write -globalDomain NSCloseAlwaysConfirmsChanges -bool true

echo "System Preferences > General > Close windows when quitting: Yes"
defaults write -globalDomain NSQuitAlwaysKeepsWindows -bool false



echo "System Preferences > Dock & Menu Bar > Tile size: ~55%"
defaults write com.apple.dock tilesize -int 75

echo "System Preferences > Dock & Menu Bar > Magnify: Yes"
defaults write com.apple.dock magnification -bool true

echo "System Preferences > Dock & Menu Bar > Magnification size: ~70%"
defaults write com.apple.dock largesize -int 96

echo "System Preferences > Dock & Menu Bar > Position: Bottom"
defaults write com.apple.dock orientation -string bottom

echo "System Preferences > Dock & Menu Bar > Minimize: Scale"
defaults write com.apple.dock mineffect -string scale

echo "System Preferences > Dock & Menu Bar > Double-click action: Minimize"
defaults write -globalDomain AppleActionOnDoubleClick -string Minimize

echo "System Preferences > Dock & Menu Bar > Minimize windows into application icon: Yes"
defaults write com.apple.dock minimize-to-application -bool false

echo "System Preferences > Dock & Menu Bar > Animate opening applications: Yes"
defaults write com.apple.dock launchanim -bool true

echo "System Preferences > Dock & Menu Bar > Automatically hide and show the Dock: Yes"
defaults write com.apple.dock autohide -bool true

echo "System Preferences > Dock & Menu Bar > Show indicators for open applications: Yes"
defaults write com.apple.dock show-process-indicators -bool true

echo "System Preferences > Dock & Menu Bar > Show recent apps in Dock: No"
defaults write com.apple.dock show-recents -bool false

echo "System Preferences > Dock & Menu Bar > Auto hide menu bar: Yes"
defaults write -globalDomain _HIHideMenuBar -bool true

echo "System Preferences > Dock & Menu Bar > Show in menu bar - Wi-Fi: No"
defaults write com.apple.controlcenter "NSStatusItem Visible WiFi" -bool false

echo "System Preferences > Dock & Menu Bar > Show in menu bar - Bluetooth: No"
defaults write com.apple.controlcenter "NSStatusItem Visible Bluetooth" -bool false

echo "System Preferences > Dock & Menu Bar > Show in menu bar - AirDrop: No"
defaults write com.apple.controlcenter "NSStatusItem Visible AirDrop" -bool false

echo "System Preferences > Dock & Menu Bar > Show in menu bar - Do Not Disturb: Yes, when active"
defaults write com.apple.controlcenter "NSStatusItem Visible DoNotDisturb" -bool false

echo "System Preferences > Dock & Menu Bar > Show in menu bar - Keyboard Brightness: No"
defaults write com.apple.controlcenter "NSStatusItem Visible KeyboardBrightness" -bool false



echo "System Preferences > Dock & Menu Bar > Show in menu bar - Sound: Yes, always"
defaults write com.apple.controlcenter "NSStatusItem Visible Sound" -bool true

echo "System Preferences > Dock & Menu Bar > Show in menu bar - Now Playing: Yes, when active"
defaults write com.apple.controlcenter "NSStatusItem Visible NowPlaying" -bool false


echo "System Preferences > Dock & Menu Bar > Accessibility Shortcuts - Show in Control Center: No"
defaults write com.apple.controlcenter "NSStatusItem Visible AccessibilityShortcuts" -bool false

echo "System Preferences > Dock & Menu Bar > Battery - Show in Menu Bar: Yes"
defaults write com.apple.systemuiserver "NSStatusItem Visible com.apple.menuextra.battery" -bool true

echo "System Preferences > Dock & Menu Bar > Battery - Show in Control Center: Yes"
defaults write com.apple.controlcenter "NSStatusItem Visible Battery" -bool true

echo "System Preferences > Dock & Menu Bar > Battery - Show Percentage: Yes"
defaults write com.apple.menuextra.battery ShowPercent -string YES


echo "System Preferences > Dock & Menu Bar > Fast User Switching - Show in Control Center: No"
defaults write com.apple.controlcenter "NSStatusItem Visible UserSwitcher" -bool false

echo "System Preferences > Dock & Menu Bar > Clock - Show day of week: Yes"
defaults write com.apple.menuextra.clock ShowDayOfWeek -bool true

echo "System Preferences > Dock & Menu Bar > Clock - Show date: Yes"
defaults write com.apple.menuextra.clock ShowDayOfMonth -bool true

echo "System Preferences > Dock & Menu Bar > Clock - Time options: Digital"
defaults write com.apple.menuextra.clock IsAnalog -bool false

echo "System Preferences > Dock & Menu Bar > Clock - Use a 24-hour clock: No"
defaults write com.apple.menuextra.clock Show24Hour -bool false

echo "System Preferences > Dock & Menu Bar > Clock - Show AM/PM: Yes"
defaults write com.apple.menuextra.clock ShowAMPM -bool true

echo "System Preferences > Dock & Menu Bar > Clock - Flash time separators: No"
defaults write com.apple.menuextra.clock FlashDateSeparators -bool false

echo "System Preferences > Dock & Menu Bar > Clock - Display the time with seconds: Yes"
defaults write com.apple.menuextra.clock ShowSeconds -bool true

echo "System Preferences > Dock & Menu Bar > Clock - Announce the time: No"
defaults write com.apple.speech.synthesis.general.prefs TimeAnnouncementPrefs.TimeAnnouncementsEnabled -bool false

echo "System Preferences > Dock & Menu Bar > Spotlight - Show in Menu Bar: No"
defaults write com.apple.Spotlight "NSStatusItem Visible Item-0" -bool false


echo "System Preferences > Dock & Menu Bar > Time Machine - Show in Menu Bar: No"
defaults write com.apple.systemuiserver "NSStatusItem Visible com.apple.menuextra.TimeMachine" -bool false

echo "System Preferences > Dock & Menu Bar > Remove the auto-hiding Dock delay"
defaults write com.apple.dock autohide-delay -float 0

echo "System Preferences > Dock & Menu Bar > Show hidden apps with translucent icon: Yes"
defaults write com.apple.dock showhidden -bool true

echo "System Preferences > Dock & Menu Bar > Only active apps in Dock: No"
defaults write com.apple.dock static-only -bool false

echo "System Preferences > Mission Control > Automatically rearrange Spaces based on most recent use: No"
defaults write com.apple.dock mru-spaces -bool false


echo "System Preferences > Mission Control > Group windows by application: Yes"
defaults write com.apple.dock expose-group-by-app -bool true





echo "System Preferences > Hot Corners > Top-left: none"
defaults write com.apple.dock wvous-tl-corner -int 0

echo "System Preferences > Hot Corners > Top-left: none"
defaults write com.apple.dock wvous-tl-modifier -int 0

echo "System Preferences > Hot Corners > Top-right: none"
defaults write com.apple.dock wvous-tr-corner -int 0

echo "System Preferences > Hot Corners > Top-right: none"
defaults write com.apple.dock wvous-tr-modifier -int 0

echo "System Preferences > Hot Corners > Bottom-left: none"
defaults write com.apple.dock wvous-bl-corner -int 0

echo "System Preferences > Hot Corners > Bottom-left: none"
defaults write com.apple.dock wvous-bl-modifier -int 0

echo "System Preferences > Hot Corners > Bottom-right: none"
defaults write com.apple.dock wvous-br-corner -int 0

echo "System Preferences > Hot Corners > Bottom-right: none"
defaults write com.apple.dock wvous-br-modifier -int 0

echo "System Preferences > Siri > Enable Ask Siri: No"
defaults write com.apple.Siri VoiceTriggerUserEnabled -bool false

echo "System Preferences > Siri > Show Siri in menu bar: No"
defaults write com.apple.Siri StatusMenuVisible -bool false

echo "System Preferences > Language & Region > Preferred languages: English (US), Chinese Simplified"
defaults write -globalDomain AppleLanguages -array "en-US" "zh-Hans-US"

echo "System Preferences > Language & Region > Region: United States"
defaults write -globalDomain AppleLocale -string "en-US"

echo "System Preferences > Language & Region > First day of week: Monday"
defaults write -globalDomain AppleFirstWeekday -dict gregorian 2

echo "System Preferences > Language & Region > Time format: 12-hr"
defaults write -globalDomain AppleICUForce24HourTime -bool false

echo "System Preferences > Language & Region > Temperature: Fahrenheit"
defaults write -globalDomain AppleTemperatureUnit -string Fahrenheit


echo "System Preferences > Sound > Play feedback when volume is changed: No"
defaults write  com.apple.sound.beep.feedback -bool false

echo "System Preferences > Keyboard > Correct spelling automatically: No"
defaults write -globalDomain NSAutomaticSpellingCorrectionEnabled -bool false

echo "System Preferences > Keyboard > Capitalize words automatically: No"
defaults write -globalDomain NSAutomaticCapitalizationEnabled -bool false

echo "System Preferences > Keyboard > Add period with double-space: No"
defaults write -globalDomain NSAutomaticPeriodSubstitutionEnabled -bool false


echo "System Preferences > Keyboard > Use smart quotes: Yes"
defaults write -globalDomain NSAutomaticQuoteSubstitutionEnabled -bool true

echo "System Preferences > Keyboard > Use smart dashes: Yes"
defaults write -globalDomain NSAutomaticDashSubstitutionEnabled -bool true

echo "System Preferences > Keyboard > Show Input menu in menu bar"
defaults write com.apple.TextInputMenu visible -bool true

echo "System Preferences > Time Machine > Stop suggesting for new disks"
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

echo "Finder > General > Show on desktop - Hard disks: No"
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false

echo "Finder > General > Show on desktop - External disks: No"
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false

echo "Finder > General > Show on desktop - Removable: No"
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false

echo "Finder > General > Show on desktop - Connected servers: No"
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false

echo "Finder > General > New windows show: home"
defaults write com.apple.finder NewWindowTarget -string PfHm

echo "Finder > General > New windows show: home"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

echo "Finder > General > Open folders in tabs instead of windows: No"
defaults write com.apple.finder FinderSpawnTab -bool false


echo "Finder > Advanced > Show extensions: Yes"
defaults write -globalDomain AppleShowAllExtensions -bool true

echo "Finder > Advanced > Show warning before changing extension: Yes"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool true

echo "Finder > Advanced > Show warning before removing from iCloud: Yes"
defaults write com.apple.finder FXEnableRemoveFromICloudDriveWarning -bool true

echo "Finder > Advanced > Show warning on empty trash: Yes"
defaults write com.apple.finder WarnOnEmptyTrash -bool true

echo "Finder > Advanced > When searching: Current folder"
defaults write com.apple.finder FXDefaultSearchScope -string SCcf




echo "Finder > View Options > Show path bar: Yes"
defaults write com.apple.finder ShowPathbar -bool true


echo "Finder > View Options > Show status bar: Yes"
defaults write com.apple.finder ShowStatusBar -bool true

echo "Finder > View Options > Show hidden files: No"
defaults write com.apple.finder AppleShowAllFiles -bool false

echo "Finder > View Options > Show recent tags: No"
defaults write com.apple.finder ShowRecentTags -bool false

echo "Finder > View Options > Show folders on top: Yes"
defaults write com.apple.finder _FXSortFoldersFirst -bool true

echo "Finder > Other > Create Desktop: No"
defaults write com.apple.finder CreateDesktop -bool false

echo "Finder > Other > Auto-expand save panel: Yes"
defaults write -globalDomain NSNavPanelExpandedStateForSaveMode -bool true

echo "Finder > Other > Auto-expand save panel: Yes"
defaults write -globalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

echo "Finder > Other > Save to iCloud by default: No"
defaults write -globalDomain NSDocumentSaveNewDocumentsToCloud -bool false

echo "Other > Screenshots > Set screenshot location"
defaults write com.apple.screencapture location -string "$\{HOME\}/Desktop/Screenshots"

echo "Other > Screenshots > Display thumbnail: No"
defaults write com.apple.screencapture show-thumbnail -bool false

echo "Other > Screenshots > Disable shadow: Yes"
defaults write com.apple.screencapture disable-shadow -bool true

echo "Killing all affected applications..."
APPS=("Dock" "Finder")
for APP in ${APPS}; # @TODO
do
    echo "Killing ${APP}..."
    killall "${APP}"
done

echo "Done. Note: Some changes require a logout/restart to take effect."

unset APP
unset APPS

return 0