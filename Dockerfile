FROM sharaku/ev3rt-build
MAINTAINER hakoai

RUN \
  wget --no-check-certificate http://www.toppers.jp/download.cgi/ev3rt-beta6-2-release.zip -P /tmp/ && \
  unzip /tmp/ev3rt-beta6-2-release.zip -d /tmp && \
  mv /tmp/ev3rt-beta6-2-release /var/lib/ev3rt && \
  cd /var/lib/ev3rt/ && \
  tar Jxvf hrp2.tar.xz && \
  rm hrp2.tar.xz && \
  cd hrp2/cfg && \
  make
