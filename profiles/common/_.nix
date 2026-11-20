{ primaryUserName, ... }:

let
  stateVersion = "26.05";

  home-manager-src = builtins.fetchTarball {
    url = "https://github.com/nix-community/home-manager/archive/release-${stateVersion}.tar.gz";
    sha256 = "1vg8zb3qh2k9gfbjxdjx80fbww2y2ppkiwh7sqx2gclcvjw7lj22";
  };
in
{
  imports = [
    (import "${home-manager-src}/nixos")
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
