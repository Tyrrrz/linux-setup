{
  config,
  pkgs,
  ...
}:

{
  nix = {
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };

  nixpkgs.config.allowUnfree = true;

  documentation.nixos.enable = false;

  environment.systemPackages = with pkgs; [
    nixfmt
  ];
}
