#!/bin/sh
#
# gpu.sh - choose which GPU renders the Plasma Wayland desktop
#
# What it does:
#   The laptop panel (eDP) is wired to Intel, and HDMI is wired to NVIDIA.
#   By default KWin renders on Intel and copies frames to NVIDIA for HDMI.
#   If an HDMI monitor is connected at login, this sets KWIN_DRM_DEVICES so
#   NVIDIA is the primary renderer and HDMI is driven directly by the dGPU.
#   Without HDMI, the script does nothing so Intel renders and the dGPU can
#   sleep to save power.
#
# How it works:
#   - Finds the NVIDIA card by driver name (card numbers can swap between boots)
#   - Checks /sys/class/drm/<nvidia-card>-HDMI-A-*/status for "connected"
#   - Exports KWIN_DRM_DEVICES="<nvidia>:<other>" (first device = primary)
#
# After applying the NixOS configuration, log out and back in after
# connecting or disconnecting HDMI. KWin reads this variable at session start.
#
# Verify:
#   echo "$KWIN_DRM_DEVICES"                                      # set only if HDMI was connected at login
#   nvidia-smi                                                    # kwin_wayland listed = NVIDIA is rendering
#   cat /sys/bus/pci/devices/0000:01:00.0/power/runtime_status    # "suspended" = dGPU asleep
#
# Debug:
#   sh -xc '. /etc/xdg/plasma-workspace/env/gpu.sh'

for c in /sys/class/drm/card[0-9]; do
  name=$(basename "$c")
  drv=$(basename "$(readlink -f "$c/device/driver")")
  if [ "$drv" = "nvidia" ]; then
    nv="/dev/dri/$name"
    nvname="$name"
  else
    other="/dev/dri/$name"
  fi
done

[ -z "$nv" ] && return 0

for s in /sys/class/drm/"$nvname"-HDMI-A-*/status; do
  if [ "$(cat "$s" 2>/dev/null)" = "connected" ]; then
    export KWIN_DRM_DEVICES="$nv:$other"
    break
  fi
done
