{ ... }:

{
  zramSwap = {
    enable = true;
    memoryPercent = 100;   # compressed swap, up to the size of RAM
  };

  systemd.oomd.enableUserSlices = true;
}
