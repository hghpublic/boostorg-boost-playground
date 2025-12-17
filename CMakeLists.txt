cmake_minimum_required(VERSION 4.2)

project(cobalt LANGUAGES CXX)

option(BUILD_TESTING "Build Cobalt tests" ON)

add_subdirectory(example)
add_subdirectory(bench)

if(BUILD_TESTING)
add_subdirectory(test)
endif()
