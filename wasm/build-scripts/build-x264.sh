#!/bin/bash

set -euo pipefail
source $(dirname $0)/var.sh

LIB_PATH=third_party/x264
CONF_FLAGS=(
  --prefix=$BUILD_DIR                                 # install library in a build directory for FFmpeg to include
  --host=i686-gnu                                     # use i686 linux
  --enable-static                                     # enable building static library
  --disable-cli                                       # disable cli tools
  --disable-asm                                       # disable asm optimization
  --extra-cflags="-c -s USE_PTHREADS=1 $OPTIM_FLAGS"  # flags to use pthread and code optimization
)
echo "CONF_FLAGS=${CONF_FLAGS[@]}"
(cd $LIB_PATH && emconfigure ./configure -C "${CONF_FLAGS[@]}")
emmake make -C $LIB_PATH install-lib-static -j
emmake make -C $LIB_PATH clean
