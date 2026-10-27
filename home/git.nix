{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;

    settings = {
      user.name = "Tyrrrz";
      user.email = "1935960+Tyrrrz@users.noreply.github.com";
      init.defaultBranch = "prime";
      pull.rebase = true;
    };
  };
}
