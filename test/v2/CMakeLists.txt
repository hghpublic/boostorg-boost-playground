cmake_minimum_required(VERSION 4.2)

project(test-v2
    VERSION 1.89.0
    HOMEPAGE_URL "https://github.com/boostorg/process"
    LANGUAGES CXX
)

find_package(Boost REQUIRED COMPONENTS
    process
    system
    filesystem
    unit_test_framework
)

set(targets
    cstring_ref
    environment
    ext
    pid
    process
    shell
    target
    test_impl
    utf8
)

if(CMAKE_HOST_SYSTEM_NAME STREQUAL "Windows")
list(APPEND targets windows)
endif()

foreach(target ${targets})
set(logical_name test_v2_${target})
add_executable(${logical_name})
if(NOT target STREQUAL "test_impl")
target_compile_definitions(${logical_name} PRIVATE BOOST_TEST_MODULE)
else()
target_compile_definitions(${logical_name} PRIVATE BOOST_TEST_MODULE=process_v2_test)
endif()
target_compile_features(${logical_name} PRIVATE cxx_std_26)
target_sources(${logical_name} PRIVATE
    ${target}.cpp
)
target_link_libraries(${logical_name} PRIVATE
    Boost::process
    Boost::system
    Boost::filesystem
    Boost::unit_test_framework
)
set_target_properties(${logical_name} PROPERTIES
    FOLDER "test/v2"
)
endforeach()
