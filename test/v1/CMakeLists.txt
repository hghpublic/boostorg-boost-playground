cmake_minimum_required(VERSION 4.2)

project(test-v1
    VERSION 1.89.0
    HOMEPAGE_URL "https://github.com/boostorg/process"
    LANGUAGES CXX
)

find_package(Boost REQUIRED COMPONENTS
    process
    filesystem
    iostreams
    lambda
    program_options
    scope_exit
    system
    thread
    unit_test_framework
)

set(targets
    args_cmd
    args_handling
    asio_no_deprecated
    async
    async_fut
    async_pipe
    # async_system_fail
    # async_system_future
    # async_system_stackful
    # async_system_stackful_error
    # async_system_stackful_except
    # async_system_stackless
    # bind_stderr
    # bind_stdin
    # bind_stdin_stdout
    # bind_stdout
    bind_stdout_stderr
    close_stderr
    close_stdin
    close_stdout
    cmd_test
    env
    environment
    error
    exit_argc
    exit_code
    extensions
    group
    # group_wait
    limit_fd
    #? multi_ref1
    #? multi_ref2
    no_ansi_apps
    on_exit
    on_exit2
    on_exit3
    pipe
    pipe_fwd
    posix_specific
    run_exe
    run_exe_path
    search_path
    shell
    shell_path
    sparring_partner
    spawn
    # spawn_fail
    start_dir
    sub_launcher
    system_test1
    system_test2
    terminate
    throw_on_error
    # vfork
    # wait
    # wait_for
    wargs_cmd
    # windows_specific
)


foreach(target ${targets})
set(logical_name test_v1_${target})
add_executable(${logical_name})
target_compile_definitions(${logical_name} PRIVATE BOOST_TEST_MODULE)
target_compile_features(${logical_name} PRIVATE cxx_std_26)
target_sources(${logical_name} PRIVATE
    ${target}.cpp
)
target_link_libraries(${logical_name} PRIVATE
    Boost::process
    Boost::filesystem
    Boost::iostreams
    Boost::lambda
    Boost::program_options
    Boost::scope_exit
    Boost::system
    Boost::thread
    Boost::unit_test_framework
)
set_target_properties(${logical_name} PROPERTIES
    FOLDER "test/v1"
)
endforeach()
