{ ... }:

let
  hostName = "nomad";
  primaryUserName = "tyrrrz";
in
{
  _module.args = { inherit hostName primaryUserName; };

  imports = [
    ./common/_core.nix
    ./common/audio.nix
    ./common/bash.nix
    ./common/bluetooth.nix
    ./common/boot.nix
    ./common/firmware.nix
    ./common/gaming.nix
    ./common/git.nix
    ./common/gnome
    ./common/locale.nix
    ./common/network.nix
    ./common/nix.nix
    ./common/power.nix
    ./common/software.nix
    ./common/users.nix
    ./common/virtualization.nix
    ./common/vscode.nix
    ./common/yubikey.nix
  ];
}
