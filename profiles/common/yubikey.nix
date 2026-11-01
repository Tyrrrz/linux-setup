{
  config,
  pkgs,
  ...
}:

{
  services.pcscd.enable = true;

  services.udev.packages = with pkgs; [
    yubikey-personalization
    libfido2
  ];

  environment.systemPackages = with pkgs; [
    pcsclite

    # For some reason, this needs to be installed as a system package
    yubioath-flutter
  ];
}
