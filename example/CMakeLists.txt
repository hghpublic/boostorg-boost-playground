cmake_minimum_required(VERSION 4.2)

project(example LANGUAGES CXX)

find_package(Boost REQUIRED COMPONENTS
    accumulators
    foreach
)

set(target example)
add_executable(${target} main.cpp)
target_compile_features(${target} PRIVATE cxx_std_26)
target_link_libraries(${target} PRIVATE
    Boost::accumulators
    Boost::foreach
)
