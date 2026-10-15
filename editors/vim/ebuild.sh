#!/bin/bash

DIR="/tmp/vim"

src_get() {
  git clone https://github.com/vim/vim.git /tmp/vim
  cd /tmp/vim
}
src_unpack() { true; }
src_compile() {
  cd $DIR
  ./configure --prefix=/usr/local \
    --with-features=huge \
    --enable-multibyte \
    --enable-terminal

  gmake ${MAKEOPTS}
}
src_install() {
  cd $DIR
  gmake install
}
