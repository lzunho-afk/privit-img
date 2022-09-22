cmake_minimum_required(VERSION 3.10)

project(privitimgdb)

set(CMAKE_CXX_STANDARD 20)

set(SOURCES
    src/privit.cpp
    )

add_executable(SOURCES privit)

add_subdirectory(include/libpqxx build-pqxx)
target_link_libraries(privitimgdb PRIVATE pqxx)

#install (TARGETS SOURCES
#           RUNTIME DESTINATION bin)
