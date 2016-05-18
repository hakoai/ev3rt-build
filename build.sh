#!/bin/sh
build() {
  local CURRENT_DIR=`pwd`
  rm -rf ${EV3RT_WORKSPACE}/build/
  cp -R ./ ${EV3RT_WORKSPACE}/build/
  cd ${EV3RT_WORKSPACE}
  make app=build
  cd ${CURRENT_DIR}
  mv ${EV3RT_WORKSPACE}/app ./app
  cp ${EV3RT_LIB_PATH}/sdcard/uImage ./uImage
}

build
