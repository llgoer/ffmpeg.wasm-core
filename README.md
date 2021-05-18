FFmpeg.wasm Core
================

[![Node Version](https://img.shields.io/node/v/@ffmpeg/ffmpeg.svg)](https://img.shields.io/node/v/@ffmpeg/ffmpeg.svg)
![FFmpeg.wasm Core](https://github.com/ffmpegwasm/ffmpeg.wasm-core/workflows/FFmpeg.wasm/badge.svg?branch=n4.3.1-wasm)
![npm (tag)](https://img.shields.io/npm/v/@ffmpeg/core/latest)
[![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg)](https://github.com/ffmpegwasm/ffmpeg.wasm-core/graphs/commit-activity)
[![Downloads Total](https://img.shields.io/npm/dt/@ffmpeg/core.svg)](https://www.npmjs.com/package/@ffmpeg/core)
[![Downloads Month](https://img.shields.io/npm/dm/@ffmpeg/core.svg)](https://www.npmjs.com/package/@ffmpeg/core)

This is the core part of FFmpeg.wasm where we transpile C/C++ code of FFmpeg to JavaScript/WebAssembly code. It is still very experimental (and slow), but shows the possibilities of using FFmpeg purely in the browser.

If you have any issues for this repository, please put it here: https://github.com/ffmpegwasm/ffmpeg.wasm/issues

## 安装

```
$ git clone https://github.com/ffmpegwasm/ffmpeg.wasm-core
$ git submodule update --init --recursive
```

## 构建

1. 使用docker (简单方法)

安装最新的docker，然后执行 `build-with-docker.sh`.

但发现会出现不少的问题

```
$ bash build-with-docker.sh
```

2. 安装emsdk

执行
```
git clone https://github.com/emscripten-core/emsdk.git
cd emsdk
./emsdk install 2.0.8
./emsdk activate 2.0.8
```

3. 安装cmake

然后执行 `build.sh`.

```
$ bash build.sh
```

如果一切顺利, 你可以看到文件 `wasm/dist`.

## 测试

如果一切都构建完毕, 你可以执行下面的命令来测试:

```
$ cd wasm
$ npm install
$ npm test
```

## 配置

#### 基础

| Library/Tool Name | Version | Remark |
| ----------------- | ------- | ------ |
| Emscripten | 2.0.8 | |
| FFmpeg | 4.3.1 | |

#### 视频

| Library/Tool Name | Version | Remark |
| ----------------- | ------- | ------ |
| x264 | 0.160.x | mp4 format |
| x265 | 3.4 | mp4 format, only works with `-pix_fmt yuv420p10le` and `-pix_fmt yuv420p12le` |
| libvpx | 1.9.0 | webm format |
| theora | 1.1.1 | ogv format |
| aom | 1.0.0 | mkv format, extremely slow (takes over 120s for 1s video), not recommended to use |

#### 音频

| Library/Tool Name | Version | Remark |
| ----------------- | ------- | ------ |
| wavpack | 5.3.0 | wav/wv format |
| lame | 3.100 | mp3 format |
| fdk-aac | 2.0.1 | aac format |
| ogg | 1.3.4 | required by vorbis |
| vorbis | 1.3.6 | ogg format |
| opus | 1.3.1 | opus format |

#### 图片

| Library/Tool Name | Version | Remark |
| ----------------- | ------- | ------ |
| libwebp | 1.1.0 | webp format |

#### 其他

| Library/Tool Name | Version | Remark |
| ----------------- | ------- | ------ |
| freetype2 | 2.10.4 | font file support |
| fribidi | 1.0.10 | Arabic and Hebrew alphabets support |
| harfbuzz | 2.7.4 | text shaping engine |
| libass | 0.15.0 | SSA/ASS subtitles rendering library |
