cmake_minimum_required(VERSION 4.2)

project(example
    VERSION 1.89.0
    HOMEPAGE_URL "https://github.com/boostorg/signals2"
    LANGUAGES CXX
)

find_package(Boost REQUIRED COMPONENTS signals2 io)
find_package(Threads REQUIRED)

set(targets
    custom_combiners
    disconnect_and_block
    doc_view
    doc_view_acm
    doc_view_acm_deconstruct
    extended_slot
    hello_world_multi_slot
    hello_world_slot
    ordering_slots
    passing_slots
    postconstructor_ex1
    postconstructor_ex2
    predestructor_example
    signal_return_value
    slot_arguments
)

foreach(target ${targets})
add_executable(${target})
target_compile_features(${target} PRIVATE cxx_std_26)
target_sources(${target} PRIVATE
    ${target}.cpp
)
target_link_libraries(${target} PRIVATE
    Boost::signals2
    Boost::io
    Threads::Threads
)
endforeach()
