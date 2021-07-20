#!/bin/bash
source ../wasm/build-scripts/var.sh
emmake make -j
FLAGS=(
  -I.. -I../fftools -I../build/include
  -L../build/lib -L../libavcodec -L../libavdevice -L../libavfilter -L../libavformat -L../libavresample -L../libavutil -L../harfbuzz -L../libass -Lfribidi -L../libpostproc -L../libswscale -L../libswresample
  -Wno-deprecated-declarations -Wno-pointer-sign -Wno-implicit-int-float-conversion -Wno-switch -Wno-parentheses -Qunused-arguments
  -lavdevice -lavfilter -lavformat -lavcodec -lswresample -lswscale -lavutil -lpostproc -lm -lharfbuzz -lfribidi -llibass -lx264 -lx265 -lvpx -lwavpack -lmp3lame -lfdk-aac -lvorbis -lvorbisenc -lvorbisfile -logg -ltheora -ltheoraenc -ltheoradec -lz -lfreetype -lopus -lwebp -pthread
  ../fftools/ffprobe.c ../fftools/ffmpeg_opt.c ../fftools/ffmpeg_filter.c ../fftools/ffmpeg_hw.c ../fftools/cmdutils.c test.c main.c
 -s USE_SDL=2                                  # use SDL2
  -s USE_PTHREADS=1                             # enable pthreads support
  -s PROXY_TO_PTHREAD=1                         # detach main() from browser/UI main thread
  -s INVOKE_RUN=0                               # not to run the main() in the beginning
  -s EXIT_RUNTIME=1                             # exit runtime after execution
  -s MODULARIZE=1                               # use modularized version to be more flexible
  -s EXPORT_NAME="createTest"                   # assign export name for browser
  -s EXPORTED_FUNCTIONS="[_main, _proxy_main]"  # export main and proxy_main funcs
  -s EXTRA_EXPORTED_RUNTIME_METHODS="[cwrap, ccall, setValue, writeAsciiToMemory]"   # export preamble funcs
  -s INITIAL_MEMORY=2146435072                  # 64 KB * 1024 * 16 * 2047 = 2146435072 bytes ~= 2 GB
  -s WASM=1 -s INITIAL_MEMORY=2146435072 -o hello.js
  $OPTIM_FLAGS
)
echo "FFMPEG_EM_FLAGS=${FLAGS[@]}"
emcc "${FLAGS[@]}"