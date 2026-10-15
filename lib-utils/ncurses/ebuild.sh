PKG_NAME="ncurses"
PKG_VER="6.4"
SRC_URI="https://invisible-mirror.net/archives/ncurses/ncurses-6.4.tar.gz"
WORKDIR="/tmp/work/${PKG_NAME}-${PKG_VER}"

src_get() {
  rm -rf "${WORKDIR}"
  fetch -o /tmp/${PKG_NAME}.tar.gz "${SRC_URI}"
}

src_unpack() {
  mkdir -p /tmp/work
  tar -xzf /tmp/${PKG_NAME}.tar.gz -C /tmp/work
}

src_compile() {
    cd "${WORKDIR}" || exit 1
    ./configure \
        --prefix=/usr/local \
        --with-shared \
        --without-debug \
        --without-ada \
        --enable-widec

    local jobs="${JOBS:-$(sysctl -n hw.ncpu)}"
    make -j${jobs}
}

src_install() {
    cd "${WORKDIR}" || exit 1
    make DESTDIR="${DESTDIR}" install
}
