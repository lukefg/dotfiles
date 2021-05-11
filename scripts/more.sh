#!/bin/bash

echo "Executing some additional steps..."

echo "Revealing user Library folder..."
chflags nohidden ~/Library

# =========================
# === SUPERUSER SECTION ===
# =========================

# echo "Requesting superuser privileges..."
# sudo -v
# echo "Keeping sudo alive until done..."
# while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo "Turning off startup chime..."
sudo nvram StartupMute=%01

return 0