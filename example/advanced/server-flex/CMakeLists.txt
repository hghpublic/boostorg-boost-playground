

add_executable(advanced-server-flex
    Jamfile
    advanced_server_flex.cpp)

source_group("" FILES
    Jamfile
    advanced_server_flex.cpp)

target_include_directories(advanced-server-flex
    PRIVATE $ENV{WORKSPACE_ROOT})

target_link_libraries(advanced-server-flex
    PRIVATE Boost::beast OpenSSL::SSL OpenSSL::Crypto)

set_target_properties(advanced-server-flex
    PROPERTIES FOLDER "example-advanced-server")
