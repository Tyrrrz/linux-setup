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
      transmission_4-gtk
      gh
      google-chrome
      libreoffice
      protonvpn-gui
    ];
  };
}
