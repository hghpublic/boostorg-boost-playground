cmake_minimum_required(VERSION 4.2)

project(coroutine2 LANGUAGES CXX)

option(BUILD_TESTING "Build test suite" ON)

add_subdirectory(example)
add_subdirectory(performance)

if(BUILD_TESTING)
add_subdirectory(test)
endif()

