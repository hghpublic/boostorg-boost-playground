cmake_minimum_required(VERSION 4.2)

project(performance
    VERSION 1.89.0
    HOMEPAGE_URL "https://github.com/boostorg/coroutine2"
    LANGUAGES CXX
)

find_package(Boost REQUIRED COMPONENTS coroutine2)
find_package(Boost REQUIRED COMPONENTS chrono)
find_package(Boost REQUIRED COMPONENTS program_options)

set(target performance)
add_executable(${target})
target_compile_features(${target} PRIVATE cxx_std_26)
target_sources(${target} PRIVATE performance.cpp)
target_link_libraries(${target} PRIVATE Boost::coroutine2)
target_link_libraries(${target} PRIVATE Boost::chrono)
target_link_libraries(${target} PRIVATE Boost::program_options)

if(CMAKE_SYSTEM_NAME STREQUAL "AIX")
target_sources(${target} PRIVATE bind_processor_aix.cpp)
elseif(CMAKE_SYSTEM_NAME STREQUAL "FreeBSD")
target_sources(${target} PRIVATE bind_processor_freebsd.cpp)
elseif(CMAKE_SYSTEM_NAME STREQUAL "Linux")
target_sources(${target} PRIVATE bind_processor_linux.cpp)
elseif(CMAKE_SYSTEM_NAME STREQUAL "SunOS")
target_sources(${target} PRIVATE bind_processor_solaris.cpp)
elseif(CMAKE_SYSTEM_NAME STREQUAL "Windows")
target_sources(${target} PRIVATE bind_processor_windows.cpp)
endif()

# add_subdirectory(segmented)
