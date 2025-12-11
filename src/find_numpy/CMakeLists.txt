cmake_minimum_required(VERSION 4.2)

project(find_numpy LANGUAGES CXX)

# find_package(Python3 COMPONENTS Development Development.Module Interpreter REQUIRED)

find_package(Python3 COMPONENTS NumPy)
message(STATUS "Python_NumPy_FOUND: ${Python_NumPy_FOUND}")
message(STATUS "Python_NumPy_INCLUDE_DIRS: ${Python_NumPy_INCLUDE_DIRS}")
message(STATUS "Python_NumPy_VERSION: ${Python_NumPy_VERSION}")

python3_printenv()

set(target find_numpy)
add_executable(${target} main.cpp)
target_compile_features(${target} PRIVATE cxx_std_26)
# target_link_libraries(${target} PRIVATE Boost::python)
# target_link_libraries(${target} PRIVATE Python3::Python)
