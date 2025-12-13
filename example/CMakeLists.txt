cmake_minimum_required(VERSION 4.2)

project(example
    VERSION 1.89.0
    HOMEPAGE_URL "https://github.com/boostorg/serialization"
    LANGUAGES CXX
)

find_package(Boost REQUIRED COMPONENTS serialization)

set(targets
    demo
    demo_auto_ptr
    demo_exception
    demo_fast_archive
    demo_log
    demo_pimpl
    demo_polymorphic
    # demo_portable_archive
    demo_shared_ptr
    demo_simple_log
    demo_trivial_archive
    demo_xml
    demo_xml_load
    demo_xml_save
    fix_six
    # polymorphic_portable_binary_iarchive
    # polymorphic_portable_binary_oarchive
    # portable_binary_iarchive
    # portable_binary_oarchive
)

foreach(target ${targets})
add_executable(${target})
target_compile_features(${target} PRIVATE cxx_std_26)
target_sources(${target} PRIVATE
    ${target}.cpp
)
target_link_libraries(${target} PRIVATE
    Boost::serialization
)
set_target_properties(${target} PROPERTIES
    FOLDER "example"
)
endforeach()

target_sources(demo_log PRIVATE log_archive.cpp)
target_sources(demo_pimpl PRIVATE demo_pimpl_A.cpp)
target_sources(demo_polymorphic PRIVATE demo_polymorphic_A.cpp)
