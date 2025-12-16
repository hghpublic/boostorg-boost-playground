cmake_minimum_required(VERSION 4.2)

project(test
    VERSION 1.89.0
    HOMEPAGE_URL "https://github.com/boostorg/lambda2"
    LANGUAGES CXX
)

find_package(Boost REQUIRED COMPONENTS
    lambda2
    unit_test_framework
)

set(targets
    compound
    dereference
    increment
    lambda2_test
    lookup_problem
    placeholders
    project
    quick
    stream_extract
    stream_insert
    subscript
    version
)

foreach(target ${targets})
add_executable(${target})
target_compile_features(${target} PRIVATE cxx_std_26)
target_sources(${target} PRIVATE
    ${target}.cpp
)
target_link_libraries(${target} PRIVATE
    Boost::lambda2
    Boost::unit_test_framework
)
set_target_properties(${target} PROPERTIES
    FOLDER "test"
)
endforeach()
