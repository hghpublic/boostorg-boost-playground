
add_executable(advanced-server-flex-awaitable
    Jamfile
    advanced_server_flex_awaitable.cpp)

source_group("" FILES
    Jamfile
    advanced_server_flex_awaitable.cpp)

target_include_directories(advanced-server-flex-awaitable
    PRIVATE $ENV{WORKSPACE_ROOT})

target_link_libraries(advanced-server-flex-awaitable
    PRIVATE Boost::beast OpenSSL::SSL OpenSSL::Crypto)

set_target_properties(advanced-server-flex-awaitable
    PROPERTIES FOLDER "example-advanced-server")
