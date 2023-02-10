#!/bin/sh

SOURCE_DIR="$PWD/llvm-project.git/main/llvm"
BUILD_DIR="$PWD/build/llvm"
TARGET_DIR="$PWD/build/sysroot"
LLVM_DISTRO_CONF="$PWD/cmake/llvm.cmake"

cmake \
	-G Ninja \
  -Wno-dev \
  -DCMAKE_INSTALL_PREFIX="$TARGET_DIR" \
  -DPython3_EXECUTABLE=python3 \
  -DLLVM_PARALLEL_COMPILE_JOBS=8 \
  -C "$LLVM_DISTRO_CONF" \
  -S "$SOURCE_DIR" -B "$BUILD_DIR" \
	|| exit 1

ninja -C "$BUILD_DIR" stage2 || exit 1

