cmake_minimum_required(VERSION 4.2)

project(test
    VERSION 1.89.0
    HOMEPAGE_URL "https://github.com/boostorg/interprocess"
    LANGUAGES CXX
)

find_package(Boost REQUIRED COMPONENTS
    interprocess
    date_time
    smart_ptr
    unit_test_framework
)

set(targets
    adaptive_node_pool_test
    adaptive_pool_test
    allocexcept_test
    anonymous_shared_memory_test
    boost_use_windows_h
    bufferstream_test
    cached_adaptive_pool_test
    cached_node_allocator_test
    condition_any_test
    condition_test
    data_test
    deque_test
    enable_shared_from_this_test
    file_lock_test
    # file_mapping_test
    flat_map_index_allocation_test
    flat_tree_test
    include_but_no_use_windows_h
    intermodule_singleton_test
    intrusive_ptr_test
    iset_index_allocation_test
    iunordered_set_index_allocation_test
    list_test
    managed_force_native_emulation_test
    managed_mapped_file_test
    managed_shared_memory_test
    managed_windows_shared_memory_test
    managed_xsi_shared_memory_test
    map_index_allocation_test
    mapped_file_test
    memory_algorithm_test
    message_queue_test
    mp_managed_shared_memory_test
    mutex_owner_dead_test
    mutex_test
    mutex_timeout_test
    named_condition_any_test
    named_condition_test
    named_construct_test
    named_mutex_test
    named_recursive_mutex_test
    named_semaphore_test
    named_sharable_mutex_test
    named_upgradable_mutex_test
    node_allocator_test
    node_pool_test
    null_index_test
    # offset_ptr_test
    private_adaptive_pool_test
    private_node_allocator_test
    recursive_mutex_test
    robust_emulation_test
    robust_recursive_emulation_test
    segment_manager_test
    segment_manager_v1_test
    semaphore_test
    sharable_mutex_test
    shared_memory_mapping_test
    shared_memory_test
    shared_ptr_test
    shm_named_condition_test
    shm_named_mutex_test
    shm_named_recursive_mutex_test
    shm_named_semaphore_test
    slist_test
    spin_condition_test
    spin_mutex_test
    spin_recursive_mutex_test
    spin_semaphore_test
    stable_vector_test
    string_test
    tree_test
    unique_ptr_test
    unordered_test
    upgradable_mutex_test
    user_buffer_test
    vector_test
    vectorstream_test
    winapi_condition_test
    winapi_mutex_test
    winapi_named_condition_test
    winapi_named_mutex_test
    winapi_named_recursive_mutex_test
    winapi_named_semaphore_test
    winapi_recursive_mutex_test
    winapi_semaphore_test
    windows_eventlog_shared_memory_test
    windows_shared_dir_func
    windows_shared_dir_path
    windows_shared_memory_mapping_test
    windows_shared_memory_test
    xsi_shared_memory_mapping_test
)

foreach(target ${targets})
add_executable(${target})
target_compile_features(${target} PRIVATE cxx_std_26)
target_sources(${target} PRIVATE
    ${target}.cpp
)
target_link_libraries(${target} PRIVATE
    Boost::interprocess
    Boost::date_time
    Boost::smart_ptr
    Boost::unit_test_framework
)    
endforeach()
