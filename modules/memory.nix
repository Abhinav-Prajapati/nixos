{ ... }:

{
  zramSwap = {
    enable = true;
    memoryPercent = 100;   # compressed swap, up to the size of RAM
  };

  systemd.oomd.enable = true;   # kills runaway processes before the system freezes
}
