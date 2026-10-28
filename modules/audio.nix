{
  config,
  pkgs,
  ...
}:

{
  security.rtkit.enable = true;

  services.pulseaudio.enable = false;

  services.pipewire = {
    enable = true;

    alsa = {
      enable = true;
      support32Bit = true;
    };

    pulse = {
      enable = true;
    };
  };
}
