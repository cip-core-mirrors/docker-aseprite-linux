#!/bin/bash

# Download Skia
# if [ ! -d "/dependencies/skia" ]
# then
#   curl -L https://github.com/aseprite/skia/releases/download/m81-b607b32047/Skia-Linux-Release-x64.zip --output /dependencies/skia.zip
#   unzip /dependencies/skia.zip -d /dependencies/skia
# fi

# git clone --recursive https://github.com/aseprite/aseprite.git
unzip /dependencies/skia.zip -d /output/skia
unzip /dependencies/aseprite-v1.2.27.zip -d /output/aseprite

cd aseprite
mkdir -p build
cd build
cmake \
  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
  -DLAF_BACKEND=skia \
  -DSKIA_DIR=/output/skia \
  -DSKIA_LIBRARY_DIR=/output/skia/out/Release-x64 \
  -DSKIA_LIBRARY=/output/skia/out/Release-x64/libskia.a \
  -G Ninja \
  ..
ninja aseprite