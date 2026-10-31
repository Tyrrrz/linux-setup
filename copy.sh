#!/usr/bin/env sh
set -eu

TARGET_DIR_PATH=/etc/nixos/profiles/

sudo rm -rf "$TARGET_DIR_PATH"
sudo mkdir -p "$TARGET_DIR_PATH"
sudo cp -r ./profiles/* "$TARGET_DIR_PATH"
