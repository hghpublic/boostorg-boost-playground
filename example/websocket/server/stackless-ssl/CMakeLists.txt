cmake_minimum_required(VERSION 4.2)

project(stackless-ssl LANGUAGES CXX)

find_package(Boost REQUIRED COMPONENTS beast)
find_package(OpenSSL REQUIRED)

set(target websocket-server-stackless-ssl)
add_executable(${target})
target_compile_features(${target} PRIVATE cxx_std_26)
target_include_directories(${target}
    PRIVATE $ENV{WORKSPACE_ROOT})
target_sources(${target} PRIVATE
    websocket_server_stackless_ssl.cpp
)
target_link_libraries(${target} PRIVATE Boost::beast)
target_link_libraries(${target}
    PRIVATE Boost::beast OpenSSL::SSL OpenSSL::Crypto)

set_target_properties(${target}
    PROPERTIES FOLDER "example-websocket-server")
