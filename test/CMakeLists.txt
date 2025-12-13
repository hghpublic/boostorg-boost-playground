cmake_minimum_required(VERSION 4.2)

project(test
    VERSION 1.89.0
    HOMEPAGE_URL "https://github.com/boostorg/signals2"
    LANGUAGES CXX
)

find_package(Boost REQUIRED COMPONENTS
    signals2
    thread
    unit_test_framework
)
find_package(Threads REQUIRED)

# find_package(boost_included_unit_test_framework CONFIG REQUIRED)
# target_link_libraries(${target} PRIVATE Boost::included_unit_test_framework)

# find_package(boost_thread CONFIG REQUIRED)
# target_link_libraries(${target} PRIVATE Boost::thread)
set(targets
    connection_test
    dead_slot_test
    deadlock_regression_test
    deconstruct_test
    deletion_test
    # ordering_test
    regression_test
    shared_connection_block_test
    signal_n_test
    signal_test
    signal_type_test
    slot_compile_test
    trackable_test
    track_test
    mutex_test
    # threading_models_test
)

foreach(target ${targets})
add_executable(${target})
target_compile_features(${target} PRIVATE cxx_std_26)
target_sources(${target} PRIVATE
    ${target}.cpp
)
target_link_libraries(${target} PRIVATE
    Boost::signals2
    Boost::unit_test_framework
)
endforeach()

# foreach(target mutex_test; threading_models_test)    
foreach(target mutex_test)    
target_link_libraries(${target} PRIVATE
    Boost::thread
)
endforeach()
