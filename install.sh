#!/bin/bash

set -e

# Variables
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DESKTOP_FILE="$SCRIPT_DIR/austiblox.desktop"
LAUNCHER_SCRIPT="$SCRIPT_DIR/austiblox-launcher.sh"
INSTALL_DIR="$HOME/.local/share/applications"
TARGET_DESKTOP="$INSTALL_DIR/austiblox.desktop"

echo "Installing Austiblox..."

mkdir -p "$INSTALL_DIR"

# Prepare the .desktop file and copy it to the applications directory
echo "Setting up desktop file..."
sed "s|~/austiblox-launcher.sh|$LAUNCHER_SCRIPT|g" "$DESKTOP_FILE" > "$TARGET_DESKTOP"
chmod +x "$TARGET_DESKTOP"

echo "Installation complete!"
echo "You can now search for 'Austiblox' in your app launcher."

exit 0
