cmake_minimum_required(VERSION 4.2)

project(tutorial
    VERSION 1.89.0
    HOMEPAGE_URL "https://github.com/boostorg/python"
    LANGUAGES CXX
)

find_package(Python3 COMPONENTS Development REQUIRED)
find_package(Boost REQUIRED COMPONENTS python)

# python3_printenv()

set(target hello)
add_library(${target} SHARED)
target_compile_features(${target} PRIVATE cxx_std_26)
target_sources(${target} PRIVATE
    hello.cpp
)
target_link_libraries(${target} PRIVATE Boost::python)
target_link_libraries(${target} PRIVATE Python3::Python)
set_target_properties(${target} PROPERTIES
    PREFIX ""
    OUTPUT_NAME "hello_ext"
)


add_custom_command(TARGET ${target} PRE_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy 
        ${CMAKE_CURRENT_SOURCE_DIR}/hello.py
        $<TARGET_FILE_DIR:${target}>/)  

add_custom_target(run_${target}
    COMMAND python3 hello.py
    DEPENDS ${target}
    WORKING_DIRECTORY $<TARGET_FILE_DIR:${target}>
)
