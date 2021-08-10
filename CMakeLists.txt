cmake_minimum_required(VERSION 3.0.0)
project(gaia VERSION 0.1.0)

# ==== enable C++ 11
# set(CMAKE_C_STANDARD 9)
# set(CMAKE_C_STANDARD_REQUIRED True)
set(GAIA_CXX_STANDARD 11)
set(PROJECT_NAMESPACE gaia)

# ==== default build type : Debug
if (NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Release)
endif()

# ==== Environment
set(ROOT_DIR ${CMAKE_CURRENT_SOURCE_DIR})

# ==== Include other make files
include(${ROOT_DIR}/cmake/build_platform.cmake)
include(${ROOT_DIR}/cmake/build_options.cmake)

# ==== Testing
# include(CTest)
# enable_testing()

# ==== Subdir modules
add_subdirectory(${ROOT_DIR}/com ${CMAKE_BINARY_DIR}/com)

# ==== Packaging
include(${ROOT_DIR}/cmake/packaging.cmake)

show_config_options()

message("")
message("       Build Properties")
message("          project name..............: " ${CMAKE_PROJECT_NAME})
message("          c compiler................: " ${CMAKE_C_COMPILER})
message("          c++ compiler..............: " ${CMAKE_CXX_COMPILER})
message("")