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
    yubioath-flutter
  ];
}
