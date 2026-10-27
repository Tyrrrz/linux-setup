{ config, pkgs, ... }:

{
  virtualisation = {
    containers.enable = true;

    podman = {
      enable = true;
      autoPrune.enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };

    libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu;
        swtpm.enable = true;
      };
    };

    spiceUSBRedirection.enable = true;
  };

  users.users.tyrrrz = {
    extraGroups = [ "podman" "libvirtd" "kvm" ];
  };

  environment.systemPackages = with pkgs; [
    dnsmasq
    phodav
  ];
}
