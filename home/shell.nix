{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    # GNOME software
    baobab
    evolution
    file-roller
    gnome-boxes
    gnome-calculator
    gnome-console
    gnome-system-monitor
    gnome-text-editor
    gnome-weather
    loupe
    nautilus
    showtime
    snapshot

    # GNOME extensions
    gnomeExtensions.alphabetical-app-grid
    gnomeExtensions.appindicator
    gnomeExtensions.blur-my-shell
    gnomeExtensions.gsconnect
    gnomeExtensions.tophat

    # Sound theme
    sound-theme-freedesktop
  ];

  # Configure GSettings-based settings
  dconf.settings = {
    "org/gnome/desktop/app-folders" = {
      folder-children = [];
    };

    "org/gnome/desktop/background" = {
      picture-options = "zoom";
      picture-uri = "file://${./wallpaper.jpg}";
      picture-uri-dark = "file://${./wallpaper.jpg}";
    };

    "org/gnome/desktop/input-sources" = {
      per-window = true;
      sources = [
        (lib.hm.gvariant.mkTuple [ "xkb" "us" ])
        (lib.hm.gvariant.mkTuple [ "xkb" "ua+winkeys" ])
      ];
      xkb-options = [ "grp:alt_shift_toggle" ];
    };

    "org/gnome/desktop/interface" = {
      accent-color = "purple";
      color-scheme = "prefer-dark";
      enable-hot-corners = false;
      show-battery-percentage = true;
    };

    "org/gnome/desktop/peripherals/touchpad" = {
      disable-while-typing = false;
    };

    "org/gnome/desktop/privacy" = {
      old-files-age = 30;
      recent-files-max-age = 30;
      remove-old-temp-files = true;
      remove-old-trash-files = true;
    };

    "org/gnome/desktop/sound" = {
      theme-name = "freedesktop";
      event-sounds = true;
      input-feedback-sounds = true;
    };

    "org/gnome/desktop/wm/keybindings" = {
      switch-input-source = [];
      switch-input-source-backward = [];
      switch-windows = [ "<Alt>Tab" ];
    };

    "org/gnome/mutter" = {
      edge-tiling = false;
    };

    "org/gnome/nautilus/list-view" = {
      default-zoom-level = "small";
    };

    "org/gnome/nautilus/preferences" = {
      default-folder-viewer = "list-view";
      show-create-link = true;
      show-delete-permanently = true;
      show-hidden-files = true;
    };

    "org/gnome/settings-daemon/plugins/power" = {
      power-button-action = "interactive";
    };

    "org/gnome/shell" = {
      always-show-log-out = true;
      disable-user-extensions = false;

      enabled-extensions = [
        "AlphabeticalAppGrid@stuarthayhurst"
        "appindicatorsupport@rgcjonas.gmail.com"
        "blur-my-shell@aunetx"
        "gsconnect@andyholmes.github.io"
        "tophat@fflewddur.github.io"
      ];

      favorite-apps = [
        "org.gnome.Console.desktop"
        "org.gnome.Nautilus.desktop"
        "google-chrome.desktop"
        "org.gnome.Evolution.desktop"
        "code.desktop"
        "steam.desktop"
      ];
    };

    "org/gnome/shell/app-switcher" = {
      current-workspace-only = false;
    };

    "org/gnome/shell/extensions/tophat" = {
      position-in-panel = "left";
    };

    "org/gnome/shell/window-switcher" = {
      current-workspace-only = false;
    };
  };

  gtk = {
    enable = true;

    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    cursorTheme = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
    };

    # Define custom sidebar bookmarks for Nautilus and file pickers
    gtk3.bookmarks = [
      "file:/// /"
      "file:///etc/nixos NixOS Config"
      "file://${config.home.homeDirectory}/Documents"
      "file://${config.home.homeDirectory}/Downloads"
      "file://${config.home.homeDirectory}/Music"
      "file://${config.home.homeDirectory}/Pictures"
      "file://${config.home.homeDirectory}/Projects"
      "file://${config.home.homeDirectory}/Videos"
    ];
  };
}
