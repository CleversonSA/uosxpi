#! /bin/bash
# =============================================================
# EXPORTA O HD VIRTUAL DO MSX PARA UMA PASTA NO STORAGE
# VISTO QUE O OPENMSX NÃO MANIPULA DIRETO OS DISPOSITIVOS
#
# OBS: A comparacao e feita somente pela existencia do arquivo
#      nao o tamanho, por enquanto
#
# Author: Cleverson SA
# =============================================================


# =============================================================
# GLOBAIS
# =============================================================
STORAGE_DST=""
FILE_LIST="/tmp/file.list"
MSX_MSG_CMD="0xF0"
MSX_END_CMD="0xFF"
MSX_MY_CMD="0xF3"
MSX_MODE=""
MSX_HD_DIR="/mnt/msxhd"
OPENMSX_SETSTRING_CMD="./openmsx-setstring.py"
OPENMSX_SHUTDOWN_CMD="./openmsx-shutdown.py"


# =============================================================
# --- PARSE ARGS ---
# =============================================================
while [[ $# -gt 0 ]]; do
    case "$1" in
        --dst)
            STORAGE_DST="$2"
            shift 2
        ;;
	--msxmode)
	    MSX_MODE="ON"
	    shift 1
	;;
        *)
            echo "Unknown parameter: $1"
            exit 1
        ;;
    esac
done

# --- VALIDATIONS ---
if [[ -z "$STORAGE_DST" ]]; then
    echo "Usage: $0 --dst <destination_dir> "
    exit 1
fi

if [[ ! -d "$STORAGE_DST" ]]; then
    echo "Destination directory not found: $STORAGE_DST"
    exit 1
fi


# =============================================================
# VERIFY OPEN MSX MEMORY MAPPING MODE
# =============================================================
if [[ ! -z "${MSX_MODE}" ]]; then
  OPENMSX=`./openmsx-getstring.py`
  COMMAND=`echo ${OPENMSX} | awk '{ print $1 }'`
  PARAMETER=`echo ${OPENMSX} | awk '{ print $2 }'`

  echo "HD EXPORT: ${COMMAND} ${PARAMETER}"

  if [[ "${COMMAND}" != "${MSX_MY_CMD}" ]] && [[ "${PARAMETER}" != "EXPORT" ]]; then
    echo "Not my command..."
    exit 0
  fi
fi


# =============================================================
# SHUTS DOWN CURRENT OPENMSX INSTANCE, IF THERE´S ONE RUNNING
# =============================================================
MSX_MOUNTED_HD=`lsblk | grep ${MSX_HD_DIR}`
if [[ -z "${MSX_MOUNTED_HD}" ]]; then

  PROCESS_CMD=`ps -ef | grep openmsx | grep -v "grep"`
  if [[ ! -z "${PROCESS_CMD}" ]]; then

    ${OPENMSX_SHUTDOWN_CMD}
    sleep 2

  fi

  sudo mount ${MSX_HD_DIR}

else

 # Strange if it´s running with a mounted HD...
 # some corruption may happen
 #
 PROCESS_CMD=`ps -ef | grep openmsx | grep -v "grep"`
  if [[ ! -z "${PROCESS_CMD}" ]]; then

    ${OPENMSX_SHUTDOWN_CMD}
    sleep 2

  fi
 
fi

# =============================================================
# COMPARE FILES
# =============================================================
./dir-compare.sh --src ${MSX_HD_DIR} --dst ${STORAGE_DST} --noSrcDirSuffix >${FILE_LIST}

if [[ -z "$(cat ${FILE_LIST})" ]]; then
    echo "No more files to sync, exiting..."
    sudo umount ${MSX_HD_DIR}
    exit 0
fi



# =============================================================
# START SYSTEM´S OPENMSX AND START COPY
# =============================================================
cd ./openmsx-profiles
./default.system.sh &
cd ..
# We are talking about MSX so...slow! So be patient!
sleep 5
${OPENMSX_SETSTRING_CMD} --command ${MSX_MSG_CMD} --message "Exportacao do HD Virtual solicitada!"
sleep 2
${OPENMSX_SETSTRING_CMD} --command ${MSX_MSG_CMD} --message "Iniciando exportacao, aguarde..."
./dir-copy.sh \
	--filelist ${FILE_LIST} \
       	--src ${MSX_HD_DIR} \
       	--dst ${STORAGE_DST} \
       	--command './openmsx-setstring.py --command '${MSX_MSG_CMD}' --message "Copiando do HD virtual para externo..."' \
	--command-ins-spa './openmsx-setstring.py --command '${MSX_END_CMD}' --message "Armazenamento externo sem espaço para tanto arquivo! Revise e tente novamente!"' \
	--command-finish './openmsx-setstring.py --command '${MSX_END_CMD}' --message "Copia concluída, o aparelho sera desligado por seguranca"' >~/dir-copy.stdout 2>~/dir-copy.stderr
	

sleep 5
${OPENMSX_SHUTDOWN_CMD}

sudo umount ${MSX_HD_DIR}
exit 0
