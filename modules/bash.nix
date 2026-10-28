{
  config,
  pkgs,
  primaryUserName,
  ...
}:

{
  home-manager.users.${primaryUserName} = {
    programs.bash = {
      enable = true;

      # Enable the bell sound on bad inputs
      bashrcExtra = ''
        bind 'set bell-style audible'
      '';
    };

    programs.starship = {
      enable = true;
      enableBashIntegration = true;

      settings = {
        add_newline = false;

        format = "$username$hostname$directory$character";

        username = {
          style_user = "yellow";
          style_root = "red";
          show_always = true;
          format = "[$user]($style)";
        };

        hostname = {
          style = "green";
          ssh_only = false;
          format = "[@](cyan)[$hostname]($style) ";
        };

        directory = {
          disabled = false;
          truncation_length = 3;
          truncation_symbol = "…/";
          style = "cyan";
          format = "[$path]($style) ";
        };

        character = {
          success_symbol = "[❯](bright-white)";
          error_symbol = "[❯](red)";
        };
      };
    };
  };
}
