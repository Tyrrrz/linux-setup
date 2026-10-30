{
  config,
  pkgs,
  lib,
  primaryUserName,
  ...
}:

let
  stateVersion = "26.05";

  home-manager-pkg = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-${stateVersion}.tar.gz";
in
{
  imports = [
    (import "${home-manager-pkg}/nixos")
  ];

  system = {
    stateVersion = stateVersion;
    copySystemConfiguration = true;
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    backupFileExtension = "backup";
    overwriteBackup = true;

    users.${primaryUserName} = {
      home = {
        stateVersion = stateVersion;
      };
    };
  };
}
