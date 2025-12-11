cmake_minimum_required(VERSION 4.2)

project(quickstart
    VERSION 1.89.0
    HOMEPAGE_URL "https://github.com/boostorg/python"
    LANGUAGES CXX
)

find_package(Python3 COMPONENTS Development REQUIRED)
find_package(Boost REQUIRED COMPONENTS python)

# target executable embedding

set(target embedding)
add_executable(${target})
target_compile_features(${target} PRIVATE cxx_std_26)
target_sources(${target} PRIVATE
    embedding.cpp
)
target_link_libraries(${target} PRIVATE Boost::python)
target_link_libraries(${target} PRIVATE Python3::Python)

add_custom_command(TARGET ${target} PRE_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy 
        ${CMAKE_CURRENT_SOURCE_DIR}/script.py
        $<TARGET_FILE_DIR:${target}>/)  

add_custom_target(run_${target}
    COMMAND $<TARGET_FILE:${target}> script.py
    DEPENDS ${target}
    WORKING_DIRECTORY $<TARGET_FILE_DIR:${target}>
)

# target library extending

set(target extending)
add_library(${target} SHARED)
target_compile_features(${target} PRIVATE cxx_std_26)
target_sources(${target} PRIVATE
    extending.cpp
)
target_link_libraries(${target} PRIVATE Boost::python)
target_link_libraries(${target} PRIVATE Python3::Python)
set_target_properties(${target} PROPERTIES
    PREFIX ""
)


add_custom_command(TARGET ${target} PRE_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy 
        ${CMAKE_CURRENT_SOURCE_DIR}/test_extending.py
        $<TARGET_FILE_DIR:${target}>/)  

add_custom_target(run_${target}
    COMMAND python3 test_extending.py
    DEPENDS ${target}
    WORKING_DIRECTORY $<TARGET_FILE_DIR:${target}>
)
