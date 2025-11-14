#! /bin/bash
if [ -e /boot/firmware/.stopwatchdog ]; then
  exit 0
fi

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
    ./umsxpi-dsk-selector-listener.sh --initial-dir /mnt/storage1
    cd ~

done
