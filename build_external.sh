#!/bin/sh

current_path=$(cd $(dirname $0) && pwd)
gtest_root="${current_path}/deps/googletest"
gmock_root="${current_path}/deps/googlemock"

git submodule update

ln -s ${gtest_root} "${gmock_root}/gtest"

cd "${gmock_root}/build-aux"
cmake ..
make
