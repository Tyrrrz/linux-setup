# Linux Setup

This is my current Linux setup, powered by NixOS.

## Usage

- Clone or download this repository
- Copy the contents to `/etc/nixos/shared` (or another directory)
- Update the local `configuration.nix` file to import the corresponding host config

Example:

```nix
{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./shared/hosts/nomad.nix
  ];

  # Any out-of-band configuration can also be defined here
  # ...
}
```
