cmake_minimum_required(VERSION 4.2)

project(boost_python VERSION "${BOOST_SUPERPROJECT_VERSION}" LANGUAGES CXX)

option(BUILD_TESTING "Build the tests." OFF)

# find_package(Python REQUIRED COMPONENTS Development OPTIONAL_COMPONENTS NumPy)

# find_package(Python3 COMPONENTS Development REQUIRED)
# target_link_libraries(${target} PRIVATE Python3::Python)



# find_package(Boost REQUIRED COMPONENTS python)
# target_link_libraries(${target} PRIVATE Boost::python)

include(dev/cmake/python3_printenv.cmake)
add_subdirectory(example)

# Testing

if(BUILD_TESTING)
add_subdirectory(test)
endif()


add_subdirectory(src/find_numpy)
