
set(target performance_switch)
add_executable(${target})
target_compile_features(${target} PRIVATE cxx_std_26)
target_sources(${target} PRIVATE
    performance_switch.cpp
    performance_create_segmented.cpp
)
target_link_libraries(${target} PRIVATE Boost::coroutine2)
target_link_libraries(${target} PRIVATE Boost::chrono)
target_link_libraries(${target} PRIVATE Boost::program_options)
