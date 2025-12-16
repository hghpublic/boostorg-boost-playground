cmake_minimum_required(VERSION 4.2)

project(doc LANGUAGES CXX)

find_package(Boost REQUIRED COMPONENTS
    lambda2
)

set(targets
    lambda2
)

foreach(target ${targets})
add_executable(${target})
target_compile_features(${target} PRIVATE cxx_std_26)
target_sources(${target} PRIVATE
    ${target}.cpp
)
target_link_libraries(${target} PRIVATE
    Boost::lambda2
)
set_target_properties(${target} PROPERTIES
    FOLDER "doc"
)
endforeach()
