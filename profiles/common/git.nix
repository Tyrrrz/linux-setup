{
  config,
  pkgs,
  primaryUserName,
  ...
}:

{
  home-manager.users.${primaryUserName} = {
    programs.git = {
      enable = true;

      settings = {
        user = {
          name = primaryUserName;
          email = "1935960+${primaryUserName}@users.noreply.github.com";
        };

        init.defaultBranch = "prime";
        pull.rebase = true;
      };
    };
  };
}
