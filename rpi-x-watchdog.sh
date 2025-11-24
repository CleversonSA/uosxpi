#! /bin/bash
if [ -e /boot/firmware/.stopwatchdog ]; then
  exit 0
fi

# =====================================================
# Globals
# =====================================================
STORAGE1_DIR="/mnt/storage1"
STORAGE2_DIR="/mnt/storage2"
STORAGE_DIR=""
MAGIC_EXPORT_DIR="/msxhd"

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
# MAIN LOOP
# =====================================================
sleep 5
while [ 1 == 1  ];
do
    PROCESS_CMD=`ps -ef | grep openmsx | grep -v "grep"`
    
    /bin/sleep 1
    if [ "$PROCESS_CMD" == "" ]; then

        sudo shutdown -h now
	#pkill -9 wayfire

        exit 0

    fi 

    # ==================================================
    # Memory listeners
    # ==================================================
    cd ~/umsxpi-bios
    ./umsxpi-profile-listener.sh
    cd ~

    # ==================================================
    # Virtual disk listeners
    # ==================================================
    cd ~/umsxpi-bios
    ./umsxpi-check-external-storage.sh
    ./umsxpi-disk-listener.sh
    get_external_storage
    ./umsxpi-dsk-selector-listener.sh --initial-dir ${STORAGE_DIR}
    cd ~

    # ==================================================
    # Export trigger
    # ==================================================
    cd ~/umsxpi-bios
    get_external_storage
    ./umsxpi-hd-export.sh --dst ${STORAGE_DIR}${MAGIC_EXPORT_DIR} --msxmode
    cd ~


done
