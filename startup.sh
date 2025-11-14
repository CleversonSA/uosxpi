#! /bin/bash
# For 4 inch lcd
#WAYLAND_DISPLAY=wayland-1 wlr-randr --output HDMI-A-1 --custom-mode 480x800@60Hz --transform=90
# For 3.5 HDMI LCD
WAYLAND_DISPLAY=wayland-1 wlr-randr --output HDMI-A-1 --custom-mode 800x600@60Hz

  /home/umsxpi/rpi-x-watchdog.sh &
  cd ~/umsxpi-bios/openmsx-profiles/
  ./default.sh &
  cd ~/umsxpi-bios
  # Wait a little for OpenMSX start
  sleep 5
  ./openmsx-start-binds.py
