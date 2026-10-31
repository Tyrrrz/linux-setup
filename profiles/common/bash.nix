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

      # Enable the bell sound
      bashrcExtra = ''
        bind 'set bell-style audible'
      '';
    };

    programs.starship = {
      enable = true;
      enableBashIntegration = true;

      settings = {
        add_newline = false;

        format = "$username$hostname$directory$git_branch$git_status$character";

        username = {
          style_user = "yellow";
          style_root = "red";
          show_always = true;
          format = "[$user]($style)";
        };

        hostname = {
          style = "green";
          ssh_only = false;
          format = "[@](white)[$hostname]($style) ";
        };

        directory = {
          disabled = false;
          truncation_length = 3;
          truncation_symbol = "…/";
          style = "cyan";
          format = "[$path]($style) ";
        };

        git_branch = {
          symbol = "⌥ ";
          style = "purple";
          format = "[$symbol$branch]($style) ";
        };

        git_status = {
          conflicted = "=\$count";
          ahead = "⇡\$count";
          behind = "⇣\$count";
          diverged = "⇕⇡\$ahead_behind";
          untracked = "?\$count";
          stashed = "*";
          modified = "*";
          staged = "[+\$count](green)";
          renamed = "»\$count";
          deleted = "✘\$count";
          format = "([\\($all_status$ahead_behind\\)]($style) )";
        };

        character = {
          success_symbol = "[❯](bright-white)";
          error_symbol = "[❯](red)";
        };
      };
    };
  };
}
