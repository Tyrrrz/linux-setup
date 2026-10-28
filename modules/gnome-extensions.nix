{
  config,
  pkgs,
  primaryUserName,
  ...
}:

{
  home-manager.users.${primaryUserName} = {
    home.packages = with pkgs; [
      gnomeExtensions.alphabetical-app-grid
      gnomeExtensions.appindicator
      gnomeExtensions.blur-my-shell
      gnomeExtensions.gsconnect
      gnomeExtensions.tophat
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
