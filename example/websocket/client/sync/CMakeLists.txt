cmake_minimum_required(VERSION 4.2)

project(sync LANGUAGES CXX)

find_package(Boost REQUIRED COMPONENTS beast)

set(target websocket-client-sync)
add_executable(${target})
target_compile_features(${target} PRIVATE cxx_std_26)
target_sources(${target} PRIVATE
    websocket_client_sync.cpp
)
target_link_libraries(${target} PRIVATE Boost::beast)

set_target_properties(${target}
    PROPERTIES FOLDER "example-websocket-client")
