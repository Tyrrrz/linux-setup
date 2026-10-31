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
        name = "Bibata-Modern-Classic";
        package = pkgs.bibata-cursors;
      };
    };

    dconf.settings = {
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
