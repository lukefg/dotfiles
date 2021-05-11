#!/bin/sh

# @TODO
# ssh?
# github / gitlab
# heroku

# Accept Xcode license
echo "Please accept Xcode license..."
sudo xcodebuild -license accept


read -p "Do you want to open apps that require manual login? [yN] " RESPONSE
case $RESPONSE in
    [Yy]* ) break;;
    * ) echo "Skipping."; unset RESPONSE; return 1;;
esac

echo "Opening apps for manual login..."
for APP in "Firefox" "Postman"
do
    open -a "${APP}"
done

unset RESPONSE

return 0