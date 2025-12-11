cmake_minimum_required(VERSION 4.2)

project(numpy
    VERSION 1.89.0
    HOMEPAGE_URL "https://github.com/boostorg/python"
    LANGUAGES CXX
)

# https://cmake.org/cmake/help/latest/module/FindPython3.html
find_package(Python3 COMPONENTS REQUIRED Development OPTIONAL_COMPONENTS NumPy)
find_package(Boost REQUIRED COMPONENTS python numpy)

# executable targets

set(targets
    dtype
    fromdata
    ndarray
    simple
    ufunc
    wrap
)

foreach(target ${targets})
add_executable(${target})
target_compile_features(${target} PRIVATE cxx_std_26)
target_sources(${target} PRIVATE
    ${target}.cpp
)
target_link_libraries(${target} PRIVATE Boost::python Boost::numpy)
target_link_libraries(${target} PRIVATE Python3::Python Python3::NumPy)
endforeach()


# target library gaussian

set(target gaussian)
add_library(${target} SHARED)
target_compile_features(${target} PRIVATE cxx_std_26)
target_sources(${target} PRIVATE
    gaussian.cpp
)
target_link_libraries(${target} PRIVATE Boost::python Boost::numpy)
target_link_libraries(${target} PRIVATE Python3::Python Python3::NumPy)
set_target_properties(${target} PROPERTIES
    PREFIX ""
)


add_custom_command(TARGET ${target} PRE_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy 
        ${CMAKE_CURRENT_SOURCE_DIR}/demo_gaussian.py
        $<TARGET_FILE_DIR:${target}>/)  

add_custom_target(run_${target}
    COMMAND python3 demo_gaussian.py
    DEPENDS ${target}
    WORKING_DIRECTORY $<TARGET_FILE_DIR:${target}>
)
