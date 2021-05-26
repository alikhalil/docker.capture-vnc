#!/bin/bash

if [ ! -v VNC_HOST_IP ]; then
  echo "Environment Variable Required:"
  echo "  - VNC_HOST_IP"
  exit 1
fi

if [ ! -v RESOLUTION ]; then
  # Default values for Siglent SDS1104X-E
  export RESOLUTION=800x480
fi

export DISPLAY=:3
export BITDEPTH=24

Xvfb $DISPLAY -screen 0 "$RESOLUTION"x"$BITDEPTH" -ac &
sleep 1
ratpoison &
sleep 3
vncviewer $VNC_HOST_IP -ViewOnly -display $DISPLAY -FullScreen -SecurityTypes None -QualityLevel 9 -Shared -PreferredEncoding raw -CompressLevel 0 -DotWhenNoCursor &

echo
echo "# VNC_HOST_IP: ${VNC_HOST_IP}"
echo "# Use the /opt/capture-vnc.sh script to record VNC session to MP4"
echo

# Drop into bash shell for performing actual capture
# using the /opt/capture-vnc.sh script
/bin/bash
