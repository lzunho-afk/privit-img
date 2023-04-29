cmake_minimum_required(VERSION 3.14)
project(privit-img VERSION 0.1.0)

include(CTest)
include(CheckSymbolExists)

enable_testing()

option(BUILD_DOC "Build documentation" OFF)

# Loading extra modules
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake/")

# Check argp
check_symbol_exists(argp_parse "argp.h" HAVE_ARGP)
if(NOT HAVE_ARGP)
  message(FATAL_ERROR " agrp not found. Please install it"
    " Using mac-os, install argp-standalone"
  )
endif()

if (BUILD_DOC)
  find_package(Doxygen)
  if (DOXYGEN_FOUND)
    set(DOXYGEN_IN ${CMAKE_CURRENT_SOURCE_DIR}/docs/Doxyfile.in)
    set(DOXYGEN_OUT ${CMAKE_CURRENT_BINARY_DIR}/Doxyfile)

    configure_file(${DOXYGEN_IN} ${DOXYGEN_OUT} @ONLY)
    message("Doxygen build started")

    add_custom_target(doc_doxygen ALL
      COMMAND ${DOXYGEN_EXECUTABLE} ${DOXYGEN_OUT}
      WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
      COMMENT "Generating API documentation with Doxygen"
      VERBATIM)
  else (DOXYGEN_FOUND)
    message("Doxygen need to be installed to generate the doxygen documentation")
  endif (DOXYGEN_FOUND)
endif (BUILD_DOC)

find_package(LibYAML REQUIRED)
find_package(SQLite3 REQUIRED)
find_package(PostgreSQL)

set(SOURCES
  ${CMAKE_CURRENT_SOURCE_DIR}/src/main.c
)

set(LIBRARIES
  pthread
  ${LIBYAML_LIBRARIES}
  ${SQLite3_LIBRARIES}
)

set(INCLUDES
  ${LIBYAML_INCLUDE_DIR}
  ${SQLite3_INCLUDE_DIRS}
  ${ARGP_INCLUDE_PATH}
)

if(PostgreSQL_FOUND)
  list(APPEND LIBRARIES ${PostgreSQL_LIBRARIES})
  list(APPEND LIBRARIES_DIRS ${PostgreSQL_LIBRARY_DIRS})
  list(APPEND INCLUDE_DIRS ${PostgreSQL_INCLUDE_DIRS})
  set(POSTGRESQL_SUPPORT TRUE)
endif()

configure_file(
  ${CMAKE_CURRENT_SOURCE_DIR}/include/version.h.in 
  ${CMAKE_CURRENT_BINARY_DIR}/include/version.h 
)
configure_file(
  ${CMAKE_CURRENT_SOURCE_DIR}/include/config.h.in 
  ${CMAKE_CURRENT_BINARY_DIR}/include/config.h
)

include_directories(${INCLUDES})

add_executable(privit-img ${SOURCES})
target_include_directories(privit-img PUBLIC ${CMAKE_CURRENT_BINARY_DIR}/include)
target_link_libraries(privit-img PRIVATE ${LIBRARIES})

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)
