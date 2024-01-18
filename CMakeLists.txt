cmake_minimum_required(VERSION 3.28)

project(cmdline LANGUAGES CXX)

add_library(cmdline_cmdline INTERFACE)
add_library(cmdline::cmdline ALIAS cmdline_cmdline)

set_target_properties(cmdline_cmdline PROPERTIES EXPORT_NAME cmdline)

option(BUILD_TESTING "Build the tests" OFF)
if(BUILD_TESTING)
  add_executable(cmdline_test test.cpp)
  target_link_libraries(cmdline_test PRIVATE cmdline::cmdline)

  add_executable(cmdline_test2 test2.cpp)
  target_link_libraries(cmdline_test2 PRIVATE cmdline::cmdline)
endif()

include(CMake/InstallationRules.cmake)
