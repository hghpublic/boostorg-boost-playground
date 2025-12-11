cmake_minimum_required(VERSION 4.2)

project(example
    VERSION 1.89.0
    HOMEPAGE_URL "https://github.com/boostorg/coroutine2"
    LANGUAGES CXX
)

find_package(Boost REQUIRED COMPONENTS coroutine2)

set(targets
    fibonacci
    layout
    parser
    same_fringe
    segmented
)

foreach(target ${targets})
add_executable(${target})
target_compile_features(${target} PRIVATE cxx_std_26)
target_sources(${target} PRIVATE
    ${target}.cpp
)
target_link_libraries(${target} PRIVATE Boost::coroutine2)    
endforeach()
