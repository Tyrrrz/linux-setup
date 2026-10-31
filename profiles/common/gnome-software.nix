{
  config,
  pkgs,
  primaryUserName,
  ...
}:

{
  # Disable all bundled GNOME software
  services.gnome = {
    core-apps.enable = false;
    core-developer-tools.enable = false;
    games.enable = false;
  };

  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    gnome-user-docs
  ];

  home-manager.users.${primaryUserName} = {
    # Cherry-pick preferred GNOME software and install at user level
    home.packages = with pkgs; [
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
    ];

    dconf.settings = {
      "org/gnome/nautilus/list-view" = {
        default-zoom-level = "small";
      };

      "org/gnome/nautilus/preferences" = {
        default-folder-viewer = "list-view";
        show-create-link = true;
        show-delete-permanently = true;
        show-hidden-files = true;
      };
    };
  };
}
