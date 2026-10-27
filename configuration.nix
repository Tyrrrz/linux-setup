{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix

      ./boot.nix
      ./locale.nix
      ./networking.nix
      ./audio.nix
      ./virtual.nix
      ./users.nix
      ./shell.nix
      ./gaming.nix
      ./yubikey.nix

      ./home/configuration.nix

      ./extra.nix
    ];

  system = {
    stateVersion = "26.05";
    copySystemConfiguration = true;
  };

  services.fwupd.enable = true;

  documentation.nixos.enable = false;

  nixpkgs.config.allowUnfree = true;

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };
}
