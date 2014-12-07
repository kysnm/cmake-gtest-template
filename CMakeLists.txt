cmake_minimum_required(VERSION 2.8)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/bin")
set(GTEST_ROOT "${CMAKE_CURRENT_SOURCE_DIR}/deps/googletest")
set(GMOCK_ROOT "${CMAKE_CURRENT_SOURCE_DIR}/deps/googlemock")

project(hpack)

set(serial "0.0.1")

include_directories(
    "${CMAKE_CURRENT_SOURCE_DIR}" "${GTEST_ROOT}/include"
    "${CMAKE_CURRENT_SOURCE_DIR}" "${GMOCK_ROOT}/include"
    )

file(GLOB TestSourceFiles t/*.cc src/*.cc)

add_executable(run_test ${TestSourceFiles})

add_custom_target(
    build_external
    COMMAND "${CMAKE_CURRENT_SOURCE_DIR}/build_external.sh")

add_dependencies(run_test build_external)

target_link_libraries(run_test
    pthread
    ${GMOCK_ROOT}/build-aux/gtest/libgtest.a
    ${GMOCK_ROOT}/build-aux/gtest/libgtest_main.a
    ${GMOCK_ROOT}/build-aux/libgmock.a
    ${GMOCK_ROOT}/build-aux/libgmock_main.a
    )

add_custom_command(
    TARGET run_test
    POST_BUILD
    COMMAND run_test
    WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/bin")
