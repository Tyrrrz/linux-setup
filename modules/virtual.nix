{
  config,
  pkgs,
  primaryUserName,
  ...
}:

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

  environment.systemPackages = with pkgs; [
    dnsmasq
    phodav
  ];

  users.users.${primaryUserName} = {
    extraGroups = [
      "podman"
      "libvirtd"
      "kvm"
    ];
  };
}
