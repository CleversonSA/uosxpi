#! /bin/bash
# For 4 inch lcd
#WAYLAND_DISPLAY=wayland-1 wlr-randr --output HDMI-A-1 --custom-mode 480x800@60Hz --transform=90
# For 3.5 HDMI LCD
WAYLAND_DISPLAY=wayland-1 wlr-randr --output HDMI-A-1 --custom-mode 800x600@60Hz

# =====================================================
# Globals
# =====================================================
STORAGE1_DIR="/mnt/storage1"
STORAGE2_DIR="/mnt/storage2"
STORAGE_DIR=""
MAGIC_MSX_HD_DIR="msxhd"

# =====================================================
# PRESTARTS MOUNT POINTS
# =====================================================
sudo mount -a
sleep 2

# =====================================================
# Check for mounted storage. storage1 > storage2
# =====================================================
get_external_storage() {
   
   if [ -z "$(ls -A "$STORAGE1_DIR")" ]; then
	STORAGE_DIR=${STORAGE2_DIR}
   else
	STORAGE_DIR=${STORAGE1_DIR}
   fi

}

# =====================================================
# CHECK FOR FILES TO COPY
# =====================================================
cd ~/umsxpi-bios
get_external_storage
./umsxpi-hd-import.sh --src ${STORAGE_DIR}/${MAGIC_MSX_HD_DIR}
cd ~

# =====================================================
# CORE
# =====================================================
./rpi-x-watchdog.sh &

cd ~/umsxpi-bios/openmsx-profiles/
./default.sh &

cd ~/umsxpi-bios
# Wait a little for OpenMSX start
sleep 5
./openmsx-start-binds.py


