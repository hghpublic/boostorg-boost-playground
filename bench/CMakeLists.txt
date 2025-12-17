cmake_minimum_required(VERSION 4.2)

project(bench
    VERSION 1.89.0
    HOMEPAGE_URL "https://github.com/boostorg/cobalt"
    LANGUAGES CXX
)

find_package(Boost REQUIRED COMPONENTS
    cobalt
    # asio
    # beast
    # json
    # lockfree
    # signals2
)
find_package(Threads REQUIRED)
# find_package(Python COMPONENTS Interpreter Development REQUIRED)
# find_package(nanobind REQUIRED)
# nanobind_add_module(my_ext source.cpp)

set(targets
    channel
    immediate
    # monotonic
    parallel
    post
)

foreach(target ${targets})
set(locical_name bench_${target})
add_executable(${locical_name})
target_compile_features(${locical_name} PRIVATE cxx_std_26)
target_sources(${locical_name} PRIVATE
    ${target}.cpp
)
target_link_libraries(${locical_name} PRIVATE
    Boost::cobalt
    # Boost::beast
    # Boost::json
    # Boost::lockfree
    # Boost::signals2
    # Threads::Threads
)
set_target_properties(${locical_name} PROPERTIES
    FOLDER "bench"
)
endforeach()


# add_executable(boost_cobalt_post_bench post.cpp)
# target_link_libraries(boost_cobalt_post_bench PRIVATE Boost::cobalt Boost::system Threads::Threads)
# if (TARGET Boost::context)
#     target_link_libraries(boost_cobalt_post_bench PRIVATE Boost::context)
#     target_compile_definitions(boost_cobalt_post_bench PRIVATE BOOST_COBALT_BENCH_WITH_CONTEXT=1)
#     set_property(TARGET boost_cobalt_post_bench PROPERTY INTERPROCEDURAL_OPTIMIZATION ON)
# endif()

# add_executable(boost_cobalt_immediate_bench immediate.cpp)
# target_link_libraries(boost_cobalt_immediate_bench PRIVATE Boost::cobalt Boost::system Threads::Threads)
# if (TARGET Boost::context)
#     target_link_libraries(boost_cobalt_immediate_bench PRIVATE Boost::context)
#     target_compile_definitions(boost_cobalt_immediate_bench PRIVATE BOOST_COBALT_BENCH_WITH_CONTEXT=1)
#     set_property(TARGET boost_cobalt_immediate_bench PROPERTY INTERPROCEDURAL_OPTIMIZATION ON)
# endif()

# add_executable(boost_cobalt_channel_bench channel.cpp)
# target_link_libraries(boost_cobalt_channel_bench PRIVATE Boost::cobalt Boost::system Threads::Threads)
# if (TARGET Boost::context)
#     target_link_libraries(boost_cobalt_channel_bench PRIVATE Boost::context)
#     target_compile_definitions(boost_cobalt_channel_bench PRIVATE BOOST_COBALT_BENCH_WITH_CONTEXT=1)
#     set_property(TARGET boost_cobalt_channel_bench PROPERTY INTERPROCEDURAL_OPTIMIZATION ON)
# endif()

# add_executable(boost_cobalt_parallel_bench parallel.cpp)
# target_link_libraries(boost_cobalt_parallel_bench PRIVATE Boost::cobalt Boost::system Threads::Threads)
# if (TARGET Boost::context)
#     target_link_libraries(boost_cobalt_parallel_bench PRIVATE Boost::context)
#     target_compile_definitions(boost_cobalt_parallel_bench PRIVATE BOOST_COBALT_BENCH_WITH_CONTEXT=1)
#     set_property(TARGET boost_cobalt_parallel_bench PROPERTY INTERPROCEDURAL_OPTIMIZATION ON)
# endif()



# add_executable(boost_cobalt_monotonic_bench monotonic.cpp)
# target_link_libraries(boost_cobalt_monotonic_bench PRIVATE Boost::cobalt Boost::system Threads::Threads)
# if (TARGET Boost::context)
#     target_link_libraries(boost_cobalt_monotonic_bench PRIVATE Boost::context)
#     target_compile_definitions(boost_cobalt_monotonic_bench PRIVATE BOOST_COBALT_BENCH_WITH_CONTEXT=1)
#     set_property(TARGET boost_cobalt_monotonic_bench PROPERTY INTERPROCEDURAL_OPTIMIZATION ON)
# endif()
