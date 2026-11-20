{ ... }:

let
  hostName = "nomad";
  primaryUserName = "tyrrrz";
in
{
  _module.args = { inherit hostName primaryUserName; };

  imports = [
    ./common/_.nix
    ./common/audio.nix
    ./common/bash.nix
    ./common/boot.nix
    ./common/firmware.nix
    ./common/gaming.nix
    ./common/git.nix
    ./common/gnome
    ./common/locale.nix
    ./common/network.nix
    ./common/nix.nix
    ./common/packages.nix
    ./common/power.nix
    ./common/users.nix
    ./common/virtualization.nix
    ./common/vscode.nix
    ./common/yubikey.nix
  ];
}
