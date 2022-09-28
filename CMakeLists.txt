cmake_minimum_required(VERSION 3.0.0)
project(privit-img VERSION 0.1.0)

include(CTest)
enable_testing()

set(SOURCES
    src/main.c
    )

add_executable(privit-img ${SOURCES})

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)
