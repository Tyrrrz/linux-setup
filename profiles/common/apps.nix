{
  config,
  pkgs,
  primaryUserName,
  ...
}:

{
  home-manager.users.${primaryUserName} = {
    home.packages = with pkgs; [
      busybox
      fastfetch
      transmission_4-gtk
      gh
      google-chrome
      libreoffice
      proton-vpn
    ];
  };
}
