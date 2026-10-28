{
  config,
  pkgs,
  lib,
  ...
}:

let
  hostName = "nomad";
  primaryUserName = "tyrrrz";

  modules = lib.pipe ../modules [
    lib.filesystem.listFilesRecursive
    (lib.filter (lib.hasSuffix ".nix"))
  ];
in
{
  _module.args = { inherit hostName primaryUserName; };
  imports = modules;
}
