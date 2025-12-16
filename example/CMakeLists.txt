cmake_minimum_required(VERSION 4.2)

project(example LANGUAGES CXX)

find_package(Boost REQUIRED COMPONENTS
    process
    system
    asio
    core
)

set(targets
    env
    intro
    intro_popen
    quickstart
    start_dir
    stdio
)

foreach(target ${targets})
add_executable(${target})
target_compile_features(${target} PRIVATE cxx_std_26)
target_sources(${target} PRIVATE
    ${target}.cpp
)
target_link_libraries(${target} PRIVATE
    Boost::process
    Boost::system
    Boost::asio
    Boost::core
)
set_target_properties(${target} PROPERTIES
    FOLDER "example"
)
endforeach()
