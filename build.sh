#!/bin/sh

DIR=$(cd $(dirname $0); pwd)
cd ${DIR}
pushd .
rm -rf ${EV3RT_WORKSPACE}/build/
cp -R ./ ${EV3RT_WORKSPACE}/build/
cd ${EV3RT_WORKSPACE}
make mod=build
popd
mv ${EV3RT_WORKSPACE}/app ./app
cp ${EV3RT_LIB_PATH}/sdcard/uImage ./uImage
