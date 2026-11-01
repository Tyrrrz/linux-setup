#!/usr/bin/env sh
set -eu

./copy.sh

sudo nixos-rebuild switch
