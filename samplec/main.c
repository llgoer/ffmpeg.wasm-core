#include <stdio.h>
#include "test.h"
#include "libavutil/ffversion.h"
#include "ffprobe.h"

int main(int argc, char ** argv) {
  printf("Hello World:%s--%s\n",test_version(), FFMPEG_VERSION);
  ffprobe_execute(argc, argv);
}