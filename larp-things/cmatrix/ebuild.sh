PKG_NAME="cmatrix"
PKG_VER="2.0"
SRC_URI="https://github.com/abishekvashok/cmatrix/archive/refs/tags/v2.0.zip"
WORKDIR="/tmp/work/${PKG_NAME}-${PKG_VER}"

src_get() {
  fetch -o /tmp/${PKG_NAME}.zip "${SRC_URI}"
}

src_unpack() {
  mkdir -p /tmp/work
  unzip -o /tmp/${PKG_NAME}.zip -d /tmp/work
}

src_compile() {
  cd "${WORKDIR}" || exit 1
  autoreconf -i
  ./configure --prefix=/usr/local
  make -j${JOBS:-$(sysctl -n hw.ncpu)}
}

src_install() {
  cd "${WORKDIR}" || exit 1
  make DESTDIR="${DESTDIR}" install
}

"$1"
