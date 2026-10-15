#!/bin/bash

DIR="/tmp/sqlite"
VERSION="3450300"
YEAR="2024"
TARBALL="sqlite-autoconf-${VERSION}.tar.gz"
URL="https://www.sqlite.org/${YEAR}/${TARBALL}"

src_get() {
  if [ ! -d "$DIR" ]; then
    mkdir -p "$DIR"
    fetch -o "/tmp/${TARBALL}" "${URL}"
    tar -xzf "/tmp/${TARBALL}" -C /tmp/
    mv /tmp/sqlite-autoconf-${VERSION} "$DIR"
  fi
}

src_unpack() { true; }
src_compile() {
  cd "$DIR"
  ./configure --prefix=/usr/local \
    --disable-shared=no
  gmake ${MAKEOPTS}
}

src_install(){
  cd "$DIR"
  gmake install
}
