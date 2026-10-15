PKG_NAME="ee"
PKG_VER="1.5.2"
SRC_URI="https://www.freebsd.org/ports/local-distrib/ee-1.5.2.tar.gz" # or alternative source
WORKDIR="/tmp/work/${PKG_NAME}-${PKG_VER}"

src_get() {
  fetch -o /tmp/${PKG_NAME}.tar.gz "${SRC_URI}"
}

src_unpack() {
  mkdir -p /tmp/work
  tar -xzf /tmp/${PKG_NAME}.tar.gz -C /tmp/work
}

src_compile() {
  cd "${WORKDIR}" || exit 1
  local jobs="${JOBS:-$(sysctl -n hw.ncpu)}"
  make -j${jobs}
}

src_install() {
  cd "${WORKDIR}" || exit 1
  mkdir -p "${DESTDIR}/usr/local/bin"
  make DESTDIR="${DESTDIR}" PREFIX=/usr/local install
}

"$1"
