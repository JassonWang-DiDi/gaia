cmake_minimum_required(VERSION 3.0.0)
set(MODULE_NAME com)
project(gaia_${MODULE_NAME} VERSION 0.1.0)

# ==== Find packages

# ==== Options

add_library(${PROJECT_NAME}
    src/com.c
)

add_library(${PROJECT_NAMESPACE}::${MODULE_NAME} ALIAS ${PROJECT_NAME})

set_target_properties(${PROJECT_NAME} PROPERTIES
    CXX_STANDARD_REQUIRED ON
    CXX_STANDARD ${GAIA_CXX_STANDARD}
    POSITION_INDEPENDENT_CODE ON
    RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}"
)

target_include_directories(${PROJECT_NAME}
    PUBLIC
    PRIVATE
    inc
)
target_link_libraries(${PROJECT_NAME}
    PUBLIC
    PRIVATE
    ${ICEORYX_SANITIZER_FLAGS}
    ${CMAKE_THREAD_LIBS_INIT}
)

target_compile_options(${PROJECT_NAME} PRIVATE ${ICEORYX_WARNINGS} ${ICEORYX_SANITIZER_FLAGS})

if(LINUX)
    target_link_libraries(${PROJECT_NAME} PRIVATE rt)
elseif(QNX)
elseif(APPLE)
elseif(WIN32)
else()
    message(WARNING "Could not detect supported platform, but I'm feeling lucky today." )
endif()

# Install license files
install(
  FILES ${CMAKE_CURRENT_SOURCE_DIR}/LICENSE
  DESTINATION share/doc/${PROJECT_NAME}
  COMPONENT dev)

if(BUILD_TEST)
  add_subdirectory(test)
endif()
