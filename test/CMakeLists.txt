cmake_minimum_required(VERSION 4.2)

project(test
    VERSION 1.89.0
    HOMEPAGE_URL "https://github.com/boostorg/cobalt"
    LANGUAGES CXX
)

find_package(Boost REQUIRED COMPONENTS
    cobalt
    unit_test_framework
)
find_package(Threads REQUIRED)
find_package(OpenSSL REQUIRED)

set(targets
    any_completion_handler
    async_for
    channel
    # composition
    # concepts
    detached
    fork
    gather
    generator
    handler
    join
    left_race
    # main
    # main_compile
    monotonic_resource
    op
    promise
    race
    run
    sbo_resource
    strand
    task
    # test_main
    this_coro
    thread
    # util
    wait_group
    with
    wrappers
)

foreach(target ${targets})
set(logical_name test_${target})
add_executable(${logical_name})
target_compile_features(${logical_name} PRIVATE cxx_std_26)
target_compile_definitions(${logical_name} PRIVATE BOOST_TEST_MODULE)
target_sources(${logical_name} PRIVATE
    ${target}.cpp
)
target_link_libraries(${logical_name} PRIVATE
    Boost::cobalt
    Boost::unit_test_framework
)
target_link_libraries(${logical_name} PRIVATE OpenSSL::SSL OpenSSL::Crypto)
set_target_properties(${logical_name} PROPERTIES
    FOLDER "test"
)
endforeach()

# if(NOT TARGET tests)
#     add_custom_target(tests)
#     set_property(TARGET tests PROPERTY FOLDER _deps)
# endif()

set(target boost_cobalt_static_tests)
add_library(${target} EXCLUDE_FROM_ALL concepts.cpp util.cpp)
target_link_libraries(${target} Boost::cobalt)
set_target_properties(${target} PROPERTIES
    FOLDER "test"
)

set(target boost_cobalt_main)
add_executable(${target} EXCLUDE_FROM_ALL main.cpp)
target_link_libraries(${target} Boost::cobalt)
set_target_properties(${target} PROPERTIES
    FOLDER "test"
)

set(target boost_cobalt_main_compile)
add_executable(${target} EXCLUDE_FROM_ALL main_compile.cpp)
target_link_libraries(${target} Boost::cobalt)
set_target_properties(${target} PROPERTIES
    FOLDER "test"
)

set(target boost_cobalt_basic_tests)
add_executable(${target}  EXCLUDE_FROM_ALL
      async_for.cpp test_main.cpp promise.cpp with.cpp op.cpp handler.cpp join.cpp race.cpp this_coro.cpp
      channel.cpp generator.cpp run.cpp task.cpp gather.cpp wait_group.cpp wrappers.cpp left_race.cpp
      strand.cpp fork.cpp thread.cpp any_completion_handler.cpp detached.cpp monotonic_resource.cpp sbo_resource.cpp
      )
    #   composition.cpp)
target_link_libraries(${target} Boost::cobalt Boost::unit_test_framework)
set_target_properties(${target} PROPERTIES
    FOLDER "test"
)



# add_test(NAME boost_cobalt_main COMMAND boost_cobalt_main)
# add_test(NAME boost_cobalt_basic_tests COMMAND boost_cobalt_basic_tests)

# add_executable(boost_cobalt_experimental EXCLUDE_FROM_ALL test_main.cpp experimental/context.cpp experimental/yield_context.cpp)
# target_link_libraries(boost_cobalt_experimental  Boost::cobalt Boost::unit_test_framework Boost::context)
# add_test(NAME boost_cobalt_experimental COMMAND boost_cobalt_experimental)

# find_package(OpenSSL REQUIRED)

# add_executable(boost_cobalt_io_test EXCLUDE_FROM_ALL
#                test_main.cpp
#                io/buffer.cpp
#                io/ops.cpp
#                io/sleep.cpp
#                io/pipe.cpp
#                io/endpoint.cpp
#                io/lookup.cpp
#                )
# target_link_libraries(boost_cobalt_io_test  Boost::cobalt::io Boost::unit_test_framework OpenSSL::SSL OpenSSL::Crypto Boost::url)
# add_dependencies(tests boost_cobalt_main boost_cobalt_basic_tests boost_cobalt_static_tests boost_cobalt_experimental boost_cobalt_io_test)
