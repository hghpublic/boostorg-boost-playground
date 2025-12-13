cmake_minimum_required(VERSION 4.2)

project(serialization LANGUAGES CXX)

option(BUILD_TESTING "Build the serialization tests" ON)

# add_subdirectory(example)
add_subdirectory(performance)

if(BUILD_TESTING)
add_subdirectory(test)
endif()
