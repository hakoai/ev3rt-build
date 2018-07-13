FROM ubuntu:16.04
MAINTAINER hakoai

ENV GCC_ARM_VER=6-2017-q1-update \
    GCC_ARM_URL=https://developer.arm.com/-/media/Files/downloads/gnu-rm/6_1-2017q1/gcc-arm-none-eabi-6-2017-q1-update-linux.tar.bz2 \
    GCC_ARM_DIR=/opt

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get remove binutils-arm-none-eabi gcc-arm-none-eabi -y && \
    apt-get install make g++ git bzip2 unzip wget tar u-boot-tools libboost-all-dev -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    wget "${GCC_ARM_URL}" -P /tmp/ && \
    tar -xvvf /tmp/`basename ${GCC_ARM_URL}` -C ${GCC_ARM_DIR} && \
    echo export PATH=\$PATH:${GCC_ARM_DIR}/gcc-arm-none-eabi-${GCC_ARM_VER}/bin > /etc/profile.d/ev3rt.sh && \
    . /etc/profile.d/ev3rt.sh

ENV EV3RT_LIB_NAME=ev3rt-beta7-1-release \
    EV3RT_LIB_PATH=/var/lib/ev3rt

ENV EV3RT_WORKSPACE=${EV3RT_LIB_PATH}/hrp2/sdk/workspace

RUN wget --no-check-certificate http://www.toppers.jp/download.cgi/${EV3RT_LIB_NAME}.zip -P /tmp/ && \
    unzip /tmp/${EV3RT_LIB_NAME}.zip -d /tmp && \
    mv /tmp/${EV3RT_LIB_NAME} ${EV3RT_LIB_PATH} && \
    cd ${EV3RT_LIB_PATH} && \
    tar xvf hrp2.tar.xz && \
    rm hrp2.tar.xz && \
    cd hrp2/cfg && \
    make

COPY build.sh ${EV3RT_WORKSPACE}
