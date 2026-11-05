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

    networkmanager = {
      enable = true;
      insertNameservers = [
        "1.1.1.1"
        "1.0.0.1"
        "2606:4700:4700::1111"
        "2606:4700:4700::1001"
      ];
    };

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
