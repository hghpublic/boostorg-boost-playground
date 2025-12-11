cmake_minimum_required(VERSION 4.2)

project(test
    VERSION 1.89.0
    HOMEPAGE_URL "https://github.com/boostorg/coroutine2"
    LANGUAGES CXX
)

find_package(Boost REQUIRED COMPONENTS coroutine2)
find_package(Boost REQUIRED COMPONENTS unit_test_framework)

set(target test_coroutine)
add_executable(${target})
target_compile_features(${target} PRIVATE cxx_std_26)
target_sources(${target} PRIVATE
    ${target}.cpp
)
target_link_libraries(${target} PRIVATE Boost::coroutine2)
target_link_libraries(${target} PRIVATE Boost::unit_test_framework)
