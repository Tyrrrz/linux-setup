{
  config,
  pkgs,
  primaryUserName,
  ...
}:

{
  home-manager.users.${primaryUserName} = {
    home.packages = with pkgs; [
      sound-theme-freedesktop
    ];

    gtk = {
      enable = true;

      theme = {
        name = "Adwaita-dark";
        package = pkgs.gnome-themes-extra;
      };

      iconTheme = {
        name = "Numix-Circle";
        package = pkgs.numix-icon-theme-circle;
      };

      cursorTheme = {
        name = "Bibata-Modern-Ice";
        package = pkgs.bibata-cursors;
      };
    };

    dconf.settings = {
      "org/gnome/desktop/background" = {
        picture-options = "zoom";
        picture-uri = "file://${./assets/wallpaper.jpg}";
        picture-uri-dark = "file://${./assets/wallpaper.jpg}";
      };

      "org/gnome/desktop/interface" = {
        accent-color = "purple";
        color-scheme = "prefer-dark";
      };

      "org/gnome/desktop/sound" = {
        theme-name = "freedesktop";
      };
    };
  };
}
