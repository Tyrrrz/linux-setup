#!/usr/bin/env sh
set -eu

TARGET_DIR_NAME=profiles
NIX_CONFIG_DIR_PATH=/etc/nixos

sudo rm -rf "$NIX_CONFIG_DIR_PATH/$TARGET_DIR_NAME"
sudo mkdir -p "$NIX_CONFIG_DIR_PATH/$TARGET_DIR_NAME"
sudo cp -r "./$TARGET_DIR_NAME/"* "$NIX_CONFIG_DIR_PATH/$TARGET_DIR_NAME"
