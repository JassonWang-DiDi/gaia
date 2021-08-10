# Copyright (c) 2020 - 2021 by Apex.AI Inc. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may not
# use this file except in compliance with the License. You may obtain a copy of
# the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations under
# the License.
#
# SPDX-License-Identifier: Apache-2.0

cmake_minimum_required(VERSION 3.0.0)

## please add new entries alphabetically sorted
option(BUILD_ALL "Build with all extensions and all tests" OFF)
option(BUILD_SHARED_LIBS "Build sub-modules as shared libraries" OFF)
option(BUILD_STRICT "Build is performed with '-Werror'" OFF)
option(BUILD_TEST "Build all tests" OFF)
option(BUILD_EXAMPLES "Build all gaia examples" OFF)
option(INTROSPECTION "Builds the introspection client which requires the ncurses library with an activated terminfo feature" OFF)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON) # "Create compile_commands.json file"

if(BUILD_ALL)
  set(BUILD_EXAMPLES ON)
  set(BUILD_TEST ON)
endif()

function(show_config_options)
  message("")
  message("       CMake Options")
  message("          CMAKE_BUILD_TYPE.....................: " ${CMAKE_BUILD_TYPE})
  message("          CMAKE_TOOLCHAIN_FILE.................: " ${CMAKE_TOOLCHAIN_FILE})
  message("          CMAKE_EXPORT_COMPILE_COMMANDS........: " ${CMAKE_EXPORT_COMPILE_COMMANDS})
  message("")
  message("       GAIA Options")
  message("          BUILD_ALL............................: " ${BUILD_ALL})
  message("          BUILD_SHARED_LIBS....................: " ${BUILD_SHARED_LIBS})
  message("          BUILD_STRICT.........................: " ${BUILD_STRICT})
  message("          BUILD_TEST...........................: " ${BUILD_TEST} ${BUILD_TEST_HINT})
  message("          BUILD_EXAMPLES.......................: " ${BUILD_EXAMPLES})
  message("          INTROSPECTION........................: " ${INTROSPECTION})
endfunction()
