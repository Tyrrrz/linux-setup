{
  config,
  pkgs,
  primaryUserName,
  ...
}:

{
  home-manager.users.${primaryUserName} = {
    home.packages = with pkgs.gnomeExtensions; [
      alphabetical-app-grid
      appindicator
      blur-my-shell
      gsconnect
      tophat
    ];

    dconf.settings = {
      "org/gnome/shell" = {
        disable-user-extensions = false;

        enabled-extensions = [
          "AlphabeticalAppGrid@stuarthayhurst"
          "appindicatorsupport@rgcjonas.gmail.com"
          "blur-my-shell@aunetx"
          "gsconnect@andyholmes.github.io"
          "tophat@fflewddur.github.io"
        ];
      };

      "org/gnome/shell/extensions/tophat" = {
        position-in-panel = "left";
      };
    };
  };
}
