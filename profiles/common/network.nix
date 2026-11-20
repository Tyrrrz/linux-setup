{
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
        # https://one.one.one.one/dns
        "1.1.1.1"
        "1.0.0.1"
        "2606:4700:4700::1111"
        "2606:4700:4700::1001"
      ];
    };

    firewall.enable = true;
  };

  users.users.${primaryUserName} = {
    extraGroups = [ "networkmanager" ];
  };
}
