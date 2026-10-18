{ ... }:

{
  services.pulseaudio.enable = false;   # PipeWire replaces it
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
}
