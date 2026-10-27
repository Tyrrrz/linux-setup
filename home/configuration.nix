{ config, pkgs, ... }:

let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-26.05.tar.gz";
in
{
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    backupFileExtension = "backup";

    users.tyrrrz = {
      imports = [
        ./bash.nix
        ./git.nix
        ./shell.nix
      ];

      home = {
        stateVersion = "26.05";

        packages = with pkgs; [
          fastfetch
          fragments
          gh
          google-chrome
          libreoffice
          vscode
        ];
      };
    };
  };
}
