cmake_minimum_required(VERSION 3.0.0)
project(privit-img VERSION 0.1.0)

include(CTest)
enable_testing()

set(SOURCES
    src/main.c
)

link_directories(${CMAKE_CURRENT_SOURCE_DIR}/lib/libcyaml/lib)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/lib/libcyaml/include)

set(LIBRARIES
    pthread
    cyaml
)

add_executable(privit-img ${SOURCES})
target_include_directories(privit-img PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)
target_link_libraries(privit-img ${LIBRARIES})

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)
