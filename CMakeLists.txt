cmake_minimum_required(VERSION 4.2)

project(interprocess
    VERSION 1.89.0
    LANGUAGES CXX
)

option(BUILD_TESTING "Build test suite" ON)

add_subdirectory(example)

if(BUILD_TESTING)
add_subdirectory(test)
endif()

