cmake_minimum_required(VERSION 3.14)
project(privit-img VERSION 0.1.0)

include(CTest)
include(CheckSymbolExists)

enable_testing()

# Check argp
check_symbol_exists(argp_parse "argp.h" HAVE_ARGP)
if(NOT HAVE_ARGP)
    message(FATAL_ERROR " agrp not found. Please install it"
                        " Using mac-os, install argp-standalone"
    )
endif()

find_package(SQLite3 REQUIRED)
find_package(PostgreSQL)

set(LIBCYAML_INCLUDES ${CMAKE_CURRENT_SOURCE_DIR}/lib/libcyaml/include)
set(LIBCYAML_LIBRARY_DIRS ${CMAKE_CURRENT_SOURCE_DIR}/lib/libcyaml/lib)

set(SOURCES
    src/main.c
)

set(LIBRARIES
    pthread
    cyaml
    ${SQLite3_LIBRARIES}
)

set(LIBRARIES_DIRS
    ${LIBCYAML_LIBRARY_DIRS}
)

set(INCLUDES 
    ${LIBCYAML_INCLUDES}
    ${SQLite3_INCLUDE_DIRS}
    ${ARGP_INCLUDE_PATH}
)

if(PostgreSQL_FOUND)
    list(APPEND LIBRARIES ${PostgreSQL_LIBRARIES})
    list(APPEND LIBRARIES_DIRS ${PostgreSQL_LIBRARY_DIRS})
    list(APPEND INCLUDE_DIRS ${PostgreSQL_INCLUDE_DIRS})
endif()

configure_file(
    ${CMAKE_CURRENT_SOURCE_DIR}/include/version.h.in 
    ${CMAKE_CURRENT_SOURCE_DIR}/include/version.h 
)
configure_file(
    ${CMAKE_CURRENT_SOURCE_DIR}/include/config.h.in 
    ${CMAKE_CURRENT_SOURCE_DIR}/include/config.h
)

link_directories(${LIBRARIES_DIRS})
include_directories(${INCLUDES})

add_executable(privit-img ${SOURCES})
target_include_directories(privit-img PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)
target_link_libraries(privit-img PRIVATE ${LIBRARIES})

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)
