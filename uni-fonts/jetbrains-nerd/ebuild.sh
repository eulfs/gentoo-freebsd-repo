#!/bin/bash

DIR="/tmp/jetbrains-mono-nerdfont"
VERSION="v3.2.1"
FONT_ZIP="JetBrainsMono.zip"
URL="https://github.com/ryanoasis/nerd-fonts/releases/download/${VERSION}/${FONT_ZIP}"
INSTALL_DIR="/usr/local/share/fonts/NerdFonts"

src_get() {
  if [ ! -d "$DIR" ]; then
    mkdir -p "$DIR"
    fetch -o "/tmp/${FONT_ZIP}" "${URL}"
  fi
}

src_unpack() {
  cd "$DIR"
  unzip -o "/tmp/${FONT_ZIP}"
}

src_compile() { true; }

src_install() {
  cd "$DIR"
  mkdir -p "${INSTALL_DIR}"
  
  cp *.ttf "${INSTALL_DIR}/"
  
  if command -v fc-cache >/dev/null 2>&1; then
    fc-cache -f "${INSTALL_DIR}"
  fi
}

"$1"
