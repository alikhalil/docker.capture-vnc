#!/bin/bash

OUTPUT_FILE="VNC_OUTPUT_$(date +%Y%m%d_%H%M%S).mp4"

ffmpeg -hide_banner -f x11grab -s $RESOLUTION -r 24 -draw_mouse 0 -i "$DISPLAY".0 -c:v libx264 -x264opts keyint=20 -preset ultrafast -pix_fmt yuv420p -s $RESOLUTION -threads 0 -f mp4 /output/${OUTPUT_FILE}
