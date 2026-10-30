{
  config,
  pkgs,
  hostName,
  primaryUserName,
  ...
}:

{
  networking = {
    hostName = hostName;
    networkmanager.enable = true;

    firewall = {
      enable = true;

      allowedTCPPorts = [
        80
        443
      ];

      allowedUDPPortRanges = [
        {
          from = 4000;
          to = 4007;
        }
        {
          from = 8000;
          to = 8010;
        }
      ];
    };
  };

  hardware.bluetooth.enable = true;

  users.users.${primaryUserName} = {
    extraGroups = [ "networkmanager" ];
  };
}
