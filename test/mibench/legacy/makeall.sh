#!/bin/bash

if [ $# -ne 2 ]; then
  echo "expect two argument. For example ./makeall all idem"
  exit 1
fi

declare -A binaries
BINARYTYPE=$2

if [ $1 == "all" ]; then
  benchs=("adpcm" "epic" "jpeg" "mesa" "pegwit" "g721" "gsm" "mpeg2" "sha" "susan")
  #benchs=("adpcm" "epic" "jpeg" "mesa" "pegwit" "g721" "gsm" "mpeg2")
  #benchs=("adpcm" "epic" "jpeg" "mesa" "pegwit" "g721" "gsm")
  #benchs=("adpcm" "epic" "g721" "gsm" "jpeg" "mesa" "mpeg2" "pegwit" "pgp")
#  benchs=("adpcm" "epic" "g721" "jpeg" "mesa" "mpeg2" "pgp")
else
  benchs=("$1")
fi
#apps=("perlbench" "bzip2" "gcc" "mcf" "milc" "namd" "gobmk" "dealII" "soplex" "hmmer" "sjeng" "libquantum" "h264ref" "lbm" "omnetpp" "astar" "Xalan")
binaries=(["adpcm"]="rawdaudio rawcaudio" ["epic"]="epic unepic" ["g721"]="decode encode" ["gsm"]="toast  untoast" ["jpeg"]="cjpeg djpeg" ["mesa"]="mipmap osdemo texgen" ["mpeg2"]="mpeg2decode  mpeg2encode" ["pgp"]="pgp" ["pegwit"]="pegwit" ["sha"]="sha" ["susan"]="susan")
benchNum=${#benchs[@]}
HOMEDIR="/home/lqingrui"
MEDIA_DIR_BASE="${HOMEDIR}/Benchmark/mediabench3"
COPYDIR="${HOMEDIR}/binaries/mediabench/"
#BUILDDIR="run/build_base_amd64-m32-gcc42-nn.0000"

#ORACLEDIR="/home/lqingrui/data/2color/profile"
#ORACLE="/home/lqingrui/oracle.txt"
STATIC_REGION_INFO="/home/lqingrui/RegionNum.txt"
STATIC_REGION_INFO_DIR="/home/lqingrui/staticInfo/regionInfo"

pushd ${COPYDIR} &> /dev/null
#mkdir ${COPYDIR}/${BINARYTYPE}
if [ ! -d "${BINARYTYPE}" ]; then
  echo "${COPYDIR}/${BINARYTYPE} doesn't exist! creating one..."
  mkdir ${BINARYTYPE}
  if [ $? -ne 0 ]; then
    echo "cannot create directory ${COPYDIR}/${BINARYTYPE}"
    exit 1
  fi 
fi
popd &> /dev/null

for i in ${benchs[*]}; do
#  rm ${ORACLE}
#  cp ${ORACLEDIR}/${i} ${ORACLE}
#  if [ $? -ne 0 ]; then
#    echo "${i} copy the oracle.txt!"
#    exit 1 
#  fi
  pushd ${MEDIA_DIR_BASE}/${i}
  # firstly compile the source code
  if [ ${i} = "mesa" ]; then
    make realclean;
    make linux -j8
  elif [ ${i} = "jpeg" ]; then
    pushd jpeg-6a && make clean && make -j8 && popd
  elif [ ${i} = "gsm" ]; then
    make clean && make -j8
  elif [ ${i} = "mpeg2" ]; then
    make clean && make -j8
  elif [ ${i} = "pgp" ]; then
    pushd rsaref && pushd source
    make clean && make -j8
    popd && popd
    pushd src && make clean && make -j8 &&popd
  elif [ ${i} = "sha" ] || [ ${i} = "susan" ]; then
    make clean && make
  else
    pushd src && make clean && make -j8 && popd
  fi
  if [ $? -ne 0 ]; then
    echo "${i} cannot make successfully!"
    exit 1 
  fi

  #mv ~/CPNum.txt /home/lqingrui/cpfreq/mediabench/${i}
#  if [ ! -d "${STATIC_REGION_INFO_DIR}/${BINARYTYPE}" ]; then
#    mkdir ${STATIC_REGION_INFO_DIR}/${BINARYTYPE}
#  fi
#  mv ${STATIC_REGION_INFO} ${STATIC_REGION_INFO_DIR}/${BINARYTYPE}/${i}

  #secondly, upload it to systemg
  if [ ${i} = "mesa" ]; then
    pushd ${MEDIA_DIR_BASE}/${i}/demos &&
    for binary in ${binaries[${i}]}; do
      cp ${binary} ${COPYDIR}/${BINARYTYPE}
    done
    popd
  elif [ ${i} = "jpeg" ]; then
    pushd ${MEDIA_DIR_BASE}/${i}/jpeg-6a &&
    for binary in ${binaries[${i}]}; do
      cp ${binary} ${COPYDIR}/${BINARYTYPE}
    done
    popd
  elif [ ${i} = "gsm" ]; then
    pushd ${MEDIA_DIR_BASE}/${i}/bin &&
    for binary in ${binaries[${i}]}; do
      cp ${binary} ${COPYDIR}/${BINARYTYPE}
    done
    popd
  elif [ ${i} = "mpeg2" ]; then
    pushd ${MEDIA_DIR_BASE}/${i}/bin &&
    for binary in ${binaries[${i}]}; do
      cp ${binary} ${COPYDIR}/${BINARYTYPE}
    done
    popd
  elif [ ${i} = "sha" ] || [ ${i} = "susan" ]; then
    for binary in ${binaries[${i}]}; do
      cp  ${binary} ${COPYDIR}/${BINARYTYPE}
    done
  else
    pushd ${MEDIA_DIR_BASE}/${i}/src &&
    for binary in ${binaries[${i}]}; do
      cp ${binary} ${COPYDIR}/${BINARYTYPE}
      if [ $? -ne 0 ]; then
        echo "${i} cannot upload successfully!"
        exit 1 
      fi
    done
    popd
  fi
  popd
done

