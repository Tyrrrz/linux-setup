{
  config,
  pkgs,
  primaryUserName,
  ...
}:

let
  extensions = with pkgs.gnomeExtensions; [
    alphabetical-app-grid
    appindicator
    blur-my-shell
    gsconnect
    tophat
  ];
in
{
  home-manager.users.${primaryUserName} = {
    home.packages = extensions;

    dconf.settings = {
      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = map (ext: ext.extensionUuid) extensions;
      };

      "org/gnome/shell/extensions/tophat" = {
        position-in-panel = "left";
      };
    };
  };
}
