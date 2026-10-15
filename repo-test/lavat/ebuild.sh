#!/bin/bash

src_get() {
  git clone https://github.com/AngelJumbo/lavat /tmp/lavat
  cd /tmp/lavat
}
src_unpack() { true; }
src_compile() {
  cd /tmp/lavat
  local jobs="${JOBS:-$(sysctl -n hw.ncpu)}"
  make -j${jobs}
}
src_install() {
  cd /tmp/lavat
  make install
}
