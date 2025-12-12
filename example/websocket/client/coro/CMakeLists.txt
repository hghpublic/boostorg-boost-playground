cmake_minimum_required(VERSION 4.2)

project(coro LANGUAGES CXX)

find_package(Boost REQUIRED COMPONENTS beast)

set(target websocket-client-coro)
add_executable(${target})
target_compile_features(${target} PRIVATE cxx_std_26)
target_sources(${target} PRIVATE
    websocket_client_coro.cpp
)
target_link_libraries(${target} PRIVATE Boost::beast)

set_target_properties(${target}
    PROPERTIES FOLDER "example-websocket-client")
