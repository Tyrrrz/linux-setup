{
  config,
  pkgs,
  primaryUserName,
  ...
}:

{
  users.users = {
    ${primaryUserName} = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
    };
  };
}
