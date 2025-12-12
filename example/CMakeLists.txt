cmake_minimum_required(VERSION 4.2)

project(example
    VERSION 1.89.0
    HOMEPAGE_URL "https://github.com/boostorg/interprocess"
    LANGUAGES CXX
)

find_package(Boost REQUIRED COMPONENTS interprocess)

set(targets
    comp_doc_anonymous_conditionA
    comp_doc_anonymous_conditionB
    comp_doc_anonymous_mutexA
    comp_doc_anonymous_mutexB
    comp_doc_anonymous_semaphoreA
    comp_doc_anonymous_semaphoreB
    comp_doc_anonymous_upgradable_mutexA
    comp_doc_anonymous_upgradable_mutexB
    comp_doc_message_queueA
    comp_doc_message_queueB
    doc_adaptive_pool
    doc_allocator
    doc_anonymous_shared_memory
    doc_bufferstream
    doc_cached_adaptive_pool
    doc_cached_node_allocator
    doc_complex_map
    # doc_complex_map_uses_allocator
    doc_cont
    doc_file_mapping
    doc_intrusive
    doc_ipc_message
    doc_managed_aligned_allocation
    doc_managed_allocation_command
    doc_managed_construction_info
    doc_managed_copy_on_write
    doc_managed_external_buffer
    doc_managed_grow
    doc_managed_heap_memory
    doc_managed_mapped_file
    doc_managed_multiple_allocation
    doc_managed_raw_allocation
    doc_map
    # doc_multi_index
    doc_named_alloc
    doc_named_mutex
    doc_node_allocator
    doc_offset_ptr
    doc_private_adaptive_pool
    doc_private_node_allocator
    doc_scoped_ptr
    doc_shared_memory
    doc_shared_ptr
    doc_shared_ptr_explicit
    doc_spawn_vector
    doc_unique_ptr
    doc_unordered_map
    doc_vectorstream
    doc_where_allocate
    doc_windows_shared_memory
    doc_xsi_shared_memory
)

foreach(target ${targets})
add_executable(${target})
target_compile_features(${target} PRIVATE cxx_std_26)
target_sources(${target} PRIVATE
    ${target}.cpp
)
target_link_libraries(${target} PRIVATE Boost::interprocess)    
endforeach()
