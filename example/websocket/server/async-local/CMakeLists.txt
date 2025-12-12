cmake_minimum_required(VERSION 4.2)

project(async-local LANGUAGES CXX)

find_package(Boost REQUIRED COMPONENTS beast)

set(target websocket-server-async-local)
add_executable(${target})
target_compile_features(${target} PRIVATE cxx_std_26)
target_sources(${target} PRIVATE
    websocket_server_async_local.cpp
)
target_link_libraries(${target} PRIVATE Boost::beast)

set_target_properties(${target}
    PROPERTIES FOLDER "example-websocket-server")
