cmake_minimum_required(VERSION 4.2)

project(lambda2 LANGUAGES CXX)

option(BUILD_TESTING "Build Lambda2 tests" ON)

add_subdirectory(doc/lambda2)

if(BUILD_TESTING)
add_subdirectory(test)
endif()
