


find_package(Threads REQUIRED)
find_package(OpenSSL REQUIRED)

# boost_beast_lib_asio
add_library(boost_beast_lib_asio STATIC lib_asio.cpp)
source_group("" FILES boost_beast_lib_asio.cpp)
target_compile_definitions(boost_beast_lib_asio PUBLIC
    BOOST_ASIO_SEPARATE_COMPILATION
    BOOST_ASIO_NO_DEPRECATED
    BOOST_ASIO_DISABLE_BOOST_ARRAY
    BOOST_ASIO_DISABLE_BOOST_BIND
    BOOST_ASIO_DISABLE_BOOST_DATE_TIME
    BOOST_ASIO_DISABLE_BOOST_REGEX)
target_link_libraries(boost_beast_lib_asio PUBLIC Boost::asio Threads::Threads)
set_target_properties(boost_beast_lib_asio PROPERTIES FOLDER "static-libs")

# boost_beast_lib_asio_ssl
add_library(boost_beast_lib_asio_ssl STATIC lib_asio_ssl.cpp)
source_group("" FILES boost_beast_lib_asio_ssl.cpp)
target_link_libraries(boost_beast_lib_asio_ssl PUBLIC boost_beast_lib_asio)
target_link_libraries(boost_beast_lib_asio_ssl PUBLIC OpenSSL::SSL OpenSSL::Crypto)
set_target_properties(boost_beast_lib_asio_ssl PROPERTIES FOLDER "static-libs")

# boost_beast_lib_beast
add_library(boost_beast_lib_beast STATIC lib_beast.cpp)
source_group("" FILES boost_beast_lib_beast.cpp)
target_compile_definitions(boost_beast_lib_beast PUBLIC
    BOOST_BEAST_SEPARATE_COMPILATION
    BOOST_BEAST_ALLOW_DEPRECATED
    BOOST_BEAST_TESTS)
target_link_libraries(boost_beast_lib_beast PUBLIC Boost::beast boost_beast_lib_asio)
set_target_properties(boost_beast_lib_beast PROPERTIES FOLDER "static-libs")



# boost_beast_lib_test
add_library(boost_beast_lib_test STATIC lib_test.cpp)
source_group("" FILES boost_beast_lib_test.cpp)
target_include_directories(boost_beast_lib_test PUBLIC extras/include)
target_link_libraries(boost_beast_lib_test PUBLIC boost_beast_lib_beast)
set_target_properties(boost_beast_lib_test PROPERTIES FOLDER "static-libs")

add_subdirectory(beast)
add_subdirectory(bench)
add_subdirectory(doc)
add_subdirectory(example)

if (BOOST_BEAST_BUILD_FUZZERS)
    add_subdirectory(fuzz)
endif ()
