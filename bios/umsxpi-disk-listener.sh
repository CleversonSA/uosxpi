#! /bin/bash

# ============================================
# Automation to simulate a disk insertion into
# emulator.
#
# This program will check these folders:
# 
# /mnt/storage1
# /mnt/storage2
#
# The first diska folder or dsk file found in 
# these storages, will be mounted.
#
# If a diska.dsk file and a diska folder is 
# present, the DSK file will have the priority.
#
# Same with hda.dsk file and a hda folder.
#
# =============================================
#
#  @Author: Cleverson S A


# Check if disquette is already mounted
DISKA_MOUNTED=`./openmsx-disk-mount.py --check-mounted-storage diska`

# Check for lost link or unmounted devices
if [ "${DISKA_MOUNTED}" == "true" ]; then

   LAST_MOUNT=`./openmsx-disk-mount.py --check-mounted-storage diska --get-storage-info | awk '{ print $2 }'`
   echo ${LAST_MOUNT}

   if [ -e "$LAST_MOUNT" ]; then
     # Mounted, do nothing
     ls ${LAST_MOUNT}
     echo "Mount ok..."
   else
     echo "Last mount ${LAST_MOUNT} was not available, unmounting..."
     ./openmsx-disk-umount.py --drive a
     exit 0
   fi
fi

# Find the possible first dsk file
DISKA_FILE_FOUND=`find /mnt -maxdepth 2 -iname "diska.dsk" | head -n 1`

# Find the possible first diska dir
DISKA_DIR_FOUND=`find /mnt -maxdepth 2 -type d -iname "diska" | head -n 1`

# Find the possible first hda dsk file
HDA_FILE_FOUND=`find /mnt -maxdepth 2 -iname "hda.dsk" | head -n 1`

# Find the possible first hda dir
HDA_DIR_FOUND=`find /mnt -maxdepth 2 -type d -iname "hda" | head -n 1`


# Unmount drive
if [[ -n "${DISKA_FILE_FOUND}" || -n "${DISKA_DIR_FOUND}" ]]; then

    # Try avoid unmount the same dsk or dir with the same mountpount
    
    MOUNT_FILE_CHECK=`./openmsx-disk-mount.py --check-mounted-storage diska --with-storage ${DISKA_FILE_FOUND} 2>/dev/null`
    MOUNT_DIR_CHECK=`./openmsx-disk-mount.py --check-mounted-storage diska --with-storage ${DISKA_DIR_FOUND} 2>/dev/null`

    if [[ -n "${DISKA_FILE_FOUND}" && ${MOUNT_FILE_CHECK} == "true" ]]; then
       echo "Already mounted"
       exit 0
    fi

    if [[ -n "${DISKA_DIR_FOUND}" && ${MOUNT_DIR_CHECK} == "true" ]]; then
       echo "Already mounted"
       exit 0
    fi

    ./openmsx-disk-umount.py --drive a

fi


# If there is a DSK file, mount it first
if [ -n "${DISKA_FILE_FOUND}" ]; then
  
  ./openmsx-disk-mount.py --drive a --disk-path ${DISKA_FILE_FOUND}
  exit 0

fi

# If there is a DISK FOLDER, mount it
if [ -n "${DISKA_DIR_FOUND}" ]; then
  
  ./openmsx-disk-mount.py --drive a --disk-path ${DISKA_DIR_FOUND}
  exit 0

fi

exit 0
