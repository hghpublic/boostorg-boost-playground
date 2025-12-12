cmake_minimum_required(VERSION 4.2)

project(beast
    VERSION 1.89.0
    LANGUAGES CXX
)

option(BEAST_BUILD_EXAMPLES "Build examples" ON)
option(BEAST_BUILD_TESTS "Build tests" OFF)
option(BEAST_BUILD_FUZZERS "Build fuzzers" OFF)

if(BEAST_BUILD_TESTS OR BEAST_BUILD_FUZZERS)
include(CTest)
endif()

if (BEAST_BUILD_EXAMPLES)
add_subdirectory(example)
endif()

if (BEAST_BUILD_TESTS)
add_subdirectory(test)
endif()

