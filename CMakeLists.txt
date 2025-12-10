cmake_minimum_required(VERSION 4.2)

project(accumulators
    VERSION 1.89.0
    HOMEPAGE_URL "https://github.com/boostorg/accumulators"
    DESCRIPTION "Boost.Accumulators is both a library for incremental \
        statistical computation as well as an extensible framework for \
        incremental calculation in general."
    LANGUAGES CXX
)

add_subdirectory(example)
add_subdirectory(test)
