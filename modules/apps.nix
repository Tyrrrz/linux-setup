{
  config,
  pkgs,
  primaryUserName,
  ...
}:

{
  home-manager.users.${primaryUserName} = {
    home.packages = with pkgs; [
      fastfetch
      fragments
      gh
      google-chrome
      libreoffice
      vscode
    ];
  };
}
