cmake_minimum_required(VERSION 4.2)

project(performance
    VERSION 1.89.0
    HOMEPAGE_URL "https://github.com/boostorg/serialization"
    LANGUAGES CXX
)

find_package(Boost REQUIRED COMPONENTS
    serialization
    filesystem
)
set(targets
    peformance_array
    performance_binary
    # performance_codecvt_null
    # performance_iterators
    # performance_iterators_base64
    # performance_no_rtti
    # performance_polymorphic
    # performance_simple_class
    # performance_utf8_codecvt
    # performance_vector
)

foreach(target ${targets})
add_executable(${target})
target_include_directories(${target} PRIVATE ../test)
target_compile_features(${target} PRIVATE cxx_std_26)
target_sources(${target} PRIVATE
    ${target}.cpp
)
target_link_libraries(${target} PRIVATE
    Boost::serialization
    Boost::filesystem
)
set_target_properties(${target} PROPERTIES
    FOLDER "performance"
)
endforeach()

# targets depending on test/A.cpp

set(targets_dep_test_A
    peformance_array
    # performance_vector
)
foreach(target ${targets_dep_test_A})
target_sources(${target} PRIVATE
    ../test/A.cpp
)
endforeach()
