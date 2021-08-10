# Copyright (c) 2020 by Robert Bosch GmbH. All rights reserved.
# Copyright (c) 2020 - 2021 by Apex.AI Inc. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# SPDX-License-Identifier: Apache-2.0

if(UNIX AND NOT APPLE)
    if(CMAKE_SYSTEM_NAME MATCHES Linux)
        set(LINUX true)
    elseif(CMAKE_SYSTEM_NAME MATCHES QNX)
        set(QNX true)
    endif()
endif()

if(LINUX)
    set(GAIA_CXX_STANDARD 11)
elseif(QNX)
    set(GAIA_CXX_STANDARD 11)
elseif(WIN32)
    set(GAIA_CXX_STANDARD 11)
elseif(APPLE)
    set(GAIA_CXX_STANDARD 11)
endif()

if(CMAKE_CXX_COMPILER_ID MATCHES "MSVC")
    set(GAIA_WARNINGS PRIVATE ${GAIA_WARNINGS} /W0) # TODO iox-#33 set to /W1
    # todo: '/O2' and '/RTC1' (set by default) options are incompatible,
elseif(CMAKE_CXX_COMPILER_ID MATCHES "GNU" OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
    set(GAIA_WARNINGS PRIVATE ${GAIA_WARNINGS} -W -Wall -Wextra -Wuninitialized -Wpedantic -Wstrict-aliasing -Wcast-align -Wno-noexcept-type -Wconversion)
endif()

if(BUILD_STRICT)
    if(CMAKE_CXX_COMPILER_ID MATCHES "MSVC")
        set(GAIA_WARNINGS ${GAIA_WARNINGS} /W0) # TODO iox-#33 set to /WX
    elseif(CMAKE_CXX_COMPILER_ID MATCHES "GNU")
        set(GAIA_WARNINGS ${GAIA_WARNINGS} -Werror)
    elseif(CMAKE_CXX_COMPILER_ID MATCHES "Clang")
        set(GAIA_WARNINGS ${GAIA_WARNINGS} -Werror)
    endif()
endif()
