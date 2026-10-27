{ config, pkgs, ... }:

{
  users.users = {
    "tyrrrz" = {
      isNormalUser = true;
      description = "tyrrrz";
      extraGroups = [ "wheel" "networkmanager" ];
    };
  };
}
