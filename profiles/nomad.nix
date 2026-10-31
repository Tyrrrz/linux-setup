{
  config,
  pkgs,
  lib,
  ...
}:

let
  hostName = "nomad";
  primaryUserName = "tyrrrz";

  # In the future, when I add other profiles, I might replace this with
  # manual imports so that each profile would have a somewhat different
  # collection of modules. But for now, this is good enough.
  modules = lib.pipe ./common [
    lib.filesystem.listFilesRecursive
    (lib.filter (lib.hasSuffix ".nix"))
  ];
in
{
  _module.args = { inherit hostName primaryUserName; };
  imports = modules;
}
