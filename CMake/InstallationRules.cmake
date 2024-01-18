include(GNUInstallDirs)
include(CMakePackageConfigHelpers)

set(package cmdline)

set(cmdline_INSTALL_INCLUDEDIR "${CMAKE_INSTALL_INCLUDEDIR}/${package}")
set(cmdline_INSTALL_CMAKEDIR "${CMAKE_INSTALL_DATADIR}/${package}")

install(FILES "cmdline.h" DESTINATION "${cmdline_INSTALL_INCLUDEDIR}")

install(
  TARGETS cmdline_cmdline
  EXPORT cmdlineTargets
  INCLUDES
  DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}")

install(
  FILES "CMake/InstallationConfig.cmake"
  DESTINATION "${cmdline_INSTALL_CMAKEDIR}"
  RENAME "${package}Config.cmake")

write_basic_package_version_file(
  "${PROJECT_BINARY_DIR}/${package}ConfigVersion.cmake"
  VERSION 1.0.0
  COMPATIBILITY SameMajorVersion ARCH_INDEPENDENT)

install(FILES "${PROJECT_BINARY_DIR}/${package}ConfigVersion.cmake"
        DESTINATION "${cmdline_INSTALL_CMAKEDIR}")

install(
  EXPORT ${package}Targets
  DESTINATION "${cmdline_INSTALL_CMAKEDIR}"
  NAMESPACE ${package}::)
