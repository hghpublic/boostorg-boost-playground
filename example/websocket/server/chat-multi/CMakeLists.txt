cmake_minimum_required(VERSION 4.2)

project(chat-multi LANGUAGES CXX)

find_package(Boost REQUIRED COMPONENTS beast)

set(target websocket-chat-multi)
add_executable(${target})
target_compile_features(${target} PRIVATE cxx_std_26)
target_sources(${target} PRIVATE
    main.cpp
    
    beast.hpp
    http_session.cpp
    http_session.hpp
    listener.cpp
    listener.hpp
    net.hpp
    shared_state.cpp
    shared_state.hpp
    websocket_session.cpp
    websocket_session.hpp
)
target_link_libraries(${target} PRIVATE Boost::beast)

set_target_properties(${target}
PROPERTIES FOLDER "example-websocket-server")

add_custom_command(TARGET ${target} POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy_if_different
        ${CMAKE_CURRENT_SOURCE_DIR}/chat_client.html
        $<TARGET_FILE_DIR:${target}>
)
