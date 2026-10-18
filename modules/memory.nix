{ ... }:

{
  zramSwap = {
    enable = true;
    memoryPercent = 100;   # compressed swap, up to the size of your RAM
  };

  systemd.oomd.enable = true;   # kills runaway processes before the system freezes
}
