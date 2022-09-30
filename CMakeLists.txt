cmake_minimum_required(VERSION 3.0.0)
project(privit-img VERSION 0.1.0)

include(CTest)
enable_testing()

set(SOURCES
    src/main.c
    )

include_directories(privit-img PRIVATE include)
add_executable(privit-img ${SOURCES})

target_link_libraries(privit-img pthread)

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)
