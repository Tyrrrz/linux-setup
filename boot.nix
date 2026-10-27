{ config, pkgs, ... }:

{
  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;

    kernelPackages = pkgs.linuxPackages_latest;
    kernelModules = [ "kvm-amd" "kvm-intel" ];

    initrd.luks.devices."luks-6bc1d4a5-4af0-4fcc-a586-9548045dcec0".device = "/dev/disk/by-uuid/6bc1d4a5-4af0-4fcc-a586-9548045dcec0";
  };
}
