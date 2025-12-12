cmake_minimum_required(VERSION 4.2)

project(coro-ssl LANGUAGES CXX)

find_package(Boost REQUIRED COMPONENTS beast)
find_package(OpenSSL REQUIRED)

set(target websocket-client-coro-ssl)
add_executable(${target})
target_compile_features(${target} PRIVATE cxx_std_26)
target_include_directories(${target}
    PRIVATE $ENV{WORKSPACE_ROOT})
target_sources(${target} PRIVATE
    websocket_client_coro_ssl.cpp
)
target_link_libraries(${target} PRIVATE Boost::beast)
target_link_libraries(${target}
    PRIVATE Boost::beast OpenSSL::SSL OpenSSL::Crypto)

set_target_properties(${target}
    PROPERTIES FOLDER "example-websocket-client")
