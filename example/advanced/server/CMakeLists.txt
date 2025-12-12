
add_executable(advanced-server
    Jamfile
    advanced_server.cpp)

source_group("" FILES
    Jamfile
    advanced_server.cpp)

target_link_libraries(advanced-server PRIVATE Boost::beast)

set_target_properties(advanced-server PROPERTIES FOLDER "example-advanced-server")
