cmake_minimum_required(VERSION 4.2)

project(process LANGUAGES CXX)

option(BUILD_TESTING "Build the tests." ON)

add_subdirectory(example)

if(BUILD_TESTING)
add_subdirectory(test)
endif()

