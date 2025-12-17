cmake_minimum_required(VERSION 4.2)

project(example
    VERSION 1.89.0
    HOMEPAGE_URL "https://github.com/boostorg/cobalt"
    LANGUAGES CXX
)

find_package(Boost REQUIRED COMPONENTS
    cobalt
    asio
    beast
    json
    lockfree
    signals2
)
find_package(Threads REQUIRED)
# find_package(Python COMPONENTS Interpreter Development REQUIRED)
# find_package(nanobind REQUIRED)
# nanobind_add_module(my_ext source.cpp)

set(targets
    channel
    delay
    delay_op
    # echo_server
    # http
    # outcome
    # python
    signals
    spsc
    thread
    thread_pool
    # ticker
)

foreach(target ${targets})
add_executable(${target})
target_compile_features(${target} PRIVATE cxx_std_26)
target_sources(${target} PRIVATE
    ${target}.cpp
)
target_link_libraries(${target} PRIVATE
    Boost::cobalt
    Boost::beast
    Boost::json
    Boost::lockfree
    Boost::signals2
    Threads::Threads
)
set_target_properties(${target} PROPERTIES
    FOLDER "example"
)
endforeach()
