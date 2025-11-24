#! /bin/bash
WAYLAND_DISPLAY=wayland-1 wlr-randr --output HDMI-A-1 --custom-mode 800x600@60Hz


OPENMSX=`./openmsx-getstring.py`
COMMAND=`echo ${OPENMSX} | awk '{ print $1 }'`
PROFILE=`echo ${OPENMSX} | awk '{ print $2 }'`

if [ "${COMMAND}" != "0xF1" ]; then
  echo "Not my command..."
  exit 0
fi

case "${PROFILE}" in
  
   "EXPERT3")   
     ./openmsx-shutdown.py
     cp -f ./openmsx-profiles/EXPERT3.sh ./openmsx-profiles/default.sh
     cp -f ./openmsx-profiles/EXPERT3.system.sh ./openmsx-profiles/default.system.sh
     ./openmsx-profiles/EXPERT3.sh &
     sleep 5
     ./openmsx-start-binds.py
     ;;

    "EXPERT1")
      ./openmsx-shutdown.py
      cp -f ./openmsx-profiles/EXPERT1.sh ./openmsx-profiles/default.sh
      cp -f ./openmsx-profiles/EXPERT1.system.sh ./openmsx-profiles/default.system.sh
      ./openmsx-profiles/EXPERT1.sh &
      sleep 5
      ./openmsx-start-binds.py
      ;;

    "EXPERT1EX")
      ./openmsx-shutdown.py
      cp -f ./openmsx-profiles/EXPERT1EX.sh ./openmsx-profiles/default.sh
      cp -f ./openmsx-profiles/EXPERT1.system.sh ./openmsx-profiles/default.system.sh
      ./openmsx-profiles/EXPERT1EX.sh &
      sleep 5
      ./openmsx-start-binds.py
      ;;

    "HOTBIT")
      ./openmsx-shutdown.py
      cp -f ./openmsx-profiles/HOTBIT.sh ./openmsx-profiles/default.sh
      cp -f ./openmsx-profiles/HOTBIT.system.sh ./openmsx-profiles/default.system.sh
      ./openmsx-profiles/HOTBIT.sh &
      sleep 5
      ./openmsx-start-binds.py
      ;;


    "HOTBITEX")
      ./openmsx-shutdown.py
      cp -f ./openmsx-profiles/HOTBITEX.sh ./openmsx-profiles/default.sh
      cp -f ./openmsx-profiles/HOTBIT.system.sh ./openmsx-profiles/default.system.sh 
      ./openmsx-profiles/HOTBITEX.sh &
      sleep 5
      ./openmsx-start-binds.py
      ;;


    *)
      ;;

 esac


