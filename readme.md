# Linux Setup

This is my current Linux setup, powered by NixOS.

## Usage

- Clone or download this repository
- Copy the `profiles/` directory to `/etc/nixos/` (or use `copy.sh`)
- Update the local `configuration.nix` file to import the corresponding profile

Example:

```nix
{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix

    # Specify the desired profile
    ./profiles/nomad.nix
  ];

  # Any out-of-band configuration may also be defined here
  # ...
}
```
