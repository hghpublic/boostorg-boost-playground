cmake_minimum_required(VERSION 4.2)

project(signals2 LANGUAGES CXX)

option(BUILD_TESTING "Build Signals2 tests" ON)

add_subdirectory(example)

if(BUILD_TESTING)
add_subdirectory(test)
endif()
