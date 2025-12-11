# https://cmake.org/cmake/help/latest/module/FindPython3.html
# Result Variables
set(result_vars
    Python3_FOUND
    Python3_Interpreter_FOUND
    Python3_EXECUTABLE
    Python3_EXECUTABLE_DEBUG
    Python3_INTERPRETER
    Python3_INTERPRETER_ID
    Python3_STDLIB
    Python3_STDARCH
    Python3_SITELIB
    Python3_SITEARCH
    Python3_SOABI
    Python3_SOSABI
    Python3_Compiler_FOUND
    Python3_COMPILER
    Python3_COMPILER_ID
    Python3_DOTNET_LAUNCHER
    Python3_Development_FOUND
    Python3_Development.Module_FOUND
    Python3_Development.SABIModule_FOUND
    Python3_Development.Embed_FOUND
    Python3_INCLUDE_DIRS
    Python3_DEFINITIONS
    Python3_DEBUG_POSTFIX
    Python3_LINK_OPTIONS
    Python3_LIBRARIES
    Python3_LIBRARY_DIRS
    Python3_RUNTIME_LIBRARY_DIRS
    Python3_SABI_LIBRARIES
    Python3_SABI_LIBRARY_DIRS
    Python3_RUNTIME_SABI_LIBRARY_DIRS
    Python3_VERSION
    Python3_VERSION_MAJOR
    Python3_VERSION_MINOR
    Python3_VERSION_PATCH
    Python3_PyPy_VERSION
    Python3_NumPy_FOUND
    Python3_NumPy_INCLUDE_DIRS
    Python3_NumPy_VERSION
)

macro(python3_printenv)
foreach(var ${result_vars})
if(DEFINED ${var})
    message(STATUS "${var}: ${${var}}")
else()
    message(STATUS "${var}: <NOT DEFINED>")
endif()
endforeach()
endmacro()
