PKG_NAME="neofetch"
PKG_VER="7.1.0"
SRC_URI="https://github.com/dylanaraps/neofetch/archive/refs/tags/7.1.0.tar.gz"
WORKDIR="/tmp/work/${PKG_NAME}-${PKG_VER}"

src_get(){
  rm -rf "${WORKDIR}"
  fetch -o /tmp/${PKG_NAME}.tar.gz "${SRC_URI}"
}

src_unpack() {
    mkdir -p /tmp/work
    tar -xzf /tmp/${PKG_NAME}.tar.gz -C /tmp/work
}

src_compile(){ true; }

src_install(){
  cd "${WORKDIR}" || exit 1
  make DESTDIR="${DESTDIR}" PREFIX=/usr/local install
}

"$1"
