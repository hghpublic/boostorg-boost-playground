cmake_minimum_required(VERSION 4.2)

project(test
    VERSION 1.89.0
    HOMEPAGE_URL "https://github.com/boostorg/serialization"
    LANGUAGES CXX
)

find_package(Boost REQUIRED COMPONENTS
    serialization
    filesystem
    math
    unit_test_framework
)

# library A

set(target A)
add_library(${target} SHARED)
target_compile_features(${target} PRIVATE cxx_std_26)
target_include_directories(${target} INTERFACE ${CMAKE_CURRENT_LIST_DIR})
target_sources(${target} PRIVATE
    A.cpp
    A.ipp
)
target_link_libraries(${target} PRIVATE
    Boost::serialization
)
set_target_properties(${target} PROPERTIES
    FOLDER "test"
)


set(targets
    # A
    # config_test
    # dll_a
    # dll_base
    # dll_derived2
    # dll_polymorphic_base
    # dll_polymorphic_derived2
    # multi_shared1
    # multi_shared2
    # polymorphic_base
    # polymorphic_derived1
    # polymorphic_derived2
    # test__helper
    test_array
    # test_binary
    # test_bitset
    # test_boost_array
    # test_check
    # test_class_info_load
    # test_class_info_save
    # test_codecvt_null
    # test_complex
    # test_const_load_fail1
    # test_const_load_fail1_nvp
    # test_const_load_fail2
    # test_const_load_fail2_nvp
    # test_const_load_fail3
    # test_const_load_fail3_nvp
    # test_const_pass
    # test_const_save_warn1
    # test_const_save_warn1_nvp
    # test_const_save_warn2
    # test_const_save_warn2_nvp
    # test_const_save_warn3
    # test_const_save_warn3_nvp
    # test_const_save_warn4
    # test_const_save_warn4_nvp
    # test_contained_class
    # test_cyclic_ptrs
    # test_delete_pointer
    # test_deque
    # test_derived
    # test_derived_class
    # test_derived_class_ptr
    # test_diamond
    # test_diamond_complex
    # test_dll_exported
    # test_dll_plugin
    # test_dll_simple
    # test_enable_shared_from_this
    # test_exported
    # test_forward_list
    # test_forward_list_ptrs
    # test_helper_support
    # test_inclusion
    # test_inclusion2
    # test_interators
    # test_interrupts
    # test_iterators
    # test_iterators_base64
    # test_list
    # test_list_ptrs
    # test_map
    # test_map_hashed
    # test_mi
    # test_mult_archive_types
    # test_multi_shared_lib
    # test_multiple_inheritance
    # test_multiple_ptrs
    # test_native_array
    # test_new_operator
    # test_no_rtti
    # test_non_default_ctor
    # test_non_default_ctor2
    # test_non_intrusive
    # test_not_serializable
    # test_null_ptr
    # test_nvp
    # test_object
    # test_optional
    # test_p_helper
    # test_pimpl
    # test_polymorphic
    # test_polymorphic2
    # test_polymorphic2imp
    # test_polymorphic_A
    # test_primitive
    # test_priority_queue
    # test_private_base
    # test_private_base2
    # test_private_ctor
    # test_queue
    # test_recursion
    # test_registered
    # test_reset_object_address
    # test_set
    # test_set_hashed
    # test_shared_ptr
    # test_shared_ptr_132
    # test_shared_ptr_multi_base
    # test_simple_class
    # test_simple_class_ptr
    # test_singleton
    # test_singleton_inherited
    # test_singleton_plain
    # test_slist
    # test_slist_ptrs
    # test_smart_cast
    # test_split
    # test_stack
    # test_static_warning
    # test_strong_typedef
    # test_tracking
    # test_traits_fail
    # test_traits_pass
    # test_unique_ptr
    # test_unregistered
    # test_valarray
    # test_variant
    # test_vector
    # test_void_cast
    # test_z
)

foreach(target ${targets})
add_executable(${target})
target_compile_features(${target} PRIVATE cxx_std_26)
target_sources(${target} PRIVATE
    ${target}.cpp
)
target_link_libraries(${target} PRIVATE
    Boost::serialization
    Boost::filesystem
    Boost::math
    Boost::unit_test_framework
)
set_target_properties(${target} PROPERTIES
    FOLDER "test"
)
endforeach()


target_sources(test_array PRIVATE A.cpp)
# targets depending on A.cpp

# set(targets_dep_A
#     test_array
# )
# foreach(target ${targets_dep_test_A})
# target_link_libraries(${target} PRIVATE A)
# endforeach()

