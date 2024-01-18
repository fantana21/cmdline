cmake_minimum_required(VERSION 3.28)

project(cmdline LANGUAGES CXX)

add_library(cmdline_cmdline INTERFACE)
add_library(cmdline::cmdline ALIAS cmdline_cmdline)

target_sources(cmdline_cmdline PUBLIC FILE_SET HEADERS FILES cmdline.h)

option(BUILD_TESTING "Build the tests" OFF)
if(BUILD_TESTING)
    add_executable(cmdline_test test.cpp)
    target_link_libraries(cmdline_test PRIVATE cmdline::cmdline)

    add_executable(cmdline_test2 test2.cpp)
    target_link_libraries(cmdline_test2 PRIVATE cmdline::cmdline)
endif()
