; ModuleID = 'tests/simple_test_for_mir.cpp'
source_filename = "tests/simple_test_for_mir.cpp"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-macosx15.0.0"

%"struct.sc_core::sc_api_version_3_0_1_cxx201703L" = type { i8 }
%"class.std::__1::basic_ostream" = type { ptr, %"class.std::__1::basic_ios.base" }
%"class.std::__1::basic_ios.base" = type <{ %"class.std::__1::ios_base", ptr, %"struct.std::__1::_SentinelValueFill" }>
%"class.std::__1::ios_base" = type { ptr, i32, i64, i64, i32, i32, ptr, ptr, ptr, ptr, i64, i64, ptr, i64, i64, ptr, i64, i64 }
%"struct.std::__1::_SentinelValueFill" = type { i32 }
%"class.std::__1::locale::id" = type <{ %"struct.std::__1::once_flag", i32, [4 x i8] }>
%"struct.std::__1::once_flag" = type { i64 }
%"class.sc_core::sc_clock" = type { %"class.sc_core::sc_signal", %"class.sc_core::sc_time", double, %"class.sc_core::sc_time", i8, %"class.sc_core::sc_time", %"class.sc_core::sc_time", %"class.sc_core::sc_event", %"class.sc_core::sc_event" }
%"class.sc_core::sc_signal" = type { %"class.sc_core::sc_signal_t.base", ptr, ptr, ptr }
%"class.sc_core::sc_signal_t.base" = type <{ %"class.sc_core::sc_signal_inout_if", %"class.sc_core::sc_signal_channel", %"struct.sc_core::sc_writer_policy_check", i8, i8 }>
%"class.sc_core::sc_signal_inout_if" = type { %"class.sc_core::sc_signal_in_if", %"class.sc_core::sc_signal_write_if" }
%"class.sc_core::sc_signal_in_if" = type { %"class.sc_core::sc_interface" }
%"class.sc_core::sc_interface" = type { ptr }
%"class.sc_core::sc_signal_write_if" = type { %"class.sc_core::sc_interface" }
%"class.sc_core::sc_signal_channel" = type { %"class.sc_core::sc_prim_channel", ptr, i64 }
%"class.sc_core::sc_prim_channel" = type { %"class.sc_core::sc_object", ptr, ptr }
%"class.sc_core::sc_object" = type { ptr, ptr, %"class.std::__1::basic_string", ptr, ptr }
%"class.std::__1::basic_string" = type { %"union.std::__1::basic_string<char>::__rep" }
%"union.std::__1::basic_string<char>::__rep" = type { %"struct.std::__1::basic_string<char>::__long" }
%"struct.std::__1::basic_string<char>::__long" = type { ptr, i64, i64 }
%"struct.sc_core::sc_writer_policy_check" = type { %"struct.sc_core::sc_writer_policy_check_port", %"struct.sc_core::sc_writer_policy_check_write" }
%"struct.sc_core::sc_writer_policy_check_port" = type { ptr }
%"struct.sc_core::sc_writer_policy_check_write" = type { i8, %"class.sc_core::sc_process_handle" }
%"class.sc_core::sc_process_handle" = type { ptr }
%"class.sc_core::sc_time" = type { i64 }
%"class.sc_core::sc_event" = type { ptr, i64, i32, i32, ptr, %"class.std::__1::vector", %"class.std::__1::vector", %"class.std::__1::vector.0", %"class.std::__1::vector.0", %"class.std::__1::basic_string", %"class.sc_core::sc_ptr_flag" }
%"class.std::__1::vector" = type { ptr, ptr, ptr }
%"class.std::__1::vector.0" = type { ptr, ptr, ptr }
%"class.sc_core::sc_ptr_flag" = type { i64 }
%"class.sc_core::sc_signal.1" = type { %"class.sc_core::sc_signal_t.2" }
%"class.sc_core::sc_signal_t.2" = type { %"class.sc_core::sc_signal_inout_if.3", %"class.sc_core::sc_signal_channel", %"struct.sc_core::sc_writer_policy_check", i32, i32 }
%"class.sc_core::sc_signal_inout_if.3" = type { %"class.sc_core::sc_signal_in_if.4", %"class.sc_core::sc_signal_write_if.5" }
%"class.sc_core::sc_signal_in_if.4" = type { %"class.sc_core::sc_interface" }
%"class.sc_core::sc_signal_write_if.5" = type { %"class.sc_core::sc_interface" }
%struct.simple_counter = type <{ %"class.sc_core::sc_module", %"class.sc_core::sc_in", %"class.sc_core::sc_in", %"class.sc_core::sc_out", i32, [4 x i8] }>
%"class.sc_core::sc_module" = type { %"class.sc_core::sc_object_host", %"class.sc_core::sc_process_host", %"class.sc_core::sc_sensitive", %"class.sc_core::sc_sensitive_pos", %"class.sc_core::sc_sensitive_neg", i8, ptr, i32, ptr, ptr }
%"class.sc_core::sc_object_host" = type { %"class.sc_core::sc_object", %"class.std::__1::vector.6", %"class.std::__1::vector.7", ptr }
%"class.std::__1::vector.6" = type { ptr, ptr, ptr }
%"class.std::__1::vector.7" = type { ptr, ptr, ptr }
%"class.sc_core::sc_process_host" = type { ptr }
%"class.sc_core::sc_sensitive" = type { ptr, i32, ptr }
%"class.sc_core::sc_sensitive_pos" = type { ptr, i32, ptr }
%"class.sc_core::sc_sensitive_neg" = type { ptr, i32, ptr }
%"class.sc_core::sc_in" = type { %"class.sc_core::sc_port", ptr, ptr, ptr, ptr }
%"class.sc_core::sc_port" = type { %"class.sc_core::sc_port_b" }
%"class.sc_core::sc_port_b" = type { %"class.sc_core::sc_port_base", ptr, %"class.std::__1::vector.8" }
%"class.sc_core::sc_port_base" = type { %"class.sc_core::sc_object", ptr }
%"class.std::__1::vector.8" = type { ptr, ptr, ptr }
%"class.sc_core::sc_out" = type { %"class.sc_core::sc_inout" }
%"class.sc_core::sc_inout" = type { %"class.sc_core::sc_port.9", ptr, ptr, ptr }
%"class.sc_core::sc_port.9" = type { %"class.sc_core::sc_port_b.10" }
%"class.sc_core::sc_port_b.10" = type { %"class.sc_core::sc_port_base", ptr, %"class.std::__1::vector.11" }
%"class.std::__1::vector.11" = type { ptr, ptr, ptr }
%"class.sc_core::sc_module_name" = type { ptr, ptr, ptr, ptr, i8, %"class.std::__1::vector.12" }
%"class.std::__1::vector.12" = type { ptr, ptr, ptr }
%"class.sc_core::sc_hierarchy_scope" = type { ptr, ptr }
%"class.std::__1::type_index" = type { ptr }
%"struct.sc_core::sc_trace_params" = type { ptr, %"class.std::__1::basic_string" }
%"class.std::__1::vector<sc_core::sc_signal_inout_if<int> *>::__destroy_vector" = type { ptr }
%"class.std::__1::vector.14" = type { ptr, ptr, ptr }
%"class.std::__1::vector<sc_core::sc_trace_params *>::__destroy_vector" = type { ptr }
%"struct.std::__1::vector<sc_core::sc_signal_inout_if<int> *>::_ConstructTransaction" = type { ptr, ptr, ptr }
%"struct.std::__1::__split_buffer" = type { ptr, ptr, ptr, ptr, ptr }
%"struct.std::__1::__less" = type { i8 }
%"struct.std::__1::__allocation_result" = type { ptr, i64 }
%"struct.std::__1::integral_constant" = type { i8 }
%"class.std::__1::basic_ostream<char>::sentry" = type { i8, ptr }
%"class.std::__1::ostreambuf_iterator" = type { ptr }
%"class.std::__1::basic_ios" = type <{ %"class.std::__1::ios_base", ptr, %"struct.std::__1::_SentinelValueFill", [4 x i8] }>
%"struct.std::__1::basic_string<char>::__short" = type { [23 x i8], i8 }
%"class.std::__1::locale" = type { ptr }
%"class.sc_core::sc_event_finder" = type { ptr, ptr }
%"class.sc_core::sc_event_finder_t" = type { %"class.sc_core::sc_event_finder", { i64, i64 } }
%"class.sc_core::sc_signal_t" = type <{ %"class.sc_core::sc_signal_inout_if", %"class.sc_core::sc_signal_channel", %"struct.sc_core::sc_writer_policy_check", i8, i8, [6 x i8] }>
%"class.std::type_info" = type { ptr, i64 }
%"class.sc_core::sc_process_b" = type <{ %"class.sc_core::sc_object_host", ptr, i32, i32, i32, i32, i8, [3 x i8], i32, ptr, i32, [4 x i8], ptr, ptr, i8, i8, i8, i8, [4 x i8], ptr, i32, i32, %"class.std::__1::vector.25", ptr, ptr, ptr, ptr, { i64, i64 }, i32, [4 x i8], %"class.std::__1::vector.26", i8, [7 x i8], ptr, ptr, i32, i8, [3 x i8], ptr, i32, i8, i8, i8, i8 }>
%"class.std::__1::vector.25" = type { ptr, ptr, ptr }
%"class.std::__1::vector.26" = type { ptr, ptr, ptr }
%"class.sc_core::sc_simcontext" = type { ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, %"struct.sc_core::sc_curr_proc_info", ptr, i32, i32, %"class.std::__1::vector.0", %"class.std::__1::vector.6", %"class.std::__1::vector.7", %"class.std::__1::vector.6", ptr, ptr, %"class.std::__1::vector.24", i8, ptr, ptr, ptr, %"class.sc_core::sc_time", %"class.sc_core::sc_time", ptr, i64, i64, i64, i8, i8, i8, i8, i32, ptr, i8, i8, i32, %"class.sc_core::sc_host_mutex", i32, i8, ptr, ptr, ptr, i32, i32 }
%"struct.sc_core::sc_curr_proc_info" = type <{ ptr, i32, [4 x i8] }>
%"class.std::__1::vector.24" = type { ptr, ptr, ptr }
%"class.sc_core::sc_host_mutex" = type { %"class.sc_core::sc_mutex_if", %"class.std::__1::mutex" }
%"class.sc_core::sc_mutex_if" = type { %"class.sc_core::sc_interface" }
%"class.std::__1::mutex" = type { %struct._opaque_pthread_mutex_t }
%struct._opaque_pthread_mutex_t = type { i64, [56 x i8] }
%"class.sc_core::sc_prim_channel_registry" = type { ptr, i32, %"class.std::__1::vector.27", ptr, ptr, ptr }
%"class.std::__1::vector.27" = type { ptr, ptr, ptr }

@_ZN7sc_coreL17api_version_checkE = internal global %"struct.sc_core::sc_api_version_3_0_1_cxx201703L" zeroinitializer, align 1
@.str = private unnamed_addr constant [4 x i8] c"clk\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"counter\00", align 1
@_ZTV14simple_counter = linkonce_odr unnamed_addr constant { [19 x ptr], [4 x ptr] } { [19 x ptr] [ptr null, ptr @_ZTI14simple_counter, ptr @_ZNK7sc_core9sc_object5printERNSt3__113basic_ostreamIcNS1_11char_traitsIcEEEE, ptr @_ZNK7sc_core9sc_object4dumpERNSt3__113basic_ostreamIcNS1_11char_traitsIcEEEE, ptr @_ZNK7sc_core9sc_object5traceEPNS_13sc_trace_fileE, ptr @_ZNK7sc_core9sc_module4kindEv, ptr @_ZNK7sc_core14sc_object_host16get_child_eventsEv, ptr @_ZNK7sc_core14sc_object_host17get_child_objectsEv, ptr @_ZN14simple_counterD1Ev, ptr @_ZN14simple_counterD0Ev, ptr @_ZN7sc_core14sc_object_host19get_hierarchy_scopeEv, ptr @_ZN7sc_core14sc_object_host15add_child_eventEPNS_8sc_eventE, ptr @_ZN7sc_core14sc_object_host16add_child_objectEPNS_9sc_objectE, ptr @_ZN7sc_core14sc_object_host18remove_child_eventEPNS_8sc_eventE, ptr @_ZN7sc_core14sc_object_host19remove_child_objectEPNS_9sc_objectE, ptr @_ZN7sc_core9sc_module25before_end_of_elaborationEv, ptr @_ZN7sc_core9sc_module18end_of_elaborationEv, ptr @_ZN7sc_core9sc_module19start_of_simulationEv, ptr @_ZN7sc_core9sc_module17end_of_simulationEv], [4 x ptr] [ptr inttoptr (i64 -112 to ptr), ptr @_ZTI14simple_counter, ptr @_ZThn112_N14simple_counterD1Ev, ptr @_ZThn112_N14simple_counterD0Ev] }, align 8
@.str.2 = private unnamed_addr constant [14 x i8] c"count_process\00", align 1
@_ZTI14simple_counter = linkonce_odr hidden constant { ptr, ptr, ptr } { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr inttoptr (i64 add (i64 ptrtoint (ptr @_ZTS14simple_counter to i64), i64 -9223372036854775808) to ptr), ptr @_ZTIN7sc_core9sc_moduleE }, align 8
@_ZTVN10__cxxabiv120__si_class_type_infoE = external global [0 x ptr]
@_ZTS14simple_counter = linkonce_odr hidden constant [17 x i8] c"14simple_counter\00", align 1
@_ZTIN7sc_core9sc_moduleE = external constant ptr
@_ZTVN7sc_core5sc_inIbEE = external unnamed_addr constant { [29 x ptr] }, align 8
@_ZTVN7sc_core6sc_outIiEE = linkonce_odr unnamed_addr constant { [26 x ptr] } { [26 x ptr] [ptr null, ptr @_ZTIN7sc_core6sc_outIiEE, ptr @_ZNK7sc_core9sc_object5printERNSt3__113basic_ostreamIcNS1_11char_traitsIcEEEE, ptr @_ZNK7sc_core9sc_object4dumpERNSt3__113basic_ostreamIcNS1_11char_traitsIcEEEE, ptr @_ZNK7sc_core9sc_object5traceEPNS_13sc_trace_fileE, ptr @_ZNK7sc_core6sc_outIiE4kindEv, ptr @_ZNK7sc_core9sc_object16get_child_eventsEv, ptr @_ZNK7sc_core9sc_object17get_child_objectsEv, ptr @_ZN7sc_core6sc_outIiED1Ev, ptr @_ZN7sc_core6sc_outIiED0Ev, ptr @_ZN7sc_core9sc_object19get_hierarchy_scopeEv, ptr @_ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE13get_interfaceEv, ptr @_ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE13get_interfaceEv, ptr @_ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE18get_interface_typeEv, ptr @_ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE5vbindERNS_12sc_interfaceE, ptr @_ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE5vbindERNS_12sc_port_baseE, ptr @_ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE13add_interfaceEPNS_12sc_interfaceE, ptr @_ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE15interface_countEv, ptr @_ZN7sc_core12sc_port_base25before_end_of_elaborationEv, ptr @_ZN7sc_core8sc_inoutIiE18end_of_elaborationEv, ptr @_ZN7sc_core12sc_port_base19start_of_simulationEv, ptr @_ZN7sc_core12sc_port_base17end_of_simulationEv, ptr @_ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE14make_sensitiveEPNS_17sc_thread_processEPNS_15sc_event_finderE, ptr @_ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE14make_sensitiveEPNS_17sc_method_processEPNS_15sc_event_finderE, ptr @_ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE4bindERS2_, ptr @_ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE4bindERS3_] }, align 8
@_ZTIN7sc_core6sc_outIiEE = linkonce_odr hidden constant { ptr, ptr, ptr } { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr inttoptr (i64 add (i64 ptrtoint (ptr @_ZTSN7sc_core6sc_outIiEE to i64), i64 -9223372036854775808) to ptr), ptr @_ZTIN7sc_core8sc_inoutIiEE }, align 8
@_ZTSN7sc_core6sc_outIiEE = linkonce_odr hidden constant [21 x i8] c"N7sc_core6sc_outIiEE\00", align 1
@_ZTIN7sc_core8sc_inoutIiEE = linkonce_odr hidden constant { ptr, ptr, ptr } { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr inttoptr (i64 add (i64 ptrtoint (ptr @_ZTSN7sc_core8sc_inoutIiEE to i64), i64 -9223372036854775808) to ptr), ptr @_ZTIN7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EEE }, align 8
@_ZTSN7sc_core8sc_inoutIiEE = linkonce_odr hidden constant [23 x i8] c"N7sc_core8sc_inoutIiEE\00", align 1
@_ZTIN7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EEE = linkonce_odr hidden constant { ptr, ptr, ptr } { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr inttoptr (i64 add (i64 ptrtoint (ptr @_ZTSN7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EEE to i64), i64 -9223372036854775808) to ptr), ptr @_ZTIN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEEE }, align 8
@_ZTSN7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EEE = linkonce_odr hidden constant [75 x i8] c"N7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EEE\00", align 1
@_ZTIN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEEE = linkonce_odr hidden constant { ptr, ptr, ptr } { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr inttoptr (i64 add (i64 ptrtoint (ptr @_ZTSN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEEE to i64), i64 -9223372036854775808) to ptr), ptr @_ZTIN7sc_core12sc_port_baseE }, align 8
@_ZTSN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEEE = linkonce_odr hidden constant [50 x i8] c"N7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEEE\00", align 1
@_ZTIN7sc_core12sc_port_baseE = external constant ptr
@_ZTVN7sc_core8sc_inoutIiEE = linkonce_odr unnamed_addr constant { [26 x ptr] } { [26 x ptr] [ptr null, ptr @_ZTIN7sc_core8sc_inoutIiEE, ptr @_ZNK7sc_core9sc_object5printERNSt3__113basic_ostreamIcNS1_11char_traitsIcEEEE, ptr @_ZNK7sc_core9sc_object4dumpERNSt3__113basic_ostreamIcNS1_11char_traitsIcEEEE, ptr @_ZNK7sc_core9sc_object5traceEPNS_13sc_trace_fileE, ptr @_ZNK7sc_core8sc_inoutIiE4kindEv, ptr @_ZNK7sc_core9sc_object16get_child_eventsEv, ptr @_ZNK7sc_core9sc_object17get_child_objectsEv, ptr @_ZN7sc_core8sc_inoutIiED1Ev, ptr @_ZN7sc_core8sc_inoutIiED0Ev, ptr @_ZN7sc_core9sc_object19get_hierarchy_scopeEv, ptr @_ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE13get_interfaceEv, ptr @_ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE13get_interfaceEv, ptr @_ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE18get_interface_typeEv, ptr @_ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE5vbindERNS_12sc_interfaceE, ptr @_ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE5vbindERNS_12sc_port_baseE, ptr @_ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE13add_interfaceEPNS_12sc_interfaceE, ptr @_ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE15interface_countEv, ptr @_ZN7sc_core12sc_port_base25before_end_of_elaborationEv, ptr @_ZN7sc_core8sc_inoutIiE18end_of_elaborationEv, ptr @_ZN7sc_core12sc_port_base19start_of_simulationEv, ptr @_ZN7sc_core12sc_port_base17end_of_simulationEv, ptr @_ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE14make_sensitiveEPNS_17sc_thread_processEPNS_15sc_event_finderE, ptr @_ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE14make_sensitiveEPNS_17sc_method_processEPNS_15sc_event_finderE, ptr @_ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE4bindERS2_, ptr @_ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE4bindERS3_] }, align 8
@_ZTVN7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EEE = linkonce_odr unnamed_addr constant { [26 x ptr] } { [26 x ptr] [ptr null, ptr @_ZTIN7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EEE, ptr @_ZNK7sc_core9sc_object5printERNSt3__113basic_ostreamIcNS1_11char_traitsIcEEEE, ptr @_ZNK7sc_core9sc_object4dumpERNSt3__113basic_ostreamIcNS1_11char_traitsIcEEEE, ptr @_ZNK7sc_core9sc_object5traceEPNS_13sc_trace_fileE, ptr @_ZNK7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EE4kindEv, ptr @_ZNK7sc_core9sc_object16get_child_eventsEv, ptr @_ZNK7sc_core9sc_object17get_child_objectsEv, ptr @_ZN7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EED1Ev, ptr @_ZN7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EED0Ev, ptr @_ZN7sc_core9sc_object19get_hierarchy_scopeEv, ptr @_ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE13get_interfaceEv, ptr @_ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE13get_interfaceEv, ptr @_ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE18get_interface_typeEv, ptr @_ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE5vbindERNS_12sc_interfaceE, ptr @_ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE5vbindERNS_12sc_port_baseE, ptr @_ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE13add_interfaceEPNS_12sc_interfaceE, ptr @_ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE15interface_countEv, ptr @_ZN7sc_core12sc_port_base25before_end_of_elaborationEv, ptr @_ZN7sc_core12sc_port_base18end_of_elaborationEv, ptr @_ZN7sc_core12sc_port_base19start_of_simulationEv, ptr @_ZN7sc_core12sc_port_base17end_of_simulationEv, ptr @_ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE14make_sensitiveEPNS_17sc_thread_processEPNS_15sc_event_finderE, ptr @_ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE14make_sensitiveEPNS_17sc_method_processEPNS_15sc_event_finderE, ptr @_ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE4bindERS2_, ptr @_ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE4bindERS3_] }, align 8
@_ZTVN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEEE = linkonce_odr unnamed_addr constant { [26 x ptr] } { [26 x ptr] [ptr null, ptr @_ZTIN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEEE, ptr @_ZNK7sc_core9sc_object5printERNSt3__113basic_ostreamIcNS1_11char_traitsIcEEEE, ptr @_ZNK7sc_core9sc_object4dumpERNSt3__113basic_ostreamIcNS1_11char_traitsIcEEEE, ptr @_ZNK7sc_core9sc_object5traceEPNS_13sc_trace_fileE, ptr @_ZNK7sc_core12sc_port_base4kindEv, ptr @_ZNK7sc_core9sc_object16get_child_eventsEv, ptr @_ZNK7sc_core9sc_object17get_child_objectsEv, ptr @_ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEED1Ev, ptr @_ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEED0Ev, ptr @_ZN7sc_core9sc_object19get_hierarchy_scopeEv, ptr @_ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE13get_interfaceEv, ptr @_ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE13get_interfaceEv, ptr @_ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE18get_interface_typeEv, ptr @_ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE5vbindERNS_12sc_interfaceE, ptr @_ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE5vbindERNS_12sc_port_baseE, ptr @_ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE13add_interfaceEPNS_12sc_interfaceE, ptr @_ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE15interface_countEv, ptr @_ZN7sc_core12sc_port_base25before_end_of_elaborationEv, ptr @_ZN7sc_core12sc_port_base18end_of_elaborationEv, ptr @_ZN7sc_core12sc_port_base19start_of_simulationEv, ptr @_ZN7sc_core12sc_port_base17end_of_simulationEv, ptr @_ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE14make_sensitiveEPNS_17sc_thread_processEPNS_15sc_event_finderE, ptr @_ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE14make_sensitiveEPNS_17sc_method_processEPNS_15sc_event_finderE, ptr @_ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE4bindERS2_, ptr @_ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE4bindERS3_] }, align 8
@.str.3 = private unnamed_addr constant [13 x i8] c"sc_port_base\00", align 1
@.str.4 = private unnamed_addr constant [8 x i8] c"sc_port\00", align 1
@.str.5 = private unnamed_addr constant [9 x i8] c"sc_inout\00", align 1
@.str.6 = private unnamed_addr constant [7 x i8] c"sc_out\00", align 1
@_ZTIN7sc_core18sc_signal_inout_ifIiEE = linkonce_odr hidden constant { ptr, ptr, i32, i32, ptr, i64, ptr, i64 } { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv121__vmi_class_type_infoE, i64 2), ptr inttoptr (i64 add (i64 ptrtoint (ptr @_ZTSN7sc_core18sc_signal_inout_ifIiEE to i64), i64 -9223372036854775808) to ptr), i32 2, i32 2, ptr @_ZTIN7sc_core15sc_signal_in_ifIiEE, i64 2, ptr @_ZTIN7sc_core18sc_signal_write_ifIiEE, i64 2050 }, align 8
@_ZTVN10__cxxabiv121__vmi_class_type_infoE = external global [0 x ptr]
@_ZTSN7sc_core18sc_signal_inout_ifIiEE = linkonce_odr hidden constant [34 x i8] c"N7sc_core18sc_signal_inout_ifIiEE\00", align 1
@_ZTIN7sc_core15sc_signal_in_ifIiEE = linkonce_odr hidden constant { ptr, ptr, i32, i32, ptr, i64 } { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv121__vmi_class_type_infoE, i64 2), ptr inttoptr (i64 add (i64 ptrtoint (ptr @_ZTSN7sc_core15sc_signal_in_ifIiEE to i64), i64 -9223372036854775808) to ptr), i32 0, i32 1, ptr @_ZTIN7sc_core12sc_interfaceE, i64 -12285 }, align 8
@_ZTSN7sc_core15sc_signal_in_ifIiEE = linkonce_odr hidden constant [31 x i8] c"N7sc_core15sc_signal_in_ifIiEE\00", align 1
@_ZTIN7sc_core12sc_interfaceE = external constant ptr
@_ZTIN7sc_core18sc_signal_write_ifIiEE = linkonce_odr hidden constant { ptr, ptr, i32, i32, ptr, i64 } { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv121__vmi_class_type_infoE, i64 2), ptr inttoptr (i64 add (i64 ptrtoint (ptr @_ZTSN7sc_core18sc_signal_write_ifIiEE to i64), i64 -9223372036854775808) to ptr), i32 0, i32 1, ptr @_ZTIN7sc_core12sc_interfaceE, i64 -12285 }, align 8
@_ZTSN7sc_core18sc_signal_write_ifIiEE = linkonce_odr hidden constant [34 x i8] c"N7sc_core18sc_signal_write_ifIiEE\00", align 1
@.str.7 = private unnamed_addr constant [11 x i8] c"iface != 0\00", align 1
@.str.8 = private unnamed_addr constant [63 x i8] c"/opt/homebrew/opt/systemc/include/sysc/communication/sc_port.h\00", align 1
@_ZN7sc_core22SC_ID_BIND_IF_TO_PORT_E = external constant [0 x i8], align 1
@.str.9 = private unnamed_addr constant [32 x i8] c"interface already bound to port\00", align 1
@.str.10 = private unnamed_addr constant [7 x i8] c"vector\00", align 1
@_ZTISt12length_error = external constant ptr
@_ZTVSt12length_error = external unnamed_addr constant { [5 x ptr] }, align 8
@_ZTISt20bad_array_new_length = external constant ptr
@_ZN7sc_core13SC_ID_GET_IF_E = external constant [0 x i8], align 1
@.str.11 = private unnamed_addr constant [18 x i8] c"port is not bound\00", align 1
@.str.12 = private unnamed_addr constant [13 x i8] c"iface_p != 0\00", align 1
@_ZNSt3__14coutE = external global %"class.std::__1::basic_ostream", align 8
@.str.13 = private unnamed_addr constant [10 x i8] c"Counter: \00", align 1
@_ZNSt3__15ctypeIcE2idE = external global %"class.std::__1::locale::id", align 8
@.str.14 = private unnamed_addr constant [27 x i8] c"&port_ == &cache_p->port()\00", align 1
@.str.15 = private unnamed_addr constant [71 x i8] c"/opt/homebrew/opt/systemc/include/sysc/communication/sc_event_finder.h\00", align 1
@_ZTVN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEEE = linkonce_odr unnamed_addr constant { [5 x ptr] } { [5 x ptr] [ptr null, ptr @_ZTIN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEEE, ptr @_ZN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEED1Ev, ptr @_ZN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEED0Ev, ptr @_ZNK7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEE10find_eventEPNS_12sc_interfaceE] }, align 8
@_ZTIN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEEE = linkonce_odr hidden constant { ptr, ptr, ptr } { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr inttoptr (i64 add (i64 ptrtoint (ptr @_ZTSN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEEE to i64), i64 -9223372036854775808) to ptr), ptr @_ZTIN7sc_core15sc_event_finderE }, align 8
@_ZTSN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEEE = linkonce_odr hidden constant [56 x i8] c"N7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEEE\00", align 1
@_ZTIN7sc_core15sc_event_finderE = external constant ptr
@_ZTIN7sc_core15sc_signal_in_ifIbEE = linkonce_odr hidden constant { ptr, ptr, i32, i32, ptr, i64 } { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv121__vmi_class_type_infoE, i64 2), ptr inttoptr (i64 add (i64 ptrtoint (ptr @_ZTSN7sc_core15sc_signal_in_ifIbEE to i64), i64 -9223372036854775808) to ptr), i32 0, i32 1, ptr @_ZTIN7sc_core12sc_interfaceE, i64 -12285 }, align 8
@_ZTSN7sc_core15sc_signal_in_ifIbEE = linkonce_odr hidden constant [31 x i8] c"N7sc_core15sc_signal_in_ifIbEE\00", align 1
@_ZN7sc_core17SC_ID_FIND_EVENT_E = external constant [0 x i8], align 1
@_ZN7sc_core18sc_curr_simcontextE = external global ptr, align 8
@_ZN7sc_core25sc_default_global_contextE = external global ptr, align 8
@.str.16 = private unnamed_addr constant [10 x i8] c"sc_module\00", align 1
@.str.17 = private unnamed_addr constant [7 x i8] c"signal\00", align 1
@_ZTVN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE = linkonce_odr unnamed_addr constant { [27 x ptr], [12 x ptr], [16 x ptr] } { [27 x ptr] [ptr null, ptr null, ptr null, ptr null, ptr null, ptr @_ZTIN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE, ptr @_ZN7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE13register_portERNS_12sc_port_baseEPKc, ptr @_ZNK7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE13default_eventEv, ptr @_ZN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EED1Ev, ptr @_ZN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EED0Ev, ptr @_ZNK7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE19value_changed_eventEv, ptr @_ZNK7sc_core9sc_signalIbLNS_16sc_writer_policyE0EE13posedge_eventEv, ptr @_ZNK7sc_core9sc_signalIbLNS_16sc_writer_policyE0EE13negedge_eventEv, ptr @_ZNK7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE4readEv, ptr @_ZNK7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE12get_data_refEv, ptr @_ZNK7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE5eventEv, ptr @_ZNK7sc_core9sc_signalIbLNS_16sc_writer_policyE0EE7posedgeEv, ptr @_ZNK7sc_core9sc_signalIbLNS_16sc_writer_policyE0EE7negedgeEv, ptr @_ZNK7sc_core9sc_signalIbLNS_16sc_writer_policyE0EE8is_resetEv, ptr @_ZNK7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE4kindEv, ptr @_ZNK7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE17get_writer_policyEv, ptr @_ZN7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE5writeERKb, ptr @_ZNK7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE5traceEPNS_13sc_trace_fileE, ptr @_ZNK7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE5printERNSt3__113basic_ostreamIcNS3_11char_traitsIcEEEE, ptr @_ZNK7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE4dumpERNSt3__113basic_ostreamIcNS3_11char_traitsIcEEEE, ptr @_ZN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EE6updateEv, ptr @_ZNK7sc_core9sc_signalIbLNS_16sc_writer_policyE0EE8is_clockEv], [12 x ptr] [ptr inttoptr (i64 -8 to ptr), ptr inttoptr (i64 -8 to ptr), ptr inttoptr (i64 -8 to ptr), ptr inttoptr (i64 -8 to ptr), ptr inttoptr (i64 -8 to ptr), ptr @_ZTIN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE, ptr null, ptr null, ptr @_ZThn8_N7sc_core9sc_signalIbLNS_16sc_writer_policyE0EED1Ev, ptr @_ZThn8_N7sc_core9sc_signalIbLNS_16sc_writer_policyE0EED0Ev, ptr @_ZThn8_N7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE5writeERKb, ptr @_ZThn8_NK7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE17get_writer_policyEv], [16 x ptr] [ptr inttoptr (i64 -16 to ptr), ptr @_ZTIN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE, ptr @_ZThn16_NK7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE5printERNSt3__113basic_ostreamIcNS3_11char_traitsIcEEEE, ptr @_ZThn16_NK7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE4dumpERNSt3__113basic_ostreamIcNS3_11char_traitsIcEEEE, ptr @_ZThn16_NK7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE5traceEPNS_13sc_trace_fileE, ptr @_ZThn16_NK7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE4kindEv, ptr @_ZNK7sc_core9sc_object16get_child_eventsEv, ptr @_ZNK7sc_core9sc_object17get_child_objectsEv, ptr @_ZThn16_N7sc_core9sc_signalIbLNS_16sc_writer_policyE0EED1Ev, ptr @_ZThn16_N7sc_core9sc_signalIbLNS_16sc_writer_policyE0EED0Ev, ptr @_ZN7sc_core9sc_object19get_hierarchy_scopeEv, ptr @_ZThn16_N7sc_core9sc_signalIbLNS_16sc_writer_policyE0EE6updateEv, ptr @_ZN7sc_core15sc_prim_channel25before_end_of_elaborationEv, ptr @_ZN7sc_core15sc_prim_channel18end_of_elaborationEv, ptr @_ZN7sc_core15sc_prim_channel19start_of_simulationEv, ptr @_ZN7sc_core15sc_prim_channel17end_of_simulationEv] }, align 8
@_ZTTN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE = linkonce_odr unnamed_addr constant [13 x ptr] [ptr getelementptr inbounds inrange(-48, 168) ({ [27 x ptr], [12 x ptr], [16 x ptr] }, ptr @_ZTVN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE, i32 0, i32 0, i32 6), ptr getelementptr inbounds inrange(-48, 160) ({ [26 x ptr], [12 x ptr] }, ptr @_ZTCN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE0_NS_11sc_signal_tIbLS1_0EEE, i32 0, i32 0, i32 6), ptr getelementptr inbounds inrange(-48, 104) ({ [19 x ptr], [12 x ptr] }, ptr @_ZTCN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE0_NS_18sc_signal_inout_ifIbEE, i32 0, i32 0, i32 6), ptr getelementptr inbounds inrange(-48, 104) ({ [19 x ptr] }, ptr @_ZTCN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE0_NS_15sc_signal_in_ifIbEE, i32 0, i32 0, i32 6), ptr getelementptr inbounds inrange(-48, 104) ({ [19 x ptr] }, ptr @_ZTCN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE0_NS_15sc_signal_in_ifIbEE, i32 0, i32 0, i32 6), ptr getelementptr inbounds inrange(-48, 48) ({ [12 x ptr], [9 x ptr] }, ptr @_ZTCN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE8_NS_18sc_signal_write_ifIbEE, i32 0, i32 0, i32 6), ptr getelementptr inbounds inrange(-40, 32) ({ [12 x ptr], [9 x ptr] }, ptr @_ZTCN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE8_NS_18sc_signal_write_ifIbEE, i32 0, i32 1, i32 5), ptr getelementptr inbounds inrange(-48, 104) ({ [19 x ptr], [12 x ptr] }, ptr @_ZTCN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE0_NS_18sc_signal_inout_ifIbEE, i32 0, i32 0, i32 6), ptr getelementptr inbounds inrange(-48, 48) ({ [19 x ptr], [12 x ptr] }, ptr @_ZTCN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE0_NS_18sc_signal_inout_ifIbEE, i32 0, i32 1, i32 6), ptr getelementptr inbounds inrange(-48, 160) ({ [26 x ptr], [12 x ptr] }, ptr @_ZTCN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE0_NS_11sc_signal_tIbLS1_0EEE, i32 0, i32 0, i32 6), ptr getelementptr inbounds inrange(-48, 48) ({ [26 x ptr], [12 x ptr] }, ptr @_ZTCN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE0_NS_11sc_signal_tIbLS1_0EEE, i32 0, i32 1, i32 6), ptr getelementptr inbounds inrange(-48, 168) ({ [27 x ptr], [12 x ptr], [16 x ptr] }, ptr @_ZTVN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE, i32 0, i32 0, i32 6), ptr getelementptr inbounds inrange(-48, 48) ({ [27 x ptr], [12 x ptr], [16 x ptr] }, ptr @_ZTVN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE, i32 0, i32 1, i32 6)], align 8
@_ZTCN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE0_NS_11sc_signal_tIbLS1_0EEE = linkonce_odr unnamed_addr constant { [26 x ptr], [12 x ptr] } { [26 x ptr] [ptr null, ptr null, ptr null, ptr null, ptr null, ptr @_ZTIN7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EEE, ptr @_ZN7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE13register_portERNS_12sc_port_baseEPKc, ptr @_ZNK7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE13default_eventEv, ptr @_ZN7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EED1Ev, ptr @_ZN7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EED0Ev, ptr @_ZNK7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE19value_changed_eventEv, ptr @__cxa_pure_virtual, ptr @__cxa_pure_virtual, ptr @_ZNK7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE4readEv, ptr @_ZNK7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE12get_data_refEv, ptr @_ZNK7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE5eventEv, ptr @__cxa_pure_virtual, ptr @__cxa_pure_virtual, ptr @_ZNK7sc_core15sc_signal_in_ifIbE8is_resetEv, ptr @_ZNK7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE4kindEv, ptr @_ZNK7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE17get_writer_policyEv, ptr @_ZN7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE5writeERKb, ptr @_ZNK7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE5traceEPNS_13sc_trace_fileE, ptr @_ZNK7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE5printERNSt3__113basic_ostreamIcNS3_11char_traitsIcEEEE, ptr @_ZNK7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE4dumpERNSt3__113basic_ostreamIcNS3_11char_traitsIcEEEE, ptr @_ZN7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE6updateEv], [12 x ptr] [ptr inttoptr (i64 -8 to ptr), ptr inttoptr (i64 -8 to ptr), ptr inttoptr (i64 -8 to ptr), ptr inttoptr (i64 -8 to ptr), ptr inttoptr (i64 -8 to ptr), ptr @_ZTIN7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EEE, ptr null, ptr null, ptr @_ZThn8_N7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EED1Ev, ptr @_ZThn8_N7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EED0Ev, ptr @_ZThn8_N7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE5writeERKb, ptr @_ZThn8_NK7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE17get_writer_policyEv] }, align 8
@_ZTIN7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EEE = external constant ptr
@_ZTCN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE0_NS_18sc_signal_inout_ifIbEE = linkonce_odr unnamed_addr constant { [19 x ptr], [12 x ptr] } { [19 x ptr] [ptr null, ptr null, ptr null, ptr null, ptr null, ptr @_ZTIN7sc_core18sc_signal_inout_ifIbEE, ptr @_ZN7sc_core12sc_interface13register_portERNS_12sc_port_baseEPKc, ptr @_ZNK7sc_core12sc_interface13default_eventEv, ptr @_ZN7sc_core18sc_signal_inout_ifIbED1Ev, ptr @_ZN7sc_core18sc_signal_inout_ifIbED0Ev, ptr @__cxa_pure_virtual, ptr @__cxa_pure_virtual, ptr @__cxa_pure_virtual, ptr @__cxa_pure_virtual, ptr @__cxa_pure_virtual, ptr @__cxa_pure_virtual, ptr @__cxa_pure_virtual, ptr @__cxa_pure_virtual, ptr @_ZNK7sc_core15sc_signal_in_ifIbE8is_resetEv], [12 x ptr] [ptr inttoptr (i64 -8 to ptr), ptr inttoptr (i64 -8 to ptr), ptr inttoptr (i64 -8 to ptr), ptr inttoptr (i64 -8 to ptr), ptr inttoptr (i64 -8 to ptr), ptr @_ZTIN7sc_core18sc_signal_inout_ifIbEE, ptr null, ptr null, ptr @_ZThn8_N7sc_core18sc_signal_inout_ifIbED1Ev, ptr @_ZThn8_N7sc_core18sc_signal_inout_ifIbED0Ev, ptr @__cxa_pure_virtual, ptr @_ZNK7sc_core18sc_signal_write_ifIbE17get_writer_policyEv] }, align 8
@_ZTIN7sc_core18sc_signal_inout_ifIbEE = linkonce_odr hidden constant { ptr, ptr, i32, i32, ptr, i64, ptr, i64 } { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv121__vmi_class_type_infoE, i64 2), ptr inttoptr (i64 add (i64 ptrtoint (ptr @_ZTSN7sc_core18sc_signal_inout_ifIbEE to i64), i64 -9223372036854775808) to ptr), i32 2, i32 2, ptr @_ZTIN7sc_core15sc_signal_in_ifIbEE, i64 2, ptr @_ZTIN7sc_core18sc_signal_write_ifIbEE, i64 2050 }, align 8
@_ZTSN7sc_core18sc_signal_inout_ifIbEE = linkonce_odr hidden constant [34 x i8] c"N7sc_core18sc_signal_inout_ifIbEE\00", align 1
@_ZTIN7sc_core18sc_signal_write_ifIbEE = linkonce_odr hidden constant { ptr, ptr, i32, i32, ptr, i64 } { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv121__vmi_class_type_infoE, i64 2), ptr inttoptr (i64 add (i64 ptrtoint (ptr @_ZTSN7sc_core18sc_signal_write_ifIbEE to i64), i64 -9223372036854775808) to ptr), i32 0, i32 1, ptr @_ZTIN7sc_core12sc_interfaceE, i64 -12285 }, align 8
@_ZTSN7sc_core18sc_signal_write_ifIbEE = linkonce_odr hidden constant [34 x i8] c"N7sc_core18sc_signal_write_ifIbEE\00", align 1
@_ZTCN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE0_NS_15sc_signal_in_ifIbEE = linkonce_odr unnamed_addr constant { [19 x ptr] } { [19 x ptr] [ptr null, ptr null, ptr null, ptr null, ptr null, ptr @_ZTIN7sc_core15sc_signal_in_ifIbEE, ptr @_ZN7sc_core12sc_interface13register_portERNS_12sc_port_baseEPKc, ptr @_ZNK7sc_core12sc_interface13default_eventEv, ptr @_ZN7sc_core15sc_signal_in_ifIbED1Ev, ptr @_ZN7sc_core15sc_signal_in_ifIbED0Ev, ptr @__cxa_pure_virtual, ptr @__cxa_pure_virtual, ptr @__cxa_pure_virtual, ptr @__cxa_pure_virtual, ptr @__cxa_pure_virtual, ptr @__cxa_pure_virtual, ptr @__cxa_pure_virtual, ptr @__cxa_pure_virtual, ptr @_ZNK7sc_core15sc_signal_in_ifIbE8is_resetEv] }, align 8
@_ZTCN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE8_NS_18sc_signal_write_ifIbEE = linkonce_odr unnamed_addr constant { [12 x ptr], [9 x ptr] } { [12 x ptr] [ptr inttoptr (i64 -8 to ptr), ptr null, ptr inttoptr (i64 -8 to ptr), ptr inttoptr (i64 -8 to ptr), ptr null, ptr @_ZTIN7sc_core18sc_signal_write_ifIbEE, ptr null, ptr null, ptr @_ZN7sc_core18sc_signal_write_ifIbED1Ev, ptr @_ZN7sc_core18sc_signal_write_ifIbED0Ev, ptr @__cxa_pure_virtual, ptr @_ZNK7sc_core18sc_signal_write_ifIbE17get_writer_policyEv], [9 x ptr] [ptr inttoptr (i64 8 to ptr), ptr null, ptr null, ptr inttoptr (i64 8 to ptr), ptr @_ZTIN7sc_core18sc_signal_write_ifIbEE, ptr @_ZN7sc_core12sc_interface13register_portERNS_12sc_port_baseEPKc, ptr @_ZNK7sc_core12sc_interface13default_eventEv, ptr @_ZTv0_n40_N7sc_core18sc_signal_write_ifIbED1Ev, ptr @_ZTv0_n40_N7sc_core18sc_signal_write_ifIbED0Ev] }, align 8
@_ZTIN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE = linkonce_odr hidden constant { ptr, ptr, ptr } { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr inttoptr (i64 add (i64 ptrtoint (ptr @_ZTSN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE to i64), i64 -9223372036854775808) to ptr), ptr @_ZTIN7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EEE }, align 8
@_ZTSN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE = linkonce_odr hidden constant [49 x i8] c"N7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE\00", align 1
@_ZTVN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE = linkonce_odr unnamed_addr constant { [21 x ptr], [12 x ptr], [16 x ptr] } { [21 x ptr] [ptr null, ptr null, ptr null, ptr null, ptr null, ptr @_ZTIN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE, ptr @_ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE13register_portERNS_12sc_port_baseEPKc, ptr @_ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE13default_eventEv, ptr @_ZN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED1Ev, ptr @_ZN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED0Ev, ptr @_ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE19value_changed_eventEv, ptr @_ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE4readEv, ptr @_ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE12get_data_refEv, ptr @_ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5eventEv, ptr @_ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE4kindEv, ptr @_ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE17get_writer_policyEv, ptr @_ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5writeERKi, ptr @_ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5traceEPNS_13sc_trace_fileE, ptr @_ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5printERNSt3__113basic_ostreamIcNS3_11char_traitsIcEEEE, ptr @_ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE4dumpERNSt3__113basic_ostreamIcNS3_11char_traitsIcEEEE, ptr @_ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE6updateEv], [12 x ptr] [ptr inttoptr (i64 -8 to ptr), ptr inttoptr (i64 -8 to ptr), ptr inttoptr (i64 -8 to ptr), ptr inttoptr (i64 -8 to ptr), ptr inttoptr (i64 -8 to ptr), ptr @_ZTIN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE, ptr null, ptr null, ptr @_ZThn8_N7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED1Ev, ptr @_ZThn8_N7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED0Ev, ptr @_ZThn8_N7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5writeERKi, ptr @_ZThn8_NK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE17get_writer_policyEv], [16 x ptr] [ptr inttoptr (i64 -16 to ptr), ptr @_ZTIN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE, ptr @_ZThn16_NK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5printERNSt3__113basic_ostreamIcNS3_11char_traitsIcEEEE, ptr @_ZThn16_NK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE4dumpERNSt3__113basic_ostreamIcNS3_11char_traitsIcEEEE, ptr @_ZThn16_NK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5traceEPNS_13sc_trace_fileE, ptr @_ZThn16_NK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE4kindEv, ptr @_ZNK7sc_core9sc_object16get_child_eventsEv, ptr @_ZNK7sc_core9sc_object17get_child_objectsEv, ptr @_ZThn16_N7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED1Ev, ptr @_ZThn16_N7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED0Ev, ptr @_ZN7sc_core9sc_object19get_hierarchy_scopeEv, ptr @_ZThn16_N7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE6updateEv, ptr @_ZN7sc_core15sc_prim_channel25before_end_of_elaborationEv, ptr @_ZN7sc_core15sc_prim_channel18end_of_elaborationEv, ptr @_ZN7sc_core15sc_prim_channel19start_of_simulationEv, ptr @_ZN7sc_core15sc_prim_channel17end_of_simulationEv] }, align 8
@_ZTTN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE = linkonce_odr unnamed_addr constant [13 x ptr] [ptr getelementptr inbounds inrange(-48, 120) ({ [21 x ptr], [12 x ptr], [16 x ptr] }, ptr @_ZTVN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE, i32 0, i32 0, i32 6), ptr getelementptr inbounds inrange(-48, 120) ({ [21 x ptr], [12 x ptr] }, ptr @_ZTCN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE0_NS_11sc_signal_tIiLS1_0EEE, i32 0, i32 0, i32 6), ptr getelementptr inbounds inrange(-48, 64) ({ [14 x ptr], [12 x ptr] }, ptr @_ZTCN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE0_NS_18sc_signal_inout_ifIiEE, i32 0, i32 0, i32 6), ptr getelementptr inbounds inrange(-48, 64) ({ [14 x ptr] }, ptr @_ZTCN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE0_NS_15sc_signal_in_ifIiEE, i32 0, i32 0, i32 6), ptr getelementptr inbounds inrange(-48, 64) ({ [14 x ptr] }, ptr @_ZTCN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE0_NS_15sc_signal_in_ifIiEE, i32 0, i32 0, i32 6), ptr getelementptr inbounds inrange(-48, 48) ({ [12 x ptr], [9 x ptr] }, ptr @_ZTCN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE8_NS_18sc_signal_write_ifIiEE, i32 0, i32 0, i32 6), ptr getelementptr inbounds inrange(-40, 32) ({ [12 x ptr], [9 x ptr] }, ptr @_ZTCN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE8_NS_18sc_signal_write_ifIiEE, i32 0, i32 1, i32 5), ptr getelementptr inbounds inrange(-48, 64) ({ [14 x ptr], [12 x ptr] }, ptr @_ZTCN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE0_NS_18sc_signal_inout_ifIiEE, i32 0, i32 0, i32 6), ptr getelementptr inbounds inrange(-48, 48) ({ [14 x ptr], [12 x ptr] }, ptr @_ZTCN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE0_NS_18sc_signal_inout_ifIiEE, i32 0, i32 1, i32 6), ptr getelementptr inbounds inrange(-48, 120) ({ [21 x ptr], [12 x ptr] }, ptr @_ZTCN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE0_NS_11sc_signal_tIiLS1_0EEE, i32 0, i32 0, i32 6), ptr getelementptr inbounds inrange(-48, 48) ({ [21 x ptr], [12 x ptr] }, ptr @_ZTCN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE0_NS_11sc_signal_tIiLS1_0EEE, i32 0, i32 1, i32 6), ptr getelementptr inbounds inrange(-48, 120) ({ [21 x ptr], [12 x ptr], [16 x ptr] }, ptr @_ZTVN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE, i32 0, i32 0, i32 6), ptr getelementptr inbounds inrange(-48, 48) ({ [21 x ptr], [12 x ptr], [16 x ptr] }, ptr @_ZTVN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE, i32 0, i32 1, i32 6)], align 8
@_ZTCN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE0_NS_11sc_signal_tIiLS1_0EEE = linkonce_odr unnamed_addr constant { [21 x ptr], [12 x ptr] } { [21 x ptr] [ptr null, ptr null, ptr null, ptr null, ptr null, ptr @_ZTIN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE, ptr @_ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE13register_portERNS_12sc_port_baseEPKc, ptr @_ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE13default_eventEv, ptr @_ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED1Ev, ptr @_ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED0Ev, ptr @_ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE19value_changed_eventEv, ptr @_ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE4readEv, ptr @_ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE12get_data_refEv, ptr @_ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5eventEv, ptr @_ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE4kindEv, ptr @_ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE17get_writer_policyEv, ptr @_ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5writeERKi, ptr @_ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5traceEPNS_13sc_trace_fileE, ptr @_ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5printERNSt3__113basic_ostreamIcNS3_11char_traitsIcEEEE, ptr @_ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE4dumpERNSt3__113basic_ostreamIcNS3_11char_traitsIcEEEE, ptr @_ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE6updateEv], [12 x ptr] [ptr inttoptr (i64 -8 to ptr), ptr inttoptr (i64 -8 to ptr), ptr inttoptr (i64 -8 to ptr), ptr inttoptr (i64 -8 to ptr), ptr inttoptr (i64 -8 to ptr), ptr @_ZTIN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE, ptr null, ptr null, ptr @_ZThn8_N7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED1Ev, ptr @_ZThn8_N7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED0Ev, ptr @_ZThn8_N7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5writeERKi, ptr @_ZThn8_NK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE17get_writer_policyEv] }, align 8
@_ZTIN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE = linkonce_odr hidden constant { ptr, ptr, i32, i32, ptr, i64, ptr, i64, ptr, i64 } { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv121__vmi_class_type_infoE, i64 2), ptr inttoptr (i64 add (i64 ptrtoint (ptr @_ZTSN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE to i64), i64 -9223372036854775808) to ptr), i32 2, i32 3, ptr @_ZTIN7sc_core18sc_signal_inout_ifIiEE, i64 2, ptr @_ZTIN7sc_core17sc_signal_channelE, i64 4098, ptr @_ZTIN7sc_core22sc_writer_policy_checkILNS_16sc_writer_policyE0EEE, i64 26624 }, align 8
@_ZTSN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE = linkonce_odr hidden constant [52 x i8] c"N7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE\00", align 1
@_ZTIN7sc_core17sc_signal_channelE = external constant ptr
@_ZTIN7sc_core22sc_writer_policy_checkILNS_16sc_writer_policyE0EEE = linkonce_odr hidden constant { ptr, ptr, i32, i32, ptr, i64, ptr, i64 } { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv121__vmi_class_type_infoE, i64 2), ptr inttoptr (i64 add (i64 ptrtoint (ptr @_ZTSN7sc_core22sc_writer_policy_checkILNS_16sc_writer_policyE0EEE to i64), i64 -9223372036854775808) to ptr), i32 0, i32 2, ptr @_ZTIN7sc_core27sc_writer_policy_check_portE, i64 2, ptr @_ZTIN7sc_core28sc_writer_policy_check_writeE, i64 2050 }, align 8
@_ZTSN7sc_core22sc_writer_policy_checkILNS_16sc_writer_policyE0EEE = linkonce_odr hidden constant [62 x i8] c"N7sc_core22sc_writer_policy_checkILNS_16sc_writer_policyE0EEE\00", align 1
@_ZTIN7sc_core27sc_writer_policy_check_portE = linkonce_odr hidden constant { ptr, ptr } { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv117__class_type_infoE, i64 2), ptr inttoptr (i64 add (i64 ptrtoint (ptr @_ZTSN7sc_core27sc_writer_policy_check_portE to i64), i64 -9223372036854775808) to ptr) }, align 8
@_ZTVN10__cxxabiv117__class_type_infoE = external global [0 x ptr]
@_ZTSN7sc_core27sc_writer_policy_check_portE = linkonce_odr hidden constant [40 x i8] c"N7sc_core27sc_writer_policy_check_portE\00", align 1
@_ZTIN7sc_core28sc_writer_policy_check_writeE = linkonce_odr hidden constant { ptr, ptr } { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv117__class_type_infoE, i64 2), ptr inttoptr (i64 add (i64 ptrtoint (ptr @_ZTSN7sc_core28sc_writer_policy_check_writeE to i64), i64 -9223372036854775808) to ptr) }, align 8
@_ZTSN7sc_core28sc_writer_policy_check_writeE = linkonce_odr hidden constant [41 x i8] c"N7sc_core28sc_writer_policy_check_writeE\00", align 1
@_ZTCN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE0_NS_18sc_signal_inout_ifIiEE = linkonce_odr unnamed_addr constant { [14 x ptr], [12 x ptr] } { [14 x ptr] [ptr null, ptr null, ptr null, ptr null, ptr null, ptr @_ZTIN7sc_core18sc_signal_inout_ifIiEE, ptr @_ZN7sc_core12sc_interface13register_portERNS_12sc_port_baseEPKc, ptr @_ZNK7sc_core12sc_interface13default_eventEv, ptr @_ZN7sc_core18sc_signal_inout_ifIiED1Ev, ptr @_ZN7sc_core18sc_signal_inout_ifIiED0Ev, ptr @__cxa_pure_virtual, ptr @__cxa_pure_virtual, ptr @__cxa_pure_virtual, ptr @__cxa_pure_virtual], [12 x ptr] [ptr inttoptr (i64 -8 to ptr), ptr inttoptr (i64 -8 to ptr), ptr inttoptr (i64 -8 to ptr), ptr inttoptr (i64 -8 to ptr), ptr inttoptr (i64 -8 to ptr), ptr @_ZTIN7sc_core18sc_signal_inout_ifIiEE, ptr null, ptr null, ptr @_ZThn8_N7sc_core18sc_signal_inout_ifIiED1Ev, ptr @_ZThn8_N7sc_core18sc_signal_inout_ifIiED0Ev, ptr @__cxa_pure_virtual, ptr @_ZNK7sc_core18sc_signal_write_ifIiE17get_writer_policyEv] }, align 8
@_ZTCN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE0_NS_15sc_signal_in_ifIiEE = linkonce_odr unnamed_addr constant { [14 x ptr] } { [14 x ptr] [ptr null, ptr null, ptr null, ptr null, ptr null, ptr @_ZTIN7sc_core15sc_signal_in_ifIiEE, ptr @_ZN7sc_core12sc_interface13register_portERNS_12sc_port_baseEPKc, ptr @_ZNK7sc_core12sc_interface13default_eventEv, ptr @_ZN7sc_core15sc_signal_in_ifIiED1Ev, ptr @_ZN7sc_core15sc_signal_in_ifIiED0Ev, ptr @__cxa_pure_virtual, ptr @__cxa_pure_virtual, ptr @__cxa_pure_virtual, ptr @__cxa_pure_virtual] }, align 8
@_ZTCN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE8_NS_18sc_signal_write_ifIiEE = linkonce_odr unnamed_addr constant { [12 x ptr], [9 x ptr] } { [12 x ptr] [ptr inttoptr (i64 -8 to ptr), ptr null, ptr inttoptr (i64 -8 to ptr), ptr inttoptr (i64 -8 to ptr), ptr null, ptr @_ZTIN7sc_core18sc_signal_write_ifIiEE, ptr null, ptr null, ptr @_ZN7sc_core18sc_signal_write_ifIiED1Ev, ptr @_ZN7sc_core18sc_signal_write_ifIiED0Ev, ptr @__cxa_pure_virtual, ptr @_ZNK7sc_core18sc_signal_write_ifIiE17get_writer_policyEv], [9 x ptr] [ptr inttoptr (i64 8 to ptr), ptr null, ptr null, ptr inttoptr (i64 8 to ptr), ptr @_ZTIN7sc_core18sc_signal_write_ifIiEE, ptr @_ZN7sc_core12sc_interface13register_portERNS_12sc_port_baseEPKc, ptr @_ZNK7sc_core12sc_interface13default_eventEv, ptr @_ZTv0_n40_N7sc_core18sc_signal_write_ifIiED1Ev, ptr @_ZTv0_n40_N7sc_core18sc_signal_write_ifIiED0Ev] }, align 8
@_ZTIN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE = linkonce_odr hidden constant { ptr, ptr, ptr } { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr inttoptr (i64 add (i64 ptrtoint (ptr @_ZTSN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE to i64), i64 -9223372036854775808) to ptr), ptr @_ZTIN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE }, align 8
@_ZTSN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE = linkonce_odr hidden constant [49 x i8] c"N7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE\00", align 1
@_ZTVN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE = linkonce_odr unnamed_addr constant { [21 x ptr], [12 x ptr], [16 x ptr] } { [21 x ptr] [ptr null, ptr null, ptr null, ptr null, ptr null, ptr @_ZTIN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE, ptr @_ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE13register_portERNS_12sc_port_baseEPKc, ptr @_ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE13default_eventEv, ptr @_ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED1Ev, ptr @_ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED0Ev, ptr @_ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE19value_changed_eventEv, ptr @_ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE4readEv, ptr @_ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE12get_data_refEv, ptr @_ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5eventEv, ptr @_ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE4kindEv, ptr @_ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE17get_writer_policyEv, ptr @_ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5writeERKi, ptr @_ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5traceEPNS_13sc_trace_fileE, ptr @_ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5printERNSt3__113basic_ostreamIcNS3_11char_traitsIcEEEE, ptr @_ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE4dumpERNSt3__113basic_ostreamIcNS3_11char_traitsIcEEEE, ptr @_ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE6updateEv], [12 x ptr] [ptr inttoptr (i64 -8 to ptr), ptr inttoptr (i64 -8 to ptr), ptr inttoptr (i64 -8 to ptr), ptr inttoptr (i64 -8 to ptr), ptr inttoptr (i64 -8 to ptr), ptr @_ZTIN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE, ptr null, ptr null, ptr @_ZThn8_N7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED1Ev, ptr @_ZThn8_N7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED0Ev, ptr @_ZThn8_N7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5writeERKi, ptr @_ZThn8_NK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE17get_writer_policyEv], [16 x ptr] [ptr inttoptr (i64 -16 to ptr), ptr @_ZTIN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE, ptr @_ZThn16_NK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5printERNSt3__113basic_ostreamIcNS3_11char_traitsIcEEEE, ptr @_ZThn16_NK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE4dumpERNSt3__113basic_ostreamIcNS3_11char_traitsIcEEEE, ptr @_ZThn16_NK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5traceEPNS_13sc_trace_fileE, ptr @_ZThn16_NK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE4kindEv, ptr @_ZNK7sc_core9sc_object16get_child_eventsEv, ptr @_ZNK7sc_core9sc_object17get_child_objectsEv, ptr @_ZThn16_N7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED1Ev, ptr @_ZThn16_N7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED0Ev, ptr @_ZN7sc_core9sc_object19get_hierarchy_scopeEv, ptr @_ZThn16_N7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE6updateEv, ptr @_ZN7sc_core15sc_prim_channel25before_end_of_elaborationEv, ptr @_ZN7sc_core15sc_prim_channel18end_of_elaborationEv, ptr @_ZN7sc_core15sc_prim_channel19start_of_simulationEv, ptr @_ZN7sc_core15sc_prim_channel17end_of_simulationEv] }, align 8
@_ZTTN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE = linkonce_odr unnamed_addr constant [10 x ptr] [ptr getelementptr inbounds inrange(-48, 120) ({ [21 x ptr], [12 x ptr], [16 x ptr] }, ptr @_ZTVN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE, i32 0, i32 0, i32 6), ptr getelementptr inbounds inrange(-48, 64) ({ [14 x ptr], [12 x ptr] }, ptr @_ZTCN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE0_NS_18sc_signal_inout_ifIiEE, i32 0, i32 0, i32 6), ptr getelementptr inbounds inrange(-48, 64) ({ [14 x ptr] }, ptr @_ZTCN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE0_NS_15sc_signal_in_ifIiEE, i32 0, i32 0, i32 6), ptr getelementptr inbounds inrange(-48, 64) ({ [14 x ptr] }, ptr @_ZTCN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE0_NS_15sc_signal_in_ifIiEE, i32 0, i32 0, i32 6), ptr getelementptr inbounds inrange(-48, 48) ({ [12 x ptr], [9 x ptr] }, ptr @_ZTCN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE8_NS_18sc_signal_write_ifIiEE, i32 0, i32 0, i32 6), ptr getelementptr inbounds inrange(-40, 32) ({ [12 x ptr], [9 x ptr] }, ptr @_ZTCN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE8_NS_18sc_signal_write_ifIiEE, i32 0, i32 1, i32 5), ptr getelementptr inbounds inrange(-48, 64) ({ [14 x ptr], [12 x ptr] }, ptr @_ZTCN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE0_NS_18sc_signal_inout_ifIiEE, i32 0, i32 0, i32 6), ptr getelementptr inbounds inrange(-48, 48) ({ [14 x ptr], [12 x ptr] }, ptr @_ZTCN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE0_NS_18sc_signal_inout_ifIiEE, i32 0, i32 1, i32 6), ptr getelementptr inbounds inrange(-48, 120) ({ [21 x ptr], [12 x ptr], [16 x ptr] }, ptr @_ZTVN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE, i32 0, i32 0, i32 6), ptr getelementptr inbounds inrange(-48, 48) ({ [21 x ptr], [12 x ptr], [16 x ptr] }, ptr @_ZTVN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE, i32 0, i32 1, i32 6)], align 8
@_ZTCN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE0_NS_18sc_signal_inout_ifIiEE = linkonce_odr unnamed_addr constant { [14 x ptr], [12 x ptr] } { [14 x ptr] [ptr null, ptr null, ptr null, ptr null, ptr null, ptr @_ZTIN7sc_core18sc_signal_inout_ifIiEE, ptr @_ZN7sc_core12sc_interface13register_portERNS_12sc_port_baseEPKc, ptr @_ZNK7sc_core12sc_interface13default_eventEv, ptr @_ZN7sc_core18sc_signal_inout_ifIiED1Ev, ptr @_ZN7sc_core18sc_signal_inout_ifIiED0Ev, ptr @__cxa_pure_virtual, ptr @__cxa_pure_virtual, ptr @__cxa_pure_virtual, ptr @__cxa_pure_virtual], [12 x ptr] [ptr inttoptr (i64 -8 to ptr), ptr inttoptr (i64 -8 to ptr), ptr inttoptr (i64 -8 to ptr), ptr inttoptr (i64 -8 to ptr), ptr inttoptr (i64 -8 to ptr), ptr @_ZTIN7sc_core18sc_signal_inout_ifIiEE, ptr null, ptr null, ptr @_ZThn8_N7sc_core18sc_signal_inout_ifIiED1Ev, ptr @_ZThn8_N7sc_core18sc_signal_inout_ifIiED0Ev, ptr @__cxa_pure_virtual, ptr @_ZNK7sc_core18sc_signal_write_ifIiE17get_writer_policyEv] }, align 8
@_ZTCN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE0_NS_15sc_signal_in_ifIiEE = linkonce_odr unnamed_addr constant { [14 x ptr] } { [14 x ptr] [ptr null, ptr null, ptr null, ptr null, ptr null, ptr @_ZTIN7sc_core15sc_signal_in_ifIiEE, ptr @_ZN7sc_core12sc_interface13register_portERNS_12sc_port_baseEPKc, ptr @_ZNK7sc_core12sc_interface13default_eventEv, ptr @_ZN7sc_core15sc_signal_in_ifIiED1Ev, ptr @_ZN7sc_core15sc_signal_in_ifIiED0Ev, ptr @__cxa_pure_virtual, ptr @__cxa_pure_virtual, ptr @__cxa_pure_virtual, ptr @__cxa_pure_virtual] }, align 8
@_ZTCN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE8_NS_18sc_signal_write_ifIiEE = linkonce_odr unnamed_addr constant { [12 x ptr], [9 x ptr] } { [12 x ptr] [ptr inttoptr (i64 -8 to ptr), ptr null, ptr inttoptr (i64 -8 to ptr), ptr inttoptr (i64 -8 to ptr), ptr null, ptr @_ZTIN7sc_core18sc_signal_write_ifIiEE, ptr null, ptr null, ptr @_ZN7sc_core18sc_signal_write_ifIiED1Ev, ptr @_ZN7sc_core18sc_signal_write_ifIiED0Ev, ptr @__cxa_pure_virtual, ptr @_ZNK7sc_core18sc_signal_write_ifIiE17get_writer_policyEv], [9 x ptr] [ptr inttoptr (i64 8 to ptr), ptr null, ptr null, ptr inttoptr (i64 8 to ptr), ptr @_ZTIN7sc_core18sc_signal_write_ifIiEE, ptr @_ZN7sc_core12sc_interface13register_portERNS_12sc_port_baseEPKc, ptr @_ZNK7sc_core12sc_interface13default_eventEv, ptr @_ZTv0_n40_N7sc_core18sc_signal_write_ifIiED1Ev, ptr @_ZTv0_n40_N7sc_core18sc_signal_write_ifIiED0Ev] }, align 8
@_ZTVN7sc_core17sc_signal_channelE = external unnamed_addr constant { [16 x ptr] }, align 8
@.str.18 = private unnamed_addr constant [10 x i8] c"sc_signal\00", align 1
@.str.19 = private unnamed_addr constant [20 x i8] c"m_references_n != 0\00", align 1
@.str.20 = private unnamed_addr constant [59 x i8] c"/opt/homebrew/opt/systemc/include/sysc/kernel/sc_process.h\00", align 1
@.str.21 = private unnamed_addr constant [13 x i8] c"     name = \00", align 1
@.str.22 = private unnamed_addr constant [13 x i8] c"    value = \00", align 1
@.str.23 = private unnamed_addr constant [13 x i8] c"new value = \00", align 1
@llvm.global_ctors = appending global [1 x { i32, ptr, ptr }] [{ i32, ptr, ptr } { i32 65535, ptr @_GLOBAL__sub_I_simple_test_for_mir.cpp, ptr null }]

; Function Attrs: noinline ssp uwtable(sync)
define internal void @__cxx_global_var_init() #0 section "__TEXT,__StaticInit,regular,pure_instructions" {
  %1 = call noundef ptr @_ZN7sc_core31sc_api_version_3_0_1_cxx201703LC1ENS_16sc_writer_policyEb(ptr noundef nonnull align 1 dereferenceable(1) @_ZN7sc_coreL17api_version_checkE, i32 noundef 0, i1 noundef zeroext false)
  ret void
}

declare noundef ptr @_ZN7sc_core31sc_api_version_3_0_1_cxx201703LC1ENS_16sc_writer_policyEb(ptr noundef nonnull returned align 1 dereferenceable(1), i32 noundef, i1 noundef zeroext) unnamed_addr #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define i32 @sc_main(i32 noundef %0, ptr noundef %1) #2 personality ptr @__gxx_personality_v0 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca %"class.sc_core::sc_clock", align 8
  %6 = alloca %"class.sc_core::sc_signal", align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca %"class.sc_core::sc_signal.1", align 8
  %10 = alloca %struct.simple_counter, align 8
  %11 = alloca %"class.sc_core::sc_module_name", align 8
  %12 = alloca i8, align 1
  %13 = alloca i8, align 1
  store i32 %0, ptr %3, align 4
  store ptr %1, ptr %4, align 8
  %14 = call noundef ptr @_ZN7sc_core8sc_clockC1EPKcdNS_12sc_time_unitEd(ptr noundef nonnull align 8 dereferenceable(528) %5, ptr noundef @.str, double noundef 1.000000e+01, i32 noundef 2, double noundef 5.000000e-01)
  %15 = invoke noundef ptr @_ZN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEC1Ev(ptr noundef nonnull align 8 dereferenceable(160) %6)
          to label %16 unwind label %39

16:                                               ; preds = %2
  %17 = invoke noundef ptr @_ZN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEC1Ev(ptr noundef nonnull align 8 dereferenceable(136) %9)
          to label %18 unwind label %43

18:                                               ; preds = %16
  %19 = invoke noundef ptr @_ZN7sc_core14sc_module_nameC1EPKc(ptr noundef nonnull align 8 dereferenceable(64) %11, ptr noundef @.str.1)
          to label %20 unwind label %47

20:                                               ; preds = %18
  %21 = invoke noundef ptr @_ZN14simple_counterC1EN7sc_core14sc_module_nameE(ptr noundef nonnull align 8 dereferenceable(612) %10, ptr noundef %11)
          to label %22 unwind label %51

22:                                               ; preds = %20
  %23 = invoke noundef ptr @_ZN7sc_core14sc_module_nameD1Ev(ptr noundef nonnull align 8 dereferenceable(64) %11)
          to label %24 unwind label %47

24:                                               ; preds = %22
  %25 = getelementptr inbounds nuw %struct.simple_counter, ptr %10, i32 0, i32 1
  invoke void @_ZN7sc_core5sc_inIbEclERKNS_15sc_signal_in_ifIbEE(ptr noundef nonnull align 8 dereferenceable(128) %25, ptr noundef nonnull align 8 dereferenceable(8) %5)
          to label %26 unwind label %57

26:                                               ; preds = %24
  %27 = getelementptr inbounds nuw %struct.simple_counter, ptr %10, i32 0, i32 2
  invoke void @_ZN7sc_core5sc_inIbEclERKNS_15sc_signal_in_ifIbEE(ptr noundef nonnull align 8 dereferenceable(128) %27, ptr noundef nonnull align 8 dereferenceable(8) %6)
          to label %28 unwind label %57

28:                                               ; preds = %26
  %29 = getelementptr inbounds nuw %struct.simple_counter, ptr %10, i32 0, i32 3
  invoke void @_ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEEclERS2_(ptr noundef nonnull align 8 dereferenceable(96) %29, ptr noundef nonnull align 8 dereferenceable(16) %9)
          to label %30 unwind label %57

30:                                               ; preds = %28
  store i8 1, ptr %12, align 1
  invoke void @_ZN7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE5writeERKb(ptr noundef nonnull align 8 dereferenceable(130) %6, ptr noundef nonnull align 1 dereferenceable(1) %12)
          to label %31 unwind label %57

31:                                               ; preds = %30
  invoke void @_ZN7sc_core8sc_startEiNS_12sc_time_unitENS_20sc_starvation_policyE(i32 noundef 20, i32 noundef 2, i32 noundef 1)
          to label %32 unwind label %57

32:                                               ; preds = %31
  store i8 0, ptr %13, align 1
  invoke void @_ZN7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE5writeERKb(ptr noundef nonnull align 8 dereferenceable(130) %6, ptr noundef nonnull align 1 dereferenceable(1) %13)
          to label %33 unwind label %57

33:                                               ; preds = %32
  invoke void @_ZN7sc_core8sc_startEiNS_12sc_time_unitENS_20sc_starvation_policyE(i32 noundef 100, i32 noundef 2, i32 noundef 1)
          to label %34 unwind label %57

34:                                               ; preds = %33
  %35 = call noundef ptr @_ZN14simple_counterD1Ev(ptr noundef nonnull align 8 dereferenceable(612) %10) #17
  %36 = call noundef ptr @_ZN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED1Ev(ptr noundef nonnull align 8 dereferenceable(136) %9) #17
  %37 = call noundef ptr @_ZN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EED1Ev(ptr noundef nonnull align 8 dereferenceable(160) %6) #17
  %38 = call noundef ptr @_ZN7sc_core8sc_clockD1Ev(ptr noundef nonnull align 8 dereferenceable(528) %5) #17
  ret i32 0

39:                                               ; preds = %2
  %40 = landingpad { ptr, i32 }
          cleanup
  %41 = extractvalue { ptr, i32 } %40, 0
  store ptr %41, ptr %7, align 8
  %42 = extractvalue { ptr, i32 } %40, 1
  store i32 %42, ptr %8, align 4
  br label %66

43:                                               ; preds = %16
  %44 = landingpad { ptr, i32 }
          cleanup
  %45 = extractvalue { ptr, i32 } %44, 0
  store ptr %45, ptr %7, align 8
  %46 = extractvalue { ptr, i32 } %44, 1
  store i32 %46, ptr %8, align 4
  br label %64

47:                                               ; preds = %22, %18
  %48 = landingpad { ptr, i32 }
          cleanup
  %49 = extractvalue { ptr, i32 } %48, 0
  store ptr %49, ptr %7, align 8
  %50 = extractvalue { ptr, i32 } %48, 1
  store i32 %50, ptr %8, align 4
  br label %62

51:                                               ; preds = %20
  %52 = landingpad { ptr, i32 }
          cleanup
  %53 = extractvalue { ptr, i32 } %52, 0
  store ptr %53, ptr %7, align 8
  %54 = extractvalue { ptr, i32 } %52, 1
  store i32 %54, ptr %8, align 4
  %55 = invoke noundef ptr @_ZN7sc_core14sc_module_nameD1Ev(ptr noundef nonnull align 8 dereferenceable(64) %11)
          to label %56 unwind label %73

56:                                               ; preds = %51
  br label %62

57:                                               ; preds = %33, %32, %31, %30, %28, %26, %24
  %58 = landingpad { ptr, i32 }
          cleanup
  %59 = extractvalue { ptr, i32 } %58, 0
  store ptr %59, ptr %7, align 8
  %60 = extractvalue { ptr, i32 } %58, 1
  store i32 %60, ptr %8, align 4
  %61 = call noundef ptr @_ZN14simple_counterD1Ev(ptr noundef nonnull align 8 dereferenceable(612) %10) #17
  br label %62

62:                                               ; preds = %57, %56, %47
  %63 = call noundef ptr @_ZN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED1Ev(ptr noundef nonnull align 8 dereferenceable(136) %9) #17
  br label %64

64:                                               ; preds = %62, %43
  %65 = call noundef ptr @_ZN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EED1Ev(ptr noundef nonnull align 8 dereferenceable(160) %6) #17
  br label %66

66:                                               ; preds = %64, %39
  %67 = call noundef ptr @_ZN7sc_core8sc_clockD1Ev(ptr noundef nonnull align 8 dereferenceable(528) %5) #17
  br label %68

68:                                               ; preds = %66
  %69 = load ptr, ptr %7, align 8
  %70 = load i32, ptr %8, align 4
  %71 = insertvalue { ptr, i32 } poison, ptr %69, 0
  %72 = insertvalue { ptr, i32 } %71, i32 %70, 1
  resume { ptr, i32 } %72

73:                                               ; preds = %51
  %74 = landingpad { ptr, i32 }
          catch ptr null
  %75 = extractvalue { ptr, i32 } %74, 0
  call void @__clang_call_terminate(ptr %75) #18
  unreachable
}

declare noundef ptr @_ZN7sc_core8sc_clockC1EPKcdNS_12sc_time_unitEd(ptr noundef nonnull returned align 8 dereferenceable(528), ptr noundef, double noundef, i32 noundef, double noundef) unnamed_addr #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEC1Ev(ptr noundef nonnull returned align 8 dereferenceable(160) %0) unnamed_addr #2 personality ptr @__gxx_personality_v0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i8, align 1
  store ptr %0, ptr %2, align 8
  %6 = load ptr, ptr %2, align 8
  %7 = call noundef ptr @_ZN7sc_core12sc_interfaceC2Ev(ptr noundef nonnull align 8 dereferenceable(8) %6)
  %8 = invoke noundef ptr @_ZN7sc_core18sc_gen_unique_nameEPKcb(ptr noundef @.str.17, i1 noundef zeroext false)
          to label %9 unwind label %17

9:                                                ; preds = %1
  store i8 0, ptr %5, align 1
  %10 = invoke noundef ptr @_ZN7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EEC2EPKcRKb(ptr noundef nonnull align 8 dereferenceable(130) %6, ptr noundef getelementptr inbounds ([13 x ptr], ptr @_ZTTN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE, i64 0, i64 1), ptr noundef %8, ptr noundef nonnull align 1 dereferenceable(1) %5)
          to label %11 unwind label %17

11:                                               ; preds = %9
  store ptr getelementptr inbounds inrange(-48, 168) ({ [27 x ptr], [12 x ptr], [16 x ptr] }, ptr @_ZTVN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE, i32 0, i32 0, i32 6), ptr %6, align 8
  store ptr getelementptr inbounds inrange(-48, 168) ({ [27 x ptr], [12 x ptr], [16 x ptr] }, ptr @_ZTVN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE, i32 0, i32 0, i32 6), ptr %6, align 8
  %12 = getelementptr inbounds i8, ptr %6, i64 8
  store ptr getelementptr inbounds inrange(-48, 48) ({ [27 x ptr], [12 x ptr], [16 x ptr] }, ptr @_ZTVN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE, i32 0, i32 1, i32 6), ptr %12, align 8
  %13 = getelementptr inbounds i8, ptr %6, i64 16
  store ptr getelementptr inbounds inrange(-16, 112) ({ [27 x ptr], [12 x ptr], [16 x ptr] }, ptr @_ZTVN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EEE, i32 0, i32 2, i32 2), ptr %13, align 8
  %14 = getelementptr inbounds nuw %"class.sc_core::sc_signal", ptr %6, i32 0, i32 1
  store ptr null, ptr %14, align 8
  %15 = getelementptr inbounds nuw %"class.sc_core::sc_signal", ptr %6, i32 0, i32 2
  store ptr null, ptr %15, align 8
  %16 = getelementptr inbounds nuw %"class.sc_core::sc_signal", ptr %6, i32 0, i32 3
  store ptr null, ptr %16, align 8
  ret ptr %6

17:                                               ; preds = %9, %1
  %18 = landingpad { ptr, i32 }
          cleanup
  %19 = extractvalue { ptr, i32 } %18, 0
  store ptr %19, ptr %3, align 8
  %20 = extractvalue { ptr, i32 } %18, 1
  store i32 %20, ptr %4, align 4
  %21 = call noundef ptr @_ZN7sc_core12sc_interfaceD2Ev(ptr noundef nonnull align 8 dereferenceable(8) %6) #17
  br label %22

22:                                               ; preds = %17
  %23 = load ptr, ptr %3, align 8
  %24 = load i32, ptr %4, align 4
  %25 = insertvalue { ptr, i32 } poison, ptr %23, 0
  %26 = insertvalue { ptr, i32 } %25, i32 %24, 1
  resume { ptr, i32 } %26
}

declare i32 @__gxx_personality_v0(...)

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEC1Ev(ptr noundef nonnull returned align 8 dereferenceable(136) %0) unnamed_addr #2 personality ptr @__gxx_personality_v0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %6 = load ptr, ptr %2, align 8
  %7 = call noundef ptr @_ZN7sc_core12sc_interfaceC2Ev(ptr noundef nonnull align 8 dereferenceable(8) %6)
  %8 = invoke noundef ptr @_ZN7sc_core18sc_gen_unique_nameEPKcb(ptr noundef @.str.17, i1 noundef zeroext false)
          to label %9 unwind label %14

9:                                                ; preds = %1
  store i32 0, ptr %5, align 4
  %10 = invoke noundef ptr @_ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEC2EPKcRKi(ptr noundef nonnull align 8 dereferenceable(136) %6, ptr noundef getelementptr inbounds ([13 x ptr], ptr @_ZTTN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE, i64 0, i64 1), ptr noundef %8, ptr noundef nonnull align 4 dereferenceable(4) %5)
          to label %11 unwind label %14

11:                                               ; preds = %9
  store ptr getelementptr inbounds inrange(-48, 120) ({ [21 x ptr], [12 x ptr], [16 x ptr] }, ptr @_ZTVN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE, i32 0, i32 0, i32 6), ptr %6, align 8
  store ptr getelementptr inbounds inrange(-48, 120) ({ [21 x ptr], [12 x ptr], [16 x ptr] }, ptr @_ZTVN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE, i32 0, i32 0, i32 6), ptr %6, align 8
  %12 = getelementptr inbounds i8, ptr %6, i64 8
  store ptr getelementptr inbounds inrange(-48, 48) ({ [21 x ptr], [12 x ptr], [16 x ptr] }, ptr @_ZTVN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE, i32 0, i32 1, i32 6), ptr %12, align 8
  %13 = getelementptr inbounds i8, ptr %6, i64 16
  store ptr getelementptr inbounds inrange(-16, 112) ({ [21 x ptr], [12 x ptr], [16 x ptr] }, ptr @_ZTVN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE, i32 0, i32 2, i32 2), ptr %13, align 8
  ret ptr %6

14:                                               ; preds = %9, %1
  %15 = landingpad { ptr, i32 }
          cleanup
  %16 = extractvalue { ptr, i32 } %15, 0
  store ptr %16, ptr %3, align 8
  %17 = extractvalue { ptr, i32 } %15, 1
  store i32 %17, ptr %4, align 4
  %18 = call noundef ptr @_ZN7sc_core12sc_interfaceD2Ev(ptr noundef nonnull align 8 dereferenceable(8) %6) #17
  br label %19

19:                                               ; preds = %14
  %20 = load ptr, ptr %3, align 8
  %21 = load i32, ptr %4, align 4
  %22 = insertvalue { ptr, i32 } poison, ptr %20, 0
  %23 = insertvalue { ptr, i32 } %22, i32 %21, 1
  resume { ptr, i32 } %23
}

declare noundef ptr @_ZN7sc_core14sc_module_nameC1EPKc(ptr noundef nonnull returned align 8 dereferenceable(64), ptr noundef) unnamed_addr #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN14simple_counterC1EN7sc_core14sc_module_nameE(ptr noundef nonnull returned align 8 dereferenceable(612) %0, ptr noundef %1) unnamed_addr #2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = call noundef ptr @_ZN14simple_counterC2EN7sc_core14sc_module_nameE(ptr noundef nonnull align 8 dereferenceable(612) %5, ptr noundef %1)
  ret ptr %5
}

declare noundef ptr @_ZN7sc_core14sc_module_nameD1Ev(ptr noundef nonnull returned align 8 dereferenceable(64)) unnamed_addr #1

; Function Attrs: noinline noreturn nounwind ssp uwtable(sync)
define linkonce_odr hidden void @__clang_call_terminate(ptr noundef %0) #3 {
  %2 = call ptr @__cxa_begin_catch(ptr %0) #17
  call void @_ZSt9terminatev() #18
  unreachable
}

declare ptr @__cxa_begin_catch(ptr)

declare void @_ZSt9terminatev()

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZN7sc_core5sc_inIbEclERKNS_15sc_signal_in_ifIbEE(ptr noundef nonnull align 8 dereferenceable(128) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) #2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = load ptr, ptr %5, align 8
  %8 = getelementptr inbounds ptr, ptr %7, i64 24
  %9 = load ptr, ptr %8, align 8
  call void %9(ptr noundef nonnull align 8 dereferenceable(128) %5, ptr noundef nonnull align 8 dereferenceable(8) %6)
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEEclERS2_(ptr noundef nonnull align 8 dereferenceable(96) %0, ptr noundef nonnull align 8 dereferenceable(16) %1) #2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = load ptr, ptr %5, align 8
  %8 = getelementptr inbounds ptr, ptr %7, i64 22
  %9 = load ptr, ptr %8, align 8
  call void %9(ptr noundef nonnull align 8 dereferenceable(96) %5, ptr noundef nonnull align 8 dereferenceable(16) %6)
  ret void
}

declare void @_ZN7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE5writeERKb(ptr noundef nonnull align 8 dereferenceable(130), ptr noundef nonnull align 1 dereferenceable(1)) unnamed_addr #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZN7sc_core8sc_startEiNS_12sc_time_unitENS_20sc_starvation_policyE(i32 noundef %0, i32 noundef %1, i32 noundef %2) #2 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca %"class.sc_core::sc_time", align 8
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  %8 = load i32, ptr %4, align 4
  %9 = sitofp i32 %8 to double
  %10 = load i32, ptr %5, align 4
  %11 = call noundef ptr @_ZN7sc_core7sc_timeC1EdNS_12sc_time_unitE(ptr noundef nonnull align 8 dereferenceable(8) %7, double noundef %9, i32 noundef %10)
  %12 = load i32, ptr %6, align 4
  call void @_ZN7sc_core8sc_startERKNS_7sc_timeENS_20sc_starvation_policyE(ptr noundef nonnull align 8 dereferenceable(8) %7, i32 noundef %12)
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN14simple_counterD1Ev(ptr noundef nonnull returned align 8 dereferenceable(612) %0) unnamed_addr #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef ptr @_ZN14simple_counterD2Ev(ptr noundef nonnull align 8 dereferenceable(612) %3) #17
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED1Ev(ptr noundef nonnull returned align 8 dereferenceable(136) %0) unnamed_addr #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef ptr @_ZN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED2Ev(ptr noundef nonnull align 8 dereferenceable(136) %3, ptr noundef @_ZTTN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EEE) #17
  %5 = call noundef ptr @_ZN7sc_core12sc_interfaceD2Ev(ptr noundef nonnull align 8 dereferenceable(8) %3) #17
  ret ptr %3
}

; Function Attrs: nounwind
declare noundef ptr @_ZN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EED1Ev(ptr noundef nonnull returned align 8 dereferenceable(160)) unnamed_addr #5

; Function Attrs: nounwind
declare noundef ptr @_ZN7sc_core8sc_clockD1Ev(ptr noundef nonnull returned align 8 dereferenceable(528)) unnamed_addr #5

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN14simple_counterC2EN7sc_core14sc_module_nameE(ptr noundef nonnull returned align 8 dereferenceable(612) %0, ptr noundef %1) unnamed_addr #2 personality ptr @__gxx_personality_v0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca { i64, i64 }, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = call noundef ptr @_ZN7sc_core9sc_moduleC2Ev(ptr noundef nonnull align 8 dereferenceable(232) %8)
  store ptr getelementptr inbounds inrange(-16, 136) ({ [19 x ptr], [4 x ptr] }, ptr @_ZTV14simple_counter, i32 0, i32 0, i32 2), ptr %8, align 8
  %10 = getelementptr inbounds i8, ptr %8, i64 112
  store ptr getelementptr inbounds inrange(-16, 16) ({ [19 x ptr], [4 x ptr] }, ptr @_ZTV14simple_counter, i32 0, i32 1, i32 2), ptr %10, align 8
  %11 = getelementptr inbounds nuw %struct.simple_counter, ptr %8, i32 0, i32 1
  %12 = invoke noundef ptr @_ZN7sc_core5sc_inIbEC1Ev(ptr noundef nonnull align 8 dereferenceable(128) %11)
          to label %13 unwind label %29

13:                                               ; preds = %2
  %14 = getelementptr inbounds nuw %struct.simple_counter, ptr %8, i32 0, i32 2
  %15 = invoke noundef ptr @_ZN7sc_core5sc_inIbEC1Ev(ptr noundef nonnull align 8 dereferenceable(128) %14)
          to label %16 unwind label %33

16:                                               ; preds = %13
  %17 = getelementptr inbounds nuw %struct.simple_counter, ptr %8, i32 0, i32 3
  %18 = invoke noundef ptr @_ZN7sc_core6sc_outIiEC1Ev(ptr noundef nonnull align 8 dereferenceable(120) %17)
          to label %19 unwind label %37

19:                                               ; preds = %16
  %20 = getelementptr inbounds nuw %struct.simple_counter, ptr %8, i32 0, i32 4
  store i32 0, ptr %20, align 8
  store { i64, i64 } { i64 ptrtoint (ptr @_ZN14simple_counter13count_processEv to i64), i64 -224 }, ptr %7, align 8
  %21 = load [2 x i64], ptr %7, align 8
  invoke void @_ZN7sc_core9sc_module22declare_method_processEMNS_15sc_process_hostEFvvEPKc(ptr noundef nonnull align 8 dereferenceable(232) %8, [2 x i64] %21, ptr noundef @.str.2)
          to label %22 unwind label %41

22:                                               ; preds = %19
  %23 = getelementptr inbounds nuw %"class.sc_core::sc_module", ptr %8, i32 0, i32 2
  %24 = getelementptr inbounds nuw %struct.simple_counter, ptr %8, i32 0, i32 1
  %25 = invoke noundef nonnull align 8 dereferenceable(16) ptr @_ZNK7sc_core5sc_inIbE3posEv(ptr noundef nonnull align 8 dereferenceable(128) %24)
          to label %26 unwind label %41

26:                                               ; preds = %22
  %27 = invoke noundef nonnull align 8 dereferenceable(24) ptr @_ZN7sc_core12sc_sensitivelsERNS_15sc_event_finderE(ptr noundef nonnull align 8 dereferenceable(24) %23, ptr noundef nonnull align 8 dereferenceable(16) %25)
          to label %28 unwind label %41

28:                                               ; preds = %26
  ret ptr %8

29:                                               ; preds = %2
  %30 = landingpad { ptr, i32 }
          cleanup
  %31 = extractvalue { ptr, i32 } %30, 0
  store ptr %31, ptr %5, align 8
  %32 = extractvalue { ptr, i32 } %30, 1
  store i32 %32, ptr %6, align 4
  br label %50

33:                                               ; preds = %13
  %34 = landingpad { ptr, i32 }
          cleanup
  %35 = extractvalue { ptr, i32 } %34, 0
  store ptr %35, ptr %5, align 8
  %36 = extractvalue { ptr, i32 } %34, 1
  store i32 %36, ptr %6, align 4
  br label %48

37:                                               ; preds = %16
  %38 = landingpad { ptr, i32 }
          cleanup
  %39 = extractvalue { ptr, i32 } %38, 0
  store ptr %39, ptr %5, align 8
  %40 = extractvalue { ptr, i32 } %38, 1
  store i32 %40, ptr %6, align 4
  br label %46

41:                                               ; preds = %26, %22, %19
  %42 = landingpad { ptr, i32 }
          cleanup
  %43 = extractvalue { ptr, i32 } %42, 0
  store ptr %43, ptr %5, align 8
  %44 = extractvalue { ptr, i32 } %42, 1
  store i32 %44, ptr %6, align 4
  %45 = call noundef ptr @_ZN7sc_core6sc_outIiED1Ev(ptr noundef nonnull align 8 dereferenceable(120) %17) #17
  br label %46

46:                                               ; preds = %41, %37
  %47 = call noundef ptr @_ZN7sc_core5sc_inIbED1Ev(ptr noundef nonnull align 8 dereferenceable(128) %14) #17
  br label %48

48:                                               ; preds = %46, %33
  %49 = call noundef ptr @_ZN7sc_core5sc_inIbED1Ev(ptr noundef nonnull align 8 dereferenceable(128) %11) #17
  br label %50

50:                                               ; preds = %48, %29
  %51 = call noundef ptr @_ZN7sc_core9sc_moduleD2Ev(ptr noundef nonnull align 8 dereferenceable(232) %8) #17
  br label %52

52:                                               ; preds = %50
  %53 = load ptr, ptr %5, align 8
  %54 = load i32, ptr %6, align 4
  %55 = insertvalue { ptr, i32 } poison, ptr %53, 0
  %56 = insertvalue { ptr, i32 } %55, i32 %54, 1
  resume { ptr, i32 } %56
}

declare noundef ptr @_ZN7sc_core9sc_moduleC2Ev(ptr noundef nonnull returned align 8 dereferenceable(232)) unnamed_addr #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7sc_core5sc_inIbEC1Ev(ptr noundef nonnull returned align 8 dereferenceable(128) %0) unnamed_addr #2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef ptr @_ZN7sc_core5sc_inIbEC2Ev(ptr noundef nonnull align 8 dereferenceable(128) %3)
  ret ptr %3
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7sc_core6sc_outIiEC1Ev(ptr noundef nonnull returned align 8 dereferenceable(120) %0) unnamed_addr #2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef ptr @_ZN7sc_core6sc_outIiEC2Ev(ptr noundef nonnull align 8 dereferenceable(120) %3)
  ret ptr %3
}

declare void @_ZN7sc_core9sc_module22declare_method_processEMNS_15sc_process_hostEFvvEPKc(ptr noundef nonnull align 8 dereferenceable(232), [2 x i64], ptr noundef) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZN14simple_counter13count_processEv(ptr noundef nonnull align 8 dereferenceable(612) %0) #2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %struct.simple_counter, ptr %3, i32 0, i32 2
  %5 = call noundef nonnull align 1 dereferenceable(1) ptr @_ZNK7sc_core5sc_inIbE4readEv(ptr noundef nonnull align 8 dereferenceable(128) %4)
  %6 = load i8, ptr %5, align 1
  %7 = trunc i8 %6 to i1
  br i1 %7, label %8, label %10

8:                                                ; preds = %1
  %9 = getelementptr inbounds nuw %struct.simple_counter, ptr %3, i32 0, i32 4
  store i32 0, ptr %9, align 8
  br label %14

10:                                               ; preds = %1
  %11 = getelementptr inbounds nuw %struct.simple_counter, ptr %3, i32 0, i32 4
  %12 = load i32, ptr %11, align 8
  %13 = add nsw i32 %12, 1
  store i32 %13, ptr %11, align 8
  br label %14

14:                                               ; preds = %10, %8
  %15 = getelementptr inbounds nuw %struct.simple_counter, ptr %3, i32 0, i32 3
  %16 = getelementptr inbounds nuw %struct.simple_counter, ptr %3, i32 0, i32 4
  call void @_ZN7sc_core8sc_inoutIiE5writeERKi(ptr noundef nonnull align 8 dereferenceable(120) %15, ptr noundef nonnull align 4 dereferenceable(4) %16)
  %17 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne200100INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZNSt3__14coutE, ptr noundef @.str.13)
  %18 = getelementptr inbounds nuw %struct.simple_counter, ptr %3, i32 0, i32 4
  %19 = load i32, ptr %18, align 8
  %20 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEi(ptr noundef nonnull align 8 dereferenceable(8) %17, i32 noundef %19)
  %21 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsB8ne200100EPFRS3_S4_E(ptr noundef nonnull align 8 dereferenceable(8) %20, ptr noundef @_ZNSt3__14endlB8ne200100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_)
  ret void
}

declare noundef nonnull align 8 dereferenceable(24) ptr @_ZN7sc_core12sc_sensitivelsERNS_15sc_event_finderE(ptr noundef nonnull align 8 dereferenceable(24), ptr noundef nonnull align 8 dereferenceable(16)) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef nonnull align 8 dereferenceable(16) ptr @_ZNK7sc_core5sc_inIbE3posEv(ptr noundef nonnull align 8 dereferenceable(128) %0) #2 {
  %2 = alloca ptr, align 8
  %3 = alloca { i64, i64 }, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %"class.sc_core::sc_in", ptr %4, i32 0, i32 4
  store { i64, i64 } { i64 40, i64 1 }, ptr %3, align 8
  %6 = load [2 x i64], ptr %3, align 8
  %7 = call noundef nonnull align 8 dereferenceable(16) ptr @_ZN7sc_core15sc_event_finder13cached_createINS_15sc_signal_in_ifIbEEEERS0_RPS0_RKNS_12sc_port_baseEMT_KFRKNS_8sc_eventEvE(ptr noundef nonnull align 8 dereferenceable(8) %5, ptr noundef nonnull align 8 dereferenceable(64) %4, [2 x i64] %6)
  ret ptr %7
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7sc_core6sc_outIiED1Ev(ptr noundef nonnull returned align 8 dereferenceable(120) %0) unnamed_addr #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef ptr @_ZN7sc_core6sc_outIiED2Ev(ptr noundef nonnull align 8 dereferenceable(120) %3) #17
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7sc_core5sc_inIbED1Ev(ptr noundef nonnull returned align 8 dereferenceable(128) %0) unnamed_addr #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef ptr @_ZN7sc_core5sc_inIbED2Ev(ptr noundef nonnull align 8 dereferenceable(128) %3) #17
  ret ptr %3
}

; Function Attrs: nounwind
declare noundef ptr @_ZN7sc_core9sc_moduleD2Ev(ptr noundef nonnull returned align 8 dereferenceable(232)) unnamed_addr #5

declare void @_ZNK7sc_core9sc_object5printERNSt3__113basic_ostreamIcNS1_11char_traitsIcEEEE(ptr noundef nonnull align 8 dereferenceable(56), ptr noundef nonnull align 8 dereferenceable(8)) unnamed_addr #1

declare void @_ZNK7sc_core9sc_object4dumpERNSt3__113basic_ostreamIcNS1_11char_traitsIcEEEE(ptr noundef nonnull align 8 dereferenceable(56), ptr noundef nonnull align 8 dereferenceable(8)) unnamed_addr #1

declare void @_ZNK7sc_core9sc_object5traceEPNS_13sc_trace_fileE(ptr noundef nonnull align 8 dereferenceable(56), ptr noundef) unnamed_addr #1

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZNK7sc_core9sc_module4kindEv(ptr noundef nonnull align 8 dereferenceable(232) %0) unnamed_addr #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  ret ptr @.str.16
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef nonnull align 8 dereferenceable(24) ptr @_ZNK7sc_core14sc_object_host16get_child_eventsEv(ptr noundef nonnull align 8 dereferenceable(112) %0) unnamed_addr #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %"class.sc_core::sc_object_host", ptr %3, i32 0, i32 1
  ret ptr %4
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef nonnull align 8 dereferenceable(24) ptr @_ZNK7sc_core14sc_object_host17get_child_objectsEv(ptr noundef nonnull align 8 dereferenceable(112) %0) unnamed_addr #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %"class.sc_core::sc_object_host", ptr %3, i32 0, i32 2
  ret ptr %4
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr void @_ZN14simple_counterD0Ev(ptr noundef nonnull align 8 dereferenceable(612) %0) unnamed_addr #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef ptr @_ZN14simple_counterD1Ev(ptr noundef nonnull align 8 dereferenceable(612) %3) #17
  call void @_ZdlPvm(ptr noundef %3, i64 noundef 616) #19
  ret void
}

declare void @_ZN7sc_core14sc_object_host19get_hierarchy_scopeEv(ptr dead_on_unwind writable sret(%"class.sc_core::sc_hierarchy_scope") align 8, ptr noundef nonnull align 8 dereferenceable(112)) unnamed_addr #1

declare void @_ZN7sc_core14sc_object_host15add_child_eventEPNS_8sc_eventE(ptr noundef nonnull align 8 dereferenceable(112), ptr noundef) unnamed_addr #1

declare void @_ZN7sc_core14sc_object_host16add_child_objectEPNS_9sc_objectE(ptr noundef nonnull align 8 dereferenceable(112), ptr noundef) unnamed_addr #1

declare noundef zeroext i1 @_ZN7sc_core14sc_object_host18remove_child_eventEPNS_8sc_eventE(ptr noundef nonnull align 8 dereferenceable(112), ptr noundef) unnamed_addr #1

declare noundef zeroext i1 @_ZN7sc_core14sc_object_host19remove_child_objectEPNS_9sc_objectE(ptr noundef nonnull align 8 dereferenceable(112), ptr noundef) unnamed_addr #1

declare void @_ZN7sc_core9sc_module25before_end_of_elaborationEv(ptr noundef nonnull align 8 dereferenceable(232)) unnamed_addr #1

declare void @_ZN7sc_core9sc_module18end_of_elaborationEv(ptr noundef nonnull align 8 dereferenceable(232)) unnamed_addr #1

declare void @_ZN7sc_core9sc_module19start_of_simulationEv(ptr noundef nonnull align 8 dereferenceable(232)) unnamed_addr #1

declare void @_ZN7sc_core9sc_module17end_of_simulationEv(ptr noundef nonnull align 8 dereferenceable(232)) unnamed_addr #1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZThn112_N14simple_counterD1Ev(ptr noundef %0) unnamed_addr #6 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  store ptr %4, ptr %2, align 8
  %5 = getelementptr inbounds i8, ptr %4, i64 -112
  %6 = tail call noundef ptr @_ZN14simple_counterD1Ev(ptr noundef nonnull align 8 dereferenceable(612) %5) #17
  ret ptr undef
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr void @_ZThn112_N14simple_counterD0Ev(ptr noundef %0) unnamed_addr #6 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds i8, ptr %3, i64 -112
  tail call void @_ZN14simple_counterD0Ev(ptr noundef nonnull align 8 dereferenceable(612) %4) #17
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7sc_core5sc_inIbEC2Ev(ptr noundef nonnull returned align 8 dereferenceable(128) %0) unnamed_addr #2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef ptr @_ZN7sc_core7sc_portINS_15sc_signal_in_ifIbEELi1ELNS_14sc_port_policyE0EEC2Ev(ptr noundef nonnull align 8 dereferenceable(96) %3)
  store ptr getelementptr inbounds inrange(-16, 216) ({ [29 x ptr] }, ptr @_ZTVN7sc_core5sc_inIbEE, i32 0, i32 0, i32 2), ptr %3, align 8
  %5 = getelementptr inbounds nuw %"class.sc_core::sc_in", ptr %3, i32 0, i32 1
  store ptr null, ptr %5, align 8
  %6 = getelementptr inbounds nuw %"class.sc_core::sc_in", ptr %3, i32 0, i32 2
  store ptr null, ptr %6, align 8
  %7 = getelementptr inbounds nuw %"class.sc_core::sc_in", ptr %3, i32 0, i32 3
  store ptr null, ptr %7, align 8
  %8 = getelementptr inbounds nuw %"class.sc_core::sc_in", ptr %3, i32 0, i32 4
  store ptr null, ptr %8, align 8
  ret ptr %3
}

declare noundef ptr @_ZN7sc_core7sc_portINS_15sc_signal_in_ifIbEELi1ELNS_14sc_port_policyE0EEC2Ev(ptr noundef nonnull returned align 8 dereferenceable(96)) unnamed_addr #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7sc_core6sc_outIiEC2Ev(ptr noundef nonnull returned align 8 dereferenceable(120) %0) unnamed_addr #2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef ptr @_ZN7sc_core8sc_inoutIiEC2Ev(ptr noundef nonnull align 8 dereferenceable(120) %3)
  store ptr getelementptr inbounds inrange(-16, 192) ({ [26 x ptr] }, ptr @_ZTVN7sc_core6sc_outIiEE, i32 0, i32 0, i32 2), ptr %3, align 8
  ret ptr %3
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7sc_core8sc_inoutIiEC2Ev(ptr noundef nonnull returned align 8 dereferenceable(120) %0) unnamed_addr #2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef ptr @_ZN7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EEC2Ev(ptr noundef nonnull align 8 dereferenceable(96) %3)
  store ptr getelementptr inbounds inrange(-16, 192) ({ [26 x ptr] }, ptr @_ZTVN7sc_core8sc_inoutIiEE, i32 0, i32 0, i32 2), ptr %3, align 8
  %5 = getelementptr inbounds nuw %"class.sc_core::sc_inout", ptr %3, i32 0, i32 1
  store ptr null, ptr %5, align 8
  %6 = getelementptr inbounds nuw %"class.sc_core::sc_inout", ptr %3, i32 0, i32 2
  store ptr null, ptr %6, align 8
  %7 = getelementptr inbounds nuw %"class.sc_core::sc_inout", ptr %3, i32 0, i32 3
  store ptr null, ptr %7, align 8
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZNK7sc_core6sc_outIiE4kindEv(ptr noundef nonnull align 8 dereferenceable(120) %0) unnamed_addr #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  ret ptr @.str.6
}

declare noundef nonnull align 8 dereferenceable(24) ptr @_ZNK7sc_core9sc_object16get_child_eventsEv(ptr noundef nonnull align 8 dereferenceable(56)) unnamed_addr #1

declare noundef nonnull align 8 dereferenceable(24) ptr @_ZNK7sc_core9sc_object17get_child_objectsEv(ptr noundef nonnull align 8 dereferenceable(56)) unnamed_addr #1

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr void @_ZN7sc_core6sc_outIiED0Ev(ptr noundef nonnull align 8 dereferenceable(120) %0) unnamed_addr #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef ptr @_ZN7sc_core6sc_outIiED1Ev(ptr noundef nonnull align 8 dereferenceable(120) %3) #17
  call void @_ZdlPvm(ptr noundef %3, i64 noundef 120) #19
  ret void
}

declare void @_ZN7sc_core9sc_object19get_hierarchy_scopeEv(ptr dead_on_unwind writable sret(%"class.sc_core::sc_hierarchy_scope") align 8, ptr noundef nonnull align 8 dereferenceable(56)) unnamed_addr #1

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE13get_interfaceEv(ptr noundef nonnull align 8 dereferenceable(96) %0) unnamed_addr #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %"class.sc_core::sc_port_b.10", ptr %3, i32 0, i32 1
  %5 = load ptr, ptr %4, align 8
  %6 = icmp eq ptr %5, null
  br i1 %6, label %12, label %7

7:                                                ; preds = %1
  %8 = load ptr, ptr %5, align 8
  %9 = getelementptr i8, ptr %8, i64 -48
  %10 = load i64, ptr %9, align 8
  %11 = getelementptr inbounds i8, ptr %5, i64 %10
  br label %12

12:                                               ; preds = %7, %1
  %13 = phi ptr [ %11, %7 ], [ null, %1 ]
  ret ptr %13
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE13get_interfaceEv(ptr noundef nonnull align 8 dereferenceable(96) %0) unnamed_addr #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %"class.sc_core::sc_port_b.10", ptr %3, i32 0, i32 1
  %5 = load ptr, ptr %4, align 8
  %6 = icmp eq ptr %5, null
  br i1 %6, label %12, label %7

7:                                                ; preds = %1
  %8 = load ptr, ptr %5, align 8
  %9 = getelementptr i8, ptr %8, i64 -48
  %10 = load i64, ptr %9, align 8
  %11 = getelementptr inbounds i8, ptr %5, i64 %10
  br label %12

12:                                               ; preds = %7, %1
  %13 = phi ptr [ %11, %7 ], [ null, %1 ]
  ret ptr %13
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr i64 @_ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE18get_interface_typeEv(ptr noundef nonnull align 8 dereferenceable(96) %0) unnamed_addr #4 {
  %2 = alloca %"class.std::__1::type_index", align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = call noundef ptr @_ZNSt3__110type_indexC1B8ne200100ERKSt9type_info(ptr noundef nonnull align 8 dereferenceable(8) %2, ptr noundef nonnull align 8 dereferenceable(16) @_ZTIN7sc_core18sc_signal_inout_ifIiEE) #17
  %6 = getelementptr inbounds nuw %"class.std::__1::type_index", ptr %2, i32 0, i32 0
  %7 = load ptr, ptr %6, align 8
  %8 = ptrtoint ptr %7 to i64
  ret i64 %8
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef i32 @_ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE5vbindERNS_12sc_interfaceE(ptr noundef nonnull align 8 dereferenceable(96) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) unnamed_addr #2 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load ptr, ptr %5, align 8
  %9 = icmp eq ptr %8, null
  br i1 %9, label %12, label %10

10:                                               ; preds = %2
  %11 = call ptr @__dynamic_cast(ptr %8, ptr @_ZTIN7sc_core12sc_interfaceE, ptr @_ZTIN7sc_core18sc_signal_inout_ifIiEE, i64 -1) #17
  br label %13

12:                                               ; preds = %2
  br label %13

13:                                               ; preds = %12, %10
  %14 = phi ptr [ %11, %10 ], [ null, %12 ]
  store ptr %14, ptr %6, align 8
  %15 = load ptr, ptr %6, align 8
  %16 = icmp eq ptr %15, null
  br i1 %16, label %17, label %18

17:                                               ; preds = %13
  store i32 2, ptr %3, align 4
  br label %24

18:                                               ; preds = %13
  %19 = load ptr, ptr %6, align 8
  %20 = load ptr, ptr %19, align 8
  %21 = getelementptr i8, ptr %20, i64 -48
  %22 = load i64, ptr %21, align 8
  %23 = getelementptr inbounds i8, ptr %19, i64 %22
  call void @_ZN7sc_core12sc_port_base4bindERNS_12sc_interfaceE(ptr noundef nonnull align 8 dereferenceable(64) %7, ptr noundef nonnull align 8 dereferenceable(8) %23)
  store i32 0, ptr %3, align 4
  br label %24

24:                                               ; preds = %18, %17
  %25 = load i32, ptr %3, align 4
  ret i32 %25
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef i32 @_ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE5vbindERNS_12sc_port_baseE(ptr noundef nonnull align 8 dereferenceable(96) %0, ptr noundef nonnull align 8 dereferenceable(64) %1) unnamed_addr #2 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load ptr, ptr %5, align 8
  %9 = icmp eq ptr %8, null
  br i1 %9, label %12, label %10

10:                                               ; preds = %2
  %11 = call ptr @__dynamic_cast(ptr %8, ptr @_ZTIN7sc_core12sc_port_baseE, ptr @_ZTIN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEEE, i64 0) #17
  br label %13

12:                                               ; preds = %2
  br label %13

13:                                               ; preds = %12, %10
  %14 = phi ptr [ %11, %10 ], [ null, %12 ]
  store ptr %14, ptr %6, align 8
  %15 = load ptr, ptr %6, align 8
  %16 = icmp eq ptr %15, null
  br i1 %16, label %17, label %18

17:                                               ; preds = %13
  store i32 2, ptr %3, align 4
  br label %20

18:                                               ; preds = %13
  %19 = load ptr, ptr %6, align 8
  call void @_ZN7sc_core12sc_port_base4bindERS0_(ptr noundef nonnull align 8 dereferenceable(64) %7, ptr noundef nonnull align 8 dereferenceable(64) %19)
  store i32 0, ptr %3, align 4
  br label %20

20:                                               ; preds = %18, %17
  %21 = load i32, ptr %3, align 4
  ret i32 %21
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE13add_interfaceEPNS_12sc_interfaceE(ptr noundef nonnull align 8 dereferenceable(96) %0, ptr noundef %1) unnamed_addr #2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = load ptr, ptr %4, align 8
  %10 = icmp eq ptr %9, null
  br i1 %10, label %13, label %11

11:                                               ; preds = %2
  %12 = call ptr @__dynamic_cast(ptr %9, ptr @_ZTIN7sc_core12sc_interfaceE, ptr @_ZTIN7sc_core18sc_signal_inout_ifIiEE, i64 -1) #17
  br label %14

13:                                               ; preds = %2
  br label %14

14:                                               ; preds = %13, %11
  %15 = phi ptr [ %12, %11 ], [ null, %13 ]
  store ptr %15, ptr %5, align 8
  %16 = load ptr, ptr %5, align 8
  %17 = icmp ne ptr %16, null
  br i1 %17, label %18, label %19

18:                                               ; preds = %14
  br label %21

19:                                               ; preds = %14
  call void @_ZN7sc_core19sc_assertion_failedEPKcS1_i(ptr noundef @.str.7, ptr noundef @.str.8, i32 noundef 548) #20
  unreachable

20:                                               ; No predecessors!
  br label %21

21:                                               ; preds = %20, %18
  %22 = phi i32 [ 0, %18 ], [ 0, %20 ]
  %23 = call noundef i32 @_ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE4sizeEv(ptr noundef nonnull align 8 dereferenceable(96) %8)
  store i32 %23, ptr %6, align 4
  store i32 0, ptr %7, align 4
  br label %24

24:                                               ; preds = %38, %21
  %25 = load i32, ptr %7, align 4
  %26 = load i32, ptr %6, align 4
  %27 = icmp slt i32 %25, %26
  br i1 %27, label %28, label %41

28:                                               ; preds = %24
  %29 = load ptr, ptr %5, align 8
  %30 = getelementptr inbounds nuw %"class.sc_core::sc_port_b.10", ptr %8, i32 0, i32 2
  %31 = load i32, ptr %7, align 4
  %32 = sext i32 %31 to i64
  %33 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) %30, i64 noundef %32) #17
  %34 = load ptr, ptr %33, align 8
  %35 = icmp eq ptr %29, %34
  br i1 %35, label %36, label %37

36:                                               ; preds = %28
  call void @_ZNK7sc_core12sc_port_base12report_errorEPKcS2_(ptr noundef nonnull align 8 dereferenceable(64) %8, ptr noundef @_ZN7sc_core22SC_ID_BIND_IF_TO_PORT_E, ptr noundef @.str.9)
  br label %37

37:                                               ; preds = %36, %28
  br label %38

38:                                               ; preds = %37
  %39 = load i32, ptr %7, align 4
  %40 = add nsw i32 %39, 1
  store i32 %40, ptr %7, align 4
  br label %24, !llvm.loop !6

41:                                               ; preds = %24
  %42 = getelementptr inbounds nuw %"class.sc_core::sc_port_b.10", ptr %8, i32 0, i32 2
  call void @_ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE9push_backB8ne200100ERKS4_(ptr noundef nonnull align 8 dereferenceable(24) %42, ptr noundef nonnull align 8 dereferenceable(8) %5)
  %43 = getelementptr inbounds nuw %"class.sc_core::sc_port_b.10", ptr %8, i32 0, i32 2
  %44 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) %43, i64 noundef 0) #17
  %45 = load ptr, ptr %44, align 8
  %46 = getelementptr inbounds nuw %"class.sc_core::sc_port_b.10", ptr %8, i32 0, i32 1
  store ptr %45, ptr %46, align 8
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef i32 @_ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE15interface_countEv(ptr noundef nonnull align 8 dereferenceable(96) %0) unnamed_addr #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef i32 @_ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE4sizeEv(ptr noundef nonnull align 8 dereferenceable(96) %3)
  ret i32 %4
}

declare void @_ZN7sc_core12sc_port_base25before_end_of_elaborationEv(ptr noundef nonnull align 8 dereferenceable(64)) unnamed_addr #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZN7sc_core8sc_inoutIiE18end_of_elaborationEv(ptr noundef nonnull align 8 dereferenceable(120) %0) unnamed_addr #2 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds nuw %"class.sc_core::sc_inout", ptr %6, i32 0, i32 1
  %8 = load ptr, ptr %7, align 8
  %9 = icmp ne ptr %8, null
  br i1 %9, label %10, label %19

10:                                               ; preds = %1
  %11 = getelementptr inbounds nuw %"class.sc_core::sc_inout", ptr %6, i32 0, i32 1
  %12 = load ptr, ptr %11, align 8
  call void @_ZN7sc_core8sc_inoutIiE5writeERKi(ptr noundef nonnull align 8 dereferenceable(120) %6, ptr noundef nonnull align 4 dereferenceable(4) %12)
  %13 = getelementptr inbounds nuw %"class.sc_core::sc_inout", ptr %6, i32 0, i32 1
  %14 = load ptr, ptr %13, align 8
  %15 = icmp eq ptr %14, null
  br i1 %15, label %17, label %16

16:                                               ; preds = %10
  call void @_ZdlPvm(ptr noundef %14, i64 noundef 4) #19
  br label %17

17:                                               ; preds = %16, %10
  %18 = getelementptr inbounds nuw %"class.sc_core::sc_inout", ptr %6, i32 0, i32 1
  store ptr null, ptr %18, align 8
  br label %19

19:                                               ; preds = %17, %1
  %20 = getelementptr inbounds nuw %"class.sc_core::sc_inout", ptr %6, i32 0, i32 2
  %21 = load ptr, ptr %20, align 8
  %22 = icmp ne ptr %21, null
  br i1 %22, label %23, label %62

23:                                               ; preds = %19
  store i32 0, ptr %3, align 4
  br label %24

24:                                               ; preds = %58, %23
  %25 = load i32, ptr %3, align 4
  %26 = getelementptr inbounds nuw %"class.sc_core::sc_inout", ptr %6, i32 0, i32 2
  %27 = load ptr, ptr %26, align 8
  %28 = call noundef i64 @_ZNKSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE4sizeB8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(24) %27) #17
  %29 = trunc i64 %28 to i32
  %30 = icmp slt i32 %25, %29
  br i1 %30, label %31, label %61

31:                                               ; preds = %24
  %32 = getelementptr inbounds nuw %"class.sc_core::sc_inout", ptr %6, i32 0, i32 2
  %33 = load ptr, ptr %32, align 8
  %34 = load i32, ptr %3, align 4
  %35 = sext i32 %34 to i64
  %36 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) %33, i64 noundef %35) #17
  %37 = load ptr, ptr %36, align 8
  store ptr %37, ptr %4, align 8
  %38 = load ptr, ptr %6, align 8
  %39 = getelementptr inbounds ptr, ptr %38, i64 9
  %40 = load ptr, ptr %39, align 8
  %41 = call noundef ptr %40(ptr noundef nonnull align 8 dereferenceable(96) %6)
  %42 = icmp eq ptr %41, null
  br i1 %42, label %45, label %43

43:                                               ; preds = %31
  %44 = call ptr @__dynamic_cast(ptr %41, ptr @_ZTIN7sc_core12sc_interfaceE, ptr @_ZTIN7sc_core15sc_signal_in_ifIiEE, i64 -1) #17
  br label %46

45:                                               ; preds = %31
  br label %46

46:                                               ; preds = %45, %43
  %47 = phi ptr [ %44, %43 ], [ null, %45 ]
  store ptr %47, ptr %5, align 8
  %48 = load ptr, ptr %4, align 8
  %49 = getelementptr inbounds nuw %"struct.sc_core::sc_trace_params", ptr %48, i32 0, i32 0
  %50 = load ptr, ptr %49, align 8
  %51 = load ptr, ptr %5, align 8
  %52 = load ptr, ptr %51, align 8
  %53 = getelementptr inbounds ptr, ptr %52, i64 5
  %54 = load ptr, ptr %53, align 8
  %55 = call noundef nonnull align 4 dereferenceable(4) ptr %54(ptr noundef nonnull align 8 dereferenceable(8) %51)
  %56 = load ptr, ptr %4, align 8
  %57 = getelementptr inbounds nuw %"struct.sc_core::sc_trace_params", ptr %56, i32 0, i32 1
  call void @_ZN7sc_core8sc_traceEPNS_13sc_trace_fileERKiRKNSt3__112basic_stringIcNS4_11char_traitsIcEENS4_9allocatorIcEEEEi(ptr noundef %50, ptr noundef nonnull align 4 dereferenceable(4) %55, ptr noundef nonnull align 8 dereferenceable(24) %57, i32 noundef 32)
  br label %58

58:                                               ; preds = %46
  %59 = load i32, ptr %3, align 4
  %60 = add nsw i32 %59, 1
  store i32 %60, ptr %3, align 4
  br label %24, !llvm.loop !8

61:                                               ; preds = %24
  call void @_ZNK7sc_core8sc_inoutIiE13remove_tracesEv(ptr noundef nonnull align 8 dereferenceable(120) %6)
  br label %62

62:                                               ; preds = %61, %19
  ret void
}

declare void @_ZN7sc_core12sc_port_base19start_of_simulationEv(ptr noundef nonnull align 8 dereferenceable(64)) unnamed_addr #1

declare void @_ZN7sc_core12sc_port_base17end_of_simulationEv(ptr noundef nonnull align 8 dereferenceable(64)) unnamed_addr #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE14make_sensitiveEPNS_17sc_thread_processEPNS_15sc_event_finderE(ptr noundef nonnull align 8 dereferenceable(96) %0, ptr noundef %1, ptr noundef %2) unnamed_addr #2 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %10 = load ptr, ptr %4, align 8
  %11 = getelementptr inbounds nuw %"class.sc_core::sc_port_base", ptr %10, i32 0, i32 1
  %12 = load ptr, ptr %11, align 8
  %13 = icmp eq ptr %12, null
  br i1 %13, label %14, label %47

14:                                               ; preds = %3
  %15 = call noundef i32 @_ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE4sizeEv(ptr noundef nonnull align 8 dereferenceable(96) %10)
  store i32 %15, ptr %7, align 4
  store i32 0, ptr %8, align 4
  br label %16

16:                                               ; preds = %43, %14
  %17 = load i32, ptr %8, align 4
  %18 = load i32, ptr %7, align 4
  %19 = icmp slt i32 %17, %18
  br i1 %19, label %20, label %46

20:                                               ; preds = %16
  %21 = getelementptr inbounds nuw %"class.sc_core::sc_port_b.10", ptr %10, i32 0, i32 2
  %22 = load i32, ptr %8, align 4
  %23 = sext i32 %22 to i64
  %24 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) %21, i64 noundef %23) #17
  %25 = load ptr, ptr %24, align 8
  store ptr %25, ptr %9, align 8
  %26 = load ptr, ptr %9, align 8
  %27 = icmp ne ptr %26, null
  br i1 %27, label %28, label %29

28:                                               ; preds = %20
  br label %31

29:                                               ; preds = %20
  call void @_ZN7sc_core19sc_assertion_failedEPKcS1_i(ptr noundef @.str.12, ptr noundef @.str.8, i32 noundef 596) #20
  unreachable

30:                                               ; No predecessors!
  br label %31

31:                                               ; preds = %30, %28
  %32 = phi i32 [ 0, %28 ], [ 0, %30 ]
  %33 = load ptr, ptr %5, align 8
  %34 = load ptr, ptr %9, align 8
  %35 = load ptr, ptr %34, align 8
  %36 = getelementptr i8, ptr %35, i64 -48
  %37 = load i64, ptr %36, align 8
  %38 = getelementptr inbounds i8, ptr %34, i64 %37
  %39 = load ptr, ptr %38, align 8
  %40 = getelementptr inbounds ptr, ptr %39, i64 1
  %41 = load ptr, ptr %40, align 8
  %42 = call noundef nonnull align 8 dereferenceable(160) ptr %41(ptr noundef nonnull align 8 dereferenceable(8) %38)
  call void @_ZNK7sc_core12sc_port_base16add_static_eventEPNS_17sc_thread_processERKNS_8sc_eventE(ptr noundef nonnull align 8 dereferenceable(64) %10, ptr noundef %33, ptr noundef nonnull align 8 dereferenceable(160) %42)
  br label %43

43:                                               ; preds = %31
  %44 = load i32, ptr %8, align 4
  %45 = add nsw i32 %44, 1
  store i32 %45, ptr %8, align 4
  br label %16, !llvm.loop !9

46:                                               ; preds = %16
  br label %50

47:                                               ; preds = %3
  %48 = load ptr, ptr %5, align 8
  %49 = load ptr, ptr %6, align 8
  call void @_ZNK7sc_core12sc_port_base14make_sensitiveEPNS_17sc_thread_processEPNS_15sc_event_finderE(ptr noundef nonnull align 8 dereferenceable(64) %10, ptr noundef %48, ptr noundef %49)
  br label %50

50:                                               ; preds = %47, %46
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE14make_sensitiveEPNS_17sc_method_processEPNS_15sc_event_finderE(ptr noundef nonnull align 8 dereferenceable(96) %0, ptr noundef %1, ptr noundef %2) unnamed_addr #2 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %10 = load ptr, ptr %4, align 8
  %11 = getelementptr inbounds nuw %"class.sc_core::sc_port_base", ptr %10, i32 0, i32 1
  %12 = load ptr, ptr %11, align 8
  %13 = icmp eq ptr %12, null
  br i1 %13, label %14, label %47

14:                                               ; preds = %3
  %15 = call noundef i32 @_ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE4sizeEv(ptr noundef nonnull align 8 dereferenceable(96) %10)
  store i32 %15, ptr %7, align 4
  store i32 0, ptr %8, align 4
  br label %16

16:                                               ; preds = %43, %14
  %17 = load i32, ptr %8, align 4
  %18 = load i32, ptr %7, align 4
  %19 = icmp slt i32 %17, %18
  br i1 %19, label %20, label %46

20:                                               ; preds = %16
  %21 = getelementptr inbounds nuw %"class.sc_core::sc_port_b.10", ptr %10, i32 0, i32 2
  %22 = load i32, ptr %8, align 4
  %23 = sext i32 %22 to i64
  %24 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) %21, i64 noundef %23) #17
  %25 = load ptr, ptr %24, align 8
  store ptr %25, ptr %9, align 8
  %26 = load ptr, ptr %9, align 8
  %27 = icmp ne ptr %26, null
  br i1 %27, label %28, label %29

28:                                               ; preds = %20
  br label %31

29:                                               ; preds = %20
  call void @_ZN7sc_core19sc_assertion_failedEPKcS1_i(ptr noundef @.str.12, ptr noundef @.str.8, i32 noundef 617) #20
  unreachable

30:                                               ; No predecessors!
  br label %31

31:                                               ; preds = %30, %28
  %32 = phi i32 [ 0, %28 ], [ 0, %30 ]
  %33 = load ptr, ptr %5, align 8
  %34 = load ptr, ptr %9, align 8
  %35 = load ptr, ptr %34, align 8
  %36 = getelementptr i8, ptr %35, i64 -48
  %37 = load i64, ptr %36, align 8
  %38 = getelementptr inbounds i8, ptr %34, i64 %37
  %39 = load ptr, ptr %38, align 8
  %40 = getelementptr inbounds ptr, ptr %39, i64 1
  %41 = load ptr, ptr %40, align 8
  %42 = call noundef nonnull align 8 dereferenceable(160) ptr %41(ptr noundef nonnull align 8 dereferenceable(8) %38)
  call void @_ZNK7sc_core12sc_port_base16add_static_eventEPNS_17sc_method_processERKNS_8sc_eventE(ptr noundef nonnull align 8 dereferenceable(64) %10, ptr noundef %33, ptr noundef nonnull align 8 dereferenceable(160) %42)
  br label %43

43:                                               ; preds = %31
  %44 = load i32, ptr %8, align 4
  %45 = add nsw i32 %44, 1
  store i32 %45, ptr %8, align 4
  br label %16, !llvm.loop !10

46:                                               ; preds = %16
  br label %50

47:                                               ; preds = %3
  %48 = load ptr, ptr %5, align 8
  %49 = load ptr, ptr %6, align 8
  call void @_ZNK7sc_core12sc_port_base14make_sensitiveEPNS_17sc_method_processEPNS_15sc_event_finderE(ptr noundef nonnull align 8 dereferenceable(64) %10, ptr noundef %48, ptr noundef %49)
  br label %50

50:                                               ; preds = %47, %46
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE4bindERS2_(ptr noundef nonnull align 8 dereferenceable(96) %0, ptr noundef nonnull align 8 dereferenceable(16) %1) unnamed_addr #2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = load ptr, ptr %6, align 8
  %8 = getelementptr i8, ptr %7, i64 -48
  %9 = load i64, ptr %8, align 8
  %10 = getelementptr inbounds i8, ptr %6, i64 %9
  call void @_ZN7sc_core12sc_port_base4bindERNS_12sc_interfaceE(ptr noundef nonnull align 8 dereferenceable(64) %5, ptr noundef nonnull align 8 dereferenceable(8) %10)
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE4bindERS3_(ptr noundef nonnull align 8 dereferenceable(96) %0, ptr noundef nonnull align 8 dereferenceable(96) %1) unnamed_addr #2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  call void @_ZN7sc_core12sc_port_base4bindERS0_(ptr noundef nonnull align 8 dereferenceable(64) %5, ptr noundef nonnull align 8 dereferenceable(64) %6)
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EEC2Ev(ptr noundef nonnull returned align 8 dereferenceable(96) %0) unnamed_addr #2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef ptr @_ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEEC2EiNS_14sc_port_policyE(ptr noundef nonnull align 8 dereferenceable(96) %3, i32 noundef 1, i32 noundef 0)
  store ptr getelementptr inbounds inrange(-16, 192) ({ [26 x ptr] }, ptr @_ZTVN7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EEE, i32 0, i32 0, i32 2), ptr %3, align 8
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZNK7sc_core8sc_inoutIiE4kindEv(ptr noundef nonnull align 8 dereferenceable(120) %0) unnamed_addr #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  ret ptr @.str.5
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7sc_core8sc_inoutIiED1Ev(ptr noundef nonnull returned align 8 dereferenceable(120) %0) unnamed_addr #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef ptr @_ZN7sc_core8sc_inoutIiED2Ev(ptr noundef nonnull align 8 dereferenceable(120) %3) #17
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr void @_ZN7sc_core8sc_inoutIiED0Ev(ptr noundef nonnull align 8 dereferenceable(120) %0) unnamed_addr #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef ptr @_ZN7sc_core8sc_inoutIiED1Ev(ptr noundef nonnull align 8 dereferenceable(120) %3) #17
  call void @_ZdlPvm(ptr noundef %3, i64 noundef 120) #19
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEEC2EiNS_14sc_port_policyE(ptr noundef nonnull returned align 8 dereferenceable(96) %0, i32 noundef %1, i32 noundef %2) unnamed_addr #2 {
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  %7 = load ptr, ptr %4, align 8
  %8 = load i32, ptr %5, align 4
  %9 = load i32, ptr %6, align 4
  %10 = call noundef ptr @_ZN7sc_core12sc_port_baseC2EiNS_14sc_port_policyE(ptr noundef nonnull align 8 dereferenceable(64) %7, i32 noundef %8, i32 noundef %9)
  store ptr getelementptr inbounds inrange(-16, 192) ({ [26 x ptr] }, ptr @_ZTVN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEEE, i32 0, i32 0, i32 2), ptr %7, align 8
  %11 = getelementptr inbounds nuw %"class.sc_core::sc_port_b.10", ptr %7, i32 0, i32 1
  store ptr null, ptr %11, align 8
  %12 = getelementptr inbounds nuw %"class.sc_core::sc_port_b.10", ptr %7, i32 0, i32 2
  %13 = call noundef ptr @_ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEEC1B8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(24) %12) #17
  ret ptr %7
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZNK7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EE4kindEv(ptr noundef nonnull align 8 dereferenceable(96) %0) unnamed_addr #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  ret ptr @.str.4
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EED1Ev(ptr noundef nonnull returned align 8 dereferenceable(96) %0) unnamed_addr #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef ptr @_ZN7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EED2Ev(ptr noundef nonnull align 8 dereferenceable(96) %3) #17
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr void @_ZN7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EED0Ev(ptr noundef nonnull align 8 dereferenceable(96) %0) unnamed_addr #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef ptr @_ZN7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EED1Ev(ptr noundef nonnull align 8 dereferenceable(96) %3) #17
  call void @_ZdlPvm(ptr noundef %3, i64 noundef 96) #19
  ret void
}

declare void @_ZN7sc_core12sc_port_base18end_of_elaborationEv(ptr noundef nonnull align 8 dereferenceable(64)) unnamed_addr #1

declare noundef ptr @_ZN7sc_core12sc_port_baseC2EiNS_14sc_port_policyE(ptr noundef nonnull returned align 8 dereferenceable(64), i32 noundef, i32 noundef) unnamed_addr #1

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEEC1B8ne200100Ev(ptr noundef nonnull returned align 8 dereferenceable(24) %0) unnamed_addr #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef ptr @_ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEEC2B8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(24) %3) #17
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZNK7sc_core12sc_port_base4kindEv(ptr noundef nonnull align 8 dereferenceable(64) %0) unnamed_addr #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  ret ptr @.str.3
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEED1Ev(ptr noundef nonnull returned align 8 dereferenceable(96) %0) unnamed_addr #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef ptr @_ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEED2Ev(ptr noundef nonnull align 8 dereferenceable(96) %3) #17
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr void @_ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEED0Ev(ptr noundef nonnull align 8 dereferenceable(96) %0) unnamed_addr #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef ptr @_ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEED1Ev(ptr noundef nonnull align 8 dereferenceable(96) %3) #17
  call void @_ZdlPvm(ptr noundef %3, i64 noundef 96) #19
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEEC2B8ne200100Ev(ptr noundef nonnull returned align 8 dereferenceable(24) %0) unnamed_addr #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %"class.std::__1::vector.11", ptr %3, i32 0, i32 0
  store ptr null, ptr %4, align 8
  %5 = getelementptr inbounds nuw %"class.std::__1::vector.11", ptr %3, i32 0, i32 1
  store ptr null, ptr %5, align 8
  %6 = getelementptr inbounds nuw %"class.std::__1::vector.11", ptr %3, i32 0, i32 2
  store ptr null, ptr %6, align 8
  %7 = call noundef ptr @_ZNSt3__19allocatorIPN7sc_core18sc_signal_inout_ifIiEEEC1B8ne200100Ev(ptr noundef nonnull align 1 dereferenceable(1) %3) #17
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__19allocatorIPN7sc_core18sc_signal_inout_ifIiEEEC1B8ne200100Ev(ptr noundef nonnull returned align 1 dereferenceable(1) %0) unnamed_addr #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef ptr @_ZNSt3__19allocatorIPN7sc_core18sc_signal_inout_ifIiEEEC2B8ne200100Ev(ptr noundef nonnull align 1 dereferenceable(1) %3) #17
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__19allocatorIPN7sc_core18sc_signal_inout_ifIiEEEC2B8ne200100Ev(ptr noundef nonnull returned align 1 dereferenceable(1) %0) unnamed_addr #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef ptr @_ZNSt3__116__non_trivial_ifILb1ENS_9allocatorIPN7sc_core18sc_signal_inout_ifIiEEEEEC2B8ne200100Ev(ptr noundef nonnull align 1 dereferenceable(1) %3) #17
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__116__non_trivial_ifILb1ENS_9allocatorIPN7sc_core18sc_signal_inout_ifIiEEEEEC2B8ne200100Ev(ptr noundef nonnull returned align 1 dereferenceable(1) %0) unnamed_addr #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEED2Ev(ptr noundef nonnull returned align 8 dereferenceable(96) %0) unnamed_addr #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  store ptr getelementptr inbounds inrange(-16, 192) ({ [26 x ptr] }, ptr @_ZTVN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEEE, i32 0, i32 0, i32 2), ptr %3, align 8
  %4 = getelementptr inbounds nuw %"class.sc_core::sc_port_b.10", ptr %3, i32 0, i32 2
  %5 = call noundef ptr @_ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEED1B8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(24) %4) #17
  %6 = call noundef ptr @_ZN7sc_core12sc_port_baseD2Ev(ptr noundef nonnull align 8 dereferenceable(64) %3) #17
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEED1B8ne200100Ev(ptr noundef nonnull returned align 8 dereferenceable(24) %0) unnamed_addr #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef ptr @_ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEED2B8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(24) %3) #17
  ret ptr %3
}

; Function Attrs: nounwind
declare noundef ptr @_ZN7sc_core12sc_port_baseD2Ev(ptr noundef nonnull returned align 8 dereferenceable(64)) unnamed_addr #5

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEED2B8ne200100Ev(ptr noundef nonnull returned align 8 dereferenceable(24) %0) unnamed_addr #4 personality ptr @__gxx_personality_v0 {
  %2 = alloca ptr, align 8
  %3 = alloca %"class.std::__1::vector<sc_core::sc_signal_inout_if<int> *>::__destroy_vector", align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = invoke noundef ptr @_ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE16__destroy_vectorC1B8ne200100ERS7_(ptr noundef nonnull align 8 dereferenceable(8) %3, ptr noundef nonnull align 8 dereferenceable(24) %4)
          to label %6 unwind label %8

6:                                                ; preds = %1
  invoke void @_ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE16__destroy_vectorclB8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(8) %3)
          to label %7 unwind label %8

7:                                                ; preds = %6
  ret ptr %4

8:                                                ; preds = %6, %1
  %9 = landingpad { ptr, i32 }
          catch ptr null
  %10 = extractvalue { ptr, i32 } %9, 0
  call void @__clang_call_terminate(ptr %10) #18
  unreachable
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE16__destroy_vectorC1B8ne200100ERS7_(ptr noundef nonnull returned align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(24) %1) unnamed_addr #2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = call noundef ptr @_ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE16__destroy_vectorC2B8ne200100ERS7_(ptr noundef nonnull align 8 dereferenceable(8) %5, ptr noundef nonnull align 8 dereferenceable(24) %6)
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE16__destroy_vectorclB8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %"class.std::__1::vector<sc_core::sc_signal_inout_if<int> *>::__destroy_vector", ptr %3, i32 0, i32 0
  %5 = load ptr, ptr %4, align 8
  %6 = getelementptr inbounds nuw %"class.std::__1::vector.11", ptr %5, i32 0, i32 0
  %7 = load ptr, ptr %6, align 8
  %8 = icmp ne ptr %7, null
  br i1 %8, label %9, label %23

9:                                                ; preds = %1
  %10 = getelementptr inbounds nuw %"class.std::__1::vector<sc_core::sc_signal_inout_if<int> *>::__destroy_vector", ptr %3, i32 0, i32 0
  %11 = load ptr, ptr %10, align 8
  call void @_ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE5clearB8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(24) %11) #17
  %12 = getelementptr inbounds nuw %"class.std::__1::vector<sc_core::sc_signal_inout_if<int> *>::__destroy_vector", ptr %3, i32 0, i32 0
  %13 = load ptr, ptr %12, align 8
  call void @_ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE17__annotate_deleteB8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(24) %13) #17
  %14 = getelementptr inbounds nuw %"class.std::__1::vector<sc_core::sc_signal_inout_if<int> *>::__destroy_vector", ptr %3, i32 0, i32 0
  %15 = load ptr, ptr %14, align 8
  %16 = getelementptr inbounds nuw %"class.std::__1::vector<sc_core::sc_signal_inout_if<int> *>::__destroy_vector", ptr %3, i32 0, i32 0
  %17 = load ptr, ptr %16, align 8
  %18 = getelementptr inbounds nuw %"class.std::__1::vector.11", ptr %17, i32 0, i32 0
  %19 = load ptr, ptr %18, align 8
  %20 = getelementptr inbounds nuw %"class.std::__1::vector<sc_core::sc_signal_inout_if<int> *>::__destroy_vector", ptr %3, i32 0, i32 0
  %21 = load ptr, ptr %20, align 8
  %22 = call noundef i64 @_ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE8capacityB8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(24) %21) #17
  call void @_ZNSt3__116allocator_traitsINS_9allocatorIPN7sc_core18sc_signal_inout_ifIiEEEEE10deallocateB8ne200100ERS6_PS5_m(ptr noundef nonnull align 1 dereferenceable(1) %15, ptr noundef %19, i64 noundef %22) #17
  br label %23

23:                                               ; preds = %9, %1
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE16__destroy_vectorC2B8ne200100ERS7_(ptr noundef nonnull returned align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(24) %1) unnamed_addr #4 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds nuw %"class.std::__1::vector<sc_core::sc_signal_inout_if<int> *>::__destroy_vector", ptr %5, i32 0, i32 0
  %7 = load ptr, ptr %4, align 8
  store ptr %7, ptr %6, align 8
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE5clearB8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #4 {
  %2 = alloca ptr, align 8
  %3 = alloca i64, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = call noundef i64 @_ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE4sizeB8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(24) %4) #17
  store i64 %5, ptr %3, align 8
  %6 = getelementptr inbounds nuw %"class.std::__1::vector.11", ptr %4, i32 0, i32 0
  %7 = load ptr, ptr %6, align 8
  call void @_ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE22__base_destruct_at_endB8ne200100EPS4_(ptr noundef nonnull align 8 dereferenceable(24) %4, ptr noundef %7) #17
  %8 = load i64, ptr %3, align 8
  call void @_ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE17__annotate_shrinkB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) %4, i64 noundef %8) #17
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE17__annotate_deleteB8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__116allocator_traitsINS_9allocatorIPN7sc_core18sc_signal_inout_ifIiEEEEE10deallocateB8ne200100ERS6_PS5_m(ptr noundef nonnull align 1 dereferenceable(1) %0, ptr noundef %1, i64 noundef %2) #4 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i64 %2, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load ptr, ptr %5, align 8
  %9 = load i64, ptr %6, align 8
  call void @_ZNSt3__19allocatorIPN7sc_core18sc_signal_inout_ifIiEEE10deallocateB8ne200100EPS4_m(ptr noundef nonnull align 1 dereferenceable(1) %7, ptr noundef %8, i64 noundef %9) #17
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef i64 @_ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE8capacityB8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %"class.std::__1::vector.11", ptr %3, i32 0, i32 2
  %5 = load ptr, ptr %4, align 8
  %6 = getelementptr inbounds nuw %"class.std::__1::vector.11", ptr %3, i32 0, i32 0
  %7 = load ptr, ptr %6, align 8
  %8 = ptrtoint ptr %5 to i64
  %9 = ptrtoint ptr %7 to i64
  %10 = sub i64 %8, %9
  %11 = sdiv exact i64 %10, 8
  ret i64 %11
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef i64 @_ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE4sizeB8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %"class.std::__1::vector.11", ptr %3, i32 0, i32 1
  %5 = load ptr, ptr %4, align 8
  %6 = getelementptr inbounds nuw %"class.std::__1::vector.11", ptr %3, i32 0, i32 0
  %7 = load ptr, ptr %6, align 8
  %8 = ptrtoint ptr %5 to i64
  %9 = ptrtoint ptr %7 to i64
  %10 = sub i64 %8, %9
  %11 = sdiv exact i64 %10, 8
  ret i64 %11
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE22__base_destruct_at_endB8ne200100EPS4_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %1) #4 personality ptr @__gxx_personality_v0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = getelementptr inbounds nuw %"class.std::__1::vector.11", ptr %6, i32 0, i32 1
  %8 = load ptr, ptr %7, align 8
  store ptr %8, ptr %5, align 8
  br label %9

9:                                                ; preds = %17, %2
  %10 = load ptr, ptr %4, align 8
  %11 = load ptr, ptr %5, align 8
  %12 = icmp ne ptr %10, %11
  br i1 %12, label %13, label %18

13:                                               ; preds = %9
  %14 = load ptr, ptr %5, align 8
  %15 = getelementptr inbounds ptr, ptr %14, i32 -1
  store ptr %15, ptr %5, align 8
  %16 = call noundef ptr @_ZNSt3__112__to_addressB8ne200100IPN7sc_core18sc_signal_inout_ifIiEEEEPT_S6_(ptr noundef %15) #17
  invoke void @_ZNSt3__116allocator_traitsINS_9allocatorIPN7sc_core18sc_signal_inout_ifIiEEEEE7destroyB8ne200100IS5_TnNS_9enable_ifIXsr13__has_destroyIS6_PT_EE5valueEiE4typeELi0EEEvRS6_SB_(ptr noundef nonnull align 1 dereferenceable(1) %6, ptr noundef %16)
          to label %17 unwind label %21

17:                                               ; preds = %13
  br label %9, !llvm.loop !11

18:                                               ; preds = %9
  %19 = load ptr, ptr %4, align 8
  %20 = getelementptr inbounds nuw %"class.std::__1::vector.11", ptr %6, i32 0, i32 1
  store ptr %19, ptr %20, align 8
  ret void

21:                                               ; preds = %13
  %22 = landingpad { ptr, i32 }
          catch ptr null
  %23 = extractvalue { ptr, i32 } %22, 0
  call void @__clang_call_terminate(ptr %23) #18
  unreachable
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE17__annotate_shrinkB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %1) #4 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZNSt3__116allocator_traitsINS_9allocatorIPN7sc_core18sc_signal_inout_ifIiEEEEE7destroyB8ne200100IS5_TnNS_9enable_ifIXsr13__has_destroyIS6_PT_EE5valueEiE4typeELi0EEEvRS6_SB_(ptr noundef nonnull align 1 dereferenceable(1) %0, ptr noundef %1) #2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  call void @_ZNSt3__19allocatorIPN7sc_core18sc_signal_inout_ifIiEEE7destroyB8ne200100EPS4_(ptr noundef nonnull align 1 dereferenceable(1) %5, ptr noundef %6)
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__112__to_addressB8ne200100IPN7sc_core18sc_signal_inout_ifIiEEEEPT_S6_(ptr noundef %0) #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__19allocatorIPN7sc_core18sc_signal_inout_ifIiEEE7destroyB8ne200100EPS4_(ptr noundef nonnull align 1 dereferenceable(1) %0, ptr noundef %1) #4 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__19allocatorIPN7sc_core18sc_signal_inout_ifIiEEE10deallocateB8ne200100EPS4_m(ptr noundef nonnull align 1 dereferenceable(1) %0, ptr noundef %1, i64 noundef %2) #4 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i64 %2, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load ptr, ptr %5, align 8
  %9 = load i64, ptr %6, align 8
  call void @_ZNSt3__119__libcpp_deallocateB8ne200100IPN7sc_core18sc_signal_inout_ifIiEEEEvPNS_15__type_identityIT_E4typeENS_15__element_countEm(ptr noundef %8, i64 noundef %9, i64 noundef 8) #17
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__119__libcpp_deallocateB8ne200100IPN7sc_core18sc_signal_inout_ifIiEEEEvPNS_15__type_identityIT_E4typeENS_15__element_countEm(ptr noundef %0, i64 noundef %1, i64 noundef %2) #4 {
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  store i64 %2, ptr %6, align 8
  %9 = load i64, ptr %5, align 8
  %10 = mul i64 %9, 8
  store i64 %10, ptr %7, align 8
  %11 = load i64, ptr %6, align 8
  %12 = call noundef zeroext i1 @_ZNSt3__124__is_overaligned_for_newB8ne200100Em(i64 noundef %11) #17
  br i1 %12, label %13, label %18

13:                                               ; preds = %3
  %14 = load i64, ptr %6, align 8
  store i64 %14, ptr %8, align 8
  %15 = load ptr, ptr %4, align 8
  %16 = load i64, ptr %7, align 8
  %17 = load i64, ptr %8, align 8
  call void @_ZNSt3__124__libcpp_operator_deleteB8ne200100IJPPN7sc_core18sc_signal_inout_ifIiEEmSt11align_val_tEEEvDpT_(ptr noundef %15, i64 noundef %16, i64 noundef %17) #17
  br label %21

18:                                               ; preds = %3
  %19 = load ptr, ptr %4, align 8
  %20 = load i64, ptr %7, align 8
  call void @_ZNSt3__124__libcpp_operator_deleteB8ne200100IJPPN7sc_core18sc_signal_inout_ifIiEEmEEEvDpT_(ptr noundef %19, i64 noundef %20) #17
  br label %21

21:                                               ; preds = %18, %13
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef zeroext i1 @_ZNSt3__124__is_overaligned_for_newB8ne200100Em(i64 noundef %0) #4 {
  %2 = alloca i64, align 8
  store i64 %0, ptr %2, align 8
  %3 = load i64, ptr %2, align 8
  %4 = icmp ugt i64 %3, 16
  ret i1 %4
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__124__libcpp_operator_deleteB8ne200100IJPPN7sc_core18sc_signal_inout_ifIiEEmSt11align_val_tEEEvDpT_(ptr noundef %0, i64 noundef %1, i64 noundef %2) #4 {
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  store i64 %2, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load i64, ptr %5, align 8
  %9 = load i64, ptr %6, align 8
  call void @_ZdlPvmSt11align_val_t(ptr noundef %7, i64 noundef %8, i64 noundef %9) #19
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__124__libcpp_operator_deleteB8ne200100IJPPN7sc_core18sc_signal_inout_ifIiEEmEEEvDpT_(ptr noundef %0, i64 noundef %1) #4 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load i64, ptr %4, align 8
  call void @_ZdlPvm(ptr noundef %5, i64 noundef %6) #19
  ret void
}

; Function Attrs: nobuiltin nounwind
declare void @_ZdlPvmSt11align_val_t(ptr noundef, i64 noundef, i64 noundef) #7

; Function Attrs: nobuiltin nounwind
declare void @_ZdlPvm(ptr noundef, i64 noundef) #7

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EED2Ev(ptr noundef nonnull returned align 8 dereferenceable(96) %0) unnamed_addr #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef ptr @_ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEED2Ev(ptr noundef nonnull align 8 dereferenceable(96) %3) #17
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7sc_core8sc_inoutIiED2Ev(ptr noundef nonnull returned align 8 dereferenceable(120) %0) unnamed_addr #4 personality ptr @__gxx_personality_v0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  store ptr %4, ptr %2, align 8
  store ptr getelementptr inbounds inrange(-16, 192) ({ [26 x ptr] }, ptr @_ZTVN7sc_core8sc_inoutIiEE, i32 0, i32 0, i32 2), ptr %4, align 8
  %5 = getelementptr inbounds nuw %"class.sc_core::sc_inout", ptr %4, i32 0, i32 3
  %6 = load ptr, ptr %5, align 8
  %7 = icmp eq ptr %6, null
  br i1 %7, label %12, label %8

8:                                                ; preds = %1
  %9 = load ptr, ptr %6, align 8
  %10 = getelementptr inbounds ptr, ptr %9, i64 1
  %11 = load ptr, ptr %10, align 8
  call void %11(ptr noundef nonnull align 8 dereferenceable(16) %6) #17
  br label %12

12:                                               ; preds = %8, %1
  %13 = getelementptr inbounds nuw %"class.sc_core::sc_inout", ptr %4, i32 0, i32 1
  %14 = load ptr, ptr %13, align 8
  %15 = icmp eq ptr %14, null
  br i1 %15, label %17, label %16

16:                                               ; preds = %12
  call void @_ZdlPvm(ptr noundef %14, i64 noundef 4) #19
  br label %17

17:                                               ; preds = %16, %12
  invoke void @_ZNK7sc_core8sc_inoutIiE13remove_tracesEv(ptr noundef nonnull align 8 dereferenceable(120) %4)
          to label %18 unwind label %21

18:                                               ; preds = %17
  %19 = call noundef ptr @_ZN7sc_core7sc_portINS_18sc_signal_inout_ifIiEELi1ELNS_14sc_port_policyE0EED2Ev(ptr noundef nonnull align 8 dereferenceable(96) %4) #17
  %20 = load ptr, ptr %2, align 8
  ret ptr %20

21:                                               ; preds = %17
  %22 = landingpad { ptr, i32 }
          catch ptr null
  %23 = extractvalue { ptr, i32 } %22, 0
  call void @__clang_call_terminate(ptr %23) #18
  unreachable
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr void @_ZNK7sc_core8sc_inoutIiE13remove_tracesEv(ptr noundef nonnull align 8 dereferenceable(120) %0) #4 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %"class.sc_core::sc_inout", ptr %4, i32 0, i32 2
  %6 = load ptr, ptr %5, align 8
  %7 = icmp ne ptr %6, null
  br i1 %7, label %8, label %39

8:                                                ; preds = %1
  %9 = getelementptr inbounds nuw %"class.sc_core::sc_inout", ptr %4, i32 0, i32 2
  %10 = load ptr, ptr %9, align 8
  %11 = call noundef i64 @_ZNKSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE4sizeB8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(24) %10) #17
  %12 = trunc i64 %11 to i32
  %13 = sub nsw i32 %12, 1
  store i32 %13, ptr %3, align 4
  br label %14

14:                                               ; preds = %28, %8
  %15 = load i32, ptr %3, align 4
  %16 = icmp sge i32 %15, 0
  br i1 %16, label %17, label %31

17:                                               ; preds = %14
  %18 = getelementptr inbounds nuw %"class.sc_core::sc_inout", ptr %4, i32 0, i32 2
  %19 = load ptr, ptr %18, align 8
  %20 = load i32, ptr %3, align 4
  %21 = sext i32 %20 to i64
  %22 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) %19, i64 noundef %21) #17
  %23 = load ptr, ptr %22, align 8
  %24 = icmp eq ptr %23, null
  br i1 %24, label %27, label %25

25:                                               ; preds = %17
  %26 = call noundef ptr @_ZN7sc_core15sc_trace_paramsD1Ev(ptr noundef nonnull align 8 dereferenceable(32) %23) #17
  call void @_ZdlPvm(ptr noundef %23, i64 noundef 32) #19
  br label %27

27:                                               ; preds = %25, %17
  br label %28

28:                                               ; preds = %27
  %29 = load i32, ptr %3, align 4
  %30 = add nsw i32 %29, -1
  store i32 %30, ptr %3, align 4
  br label %14, !llvm.loop !12

31:                                               ; preds = %14
  %32 = getelementptr inbounds nuw %"class.sc_core::sc_inout", ptr %4, i32 0, i32 2
  %33 = load ptr, ptr %32, align 8
  %34 = icmp eq ptr %33, null
  br i1 %34, label %37, label %35

35:                                               ; preds = %31
  %36 = call noundef ptr @_ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEED1B8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(24) %33) #17
  call void @_ZdlPvm(ptr noundef %33, i64 noundef 24) #19
  br label %37

37:                                               ; preds = %35, %31
  %38 = getelementptr inbounds nuw %"class.sc_core::sc_inout", ptr %4, i32 0, i32 2
  store ptr null, ptr %38, align 8
  br label %39

39:                                               ; preds = %37, %1
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef i64 @_ZNKSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE4sizeB8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %"class.std::__1::vector.14", ptr %3, i32 0, i32 1
  %5 = load ptr, ptr %4, align 8
  %6 = getelementptr inbounds nuw %"class.std::__1::vector.14", ptr %3, i32 0, i32 0
  %7 = load ptr, ptr %6, align 8
  %8 = ptrtoint ptr %5 to i64
  %9 = ptrtoint ptr %7 to i64
  %10 = sub i64 %8, %9
  %11 = sdiv exact i64 %10, 8
  ret i64 %11
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %1) #4 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds nuw %"class.std::__1::vector.14", ptr %5, i32 0, i32 0
  %7 = load ptr, ptr %6, align 8
  %8 = load i64, ptr %4, align 8
  %9 = getelementptr inbounds nuw ptr, ptr %7, i64 %8
  ret ptr %9
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7sc_core15sc_trace_paramsD1Ev(ptr noundef nonnull returned align 8 dereferenceable(32) %0) unnamed_addr #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef ptr @_ZN7sc_core15sc_trace_paramsD2Ev(ptr noundef nonnull align 8 dereferenceable(32) %3) #17
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEED1B8ne200100Ev(ptr noundef nonnull returned align 8 dereferenceable(24) %0) unnamed_addr #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef ptr @_ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEED2B8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(24) %3) #17
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7sc_core15sc_trace_paramsD2Ev(ptr noundef nonnull returned align 8 dereferenceable(32) %0) unnamed_addr #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %"struct.sc_core::sc_trace_params", ptr %3, i32 0, i32 1
  %5 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %4) #17
  ret ptr %3
}

; Function Attrs: nounwind
declare noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull returned align 8 dereferenceable(24)) unnamed_addr #5

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEED2B8ne200100Ev(ptr noundef nonnull returned align 8 dereferenceable(24) %0) unnamed_addr #4 personality ptr @__gxx_personality_v0 {
  %2 = alloca ptr, align 8
  %3 = alloca %"class.std::__1::vector<sc_core::sc_trace_params *>::__destroy_vector", align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = invoke noundef ptr @_ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE16__destroy_vectorC1B8ne200100ERS6_(ptr noundef nonnull align 8 dereferenceable(8) %3, ptr noundef nonnull align 8 dereferenceable(24) %4)
          to label %6 unwind label %8

6:                                                ; preds = %1
  invoke void @_ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE16__destroy_vectorclB8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(8) %3)
          to label %7 unwind label %8

7:                                                ; preds = %6
  ret ptr %4

8:                                                ; preds = %6, %1
  %9 = landingpad { ptr, i32 }
          catch ptr null
  %10 = extractvalue { ptr, i32 } %9, 0
  call void @__clang_call_terminate(ptr %10) #18
  unreachable
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE16__destroy_vectorC1B8ne200100ERS6_(ptr noundef nonnull returned align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(24) %1) unnamed_addr #2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = call noundef ptr @_ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE16__destroy_vectorC2B8ne200100ERS6_(ptr noundef nonnull align 8 dereferenceable(8) %5, ptr noundef nonnull align 8 dereferenceable(24) %6)
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE16__destroy_vectorclB8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %"class.std::__1::vector<sc_core::sc_trace_params *>::__destroy_vector", ptr %3, i32 0, i32 0
  %5 = load ptr, ptr %4, align 8
  %6 = getelementptr inbounds nuw %"class.std::__1::vector.14", ptr %5, i32 0, i32 0
  %7 = load ptr, ptr %6, align 8
  %8 = icmp ne ptr %7, null
  br i1 %8, label %9, label %23

9:                                                ; preds = %1
  %10 = getelementptr inbounds nuw %"class.std::__1::vector<sc_core::sc_trace_params *>::__destroy_vector", ptr %3, i32 0, i32 0
  %11 = load ptr, ptr %10, align 8
  call void @_ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE5clearB8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(24) %11) #17
  %12 = getelementptr inbounds nuw %"class.std::__1::vector<sc_core::sc_trace_params *>::__destroy_vector", ptr %3, i32 0, i32 0
  %13 = load ptr, ptr %12, align 8
  call void @_ZNKSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE17__annotate_deleteB8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(24) %13) #17
  %14 = getelementptr inbounds nuw %"class.std::__1::vector<sc_core::sc_trace_params *>::__destroy_vector", ptr %3, i32 0, i32 0
  %15 = load ptr, ptr %14, align 8
  %16 = getelementptr inbounds nuw %"class.std::__1::vector<sc_core::sc_trace_params *>::__destroy_vector", ptr %3, i32 0, i32 0
  %17 = load ptr, ptr %16, align 8
  %18 = getelementptr inbounds nuw %"class.std::__1::vector.14", ptr %17, i32 0, i32 0
  %19 = load ptr, ptr %18, align 8
  %20 = getelementptr inbounds nuw %"class.std::__1::vector<sc_core::sc_trace_params *>::__destroy_vector", ptr %3, i32 0, i32 0
  %21 = load ptr, ptr %20, align 8
  %22 = call noundef i64 @_ZNKSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE8capacityB8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(24) %21) #17
  call void @_ZNSt3__116allocator_traitsINS_9allocatorIPN7sc_core15sc_trace_paramsEEEE10deallocateB8ne200100ERS5_PS4_m(ptr noundef nonnull align 1 dereferenceable(1) %15, ptr noundef %19, i64 noundef %22) #17
  br label %23

23:                                               ; preds = %9, %1
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE16__destroy_vectorC2B8ne200100ERS6_(ptr noundef nonnull returned align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(24) %1) unnamed_addr #4 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds nuw %"class.std::__1::vector<sc_core::sc_trace_params *>::__destroy_vector", ptr %5, i32 0, i32 0
  %7 = load ptr, ptr %4, align 8
  store ptr %7, ptr %6, align 8
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE5clearB8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #4 {
  %2 = alloca ptr, align 8
  %3 = alloca i64, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = call noundef i64 @_ZNKSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE4sizeB8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(24) %4) #17
  store i64 %5, ptr %3, align 8
  %6 = getelementptr inbounds nuw %"class.std::__1::vector.14", ptr %4, i32 0, i32 0
  %7 = load ptr, ptr %6, align 8
  call void @_ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE22__base_destruct_at_endB8ne200100EPS3_(ptr noundef nonnull align 8 dereferenceable(24) %4, ptr noundef %7) #17
  %8 = load i64, ptr %3, align 8
  call void @_ZNKSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE17__annotate_shrinkB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) %4, i64 noundef %8) #17
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNKSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE17__annotate_deleteB8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__116allocator_traitsINS_9allocatorIPN7sc_core15sc_trace_paramsEEEE10deallocateB8ne200100ERS5_PS4_m(ptr noundef nonnull align 1 dereferenceable(1) %0, ptr noundef %1, i64 noundef %2) #4 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i64 %2, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load ptr, ptr %5, align 8
  %9 = load i64, ptr %6, align 8
  call void @_ZNSt3__19allocatorIPN7sc_core15sc_trace_paramsEE10deallocateB8ne200100EPS3_m(ptr noundef nonnull align 1 dereferenceable(1) %7, ptr noundef %8, i64 noundef %9) #17
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef i64 @_ZNKSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE8capacityB8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %"class.std::__1::vector.14", ptr %3, i32 0, i32 2
  %5 = load ptr, ptr %4, align 8
  %6 = getelementptr inbounds nuw %"class.std::__1::vector.14", ptr %3, i32 0, i32 0
  %7 = load ptr, ptr %6, align 8
  %8 = ptrtoint ptr %5 to i64
  %9 = ptrtoint ptr %7 to i64
  %10 = sub i64 %8, %9
  %11 = sdiv exact i64 %10, 8
  ret i64 %11
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE22__base_destruct_at_endB8ne200100EPS3_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %1) #4 personality ptr @__gxx_personality_v0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = getelementptr inbounds nuw %"class.std::__1::vector.14", ptr %6, i32 0, i32 1
  %8 = load ptr, ptr %7, align 8
  store ptr %8, ptr %5, align 8
  br label %9

9:                                                ; preds = %17, %2
  %10 = load ptr, ptr %4, align 8
  %11 = load ptr, ptr %5, align 8
  %12 = icmp ne ptr %10, %11
  br i1 %12, label %13, label %18

13:                                               ; preds = %9
  %14 = load ptr, ptr %5, align 8
  %15 = getelementptr inbounds ptr, ptr %14, i32 -1
  store ptr %15, ptr %5, align 8
  %16 = call noundef ptr @_ZNSt3__112__to_addressB8ne200100IPN7sc_core15sc_trace_paramsEEEPT_S5_(ptr noundef %15) #17
  invoke void @_ZNSt3__116allocator_traitsINS_9allocatorIPN7sc_core15sc_trace_paramsEEEE7destroyB8ne200100IS4_TnNS_9enable_ifIXsr13__has_destroyIS5_PT_EE5valueEiE4typeELi0EEEvRS5_SA_(ptr noundef nonnull align 1 dereferenceable(1) %6, ptr noundef %16)
          to label %17 unwind label %21

17:                                               ; preds = %13
  br label %9, !llvm.loop !13

18:                                               ; preds = %9
  %19 = load ptr, ptr %4, align 8
  %20 = getelementptr inbounds nuw %"class.std::__1::vector.14", ptr %6, i32 0, i32 1
  store ptr %19, ptr %20, align 8
  ret void

21:                                               ; preds = %13
  %22 = landingpad { ptr, i32 }
          catch ptr null
  %23 = extractvalue { ptr, i32 } %22, 0
  call void @__clang_call_terminate(ptr %23) #18
  unreachable
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNKSt3__16vectorIPN7sc_core15sc_trace_paramsENS_9allocatorIS3_EEE17__annotate_shrinkB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %1) #4 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZNSt3__116allocator_traitsINS_9allocatorIPN7sc_core15sc_trace_paramsEEEE7destroyB8ne200100IS4_TnNS_9enable_ifIXsr13__has_destroyIS5_PT_EE5valueEiE4typeELi0EEEvRS5_SA_(ptr noundef nonnull align 1 dereferenceable(1) %0, ptr noundef %1) #2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  call void @_ZNSt3__19allocatorIPN7sc_core15sc_trace_paramsEE7destroyB8ne200100EPS3_(ptr noundef nonnull align 1 dereferenceable(1) %5, ptr noundef %6)
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__112__to_addressB8ne200100IPN7sc_core15sc_trace_paramsEEEPT_S5_(ptr noundef %0) #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__19allocatorIPN7sc_core15sc_trace_paramsEE7destroyB8ne200100EPS3_(ptr noundef nonnull align 1 dereferenceable(1) %0, ptr noundef %1) #4 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__19allocatorIPN7sc_core15sc_trace_paramsEE10deallocateB8ne200100EPS3_m(ptr noundef nonnull align 1 dereferenceable(1) %0, ptr noundef %1, i64 noundef %2) #4 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i64 %2, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load ptr, ptr %5, align 8
  %9 = load i64, ptr %6, align 8
  call void @_ZNSt3__119__libcpp_deallocateB8ne200100IPN7sc_core15sc_trace_paramsEEEvPNS_15__type_identityIT_E4typeENS_15__element_countEm(ptr noundef %8, i64 noundef %9, i64 noundef 8) #17
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__119__libcpp_deallocateB8ne200100IPN7sc_core15sc_trace_paramsEEEvPNS_15__type_identityIT_E4typeENS_15__element_countEm(ptr noundef %0, i64 noundef %1, i64 noundef %2) #4 {
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  store i64 %2, ptr %6, align 8
  %9 = load i64, ptr %5, align 8
  %10 = mul i64 %9, 8
  store i64 %10, ptr %7, align 8
  %11 = load i64, ptr %6, align 8
  %12 = call noundef zeroext i1 @_ZNSt3__124__is_overaligned_for_newB8ne200100Em(i64 noundef %11) #17
  br i1 %12, label %13, label %18

13:                                               ; preds = %3
  %14 = load i64, ptr %6, align 8
  store i64 %14, ptr %8, align 8
  %15 = load ptr, ptr %4, align 8
  %16 = load i64, ptr %7, align 8
  %17 = load i64, ptr %8, align 8
  call void @_ZNSt3__124__libcpp_operator_deleteB8ne200100IJPPN7sc_core15sc_trace_paramsEmSt11align_val_tEEEvDpT_(ptr noundef %15, i64 noundef %16, i64 noundef %17) #17
  br label %21

18:                                               ; preds = %3
  %19 = load ptr, ptr %4, align 8
  %20 = load i64, ptr %7, align 8
  call void @_ZNSt3__124__libcpp_operator_deleteB8ne200100IJPPN7sc_core15sc_trace_paramsEmEEEvDpT_(ptr noundef %19, i64 noundef %20) #17
  br label %21

21:                                               ; preds = %18, %13
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__124__libcpp_operator_deleteB8ne200100IJPPN7sc_core15sc_trace_paramsEmSt11align_val_tEEEvDpT_(ptr noundef %0, i64 noundef %1, i64 noundef %2) #4 {
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  store i64 %2, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load i64, ptr %5, align 8
  %9 = load i64, ptr %6, align 8
  call void @_ZdlPvmSt11align_val_t(ptr noundef %7, i64 noundef %8, i64 noundef %9) #19
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__124__libcpp_operator_deleteB8ne200100IJPPN7sc_core15sc_trace_paramsEmEEEvDpT_(ptr noundef %0, i64 noundef %1) #4 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load i64, ptr %4, align 8
  call void @_ZdlPvm(ptr noundef %5, i64 noundef %6) #19
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__110type_indexC1B8ne200100ERKSt9type_info(ptr noundef nonnull returned align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(16) %1) unnamed_addr #4 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = call noundef ptr @_ZNSt3__110type_indexC2B8ne200100ERKSt9type_info(ptr noundef nonnull align 8 dereferenceable(8) %5, ptr noundef nonnull align 8 dereferenceable(16) %6) #17
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__110type_indexC2B8ne200100ERKSt9type_info(ptr noundef nonnull returned align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(16) %1) unnamed_addr #4 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds nuw %"class.std::__1::type_index", ptr %5, i32 0, i32 0
  %7 = load ptr, ptr %4, align 8
  store ptr %7, ptr %6, align 8
  ret ptr %5
}

; Function Attrs: nounwind willreturn memory(read)
declare ptr @__dynamic_cast(ptr, ptr, ptr, i64) #8

declare void @_ZN7sc_core12sc_port_base4bindERNS_12sc_interfaceE(ptr noundef nonnull align 8 dereferenceable(64), ptr noundef nonnull align 8 dereferenceable(8)) #1

declare void @_ZN7sc_core12sc_port_base4bindERS0_(ptr noundef nonnull align 8 dereferenceable(64), ptr noundef nonnull align 8 dereferenceable(64)) #1

; Function Attrs: noreturn
declare void @_ZN7sc_core19sc_assertion_failedEPKcS1_i(ptr noundef, ptr noundef, i32 noundef) #9

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef i32 @_ZNK7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEE4sizeEv(ptr noundef nonnull align 8 dereferenceable(96) %0) #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %"class.sc_core::sc_port_b.10", ptr %3, i32 0, i32 2
  %5 = call noundef i64 @_ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE4sizeB8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(24) %4) #17
  %6 = trunc i64 %5 to i32
  ret i32 %6
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %1) #4 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds nuw %"class.std::__1::vector.11", ptr %5, i32 0, i32 0
  %7 = load ptr, ptr %6, align 8
  %8 = load i64, ptr %4, align 8
  %9 = getelementptr inbounds nuw ptr, ptr %7, i64 %8
  ret ptr %9
}

declare void @_ZNK7sc_core12sc_port_base12report_errorEPKcS2_(ptr noundef nonnull align 8 dereferenceable(64), ptr noundef, ptr noundef) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE9push_backB8ne200100ERKS4_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) #2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE12emplace_backIJRKS4_EEERS4_DpOT_(ptr noundef nonnull align 8 dereferenceable(24) %5, ptr noundef nonnull align 8 dereferenceable(8) %6)
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE12emplace_backIJRKS4_EEERS4_DpOT_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) #2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = getelementptr inbounds nuw %"class.std::__1::vector.11", ptr %6, i32 0, i32 1
  %8 = load ptr, ptr %7, align 8
  store ptr %8, ptr %5, align 8
  %9 = load ptr, ptr %5, align 8
  %10 = getelementptr inbounds nuw %"class.std::__1::vector.11", ptr %6, i32 0, i32 2
  %11 = load ptr, ptr %10, align 8
  %12 = icmp ult ptr %9, %11
  br i1 %12, label %13, label %17

13:                                               ; preds = %2
  %14 = load ptr, ptr %4, align 8
  call void @_ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE22__construct_one_at_endB8ne200100IJRKS4_EEEvDpOT_(ptr noundef nonnull align 8 dereferenceable(24) %6, ptr noundef nonnull align 8 dereferenceable(8) %14)
  %15 = load ptr, ptr %5, align 8
  %16 = getelementptr inbounds nuw ptr, ptr %15, i32 1
  store ptr %16, ptr %5, align 8
  br label %20

17:                                               ; preds = %2
  %18 = load ptr, ptr %4, align 8
  %19 = call noundef ptr @_ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE24__emplace_back_slow_pathIJRKS4_EEEPS4_DpOT_(ptr noundef nonnull align 8 dereferenceable(24) %6, ptr noundef nonnull align 8 dereferenceable(8) %18)
  store ptr %19, ptr %5, align 8
  br label %20

20:                                               ; preds = %17, %13
  %21 = load ptr, ptr %5, align 8
  %22 = getelementptr inbounds nuw %"class.std::__1::vector.11", ptr %6, i32 0, i32 1
  store ptr %21, ptr %22, align 8
  %23 = load ptr, ptr %5, align 8
  %24 = getelementptr inbounds ptr, ptr %23, i64 -1
  ret ptr %24
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE22__construct_one_at_endB8ne200100IJRKS4_EEEvDpOT_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) #2 personality ptr @__gxx_personality_v0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca %"struct.std::__1::vector<sc_core::sc_signal_inout_if<int> *>::_ConstructTransaction", align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = call noundef ptr @_ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE21_ConstructTransactionC1B8ne200100ERS7_m(ptr noundef nonnull align 8 dereferenceable(24) %5, ptr noundef nonnull align 8 dereferenceable(24) %8, i64 noundef 1)
  %10 = getelementptr inbounds nuw %"struct.std::__1::vector<sc_core::sc_signal_inout_if<int> *>::_ConstructTransaction", ptr %5, i32 0, i32 1
  %11 = load ptr, ptr %10, align 8
  %12 = call noundef ptr @_ZNSt3__112__to_addressB8ne200100IPN7sc_core18sc_signal_inout_ifIiEEEEPT_S6_(ptr noundef %11) #17
  %13 = load ptr, ptr %4, align 8
  invoke void @_ZNSt3__116allocator_traitsINS_9allocatorIPN7sc_core18sc_signal_inout_ifIiEEEEE9constructB8ne200100IS5_JRKS5_ETnNS_9enable_ifIXsr15__has_constructIS6_PT_DpT0_EE5valueEiE4typeELi0EEEvRS6_SD_DpOSE_(ptr noundef nonnull align 1 dereferenceable(1) %8, ptr noundef %12, ptr noundef nonnull align 8 dereferenceable(8) %13)
          to label %14 unwind label %19

14:                                               ; preds = %2
  %15 = getelementptr inbounds nuw %"struct.std::__1::vector<sc_core::sc_signal_inout_if<int> *>::_ConstructTransaction", ptr %5, i32 0, i32 1
  %16 = load ptr, ptr %15, align 8
  %17 = getelementptr inbounds nuw ptr, ptr %16, i32 1
  store ptr %17, ptr %15, align 8
  %18 = call noundef ptr @_ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE21_ConstructTransactionD1B8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(24) %5) #17
  ret void

19:                                               ; preds = %2
  %20 = landingpad { ptr, i32 }
          cleanup
  %21 = extractvalue { ptr, i32 } %20, 0
  store ptr %21, ptr %6, align 8
  %22 = extractvalue { ptr, i32 } %20, 1
  store i32 %22, ptr %7, align 4
  %23 = call noundef ptr @_ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE21_ConstructTransactionD1B8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(24) %5) #17
  br label %24

24:                                               ; preds = %19
  %25 = load ptr, ptr %6, align 8
  %26 = load i32, ptr %7, align 4
  %27 = insertvalue { ptr, i32 } poison, ptr %25, 0
  %28 = insertvalue { ptr, i32 } %27, i32 %26, 1
  resume { ptr, i32 } %28
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE24__emplace_back_slow_pathIJRKS4_EEEPS4_DpOT_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) #2 personality ptr @__gxx_personality_v0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca %"struct.std::__1::__split_buffer", align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = call noundef i64 @_ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE4sizeB8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(24) %8) #17
  %10 = add i64 %9, 1
  %11 = call noundef i64 @_ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE11__recommendB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) %8, i64 noundef %10)
  %12 = call noundef i64 @_ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE4sizeB8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(24) %8) #17
  %13 = call noundef ptr @_ZNSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEEC1EmmS7_(ptr noundef nonnull align 8 dereferenceable(40) %5, i64 noundef %11, i64 noundef %12, ptr noundef nonnull align 1 dereferenceable(1) %8)
  %14 = getelementptr inbounds nuw %"struct.std::__1::__split_buffer", ptr %5, i32 0, i32 2
  %15 = load ptr, ptr %14, align 8
  %16 = call noundef ptr @_ZNSt3__112__to_addressB8ne200100IPN7sc_core18sc_signal_inout_ifIiEEEEPT_S6_(ptr noundef %15) #17
  %17 = load ptr, ptr %4, align 8
  invoke void @_ZNSt3__116allocator_traitsINS_9allocatorIPN7sc_core18sc_signal_inout_ifIiEEEEE9constructB8ne200100IS5_JRKS5_ETnNS_9enable_ifIXsr15__has_constructIS6_PT_DpT0_EE5valueEiE4typeELi0EEEvRS6_SD_DpOSE_(ptr noundef nonnull align 1 dereferenceable(1) %8, ptr noundef %16, ptr noundef nonnull align 8 dereferenceable(8) %17)
          to label %18 unwind label %26

18:                                               ; preds = %2
  %19 = getelementptr inbounds nuw %"struct.std::__1::__split_buffer", ptr %5, i32 0, i32 2
  %20 = load ptr, ptr %19, align 8
  %21 = getelementptr inbounds nuw ptr, ptr %20, i32 1
  store ptr %21, ptr %19, align 8
  invoke void @_ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE26__swap_out_circular_bufferERNS_14__split_bufferIS4_RS6_EE(ptr noundef nonnull align 8 dereferenceable(24) %8, ptr noundef nonnull align 8 dereferenceable(40) %5)
          to label %22 unwind label %26

22:                                               ; preds = %18
  %23 = getelementptr inbounds nuw %"class.std::__1::vector.11", ptr %8, i32 0, i32 1
  %24 = load ptr, ptr %23, align 8
  %25 = call noundef ptr @_ZNSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEED1Ev(ptr noundef nonnull align 8 dereferenceable(40) %5) #17
  ret ptr %24

26:                                               ; preds = %18, %2
  %27 = landingpad { ptr, i32 }
          cleanup
  %28 = extractvalue { ptr, i32 } %27, 0
  store ptr %28, ptr %6, align 8
  %29 = extractvalue { ptr, i32 } %27, 1
  store i32 %29, ptr %7, align 4
  %30 = call noundef ptr @_ZNSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEED1Ev(ptr noundef nonnull align 8 dereferenceable(40) %5) #17
  br label %31

31:                                               ; preds = %26
  %32 = load ptr, ptr %6, align 8
  %33 = load i32, ptr %7, align 4
  %34 = insertvalue { ptr, i32 } poison, ptr %32, 0
  %35 = insertvalue { ptr, i32 } %34, i32 %33, 1
  resume { ptr, i32 } %35
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE21_ConstructTransactionC1B8ne200100ERS7_m(ptr noundef nonnull returned align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %1, i64 noundef %2) unnamed_addr #2 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i64 %2, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load ptr, ptr %5, align 8
  %9 = load i64, ptr %6, align 8
  %10 = call noundef ptr @_ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE21_ConstructTransactionC2B8ne200100ERS7_m(ptr noundef nonnull align 8 dereferenceable(24) %7, ptr noundef nonnull align 8 dereferenceable(24) %8, i64 noundef %9)
  ret ptr %7
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZNSt3__116allocator_traitsINS_9allocatorIPN7sc_core18sc_signal_inout_ifIiEEEEE9constructB8ne200100IS5_JRKS5_ETnNS_9enable_ifIXsr15__has_constructIS6_PT_DpT0_EE5valueEiE4typeELi0EEEvRS6_SD_DpOSE_(ptr noundef nonnull align 1 dereferenceable(1) %0, ptr noundef %1, ptr noundef nonnull align 8 dereferenceable(8) %2) #2 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load ptr, ptr %5, align 8
  %9 = load ptr, ptr %6, align 8
  call void @_ZNSt3__19allocatorIPN7sc_core18sc_signal_inout_ifIiEEE9constructB8ne200100IS4_JRKS4_EEEvPT_DpOT0_(ptr noundef nonnull align 1 dereferenceable(1) %7, ptr noundef %8, ptr noundef nonnull align 8 dereferenceable(8) %9)
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE21_ConstructTransactionD1B8ne200100Ev(ptr noundef nonnull returned align 8 dereferenceable(24) %0) unnamed_addr #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef ptr @_ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE21_ConstructTransactionD2B8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(24) %3) #17
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE21_ConstructTransactionC2B8ne200100ERS7_m(ptr noundef nonnull returned align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %1, i64 noundef %2) unnamed_addr #4 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i64 %2, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = getelementptr inbounds nuw %"struct.std::__1::vector<sc_core::sc_signal_inout_if<int> *>::_ConstructTransaction", ptr %7, i32 0, i32 0
  %9 = load ptr, ptr %5, align 8
  store ptr %9, ptr %8, align 8
  %10 = getelementptr inbounds nuw %"struct.std::__1::vector<sc_core::sc_signal_inout_if<int> *>::_ConstructTransaction", ptr %7, i32 0, i32 1
  %11 = load ptr, ptr %5, align 8
  %12 = getelementptr inbounds nuw %"class.std::__1::vector.11", ptr %11, i32 0, i32 1
  %13 = load ptr, ptr %12, align 8
  store ptr %13, ptr %10, align 8
  %14 = getelementptr inbounds nuw %"struct.std::__1::vector<sc_core::sc_signal_inout_if<int> *>::_ConstructTransaction", ptr %7, i32 0, i32 2
  %15 = load ptr, ptr %5, align 8
  %16 = getelementptr inbounds nuw %"class.std::__1::vector.11", ptr %15, i32 0, i32 1
  %17 = load ptr, ptr %16, align 8
  %18 = load i64, ptr %6, align 8
  %19 = getelementptr inbounds nuw ptr, ptr %17, i64 %18
  store ptr %19, ptr %14, align 8
  ret ptr %7
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr void @_ZNSt3__19allocatorIPN7sc_core18sc_signal_inout_ifIiEEE9constructB8ne200100IS4_JRKS4_EEEvPT_DpOT0_(ptr noundef nonnull align 1 dereferenceable(1) %0, ptr noundef %1, ptr noundef nonnull align 8 dereferenceable(8) %2) #4 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load ptr, ptr %5, align 8
  %9 = load ptr, ptr %6, align 8
  %10 = load ptr, ptr %9, align 8
  store ptr %10, ptr %8, align 8
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE21_ConstructTransactionD2B8ne200100Ev(ptr noundef nonnull returned align 8 dereferenceable(24) %0) unnamed_addr #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %"struct.std::__1::vector<sc_core::sc_signal_inout_if<int> *>::_ConstructTransaction", ptr %3, i32 0, i32 1
  %5 = load ptr, ptr %4, align 8
  %6 = getelementptr inbounds nuw %"struct.std::__1::vector<sc_core::sc_signal_inout_if<int> *>::_ConstructTransaction", ptr %3, i32 0, i32 0
  %7 = load ptr, ptr %6, align 8
  %8 = getelementptr inbounds nuw %"class.std::__1::vector.11", ptr %7, i32 0, i32 1
  store ptr %5, ptr %8, align 8
  ret ptr %3
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden noundef i64 @_ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE11__recommendB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %1) #2 {
  %3 = alloca i64, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  %9 = load ptr, ptr %4, align 8
  %10 = call noundef i64 @_ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE8max_sizeB8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(24) %9) #17
  store i64 %10, ptr %6, align 8
  %11 = load i64, ptr %5, align 8
  %12 = load i64, ptr %6, align 8
  %13 = icmp ugt i64 %11, %12
  br i1 %13, label %14, label %15

14:                                               ; preds = %2
  call void @_ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE20__throw_length_errorB8ne200100Ev() #20
  unreachable

15:                                               ; preds = %2
  %16 = call noundef i64 @_ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE8capacityB8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(24) %9) #17
  store i64 %16, ptr %7, align 8
  %17 = load i64, ptr %7, align 8
  %18 = load i64, ptr %6, align 8
  %19 = udiv i64 %18, 2
  %20 = icmp uge i64 %17, %19
  br i1 %20, label %21, label %23

21:                                               ; preds = %15
  %22 = load i64, ptr %6, align 8
  store i64 %22, ptr %3, align 8
  br label %28

23:                                               ; preds = %15
  %24 = load i64, ptr %7, align 8
  %25 = mul i64 2, %24
  store i64 %25, ptr %8, align 8
  %26 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__13maxB8ne200100ImEERKT_S3_S3_(ptr noundef nonnull align 8 dereferenceable(8) %8, ptr noundef nonnull align 8 dereferenceable(8) %5)
  %27 = load i64, ptr %26, align 8
  store i64 %27, ptr %3, align 8
  br label %28

28:                                               ; preds = %23, %21
  %29 = load i64, ptr %3, align 8
  ret i64 %29
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEEC1EmmS7_(ptr noundef nonnull returned align 8 dereferenceable(40) %0, i64 noundef %1, i64 noundef %2, ptr noundef nonnull align 1 dereferenceable(1) %3) unnamed_addr #2 {
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  store i64 %1, ptr %6, align 8
  store i64 %2, ptr %7, align 8
  store ptr %3, ptr %8, align 8
  %9 = load ptr, ptr %5, align 8
  %10 = load i64, ptr %6, align 8
  %11 = load i64, ptr %7, align 8
  %12 = load ptr, ptr %8, align 8
  %13 = call noundef ptr @_ZNSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEEC2EmmS7_(ptr noundef nonnull align 8 dereferenceable(40) %9, i64 noundef %10, i64 noundef %11, ptr noundef nonnull align 1 dereferenceable(1) %12)
  ret ptr %9
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE26__swap_out_circular_bufferERNS_14__split_bufferIS4_RS6_EE(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(40) %1) #2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %6 = load ptr, ptr %3, align 8
  call void @_ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE17__annotate_deleteB8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(24) %6) #17
  %7 = load ptr, ptr %4, align 8
  %8 = getelementptr inbounds nuw %"struct.std::__1::__split_buffer", ptr %7, i32 0, i32 1
  %9 = load ptr, ptr %8, align 8
  %10 = getelementptr inbounds nuw %"class.std::__1::vector.11", ptr %6, i32 0, i32 1
  %11 = load ptr, ptr %10, align 8
  %12 = getelementptr inbounds nuw %"class.std::__1::vector.11", ptr %6, i32 0, i32 0
  %13 = load ptr, ptr %12, align 8
  %14 = ptrtoint ptr %11 to i64
  %15 = ptrtoint ptr %13 to i64
  %16 = sub i64 %14, %15
  %17 = sdiv exact i64 %16, 8
  %18 = sub i64 0, %17
  %19 = getelementptr inbounds ptr, ptr %9, i64 %18
  store ptr %19, ptr %5, align 8
  %20 = getelementptr inbounds nuw %"class.std::__1::vector.11", ptr %6, i32 0, i32 0
  %21 = load ptr, ptr %20, align 8
  %22 = call noundef ptr @_ZNSt3__112__to_addressB8ne200100IPN7sc_core18sc_signal_inout_ifIiEEEEPT_S6_(ptr noundef %21) #17
  %23 = getelementptr inbounds nuw %"class.std::__1::vector.11", ptr %6, i32 0, i32 1
  %24 = load ptr, ptr %23, align 8
  %25 = call noundef ptr @_ZNSt3__112__to_addressB8ne200100IPN7sc_core18sc_signal_inout_ifIiEEEEPT_S6_(ptr noundef %24) #17
  %26 = load ptr, ptr %5, align 8
  %27 = call noundef ptr @_ZNSt3__112__to_addressB8ne200100IPN7sc_core18sc_signal_inout_ifIiEEEEPT_S6_(ptr noundef %26) #17
  call void @_ZNSt3__134__uninitialized_allocator_relocateB8ne200100INS_9allocatorIPN7sc_core18sc_signal_inout_ifIiEEEEPS5_EEvRT_T0_SA_SA_(ptr noundef nonnull align 1 dereferenceable(1) %6, ptr noundef %22, ptr noundef %25, ptr noundef %27)
  %28 = load ptr, ptr %5, align 8
  %29 = load ptr, ptr %4, align 8
  %30 = getelementptr inbounds nuw %"struct.std::__1::__split_buffer", ptr %29, i32 0, i32 1
  store ptr %28, ptr %30, align 8
  %31 = getelementptr inbounds nuw %"class.std::__1::vector.11", ptr %6, i32 0, i32 0
  %32 = load ptr, ptr %31, align 8
  %33 = getelementptr inbounds nuw %"class.std::__1::vector.11", ptr %6, i32 0, i32 1
  store ptr %32, ptr %33, align 8
  %34 = getelementptr inbounds nuw %"class.std::__1::vector.11", ptr %6, i32 0, i32 0
  %35 = load ptr, ptr %4, align 8
  %36 = getelementptr inbounds nuw %"struct.std::__1::__split_buffer", ptr %35, i32 0, i32 1
  call void @_ZNSt3__14swapB8ne200100IPPN7sc_core18sc_signal_inout_ifIiEEEENS_9enable_ifIXaasr21is_move_constructibleIT_EE5valuesr18is_move_assignableIS7_EE5valueEvE4typeERS7_SA_(ptr noundef nonnull align 8 dereferenceable(8) %34, ptr noundef nonnull align 8 dereferenceable(8) %36) #17
  %37 = getelementptr inbounds nuw %"class.std::__1::vector.11", ptr %6, i32 0, i32 1
  %38 = load ptr, ptr %4, align 8
  %39 = getelementptr inbounds nuw %"struct.std::__1::__split_buffer", ptr %38, i32 0, i32 2
  call void @_ZNSt3__14swapB8ne200100IPPN7sc_core18sc_signal_inout_ifIiEEEENS_9enable_ifIXaasr21is_move_constructibleIT_EE5valuesr18is_move_assignableIS7_EE5valueEvE4typeERS7_SA_(ptr noundef nonnull align 8 dereferenceable(8) %37, ptr noundef nonnull align 8 dereferenceable(8) %39) #17
  %40 = getelementptr inbounds nuw %"class.std::__1::vector.11", ptr %6, i32 0, i32 2
  %41 = load ptr, ptr %4, align 8
  %42 = getelementptr inbounds nuw %"struct.std::__1::__split_buffer", ptr %41, i32 0, i32 3
  call void @_ZNSt3__14swapB8ne200100IPPN7sc_core18sc_signal_inout_ifIiEEEENS_9enable_ifIXaasr21is_move_constructibleIT_EE5valuesr18is_move_assignableIS7_EE5valueEvE4typeERS7_SA_(ptr noundef nonnull align 8 dereferenceable(8) %40, ptr noundef nonnull align 8 dereferenceable(8) %42) #17
  %43 = load ptr, ptr %4, align 8
  %44 = getelementptr inbounds nuw %"struct.std::__1::__split_buffer", ptr %43, i32 0, i32 1
  %45 = load ptr, ptr %44, align 8
  %46 = load ptr, ptr %4, align 8
  %47 = getelementptr inbounds nuw %"struct.std::__1::__split_buffer", ptr %46, i32 0, i32 0
  store ptr %45, ptr %47, align 8
  %48 = call noundef i64 @_ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE4sizeB8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(24) %6) #17
  call void @_ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE14__annotate_newB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) %6, i64 noundef %48) #17
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEED1Ev(ptr noundef nonnull returned align 8 dereferenceable(40) %0) unnamed_addr #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef ptr @_ZNSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEED2Ev(ptr noundef nonnull align 8 dereferenceable(40) %3) #17
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef i64 @_ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE8max_sizeB8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #4 personality ptr @__gxx_personality_v0 {
  %2 = alloca ptr, align 8
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  store ptr %0, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = call noundef i64 @_ZNSt3__116allocator_traitsINS_9allocatorIPN7sc_core18sc_signal_inout_ifIiEEEEE8max_sizeB8ne200100IS6_TnNS_9enable_ifIXsr14__has_max_sizeIKT_EE5valueEiE4typeELi0EEEmRKS6_(ptr noundef nonnull align 1 dereferenceable(1) %5) #17
  store i64 %6, ptr %3, align 8
  %7 = call noundef i64 @_ZNSt3__114numeric_limitsIlE3maxB8ne200100Ev() #17
  store i64 %7, ptr %4, align 8
  %8 = invoke noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__13minB8ne200100ImEERKT_S3_S3_(ptr noundef nonnull align 8 dereferenceable(8) %3, ptr noundef nonnull align 8 dereferenceable(8) %4)
          to label %9 unwind label %11

9:                                                ; preds = %1
  %10 = load i64, ptr %8, align 8
  ret i64 %10

11:                                               ; preds = %1
  %12 = landingpad { ptr, i32 }
          catch ptr null
  %13 = extractvalue { ptr, i32 } %12, 0
  call void @__clang_call_terminate(ptr %13) #18
  unreachable
}

; Function Attrs: mustprogress noinline noreturn optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE20__throw_length_errorB8ne200100Ev() #10 {
  call void @_ZNSt3__120__throw_length_errorB8ne200100EPKc(ptr noundef @.str.10) #20
  unreachable
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__13maxB8ne200100ImEERKT_S3_S3_(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) #2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca %"struct.std::__1::__less", align 1
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__13maxB8ne200100ImNS_6__lessIvvEEEERKT_S5_S5_T0_(ptr noundef nonnull align 8 dereferenceable(8) %6, ptr noundef nonnull align 8 dereferenceable(8) %7)
  ret ptr %8
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__13minB8ne200100ImEERKT_S3_S3_(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) #2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca %"struct.std::__1::__less", align 1
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__13minB8ne200100ImNS_6__lessIvvEEEERKT_S5_S5_T0_(ptr noundef nonnull align 8 dereferenceable(8) %6, ptr noundef nonnull align 8 dereferenceable(8) %7)
  ret ptr %8
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef i64 @_ZNSt3__116allocator_traitsINS_9allocatorIPN7sc_core18sc_signal_inout_ifIiEEEEE8max_sizeB8ne200100IS6_TnNS_9enable_ifIXsr14__has_max_sizeIKT_EE5valueEiE4typeELi0EEEmRKS6_(ptr noundef nonnull align 1 dereferenceable(1) %0) #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef i64 @_ZNKSt3__19allocatorIPN7sc_core18sc_signal_inout_ifIiEEE8max_sizeB8ne200100Ev(ptr noundef nonnull align 1 dereferenceable(1) %3) #17
  ret i64 %4
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef i64 @_ZNSt3__114numeric_limitsIlE3maxB8ne200100Ev() #4 {
  %1 = call noundef i64 @_ZNSt3__123__libcpp_numeric_limitsIlLb1EE3maxB8ne200100Ev() #17
  ret i64 %1
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__13minB8ne200100ImNS_6__lessIvvEEEERKT_S5_S5_T0_(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) #2 {
  %3 = alloca %"struct.std::__1::__less", align 1
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %6 = load ptr, ptr %5, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = call noundef zeroext i1 @_ZNKSt3__16__lessIvvEclB8ne200100ImmEEbRKT_RKT0_(ptr noundef nonnull align 1 dereferenceable(1) %3, ptr noundef nonnull align 8 dereferenceable(8) %6, ptr noundef nonnull align 8 dereferenceable(8) %7)
  br i1 %8, label %9, label %11

9:                                                ; preds = %2
  %10 = load ptr, ptr %5, align 8
  br label %13

11:                                               ; preds = %2
  %12 = load ptr, ptr %4, align 8
  br label %13

13:                                               ; preds = %11, %9
  %14 = phi ptr [ %10, %9 ], [ %12, %11 ]
  ret ptr %14
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef zeroext i1 @_ZNKSt3__16__lessIvvEclB8ne200100ImmEEbRKT_RKT0_(ptr noundef nonnull align 1 dereferenceable(1) %0, ptr noundef nonnull align 8 dereferenceable(8) %1, ptr noundef nonnull align 8 dereferenceable(8) %2) #4 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load ptr, ptr %5, align 8
  %9 = load i64, ptr %8, align 8
  %10 = load ptr, ptr %6, align 8
  %11 = load i64, ptr %10, align 8
  %12 = icmp ult i64 %9, %11
  ret i1 %12
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef i64 @_ZNKSt3__19allocatorIPN7sc_core18sc_signal_inout_ifIiEEE8max_sizeB8ne200100Ev(ptr noundef nonnull align 1 dereferenceable(1) %0) #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  ret i64 2305843009213693951
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef i64 @_ZNSt3__123__libcpp_numeric_limitsIlLb1EE3maxB8ne200100Ev() #4 {
  ret i64 9223372036854775807
}

; Function Attrs: mustprogress noinline noreturn optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__120__throw_length_errorB8ne200100EPKc(ptr noundef %0) #10 personality ptr @__gxx_personality_v0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %5 = call ptr @__cxa_allocate_exception(i64 16) #17
  %6 = load ptr, ptr %2, align 8
  %7 = invoke noundef ptr @_ZNSt12length_errorC1B8ne200100EPKc(ptr noundef nonnull align 8 dereferenceable(16) %5, ptr noundef %6)
          to label %8 unwind label %9

8:                                                ; preds = %1
  call void @__cxa_throw(ptr %5, ptr @_ZTISt12length_error, ptr @_ZNSt12length_errorD1Ev) #20
  unreachable

9:                                                ; preds = %1
  %10 = landingpad { ptr, i32 }
          cleanup
  %11 = extractvalue { ptr, i32 } %10, 0
  store ptr %11, ptr %3, align 8
  %12 = extractvalue { ptr, i32 } %10, 1
  store i32 %12, ptr %4, align 4
  call void @__cxa_free_exception(ptr %5) #17
  br label %13

13:                                               ; preds = %9
  %14 = load ptr, ptr %3, align 8
  %15 = load i32, ptr %4, align 4
  %16 = insertvalue { ptr, i32 } poison, ptr %14, 0
  %17 = insertvalue { ptr, i32 } %16, i32 %15, 1
  resume { ptr, i32 } %17
}

declare ptr @__cxa_allocate_exception(i64)

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt12length_errorC1B8ne200100EPKc(ptr noundef nonnull returned align 8 dereferenceable(16) %0, ptr noundef %1) unnamed_addr #2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = call noundef ptr @_ZNSt12length_errorC2B8ne200100EPKc(ptr noundef nonnull align 8 dereferenceable(16) %5, ptr noundef %6)
  ret ptr %5
}

declare void @__cxa_free_exception(ptr)

; Function Attrs: nounwind
declare noundef ptr @_ZNSt12length_errorD1Ev(ptr noundef nonnull returned align 8 dereferenceable(16)) unnamed_addr #5

declare void @__cxa_throw(ptr, ptr, ptr)

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt12length_errorC2B8ne200100EPKc(ptr noundef nonnull returned align 8 dereferenceable(16) %0, ptr noundef %1) unnamed_addr #2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = call noundef ptr @_ZNSt11logic_errorC2EPKc(ptr noundef nonnull align 8 dereferenceable(16) %5, ptr noundef %6)
  store ptr getelementptr inbounds inrange(-16, 24) ({ [5 x ptr] }, ptr @_ZTVSt12length_error, i32 0, i32 0, i32 2), ptr %5, align 8
  ret ptr %5
}

declare noundef ptr @_ZNSt11logic_errorC2EPKc(ptr noundef nonnull returned align 8 dereferenceable(16), ptr noundef) unnamed_addr #1

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__13maxB8ne200100ImNS_6__lessIvvEEEERKT_S5_S5_T0_(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) #4 {
  %3 = alloca %"struct.std::__1::__less", align 1
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = load ptr, ptr %5, align 8
  %8 = call noundef zeroext i1 @_ZNKSt3__16__lessIvvEclB8ne200100ImmEEbRKT_RKT0_(ptr noundef nonnull align 1 dereferenceable(1) %3, ptr noundef nonnull align 8 dereferenceable(8) %6, ptr noundef nonnull align 8 dereferenceable(8) %7)
  br i1 %8, label %9, label %11

9:                                                ; preds = %2
  %10 = load ptr, ptr %5, align 8
  br label %13

11:                                               ; preds = %2
  %12 = load ptr, ptr %4, align 8
  br label %13

13:                                               ; preds = %11, %9
  %14 = phi ptr [ %10, %9 ], [ %12, %11 ]
  ret ptr %14
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEEC2EmmS7_(ptr noundef nonnull returned align 8 dereferenceable(40) %0, i64 noundef %1, i64 noundef %2, ptr noundef nonnull align 1 dereferenceable(1) %3) unnamed_addr #2 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  %9 = alloca ptr, align 8
  %10 = alloca %"struct.std::__1::__allocation_result", align 8
  store ptr %0, ptr %6, align 8
  store i64 %1, ptr %7, align 8
  store i64 %2, ptr %8, align 8
  store ptr %3, ptr %9, align 8
  %11 = load ptr, ptr %6, align 8
  store ptr %11, ptr %5, align 8
  %12 = getelementptr inbounds nuw %"struct.std::__1::__split_buffer", ptr %11, i32 0, i32 3
  store ptr null, ptr %12, align 8
  %13 = getelementptr inbounds nuw %"struct.std::__1::__split_buffer", ptr %11, i32 0, i32 4
  %14 = load ptr, ptr %9, align 8
  store ptr %14, ptr %13, align 8
  %15 = load i64, ptr %7, align 8
  %16 = icmp eq i64 %15, 0
  br i1 %16, label %17, label %19

17:                                               ; preds = %4
  %18 = getelementptr inbounds nuw %"struct.std::__1::__split_buffer", ptr %11, i32 0, i32 0
  store ptr null, ptr %18, align 8
  br label %29

19:                                               ; preds = %4
  %20 = getelementptr inbounds nuw %"struct.std::__1::__split_buffer", ptr %11, i32 0, i32 4
  %21 = load ptr, ptr %20, align 8
  %22 = load i64, ptr %7, align 8
  %23 = call [2 x i64] @_ZNSt3__119__allocate_at_leastB8ne200100INS_9allocatorIPN7sc_core18sc_signal_inout_ifIiEEEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS9_m(ptr noundef nonnull align 1 dereferenceable(1) %21, i64 noundef %22)
  store [2 x i64] %23, ptr %10, align 8
  %24 = getelementptr inbounds nuw %"struct.std::__1::__allocation_result", ptr %10, i32 0, i32 0
  %25 = load ptr, ptr %24, align 8
  %26 = getelementptr inbounds nuw %"struct.std::__1::__split_buffer", ptr %11, i32 0, i32 0
  store ptr %25, ptr %26, align 8
  %27 = getelementptr inbounds nuw %"struct.std::__1::__allocation_result", ptr %10, i32 0, i32 1
  %28 = load i64, ptr %27, align 8
  store i64 %28, ptr %7, align 8
  br label %29

29:                                               ; preds = %19, %17
  %30 = getelementptr inbounds nuw %"struct.std::__1::__split_buffer", ptr %11, i32 0, i32 0
  %31 = load ptr, ptr %30, align 8
  %32 = load i64, ptr %8, align 8
  %33 = getelementptr inbounds nuw ptr, ptr %31, i64 %32
  %34 = getelementptr inbounds nuw %"struct.std::__1::__split_buffer", ptr %11, i32 0, i32 2
  store ptr %33, ptr %34, align 8
  %35 = getelementptr inbounds nuw %"struct.std::__1::__split_buffer", ptr %11, i32 0, i32 1
  store ptr %33, ptr %35, align 8
  %36 = getelementptr inbounds nuw %"struct.std::__1::__split_buffer", ptr %11, i32 0, i32 0
  %37 = load ptr, ptr %36, align 8
  %38 = load i64, ptr %7, align 8
  %39 = getelementptr inbounds nuw ptr, ptr %37, i64 %38
  %40 = getelementptr inbounds nuw %"struct.std::__1::__split_buffer", ptr %11, i32 0, i32 3
  store ptr %39, ptr %40, align 8
  %41 = load ptr, ptr %5, align 8
  ret ptr %41
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden [2 x i64] @_ZNSt3__119__allocate_at_leastB8ne200100INS_9allocatorIPN7sc_core18sc_signal_inout_ifIiEEEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS9_m(ptr noundef nonnull align 1 dereferenceable(1) %0, i64 noundef %1) #2 {
  %3 = alloca %"struct.std::__1::__allocation_result", align 8
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  %6 = getelementptr inbounds nuw %"struct.std::__1::__allocation_result", ptr %3, i32 0, i32 0
  %7 = load ptr, ptr %4, align 8
  %8 = load i64, ptr %5, align 8
  %9 = call noundef ptr @_ZNSt3__19allocatorIPN7sc_core18sc_signal_inout_ifIiEEE8allocateB8ne200100Em(ptr noundef nonnull align 1 dereferenceable(1) %7, i64 noundef %8)
  store ptr %9, ptr %6, align 8
  %10 = getelementptr inbounds nuw %"struct.std::__1::__allocation_result", ptr %3, i32 0, i32 1
  %11 = load i64, ptr %5, align 8
  store i64 %11, ptr %10, align 8
  %12 = load [2 x i64], ptr %3, align 8
  ret [2 x i64] %12
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__19allocatorIPN7sc_core18sc_signal_inout_ifIiEEE8allocateB8ne200100Em(ptr noundef nonnull align 1 dereferenceable(1) %0, i64 noundef %1) #2 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load i64, ptr %4, align 8
  %7 = call noundef i64 @_ZNSt3__116allocator_traitsINS_9allocatorIPN7sc_core18sc_signal_inout_ifIiEEEEE8max_sizeB8ne200100IS6_TnNS_9enable_ifIXsr14__has_max_sizeIKT_EE5valueEiE4typeELi0EEEmRKS6_(ptr noundef nonnull align 1 dereferenceable(1) %5) #17
  %8 = icmp ugt i64 %6, %7
  br i1 %8, label %9, label %10

9:                                                ; preds = %2
  call void @_ZSt28__throw_bad_array_new_lengthB8ne200100v() #20
  unreachable

10:                                               ; preds = %2
  %11 = load i64, ptr %4, align 8
  %12 = call noundef ptr @_ZNSt3__117__libcpp_allocateB8ne200100IPN7sc_core18sc_signal_inout_ifIiEEEEPT_NS_15__element_countEm(i64 noundef %11, i64 noundef 8)
  ret ptr %12
}

; Function Attrs: mustprogress noinline noreturn optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZSt28__throw_bad_array_new_lengthB8ne200100v() #10 {
  %1 = call ptr @__cxa_allocate_exception(i64 8) #17
  %2 = call noundef ptr @_ZNSt20bad_array_new_lengthC1Ev(ptr noundef nonnull align 8 dereferenceable(8) %1) #17
  call void @__cxa_throw(ptr %1, ptr @_ZTISt20bad_array_new_length, ptr @_ZNSt20bad_array_new_lengthD1Ev) #20
  unreachable
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__117__libcpp_allocateB8ne200100IPN7sc_core18sc_signal_inout_ifIiEEEEPT_NS_15__element_countEm(i64 noundef %0, i64 noundef %1) #2 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  store i64 %0, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  %8 = load i64, ptr %4, align 8
  %9 = mul i64 %8, 8
  store i64 %9, ptr %6, align 8
  %10 = load i64, ptr %5, align 8
  %11 = call noundef zeroext i1 @_ZNSt3__124__is_overaligned_for_newB8ne200100Em(i64 noundef %10) #17
  br i1 %11, label %12, label %17

12:                                               ; preds = %2
  %13 = load i64, ptr %5, align 8
  store i64 %13, ptr %7, align 8
  %14 = load i64, ptr %6, align 8
  %15 = load i64, ptr %7, align 8
  %16 = call noundef ptr @_ZNSt3__121__libcpp_operator_newB8ne200100IJmSt11align_val_tEEEPvDpT_(i64 noundef %14, i64 noundef %15)
  store ptr %16, ptr %3, align 8
  br label %20

17:                                               ; preds = %2
  %18 = load i64, ptr %6, align 8
  %19 = call noundef ptr @_ZNSt3__121__libcpp_operator_newB8ne200100IJmEEEPvDpT_(i64 noundef %18)
  store ptr %19, ptr %3, align 8
  br label %20

20:                                               ; preds = %17, %12
  %21 = load ptr, ptr %3, align 8
  ret ptr %21
}

; Function Attrs: nounwind
declare noundef ptr @_ZNSt20bad_array_new_lengthC1Ev(ptr noundef nonnull returned align 8 dereferenceable(8)) unnamed_addr #5

; Function Attrs: nounwind
declare noundef ptr @_ZNSt20bad_array_new_lengthD1Ev(ptr noundef nonnull returned align 8 dereferenceable(8)) unnamed_addr #5

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__121__libcpp_operator_newB8ne200100IJmSt11align_val_tEEEPvDpT_(i64 noundef %0, i64 noundef %1) #2 {
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  store i64 %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %5 = load i64, ptr %3, align 8
  %6 = load i64, ptr %4, align 8
  %7 = call noalias noundef nonnull ptr @_ZnwmSt11align_val_t(i64 noundef %5, i64 noundef %6) #21
  call void @llvm.assume(i1 true) [ "align"(ptr %7, i64 %6) ]
  ret ptr %7
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__121__libcpp_operator_newB8ne200100IJmEEEPvDpT_(i64 noundef %0) #2 {
  %2 = alloca i64, align 8
  store i64 %0, ptr %2, align 8
  %3 = load i64, ptr %2, align 8
  %4 = call noalias noundef nonnull ptr @_Znwm(i64 noundef %3) #21
  ret ptr %4
}

; Function Attrs: nobuiltin allocsize(0)
declare noundef nonnull ptr @_ZnwmSt11align_val_t(i64 noundef, i64 noundef) #11

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #12

; Function Attrs: nobuiltin allocsize(0)
declare noundef nonnull ptr @_Znwm(i64 noundef) #11

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__134__uninitialized_allocator_relocateB8ne200100INS_9allocatorIPN7sc_core18sc_signal_inout_ifIiEEEEPS5_EEvRT_T0_SA_SA_(ptr noundef nonnull align 1 dereferenceable(1) %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) #4 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  store ptr %3, ptr %8, align 8
  %9 = load ptr, ptr %8, align 8
  %10 = call noundef ptr @_ZNSt3__112__to_addressB8ne200100IPN7sc_core18sc_signal_inout_ifIiEEEEPT_S6_(ptr noundef %9) #17
  %11 = load ptr, ptr %6, align 8
  %12 = call noundef ptr @_ZNSt3__112__to_addressB8ne200100IPN7sc_core18sc_signal_inout_ifIiEEEEPT_S6_(ptr noundef %11) #17
  %13 = load ptr, ptr %7, align 8
  %14 = load ptr, ptr %6, align 8
  %15 = ptrtoint ptr %13 to i64
  %16 = ptrtoint ptr %14 to i64
  %17 = sub i64 %15, %16
  %18 = sdiv exact i64 %17, 8
  %19 = mul i64 8, %18
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %10, ptr align 8 %12, i64 %19, i1 false)
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__14swapB8ne200100IPPN7sc_core18sc_signal_inout_ifIiEEEENS_9enable_ifIXaasr21is_move_constructibleIT_EE5valuesr18is_move_assignableIS7_EE5valueEvE4typeERS7_SA_(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) #4 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = load ptr, ptr %6, align 8
  store ptr %7, ptr %5, align 8
  %8 = load ptr, ptr %4, align 8
  %9 = load ptr, ptr %8, align 8
  %10 = load ptr, ptr %3, align 8
  store ptr %9, ptr %10, align 8
  %11 = load ptr, ptr %5, align 8
  %12 = load ptr, ptr %4, align 8
  store ptr %11, ptr %12, align 8
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEE14__annotate_newB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %1) #4 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #13

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEED2Ev(ptr noundef nonnull returned align 8 dereferenceable(40) %0) unnamed_addr #4 personality ptr @__gxx_personality_v0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  store ptr %4, ptr %2, align 8
  call void @_ZNSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEE5clearB8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(40) %4) #17
  %5 = getelementptr inbounds nuw %"struct.std::__1::__split_buffer", ptr %4, i32 0, i32 0
  %6 = load ptr, ptr %5, align 8
  %7 = icmp ne ptr %6, null
  br i1 %7, label %8, label %15

8:                                                ; preds = %1
  %9 = getelementptr inbounds nuw %"struct.std::__1::__split_buffer", ptr %4, i32 0, i32 4
  %10 = load ptr, ptr %9, align 8
  %11 = getelementptr inbounds nuw %"struct.std::__1::__split_buffer", ptr %4, i32 0, i32 0
  %12 = load ptr, ptr %11, align 8
  %13 = invoke noundef i64 @_ZNKSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEE8capacityB8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(40) %4)
          to label %14 unwind label %17

14:                                               ; preds = %8
  call void @_ZNSt3__116allocator_traitsINS_9allocatorIPN7sc_core18sc_signal_inout_ifIiEEEEE10deallocateB8ne200100ERS6_PS5_m(ptr noundef nonnull align 1 dereferenceable(1) %10, ptr noundef %12, i64 noundef %13) #17
  br label %15

15:                                               ; preds = %14, %1
  %16 = load ptr, ptr %2, align 8
  ret ptr %16

17:                                               ; preds = %8
  %18 = landingpad { ptr, i32 }
          catch ptr null
  %19 = extractvalue { ptr, i32 } %18, 0
  call void @__clang_call_terminate(ptr %19) #18
  unreachable
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEE5clearB8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(40) %0) #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %"struct.std::__1::__split_buffer", ptr %3, i32 0, i32 1
  %5 = load ptr, ptr %4, align 8
  call void @_ZNSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEE17__destruct_at_endB8ne200100EPS4_(ptr noundef nonnull align 8 dereferenceable(40) %3, ptr noundef %5) #17
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef i64 @_ZNKSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEE8capacityB8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(40) %0) #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %"struct.std::__1::__split_buffer", ptr %3, i32 0, i32 3
  %5 = load ptr, ptr %4, align 8
  %6 = getelementptr inbounds nuw %"struct.std::__1::__split_buffer", ptr %3, i32 0, i32 0
  %7 = load ptr, ptr %6, align 8
  %8 = ptrtoint ptr %5 to i64
  %9 = ptrtoint ptr %7 to i64
  %10 = sub i64 %8, %9
  %11 = sdiv exact i64 %10, 8
  ret i64 %11
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEE17__destruct_at_endB8ne200100EPS4_(ptr noundef nonnull align 8 dereferenceable(40) %0, ptr noundef %1) #4 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca %"struct.std::__1::integral_constant", align 1
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = load ptr, ptr %4, align 8
  call void @_ZNSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEE17__destruct_at_endB8ne200100EPS4_NS_17integral_constantIbLb0EEE(ptr noundef nonnull align 8 dereferenceable(40) %6, ptr noundef %7) #17
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__114__split_bufferIPN7sc_core18sc_signal_inout_ifIiEERNS_9allocatorIS4_EEE17__destruct_at_endB8ne200100EPS4_NS_17integral_constantIbLb0EEE(ptr noundef nonnull align 8 dereferenceable(40) %0, ptr noundef %1) #4 personality ptr @__gxx_personality_v0 {
  %3 = alloca %"struct.std::__1::integral_constant", align 1
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %6 = load ptr, ptr %4, align 8
  br label %7

7:                                                ; preds = %19, %2
  %8 = load ptr, ptr %5, align 8
  %9 = getelementptr inbounds nuw %"struct.std::__1::__split_buffer", ptr %6, i32 0, i32 2
  %10 = load ptr, ptr %9, align 8
  %11 = icmp ne ptr %8, %10
  br i1 %11, label %12, label %20

12:                                               ; preds = %7
  %13 = getelementptr inbounds nuw %"struct.std::__1::__split_buffer", ptr %6, i32 0, i32 4
  %14 = load ptr, ptr %13, align 8
  %15 = getelementptr inbounds nuw %"struct.std::__1::__split_buffer", ptr %6, i32 0, i32 2
  %16 = load ptr, ptr %15, align 8
  %17 = getelementptr inbounds ptr, ptr %16, i32 -1
  store ptr %17, ptr %15, align 8
  %18 = call noundef ptr @_ZNSt3__112__to_addressB8ne200100IPN7sc_core18sc_signal_inout_ifIiEEEEPT_S6_(ptr noundef %17) #17
  invoke void @_ZNSt3__116allocator_traitsINS_9allocatorIPN7sc_core18sc_signal_inout_ifIiEEEEE7destroyB8ne200100IS5_TnNS_9enable_ifIXsr13__has_destroyIS6_PT_EE5valueEiE4typeELi0EEEvRS6_SB_(ptr noundef nonnull align 1 dereferenceable(1) %14, ptr noundef %18)
          to label %19 unwind label %21

19:                                               ; preds = %12
  br label %7, !llvm.loop !14

20:                                               ; preds = %7
  ret void

21:                                               ; preds = %12
  %22 = landingpad { ptr, i32 }
          catch ptr null
  %23 = extractvalue { ptr, i32 } %22, 0
  call void @__clang_call_terminate(ptr %23) #18
  unreachable
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZN7sc_core8sc_inoutIiE5writeERKi(ptr noundef nonnull align 8 dereferenceable(120) %0, ptr noundef nonnull align 4 dereferenceable(4) %1) #2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = call noundef ptr @_ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEEptEv(ptr noundef nonnull align 8 dereferenceable(96) %5)
  %7 = getelementptr inbounds i8, ptr %6, i64 8
  %8 = load ptr, ptr %4, align 8
  %9 = load ptr, ptr %7, align 8
  %10 = getelementptr inbounds ptr, ptr %9, i64 4
  %11 = load ptr, ptr %10, align 8
  call void %11(ptr noundef nonnull align 8 dereferenceable(8) %7, ptr noundef nonnull align 4 dereferenceable(4) %8)
  ret void
}

declare void @_ZN7sc_core8sc_traceEPNS_13sc_trace_fileERKiRKNSt3__112basic_stringIcNS4_11char_traitsIcEENS4_9allocatorIcEEEEi(ptr noundef, ptr noundef nonnull align 4 dereferenceable(4), ptr noundef nonnull align 8 dereferenceable(24), i32 noundef) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7sc_core9sc_port_bINS_18sc_signal_inout_ifIiEEEptEv(ptr noundef nonnull align 8 dereferenceable(96) %0) #2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %"class.sc_core::sc_port_b.10", ptr %3, i32 0, i32 1
  %5 = load ptr, ptr %4, align 8
  %6 = icmp eq ptr %5, null
  br i1 %6, label %7, label %8

7:                                                ; preds = %1
  call void @_ZNK7sc_core12sc_port_base12report_errorEPKcS2_(ptr noundef nonnull align 8 dereferenceable(64) %3, ptr noundef @_ZN7sc_core13SC_ID_GET_IF_E, ptr noundef @.str.11)
  call void @_ZN7sc_core8sc_abortEv() #20
  unreachable

8:                                                ; preds = %1
  %9 = getelementptr inbounds nuw %"class.sc_core::sc_port_b.10", ptr %3, i32 0, i32 1
  %10 = load ptr, ptr %9, align 8
  ret ptr %10
}

; Function Attrs: noreturn
declare void @_ZN7sc_core8sc_abortEv() #9

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(8) ptr @_ZNKSt3__16vectorIPN7sc_core18sc_signal_inout_ifIiEENS_9allocatorIS4_EEEixB8ne200100Em(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %1) #4 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds nuw %"class.std::__1::vector.11", ptr %5, i32 0, i32 0
  %7 = load ptr, ptr %6, align 8
  %8 = load i64, ptr %4, align 8
  %9 = getelementptr inbounds nuw ptr, ptr %7, i64 %8
  ret ptr %9
}

declare void @_ZNK7sc_core12sc_port_base16add_static_eventEPNS_17sc_thread_processERKNS_8sc_eventE(ptr noundef nonnull align 8 dereferenceable(64), ptr noundef, ptr noundef nonnull align 8 dereferenceable(160)) #1

declare void @_ZNK7sc_core12sc_port_base14make_sensitiveEPNS_17sc_thread_processEPNS_15sc_event_finderE(ptr noundef nonnull align 8 dereferenceable(64), ptr noundef, ptr noundef) unnamed_addr #1

declare void @_ZNK7sc_core12sc_port_base16add_static_eventEPNS_17sc_method_processERKNS_8sc_eventE(ptr noundef nonnull align 8 dereferenceable(64), ptr noundef, ptr noundef nonnull align 8 dereferenceable(160)) #1

declare void @_ZNK7sc_core12sc_port_base14make_sensitiveEPNS_17sc_method_processEPNS_15sc_event_finderE(ptr noundef nonnull align 8 dereferenceable(64), ptr noundef, ptr noundef) unnamed_addr #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef nonnull align 1 dereferenceable(1) ptr @_ZNK7sc_core5sc_inIbE4readEv(ptr noundef nonnull align 8 dereferenceable(128) %0) #2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef ptr @_ZNK7sc_core9sc_port_bINS_15sc_signal_in_ifIbEEEptEv(ptr noundef nonnull align 8 dereferenceable(96) %3)
  %5 = load ptr, ptr %4, align 8
  %6 = getelementptr inbounds ptr, ptr %5, i64 7
  %7 = load ptr, ptr %6, align 8
  %8 = call noundef nonnull align 1 dereferenceable(1) ptr %7(ptr noundef nonnull align 8 dereferenceable(8) %4)
  ret ptr %8
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne200100INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef %1) #2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = call noundef i64 @_ZNSt3__111char_traitsIcE6lengthB8ne200100EPKc(ptr noundef %7) #17
  %9 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__124__put_character_sequenceB8ne200100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m(ptr noundef nonnull align 8 dereferenceable(8) %5, ptr noundef %6, i64 noundef %8)
  ret ptr %9
}

declare noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEi(ptr noundef nonnull align 8 dereferenceable(8), i32 noundef) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsB8ne200100EPFRS3_S4_E(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef %1) #2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = call noundef nonnull align 8 dereferenceable(8) ptr %6(ptr noundef nonnull align 8 dereferenceable(8) %5)
  ret ptr %7
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__14endlB8ne200100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_(ptr noundef nonnull align 8 dereferenceable(8) %0) #2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = load ptr, ptr %4, align 8
  %6 = getelementptr i8, ptr %5, i64 -24
  %7 = load i64, ptr %6, align 8
  %8 = getelementptr inbounds i8, ptr %4, i64 %7
  %9 = call noundef signext i8 @_ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE5widenB8ne200100Ec(ptr noundef nonnull align 8 dereferenceable(148) %8, i8 noundef signext 10)
  %10 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc(ptr noundef nonnull align 8 dereferenceable(8) %3, i8 noundef signext %9)
  %11 = load ptr, ptr %2, align 8
  %12 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE5flushEv(ptr noundef nonnull align 8 dereferenceable(8) %11)
  %13 = load ptr, ptr %2, align 8
  ret ptr %13
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZNK7sc_core9sc_port_bINS_15sc_signal_in_ifIbEEEptEv(ptr noundef nonnull align 8 dereferenceable(96) %0) #2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef ptr @_ZN7sc_core9sc_port_bINS_15sc_signal_in_ifIbEEEptEv(ptr noundef nonnull align 8 dereferenceable(96) %3)
  ret ptr %4
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7sc_core9sc_port_bINS_15sc_signal_in_ifIbEEEptEv(ptr noundef nonnull align 8 dereferenceable(96) %0) #2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %"class.sc_core::sc_port_b", ptr %3, i32 0, i32 1
  %5 = load ptr, ptr %4, align 8
  %6 = icmp eq ptr %5, null
  br i1 %6, label %7, label %8

7:                                                ; preds = %1
  call void @_ZNK7sc_core12sc_port_base12report_errorEPKcS2_(ptr noundef nonnull align 8 dereferenceable(64) %3, ptr noundef @_ZN7sc_core13SC_ID_GET_IF_E, ptr noundef @.str.11)
  call void @_ZN7sc_core8sc_abortEv() #20
  unreachable

8:                                                ; preds = %1
  %9 = getelementptr inbounds nuw %"class.sc_core::sc_port_b", ptr %3, i32 0, i32 1
  %10 = load ptr, ptr %9, align 8
  ret ptr %10
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__124__put_character_sequenceB8ne200100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef %1, i64 noundef %2) #2 personality ptr @__gxx_personality_v0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca %"class.std::__1::basic_ostream<char>::sentry", align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca %"class.std::__1::ostreambuf_iterator", align 8
  %11 = alloca %"class.std::__1::ostreambuf_iterator", align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i64 %2, ptr %6, align 8
  %12 = load ptr, ptr %4, align 8
  %13 = invoke noundef ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryC1ERS3_(ptr noundef nonnull align 8 dereferenceable(16) %7, ptr noundef nonnull align 8 dereferenceable(8) %12)
          to label %14 unwind label %68

14:                                               ; preds = %3
  %15 = invoke noundef zeroext i1 @_ZNKSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentrycvbB8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(16) %7)
          to label %16 unwind label %72

16:                                               ; preds = %14
  br i1 %15, label %17, label %89

17:                                               ; preds = %16
  %18 = load ptr, ptr %4, align 8
  %19 = call noundef ptr @_ZNSt3__119ostreambuf_iteratorIcNS_11char_traitsIcEEEC1B8ne200100ERNS_13basic_ostreamIcS2_EE(ptr noundef nonnull align 8 dereferenceable(8) %11, ptr noundef nonnull align 8 dereferenceable(8) %18) #17
  %20 = load ptr, ptr %5, align 8
  %21 = load ptr, ptr %4, align 8
  %22 = load ptr, ptr %21, align 8
  %23 = getelementptr i8, ptr %22, i64 -24
  %24 = load i64, ptr %23, align 8
  %25 = getelementptr inbounds i8, ptr %21, i64 %24
  %26 = invoke noundef i32 @_ZNKSt3__18ios_base5flagsB8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(136) %25)
          to label %27 unwind label %72

27:                                               ; preds = %17
  %28 = and i32 %26, 176
  %29 = icmp eq i32 %28, 32
  br i1 %29, label %30, label %34

30:                                               ; preds = %27
  %31 = load ptr, ptr %5, align 8
  %32 = load i64, ptr %6, align 8
  %33 = getelementptr inbounds nuw i8, ptr %31, i64 %32
  br label %36

34:                                               ; preds = %27
  %35 = load ptr, ptr %5, align 8
  br label %36

36:                                               ; preds = %34, %30
  %37 = phi ptr [ %33, %30 ], [ %35, %34 ]
  %38 = load ptr, ptr %5, align 8
  %39 = load i64, ptr %6, align 8
  %40 = getelementptr inbounds nuw i8, ptr %38, i64 %39
  %41 = load ptr, ptr %4, align 8
  %42 = load ptr, ptr %41, align 8
  %43 = getelementptr i8, ptr %42, i64 -24
  %44 = load i64, ptr %43, align 8
  %45 = getelementptr inbounds i8, ptr %41, i64 %44
  %46 = load ptr, ptr %4, align 8
  %47 = load ptr, ptr %46, align 8
  %48 = getelementptr i8, ptr %47, i64 -24
  %49 = load i64, ptr %48, align 8
  %50 = getelementptr inbounds i8, ptr %46, i64 %49
  %51 = invoke noundef signext i8 @_ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE4fillB8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(148) %50)
          to label %52 unwind label %72

52:                                               ; preds = %36
  %53 = getelementptr inbounds nuw %"class.std::__1::ostreambuf_iterator", ptr %11, i32 0, i32 0
  %54 = load ptr, ptr %53, align 8
  %55 = ptrtoint ptr %54 to i64
  %56 = invoke i64 @_ZNSt3__116__pad_and_outputB8ne200100IcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_(i64 %55, ptr noundef %20, ptr noundef %37, ptr noundef %40, ptr noundef nonnull align 8 dereferenceable(136) %45, i8 noundef signext %51)
          to label %57 unwind label %72

57:                                               ; preds = %52
  %58 = getelementptr inbounds nuw %"class.std::__1::ostreambuf_iterator", ptr %10, i32 0, i32 0
  %59 = inttoptr i64 %56 to ptr
  store ptr %59, ptr %58, align 8
  %60 = call noundef zeroext i1 @_ZNKSt3__119ostreambuf_iteratorIcNS_11char_traitsIcEEE6failedB8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(8) %10) #17
  br i1 %60, label %61, label %88

61:                                               ; preds = %57
  %62 = load ptr, ptr %4, align 8
  %63 = load ptr, ptr %62, align 8
  %64 = getelementptr i8, ptr %63, i64 -24
  %65 = load i64, ptr %64, align 8
  %66 = getelementptr inbounds i8, ptr %62, i64 %65
  invoke void @_ZNSt3__19basic_iosIcNS_11char_traitsIcEEE8setstateB8ne200100Ej(ptr noundef nonnull align 8 dereferenceable(148) %66, i32 noundef 5)
          to label %67 unwind label %72

67:                                               ; preds = %61
  br label %88

68:                                               ; preds = %3
  %69 = landingpad { ptr, i32 }
          catch ptr null
  %70 = extractvalue { ptr, i32 } %69, 0
  store ptr %70, ptr %8, align 8
  %71 = extractvalue { ptr, i32 } %69, 1
  store i32 %71, ptr %9, align 4
  br label %77

72:                                               ; preds = %61, %52, %36, %17, %14
  %73 = landingpad { ptr, i32 }
          catch ptr null
  %74 = extractvalue { ptr, i32 } %73, 0
  store ptr %74, ptr %8, align 8
  %75 = extractvalue { ptr, i32 } %73, 1
  store i32 %75, ptr %9, align 4
  %76 = call noundef ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %7) #17
  br label %77

77:                                               ; preds = %72, %68
  %78 = load ptr, ptr %8, align 8
  %79 = call ptr @__cxa_begin_catch(ptr %78) #17
  %80 = load ptr, ptr %4, align 8
  %81 = load ptr, ptr %80, align 8
  %82 = getelementptr i8, ptr %81, i64 -24
  %83 = load i64, ptr %82, align 8
  %84 = getelementptr inbounds i8, ptr %80, i64 %83
  invoke void @_ZNSt3__18ios_base33__set_badbit_and_consider_rethrowEv(ptr noundef nonnull align 8 dereferenceable(136) %84)
          to label %85 unwind label %91

85:                                               ; preds = %77
  call void @__cxa_end_catch()
  br label %86

86:                                               ; preds = %85, %89
  %87 = load ptr, ptr %4, align 8
  ret ptr %87

88:                                               ; preds = %67, %57
  br label %89

89:                                               ; preds = %88, %16
  %90 = call noundef ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryD1Ev(ptr noundef nonnull align 8 dereferenceable(16) %7) #17
  br label %86

91:                                               ; preds = %77
  %92 = landingpad { ptr, i32 }
          cleanup
  %93 = extractvalue { ptr, i32 } %92, 0
  store ptr %93, ptr %8, align 8
  %94 = extractvalue { ptr, i32 } %92, 1
  store i32 %94, ptr %9, align 4
  invoke void @__cxa_end_catch()
          to label %95 unwind label %101

95:                                               ; preds = %91
  br label %96

96:                                               ; preds = %95
  %97 = load ptr, ptr %8, align 8
  %98 = load i32, ptr %9, align 4
  %99 = insertvalue { ptr, i32 } poison, ptr %97, 0
  %100 = insertvalue { ptr, i32 } %99, i32 %98, 1
  resume { ptr, i32 } %100

101:                                              ; preds = %91
  %102 = landingpad { ptr, i32 }
          catch ptr null
  %103 = extractvalue { ptr, i32 } %102, 0
  call void @__clang_call_terminate(ptr %103) #18
  unreachable
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef i64 @_ZNSt3__111char_traitsIcE6lengthB8ne200100EPKc(ptr noundef %0) #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef i64 @_ZNSt3__118__constexpr_strlenB8ne200100IcEEmPKT_(ptr noundef %3) #17
  ret i64 %4
}

declare noundef ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryC1ERS3_(ptr noundef nonnull returned align 8 dereferenceable(16), ptr noundef nonnull align 8 dereferenceable(8)) unnamed_addr #1

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef zeroext i1 @_ZNKSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentrycvbB8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(16) %0) #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %"class.std::__1::basic_ostream<char>::sentry", ptr %3, i32 0, i32 0
  %5 = load i8, ptr %4, align 8
  %6 = trunc i8 %5 to i1
  ret i1 %6
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden i64 @_ZNSt3__116__pad_and_outputB8ne200100IcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_(i64 %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef nonnull align 8 dereferenceable(136) %4, i8 noundef signext %5) #2 personality ptr @__gxx_personality_v0 {
  %7 = alloca %"class.std::__1::ostreambuf_iterator", align 8
  %8 = alloca %"class.std::__1::ostreambuf_iterator", align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca i8, align 1
  %14 = alloca i64, align 8
  %15 = alloca i64, align 8
  %16 = alloca i64, align 8
  %17 = alloca %"class.std::__1::basic_string", align 8
  %18 = alloca ptr, align 8
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = getelementptr inbounds nuw %"class.std::__1::ostreambuf_iterator", ptr %8, i32 0, i32 0
  %22 = inttoptr i64 %0 to ptr
  store ptr %22, ptr %21, align 8
  store ptr %1, ptr %9, align 8
  store ptr %2, ptr %10, align 8
  store ptr %3, ptr %11, align 8
  store ptr %4, ptr %12, align 8
  store i8 %5, ptr %13, align 1
  %23 = getelementptr inbounds nuw %"class.std::__1::ostreambuf_iterator", ptr %8, i32 0, i32 0
  %24 = load ptr, ptr %23, align 8
  %25 = icmp eq ptr %24, null
  br i1 %25, label %26, label %27

26:                                               ; preds = %6
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %7, ptr align 8 %8, i64 8, i1 false)
  br label %111

27:                                               ; preds = %6
  %28 = load ptr, ptr %11, align 8
  %29 = load ptr, ptr %9, align 8
  %30 = ptrtoint ptr %28 to i64
  %31 = ptrtoint ptr %29 to i64
  %32 = sub i64 %30, %31
  store i64 %32, ptr %14, align 8
  %33 = load ptr, ptr %12, align 8
  %34 = call noundef i64 @_ZNKSt3__18ios_base5widthB8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(136) %33)
  store i64 %34, ptr %15, align 8
  %35 = load i64, ptr %15, align 8
  %36 = load i64, ptr %14, align 8
  %37 = icmp sgt i64 %35, %36
  br i1 %37, label %38, label %42

38:                                               ; preds = %27
  %39 = load i64, ptr %14, align 8
  %40 = load i64, ptr %15, align 8
  %41 = sub nsw i64 %40, %39
  store i64 %41, ptr %15, align 8
  br label %43

42:                                               ; preds = %27
  store i64 0, ptr %15, align 8
  br label %43

43:                                               ; preds = %42, %38
  %44 = load ptr, ptr %10, align 8
  %45 = load ptr, ptr %9, align 8
  %46 = ptrtoint ptr %44 to i64
  %47 = ptrtoint ptr %45 to i64
  %48 = sub i64 %46, %47
  store i64 %48, ptr %16, align 8
  %49 = load i64, ptr %16, align 8
  %50 = icmp sgt i64 %49, 0
  br i1 %50, label %51, label %62

51:                                               ; preds = %43
  %52 = getelementptr inbounds nuw %"class.std::__1::ostreambuf_iterator", ptr %8, i32 0, i32 0
  %53 = load ptr, ptr %52, align 8
  %54 = load ptr, ptr %9, align 8
  %55 = load i64, ptr %16, align 8
  %56 = call noundef i64 @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5sputnB8ne200100EPKcl(ptr noundef nonnull align 8 dereferenceable(64) %53, ptr noundef %54, i64 noundef %55)
  %57 = load i64, ptr %16, align 8
  %58 = icmp ne i64 %56, %57
  br i1 %58, label %59, label %61

59:                                               ; preds = %51
  %60 = getelementptr inbounds nuw %"class.std::__1::ostreambuf_iterator", ptr %8, i32 0, i32 0
  store ptr null, ptr %60, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %7, ptr align 8 %8, i64 8, i1 false)
  br label %111

61:                                               ; preds = %51
  br label %62

62:                                               ; preds = %61, %43
  %63 = load i64, ptr %15, align 8
  %64 = icmp sgt i64 %63, 0
  br i1 %64, label %65, label %89

65:                                               ; preds = %62
  %66 = load i64, ptr %15, align 8
  %67 = load i8, ptr %13, align 1
  %68 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B8ne200100Emc(ptr noundef nonnull align 8 dereferenceable(24) %17, i64 noundef %66, i8 noundef signext %67)
  %69 = getelementptr inbounds nuw %"class.std::__1::ostreambuf_iterator", ptr %8, i32 0, i32 0
  %70 = load ptr, ptr %69, align 8
  %71 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4dataB8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(24) %17) #17
  %72 = load i64, ptr %15, align 8
  %73 = invoke noundef i64 @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5sputnB8ne200100EPKcl(ptr noundef nonnull align 8 dereferenceable(64) %70, ptr noundef %71, i64 noundef %72)
          to label %74 unwind label %79

74:                                               ; preds = %65
  %75 = load i64, ptr %15, align 8
  %76 = icmp ne i64 %73, %75
  br i1 %76, label %77, label %84

77:                                               ; preds = %74
  %78 = getelementptr inbounds nuw %"class.std::__1::ostreambuf_iterator", ptr %8, i32 0, i32 0
  store ptr null, ptr %78, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %7, ptr align 8 %8, i64 8, i1 false)
  store i32 1, ptr %20, align 4
  br label %85

79:                                               ; preds = %65
  %80 = landingpad { ptr, i32 }
          cleanup
  %81 = extractvalue { ptr, i32 } %80, 0
  store ptr %81, ptr %18, align 8
  %82 = extractvalue { ptr, i32 } %80, 1
  store i32 %82, ptr %19, align 4
  %83 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %17) #17
  br label %115

84:                                               ; preds = %74
  store i32 0, ptr %20, align 4
  br label %85

85:                                               ; preds = %84, %77
  %86 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %17) #17
  %87 = load i32, ptr %20, align 4
  switch i32 %87, label %120 [
    i32 0, label %88
    i32 1, label %111
  ]

88:                                               ; preds = %85
  br label %89

89:                                               ; preds = %88, %62
  %90 = load ptr, ptr %11, align 8
  %91 = load ptr, ptr %10, align 8
  %92 = ptrtoint ptr %90 to i64
  %93 = ptrtoint ptr %91 to i64
  %94 = sub i64 %92, %93
  store i64 %94, ptr %16, align 8
  %95 = load i64, ptr %16, align 8
  %96 = icmp sgt i64 %95, 0
  br i1 %96, label %97, label %108

97:                                               ; preds = %89
  %98 = getelementptr inbounds nuw %"class.std::__1::ostreambuf_iterator", ptr %8, i32 0, i32 0
  %99 = load ptr, ptr %98, align 8
  %100 = load ptr, ptr %10, align 8
  %101 = load i64, ptr %16, align 8
  %102 = call noundef i64 @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5sputnB8ne200100EPKcl(ptr noundef nonnull align 8 dereferenceable(64) %99, ptr noundef %100, i64 noundef %101)
  %103 = load i64, ptr %16, align 8
  %104 = icmp ne i64 %102, %103
  br i1 %104, label %105, label %107

105:                                              ; preds = %97
  %106 = getelementptr inbounds nuw %"class.std::__1::ostreambuf_iterator", ptr %8, i32 0, i32 0
  store ptr null, ptr %106, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %7, ptr align 8 %8, i64 8, i1 false)
  br label %111

107:                                              ; preds = %97
  br label %108

108:                                              ; preds = %107, %89
  %109 = load ptr, ptr %12, align 8
  %110 = call noundef i64 @_ZNSt3__18ios_base5widthB8ne200100El(ptr noundef nonnull align 8 dereferenceable(136) %109, i64 noundef 0)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %7, ptr align 8 %8, i64 8, i1 false)
  br label %111

111:                                              ; preds = %108, %105, %85, %59, %26
  %112 = getelementptr inbounds nuw %"class.std::__1::ostreambuf_iterator", ptr %7, i32 0, i32 0
  %113 = load ptr, ptr %112, align 8
  %114 = ptrtoint ptr %113 to i64
  ret i64 %114

115:                                              ; preds = %79
  %116 = load ptr, ptr %18, align 8
  %117 = load i32, ptr %19, align 4
  %118 = insertvalue { ptr, i32 } poison, ptr %116, 0
  %119 = insertvalue { ptr, i32 } %118, i32 %117, 1
  resume { ptr, i32 } %119

120:                                              ; preds = %85
  unreachable
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__119ostreambuf_iteratorIcNS_11char_traitsIcEEEC1B8ne200100ERNS_13basic_ostreamIcS2_EE(ptr noundef nonnull returned align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) unnamed_addr #4 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = call noundef ptr @_ZNSt3__119ostreambuf_iteratorIcNS_11char_traitsIcEEEC2B8ne200100ERNS_13basic_ostreamIcS2_EE(ptr noundef nonnull align 8 dereferenceable(8) %5, ptr noundef nonnull align 8 dereferenceable(8) %6) #17
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef i32 @_ZNKSt3__18ios_base5flagsB8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(136) %0) #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %"class.std::__1::ios_base", ptr %3, i32 0, i32 1
  %5 = load i32, ptr %4, align 8
  ret i32 %5
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden noundef signext i8 @_ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE4fillB8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(148) %0) #2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %"class.std::__1::basic_ios", ptr %3, i32 0, i32 2
  %5 = call noundef zeroext i1 @_ZNKSt3__118_SentinelValueFillINS_11char_traitsIcEEE8__is_setB8ne200100Ev(ptr noundef nonnull align 1 dereferenceable(4) %4)
  br i1 %5, label %11, label %6

6:                                                ; preds = %1
  %7 = call noundef signext i8 @_ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE5widenB8ne200100Ec(ptr noundef nonnull align 8 dereferenceable(148) %3, i8 noundef signext 32)
  %8 = sext i8 %7 to i32
  %9 = getelementptr inbounds nuw %"class.std::__1::basic_ios", ptr %3, i32 0, i32 2
  %10 = call noundef nonnull align 1 dereferenceable(4) ptr @_ZNSt3__118_SentinelValueFillINS_11char_traitsIcEEEaSB8ne200100Ei(ptr noundef nonnull align 1 dereferenceable(4) %9, i32 noundef %8)
  br label %11

11:                                               ; preds = %6, %1
  %12 = getelementptr inbounds nuw %"class.std::__1::basic_ios", ptr %3, i32 0, i32 2
  %13 = call noundef i32 @_ZNKSt3__118_SentinelValueFillINS_11char_traitsIcEEE5__getB8ne200100Ev(ptr noundef nonnull align 1 dereferenceable(4) %12)
  %14 = trunc i32 %13 to i8
  ret i8 %14
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef zeroext i1 @_ZNKSt3__119ostreambuf_iteratorIcNS_11char_traitsIcEEE6failedB8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %"class.std::__1::ostreambuf_iterator", ptr %3, i32 0, i32 0
  %5 = load ptr, ptr %4, align 8
  %6 = icmp eq ptr %5, null
  ret i1 %6
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__19basic_iosIcNS_11char_traitsIcEEE8setstateB8ne200100Ej(ptr noundef nonnull align 8 dereferenceable(148) %0, i32 noundef %1) #2 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %5 = load ptr, ptr %3, align 8
  %6 = load i32, ptr %4, align 4
  call void @_ZNSt3__18ios_base8setstateB8ne200100Ej(ptr noundef nonnull align 8 dereferenceable(136) %5, i32 noundef %6)
  ret void
}

; Function Attrs: nounwind
declare noundef ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryD1Ev(ptr noundef nonnull returned align 8 dereferenceable(16)) unnamed_addr #5

declare void @_ZNSt3__18ios_base33__set_badbit_and_consider_rethrowEv(ptr noundef nonnull align 8 dereferenceable(136)) #1

declare void @__cxa_end_catch()

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef i64 @_ZNKSt3__18ios_base5widthB8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(136) %0) #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %"class.std::__1::ios_base", ptr %3, i32 0, i32 3
  %5 = load i64, ptr %4, align 8
  ret i64 %5
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden noundef i64 @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5sputnB8ne200100EPKcl(ptr noundef nonnull align 8 dereferenceable(64) %0, ptr noundef %1, i64 noundef %2) #2 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i64 %2, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load ptr, ptr %5, align 8
  %9 = load i64, ptr %6, align 8
  %10 = load ptr, ptr %7, align 8
  %11 = getelementptr inbounds ptr, ptr %10, i64 12
  %12 = load ptr, ptr %11, align 8
  %13 = call noundef i64 %12(ptr noundef nonnull align 8 dereferenceable(64) %7, ptr noundef %8, i64 noundef %9)
  ret i64 %13
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B8ne200100Emc(ptr noundef nonnull returned align 8 dereferenceable(24) %0, i64 noundef %1, i8 noundef signext %2) unnamed_addr #2 {
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca i8, align 1
  store ptr %0, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  store i8 %2, ptr %6, align 1
  %7 = load ptr, ptr %4, align 8
  %8 = load i64, ptr %5, align 8
  %9 = load i8, ptr %6, align 1
  %10 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2B8ne200100Emc(ptr noundef nonnull align 8 dereferenceable(24) %7, i64 noundef %8, i8 noundef signext %9)
  ret ptr %7
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4dataB8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE13__get_pointerB8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(24) %3) #17
  %5 = call noundef ptr @_ZNSt3__112__to_addressB8ne200100IcEEPT_S2_(ptr noundef %4) #17
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef i64 @_ZNSt3__18ios_base5widthB8ne200100El(ptr noundef nonnull align 8 dereferenceable(136) %0, i64 noundef %1) #4 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = getelementptr inbounds nuw %"class.std::__1::ios_base", ptr %6, i32 0, i32 3
  %8 = load i64, ptr %7, align 8
  store i64 %8, ptr %5, align 8
  %9 = load i64, ptr %4, align 8
  %10 = getelementptr inbounds nuw %"class.std::__1::ios_base", ptr %6, i32 0, i32 3
  store i64 %9, ptr %10, align 8
  %11 = load i64, ptr %5, align 8
  ret i64 %11
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2B8ne200100Emc(ptr noundef nonnull returned align 8 dereferenceable(24) %0, i64 noundef %1, i8 noundef signext %2) unnamed_addr #2 {
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca i8, align 1
  store ptr %0, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  store i8 %2, ptr %6, align 1
  %7 = load ptr, ptr %4, align 8
  %8 = getelementptr inbounds nuw %"class.std::__1::basic_string", ptr %7, i32 0, i32 0
  %9 = call noundef ptr @_ZNSt3__19allocatorIcEC1B8ne200100Ev(ptr noundef nonnull align 1 dereferenceable(1) %7) #17
  %10 = load i64, ptr %5, align 8
  %11 = load i8, ptr %6, align 1
  call void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6__initEmc(ptr noundef nonnull align 8 dereferenceable(24) %7, i64 noundef %10, i8 noundef signext %11)
  ret ptr %7
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__19allocatorIcEC1B8ne200100Ev(ptr noundef nonnull returned align 1 dereferenceable(1) %0) unnamed_addr #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef ptr @_ZNSt3__19allocatorIcEC2B8ne200100Ev(ptr noundef nonnull align 1 dereferenceable(1) %3) #17
  ret ptr %3
}

declare void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6__initEmc(ptr noundef nonnull align 8 dereferenceable(24), i64 noundef, i8 noundef signext) #1

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__19allocatorIcEC2B8ne200100Ev(ptr noundef nonnull returned align 1 dereferenceable(1) %0) unnamed_addr #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef ptr @_ZNSt3__116__non_trivial_ifILb1ENS_9allocatorIcEEEC2B8ne200100Ev(ptr noundef nonnull align 1 dereferenceable(1) %3) #17
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__116__non_trivial_ifILb1ENS_9allocatorIcEEEC2B8ne200100Ev(ptr noundef nonnull returned align 1 dereferenceable(1) %0) unnamed_addr #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__112__to_addressB8ne200100IcEEPT_S2_(ptr noundef %0) #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE13__get_pointerB8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef zeroext i1 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE9__is_longB8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(24) %3) #17
  br i1 %4, label %5, label %7

5:                                                ; preds = %1
  %6 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE18__get_long_pointerB8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(24) %3) #17
  br label %9

7:                                                ; preds = %1
  %8 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE19__get_short_pointerB8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(24) %3) #17
  br label %9

9:                                                ; preds = %7, %5
  %10 = phi ptr [ %6, %5 ], [ %8, %7 ]
  ret ptr %10
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef zeroext i1 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE9__is_longB8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %"class.std::__1::basic_string", ptr %3, i32 0, i32 0
  %5 = getelementptr inbounds nuw %"struct.std::__1::basic_string<char>::__short", ptr %4, i32 0, i32 1
  %6 = load i8, ptr %5, align 1
  %7 = lshr i8 %6, 7
  %8 = icmp ne i8 %7, 0
  ret i1 %8
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE18__get_long_pointerB8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %"class.std::__1::basic_string", ptr %3, i32 0, i32 0
  %5 = getelementptr inbounds nuw %"struct.std::__1::basic_string<char>::__long", ptr %4, i32 0, i32 0
  %6 = load ptr, ptr %5, align 8
  ret ptr %6
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE19__get_short_pointerB8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %"class.std::__1::basic_string", ptr %3, i32 0, i32 0
  %5 = getelementptr inbounds nuw %"struct.std::__1::basic_string<char>::__short", ptr %4, i32 0, i32 0
  %6 = getelementptr inbounds [23 x i8], ptr %5, i64 0, i64 0
  %7 = call noundef ptr @_ZNSt3__114pointer_traitsIPcE10pointer_toB8ne200100ERc(ptr noundef nonnull align 1 dereferenceable(1) %6) #17
  ret ptr %7
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__114pointer_traitsIPcE10pointer_toB8ne200100ERc(ptr noundef nonnull align 1 dereferenceable(1) %0) #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__119ostreambuf_iteratorIcNS_11char_traitsIcEEEC2B8ne200100ERNS_13basic_ostreamIcS2_EE(ptr noundef nonnull returned align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) unnamed_addr #4 personality ptr @__gxx_personality_v0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds nuw %"class.std::__1::ostreambuf_iterator", ptr %5, i32 0, i32 0
  %7 = load ptr, ptr %4, align 8
  %8 = load ptr, ptr %7, align 8
  %9 = getelementptr i8, ptr %8, i64 -24
  %10 = load i64, ptr %9, align 8
  %11 = getelementptr inbounds i8, ptr %7, i64 %10
  %12 = invoke noundef ptr @_ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE5rdbufB8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(148) %11)
          to label %13 unwind label %14

13:                                               ; preds = %2
  store ptr %12, ptr %6, align 8
  ret ptr %5

14:                                               ; preds = %2
  %15 = landingpad { ptr, i32 }
          catch ptr null
  %16 = extractvalue { ptr, i32 } %15, 0
  call void @__clang_call_terminate(ptr %16) #18
  unreachable
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE5rdbufB8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(148) %0) #2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef ptr @_ZNKSt3__18ios_base5rdbufB8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(136) %3)
  ret ptr %4
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNKSt3__18ios_base5rdbufB8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(136) %0) #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %"class.std::__1::ios_base", ptr %3, i32 0, i32 6
  %5 = load ptr, ptr %4, align 8
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef zeroext i1 @_ZNKSt3__118_SentinelValueFillINS_11char_traitsIcEEE8__is_setB8ne200100Ev(ptr noundef nonnull align 1 dereferenceable(4) %0) #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %"struct.std::__1::_SentinelValueFill", ptr %3, i32 0, i32 0
  %5 = load i32, ptr %4, align 1
  %6 = call noundef i32 @_ZNSt3__111char_traitsIcE3eofB8ne200100Ev() #17
  %7 = icmp ne i32 %5, %6
  ret i1 %7
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden noundef signext i8 @_ZNKSt3__19basic_iosIcNS_11char_traitsIcEEE5widenB8ne200100Ec(ptr noundef nonnull align 8 dereferenceable(148) %0, i8 noundef signext %1) #2 personality ptr @__gxx_personality_v0 {
  %3 = alloca ptr, align 8
  %4 = alloca i8, align 1
  %5 = alloca %"class.std::__1::locale", align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i8 %1, ptr %4, align 1
  %8 = load ptr, ptr %3, align 8
  call void @_ZNKSt3__18ios_base6getlocEv(ptr dead_on_unwind writable sret(%"class.std::__1::locale") align 8 %5, ptr noundef nonnull align 8 dereferenceable(136) %8)
  %9 = invoke noundef nonnull align 8 dereferenceable(25) ptr @_ZNSt3__19use_facetB8ne200100INS_5ctypeIcEEEERKT_RKNS_6localeE(ptr noundef nonnull align 8 dereferenceable(8) %5)
          to label %10 unwind label %15

10:                                               ; preds = %2
  %11 = load i8, ptr %4, align 1
  %12 = invoke noundef signext i8 @_ZNKSt3__15ctypeIcE5widenB8ne200100Ec(ptr noundef nonnull align 8 dereferenceable(25) %9, i8 noundef signext %11)
          to label %13 unwind label %15

13:                                               ; preds = %10
  %14 = call noundef ptr @_ZNSt3__16localeD1Ev(ptr noundef nonnull align 8 dereferenceable(8) %5) #17
  ret i8 %12

15:                                               ; preds = %10, %2
  %16 = landingpad { ptr, i32 }
          cleanup
  %17 = extractvalue { ptr, i32 } %16, 0
  store ptr %17, ptr %6, align 8
  %18 = extractvalue { ptr, i32 } %16, 1
  store i32 %18, ptr %7, align 4
  %19 = call noundef ptr @_ZNSt3__16localeD1Ev(ptr noundef nonnull align 8 dereferenceable(8) %5) #17
  br label %20

20:                                               ; preds = %15
  %21 = load ptr, ptr %6, align 8
  %22 = load i32, ptr %7, align 4
  %23 = insertvalue { ptr, i32 } poison, ptr %21, 0
  %24 = insertvalue { ptr, i32 } %23, i32 %22, 1
  resume { ptr, i32 } %24
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 1 dereferenceable(4) ptr @_ZNSt3__118_SentinelValueFillINS_11char_traitsIcEEEaSB8ne200100Ei(ptr noundef nonnull align 1 dereferenceable(4) %0, i32 noundef %1) #4 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %5 = load ptr, ptr %3, align 8
  %6 = load i32, ptr %4, align 4
  %7 = getelementptr inbounds nuw %"struct.std::__1::_SentinelValueFill", ptr %5, i32 0, i32 0
  store i32 %6, ptr %7, align 1
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef i32 @_ZNKSt3__118_SentinelValueFillINS_11char_traitsIcEEE5__getB8ne200100Ev(ptr noundef nonnull align 1 dereferenceable(4) %0) #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %"struct.std::__1::_SentinelValueFill", ptr %3, i32 0, i32 0
  %5 = load i32, ptr %4, align 1
  ret i32 %5
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef i32 @_ZNSt3__111char_traitsIcE3eofB8ne200100Ev() #4 {
  ret i32 -1
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden noundef nonnull align 8 dereferenceable(25) ptr @_ZNSt3__19use_facetB8ne200100INS_5ctypeIcEEEERKT_RKNS_6localeE(ptr noundef nonnull align 8 dereferenceable(8) %0) #2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef ptr @_ZNKSt3__16locale9use_facetERNS0_2idE(ptr noundef nonnull align 8 dereferenceable(8) %3, ptr noundef nonnull align 8 dereferenceable(12) @_ZNSt3__15ctypeIcE2idE)
  ret ptr %4
}

declare void @_ZNKSt3__18ios_base6getlocEv(ptr dead_on_unwind writable sret(%"class.std::__1::locale") align 8, ptr noundef nonnull align 8 dereferenceable(136)) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden noundef signext i8 @_ZNKSt3__15ctypeIcE5widenB8ne200100Ec(ptr noundef nonnull align 8 dereferenceable(25) %0, i8 noundef signext %1) #2 {
  %3 = alloca ptr, align 8
  %4 = alloca i8, align 1
  store ptr %0, ptr %3, align 8
  store i8 %1, ptr %4, align 1
  %5 = load ptr, ptr %3, align 8
  %6 = load i8, ptr %4, align 1
  %7 = load ptr, ptr %5, align 8
  %8 = getelementptr inbounds ptr, ptr %7, i64 7
  %9 = load ptr, ptr %8, align 8
  %10 = call noundef signext i8 %9(ptr noundef nonnull align 8 dereferenceable(25) %5, i8 noundef signext %6)
  ret i8 %10
}

; Function Attrs: nounwind
declare noundef ptr @_ZNSt3__16localeD1Ev(ptr noundef nonnull returned align 8 dereferenceable(8)) unnamed_addr #5

declare noundef ptr @_ZNKSt3__16locale9use_facetERNS0_2idE(ptr noundef nonnull align 8 dereferenceable(8), ptr noundef nonnull align 8 dereferenceable(12)) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr hidden void @_ZNSt3__18ios_base8setstateB8ne200100Ej(ptr noundef nonnull align 8 dereferenceable(136) %0, i32 noundef %1) #2 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds nuw %"class.std::__1::ios_base", ptr %5, i32 0, i32 4
  %7 = load i32, ptr %6, align 8
  %8 = load i32, ptr %4, align 4
  %9 = or i32 %7, %8
  call void @_ZNSt3__18ios_base5clearEj(ptr noundef nonnull align 8 dereferenceable(136) %5, i32 noundef %9)
  ret void
}

declare void @_ZNSt3__18ios_base5clearEj(ptr noundef nonnull align 8 dereferenceable(136), i32 noundef) #1

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef i64 @_ZNSt3__118__constexpr_strlenB8ne200100IcEEmPKT_(ptr noundef %0) #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call i64 @strlen(ptr noundef %3) #17
  ret i64 %4
}

; Function Attrs: nounwind
declare i64 @strlen(ptr noundef) #5

declare noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc(ptr noundef nonnull align 8 dereferenceable(8), i8 noundef signext) #1

declare noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE5flushEv(ptr noundef nonnull align 8 dereferenceable(8)) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef nonnull align 8 dereferenceable(16) ptr @_ZN7sc_core15sc_event_finder13cached_createINS_15sc_signal_in_ifIbEEEERS0_RPS0_RKNS_12sc_port_baseEMT_KFRKNS_8sc_eventEvE(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(64) %1, [2 x i64] %2) #2 personality ptr @__gxx_personality_v0 {
  %4 = alloca { i64, i64 }, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca { i64, i64 }, align 8
  %8 = alloca { i64, i64 }, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  store [2 x i64] %2, ptr %4, align 8
  %11 = load { i64, i64 }, ptr %4, align 8
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store { i64, i64 } %11, ptr %7, align 8
  %12 = load ptr, ptr %5, align 8
  %13 = load ptr, ptr %12, align 8
  %14 = icmp ne ptr %13, null
  br i1 %14, label %27, label %15

15:                                               ; preds = %3
  %16 = call noalias noundef nonnull ptr @_Znwm(i64 noundef 32) #21
  %17 = load ptr, ptr %6, align 8
  %18 = load { i64, i64 }, ptr %7, align 8
  store { i64, i64 } %18, ptr %8, align 8
  %19 = load [2 x i64], ptr %8, align 8
  %20 = invoke noundef ptr @_ZN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEEC1ERKNS_12sc_port_baseEMS2_KFRKNS_8sc_eventEvE(ptr noundef nonnull align 8 dereferenceable(32) %16, ptr noundef nonnull align 8 dereferenceable(64) %17, [2 x i64] %19)
          to label %21 unwind label %23

21:                                               ; preds = %15
  %22 = load ptr, ptr %5, align 8
  store ptr %16, ptr %22, align 8
  br label %27

23:                                               ; preds = %15
  %24 = landingpad { ptr, i32 }
          cleanup
  %25 = extractvalue { ptr, i32 } %24, 0
  store ptr %25, ptr %9, align 8
  %26 = extractvalue { ptr, i32 } %24, 1
  store i32 %26, ptr %10, align 4
  call void @_ZdlPvm(ptr noundef %16, i64 noundef 32) #19
  br label %40

27:                                               ; preds = %21, %3
  %28 = load ptr, ptr %6, align 8
  %29 = load ptr, ptr %5, align 8
  %30 = load ptr, ptr %29, align 8
  %31 = call noundef nonnull align 8 dereferenceable(64) ptr @_ZNK7sc_core15sc_event_finder4portEv(ptr noundef nonnull align 8 dereferenceable(16) %30)
  %32 = icmp eq ptr %28, %31
  br i1 %32, label %33, label %34

33:                                               ; preds = %27
  br label %36

34:                                               ; preds = %27
  call void @_ZN7sc_core19sc_assertion_failedEPKcS1_i(ptr noundef @.str.14, ptr noundef @.str.15, i32 noundef 139) #20
  unreachable

35:                                               ; No predecessors!
  br label %36

36:                                               ; preds = %35, %33
  %37 = phi i32 [ 0, %33 ], [ 0, %35 ]
  %38 = load ptr, ptr %5, align 8
  %39 = load ptr, ptr %38, align 8
  ret ptr %39

40:                                               ; preds = %23
  %41 = load ptr, ptr %9, align 8
  %42 = load i32, ptr %10, align 4
  %43 = insertvalue { ptr, i32 } poison, ptr %41, 0
  %44 = insertvalue { ptr, i32 } %43, i32 %42, 1
  resume { ptr, i32 } %44
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEEC1ERKNS_12sc_port_baseEMS2_KFRKNS_8sc_eventEvE(ptr noundef nonnull returned align 8 dereferenceable(32) %0, ptr noundef nonnull align 8 dereferenceable(64) %1, [2 x i64] %2) unnamed_addr #2 {
  %4 = alloca { i64, i64 }, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca { i64, i64 }, align 8
  %8 = alloca { i64, i64 }, align 8
  store [2 x i64] %2, ptr %4, align 8
  %9 = load { i64, i64 }, ptr %4, align 8
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store { i64, i64 } %9, ptr %7, align 8
  %10 = load ptr, ptr %5, align 8
  %11 = load ptr, ptr %6, align 8
  %12 = load { i64, i64 }, ptr %7, align 8
  store { i64, i64 } %12, ptr %8, align 8
  %13 = load [2 x i64], ptr %8, align 8
  %14 = call noundef ptr @_ZN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEEC2ERKNS_12sc_port_baseEMS2_KFRKNS_8sc_eventEvE(ptr noundef nonnull align 8 dereferenceable(32) %10, ptr noundef nonnull align 8 dereferenceable(64) %11, [2 x i64] %13)
  ret ptr %10
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef nonnull align 8 dereferenceable(64) ptr @_ZNK7sc_core15sc_event_finder4portEv(ptr noundef nonnull align 8 dereferenceable(16) %0) #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %"class.sc_core::sc_event_finder", ptr %3, i32 0, i32 1
  %5 = load ptr, ptr %4, align 8
  ret ptr %5
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEEC2ERKNS_12sc_port_baseEMS2_KFRKNS_8sc_eventEvE(ptr noundef nonnull returned align 8 dereferenceable(32) %0, ptr noundef nonnull align 8 dereferenceable(64) %1, [2 x i64] %2) unnamed_addr #2 {
  %4 = alloca { i64, i64 }, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca { i64, i64 }, align 8
  store [2 x i64] %2, ptr %4, align 8
  %8 = load { i64, i64 }, ptr %4, align 8
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store { i64, i64 } %8, ptr %7, align 8
  %9 = load ptr, ptr %5, align 8
  %10 = load ptr, ptr %6, align 8
  %11 = call noundef ptr @_ZN7sc_core15sc_event_finderC2ERKNS_12sc_port_baseE(ptr noundef nonnull align 8 dereferenceable(16) %9, ptr noundef nonnull align 8 dereferenceable(64) %10)
  store ptr getelementptr inbounds inrange(-16, 24) ({ [5 x ptr] }, ptr @_ZTVN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEEE, i32 0, i32 0, i32 2), ptr %9, align 8
  %12 = getelementptr inbounds nuw %"class.sc_core::sc_event_finder_t", ptr %9, i32 0, i32 1
  %13 = load { i64, i64 }, ptr %7, align 8
  store { i64, i64 } %13, ptr %12, align 8
  ret ptr %9
}

declare noundef ptr @_ZN7sc_core15sc_event_finderC2ERKNS_12sc_port_baseE(ptr noundef nonnull returned align 8 dereferenceable(16), ptr noundef nonnull align 8 dereferenceable(64)) unnamed_addr #1

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEED1Ev(ptr noundef nonnull returned align 8 dereferenceable(32) %0) unnamed_addr #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef ptr @_ZN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEED2Ev(ptr noundef nonnull align 8 dereferenceable(32) %3) #17
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr void @_ZN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEED0Ev(ptr noundef nonnull align 8 dereferenceable(32) %0) unnamed_addr #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef ptr @_ZN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEED1Ev(ptr noundef nonnull align 8 dereferenceable(32) %3) #17
  call void @_ZdlPvm(ptr noundef %3, i64 noundef 32) #19
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef nonnull align 8 dereferenceable(160) ptr @_ZNK7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEE10find_eventEPNS_12sc_interfaceE(ptr noundef nonnull align 8 dereferenceable(32) %0, ptr noundef %1) unnamed_addr #2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load ptr, ptr %5, align 8
  %9 = icmp ne ptr %8, null
  br i1 %9, label %10, label %18

10:                                               ; preds = %2
  %11 = load ptr, ptr %5, align 8
  %12 = icmp eq ptr %11, null
  br i1 %12, label %15, label %13

13:                                               ; preds = %10
  %14 = call ptr @__dynamic_cast(ptr %11, ptr @_ZTIN7sc_core12sc_interfaceE, ptr @_ZTIN7sc_core15sc_signal_in_ifIbEE, i64 -1) #17
  br label %16

15:                                               ; preds = %10
  br label %16

16:                                               ; preds = %15, %13
  %17 = phi ptr [ %14, %13 ], [ null, %15 ]
  br label %30

18:                                               ; preds = %2
  %19 = call noundef nonnull align 8 dereferenceable(64) ptr @_ZNK7sc_core15sc_event_finder4portEv(ptr noundef nonnull align 8 dereferenceable(16) %7)
  %20 = load ptr, ptr %19, align 8
  %21 = getelementptr inbounds ptr, ptr %20, i64 10
  %22 = load ptr, ptr %21, align 8
  %23 = call noundef ptr %22(ptr noundef nonnull align 8 dereferenceable(64) %19)
  %24 = icmp eq ptr %23, null
  br i1 %24, label %27, label %25

25:                                               ; preds = %18
  %26 = call ptr @__dynamic_cast(ptr %23, ptr @_ZTIN7sc_core12sc_interfaceE, ptr @_ZTIN7sc_core15sc_signal_in_ifIbEE, i64 -1) #17
  br label %28

27:                                               ; preds = %18
  br label %28

28:                                               ; preds = %27, %25
  %29 = phi ptr [ %26, %25 ], [ null, %27 ]
  br label %30

30:                                               ; preds = %28, %16
  %31 = phi ptr [ %17, %16 ], [ %29, %28 ]
  store ptr %31, ptr %6, align 8
  %32 = load ptr, ptr %6, align 8
  %33 = icmp eq ptr %32, null
  br i1 %33, label %34, label %36

34:                                               ; preds = %30
  call void @_ZNK7sc_core15sc_event_finder12report_errorEPKcS2_(ptr noundef nonnull align 8 dereferenceable(16) %7, ptr noundef @_ZN7sc_core17SC_ID_FIND_EVENT_E, ptr noundef @.str.11)
  %35 = call noundef nonnull align 8 dereferenceable(160) ptr @_ZN7sc_core8sc_event4noneEv()
  store ptr %35, ptr %3, align 8
  br label %57

36:                                               ; preds = %30
  %37 = load ptr, ptr %6, align 8
  %38 = getelementptr inbounds nuw %"class.sc_core::sc_event_finder_t", ptr %7, i32 0, i32 1
  %39 = load { i64, i64 }, ptr %38, align 8
  %40 = extractvalue { i64, i64 } %39, 1
  %41 = ashr i64 %40, 1
  %42 = getelementptr inbounds i8, ptr %37, i64 %41
  %43 = extractvalue { i64, i64 } %39, 0
  %44 = and i64 %40, 1
  %45 = icmp ne i64 %44, 0
  br i1 %45, label %46, label %52

46:                                               ; preds = %36
  %47 = load ptr, ptr %42, align 8
  %48 = trunc i64 %43 to i32
  %49 = zext i32 %48 to i64
  %50 = getelementptr i8, ptr %47, i64 %49, !nosanitize !15
  %51 = load ptr, ptr %50, align 8, !nosanitize !15
  br label %54

52:                                               ; preds = %36
  %53 = inttoptr i64 %43 to ptr
  br label %54

54:                                               ; preds = %52, %46
  %55 = phi ptr [ %51, %46 ], [ %53, %52 ]
  %56 = call noundef nonnull align 8 dereferenceable(160) ptr %55(ptr noundef nonnull align 8 dereferenceable(8) %42)
  store ptr %56, ptr %3, align 8
  br label %57

57:                                               ; preds = %54, %34
  %58 = load ptr, ptr %3, align 8
  ret ptr %58
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7sc_core17sc_event_finder_tINS_15sc_signal_in_ifIbEEED2Ev(ptr noundef nonnull returned align 8 dereferenceable(32) %0) unnamed_addr #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef ptr @_ZN7sc_core15sc_event_finderD2Ev(ptr noundef nonnull align 8 dereferenceable(16) %3) #17
  ret ptr %3
}

; Function Attrs: nounwind
declare noundef ptr @_ZN7sc_core15sc_event_finderD2Ev(ptr noundef nonnull returned align 8 dereferenceable(16)) unnamed_addr #5

declare void @_ZNK7sc_core15sc_event_finder12report_errorEPKcS2_(ptr noundef nonnull align 8 dereferenceable(16), ptr noundef, ptr noundef) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef nonnull align 8 dereferenceable(160) ptr @_ZN7sc_core8sc_event4noneEv() #2 {
  %1 = call noundef ptr @_ZN7sc_core22sc_get_curr_simcontextEv()
  %2 = call noundef nonnull align 8 dereferenceable(160) ptr @_ZN7sc_core13sc_simcontext10null_eventEv(ptr noundef nonnull align 8 dereferenceable(456) %1)
  ret ptr %2
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7sc_core22sc_get_curr_simcontextEv() #2 personality ptr @__gxx_personality_v0 {
  %1 = alloca ptr, align 8
  %2 = alloca i32, align 4
  %3 = load ptr, ptr @_ZN7sc_core18sc_curr_simcontextE, align 8
  %4 = icmp eq ptr %3, null
  br i1 %4, label %5, label %14

5:                                                ; preds = %0
  %6 = call noalias noundef nonnull ptr @_Znwm(i64 noundef 456) #21
  %7 = invoke noundef ptr @_ZN7sc_core13sc_simcontextC1Ev(ptr noundef nonnull align 8 dereferenceable(456) %6)
          to label %8 unwind label %10

8:                                                ; preds = %5
  store ptr %6, ptr @_ZN7sc_core25sc_default_global_contextE, align 8
  %9 = load ptr, ptr @_ZN7sc_core25sc_default_global_contextE, align 8
  store ptr %9, ptr @_ZN7sc_core18sc_curr_simcontextE, align 8
  br label %14

10:                                               ; preds = %5
  %11 = landingpad { ptr, i32 }
          cleanup
  %12 = extractvalue { ptr, i32 } %11, 0
  store ptr %12, ptr %1, align 8
  %13 = extractvalue { ptr, i32 } %11, 1
  store i32 %13, ptr %2, align 4
  call void @_ZdlPvm(ptr noundef %6, i64 noundef 456) #19
  br label %16

14:                                               ; preds = %8, %0
  %15 = load ptr, ptr @_ZN7sc_core18sc_curr_simcontextE, align 8
  ret ptr %15

16:                                               ; preds = %10
  %17 = load ptr, ptr %1, align 8
  %18 = load i32, ptr %2, align 4
  %19 = insertvalue { ptr, i32 } poison, ptr %17, 0
  %20 = insertvalue { ptr, i32 } %19, i32 %18, 1
  resume { ptr, i32 } %20
}

declare noundef nonnull align 8 dereferenceable(160) ptr @_ZN7sc_core13sc_simcontext10null_eventEv(ptr noundef nonnull align 8 dereferenceable(456)) #1

declare noundef ptr @_ZN7sc_core13sc_simcontextC1Ev(ptr noundef nonnull returned align 8 dereferenceable(456)) unnamed_addr #1

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7sc_core6sc_outIiED2Ev(ptr noundef nonnull returned align 8 dereferenceable(120) %0) unnamed_addr #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef ptr @_ZN7sc_core8sc_inoutIiED2Ev(ptr noundef nonnull align 8 dereferenceable(120) %3) #17
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7sc_core5sc_inIbED2Ev(ptr noundef nonnull returned align 8 dereferenceable(128) %0) unnamed_addr #4 personality ptr @__gxx_personality_v0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  store ptr %4, ptr %2, align 8
  store ptr getelementptr inbounds inrange(-16, 216) ({ [29 x ptr] }, ptr @_ZTVN7sc_core5sc_inIbEE, i32 0, i32 0, i32 2), ptr %4, align 8
  invoke void @_ZNK7sc_core5sc_inIbE13remove_tracesEv(ptr noundef nonnull align 8 dereferenceable(128) %4)
          to label %5 unwind label %32

5:                                                ; preds = %1
  %6 = getelementptr inbounds nuw %"class.sc_core::sc_in", ptr %4, i32 0, i32 2
  %7 = load ptr, ptr %6, align 8
  %8 = icmp eq ptr %7, null
  br i1 %8, label %13, label %9

9:                                                ; preds = %5
  %10 = load ptr, ptr %7, align 8
  %11 = getelementptr inbounds ptr, ptr %10, i64 1
  %12 = load ptr, ptr %11, align 8
  call void %12(ptr noundef nonnull align 8 dereferenceable(16) %7) #17
  br label %13

13:                                               ; preds = %9, %5
  %14 = getelementptr inbounds nuw %"class.sc_core::sc_in", ptr %4, i32 0, i32 3
  %15 = load ptr, ptr %14, align 8
  %16 = icmp eq ptr %15, null
  br i1 %16, label %21, label %17

17:                                               ; preds = %13
  %18 = load ptr, ptr %15, align 8
  %19 = getelementptr inbounds ptr, ptr %18, i64 1
  %20 = load ptr, ptr %19, align 8
  call void %20(ptr noundef nonnull align 8 dereferenceable(16) %15) #17
  br label %21

21:                                               ; preds = %17, %13
  %22 = getelementptr inbounds nuw %"class.sc_core::sc_in", ptr %4, i32 0, i32 4
  %23 = load ptr, ptr %22, align 8
  %24 = icmp eq ptr %23, null
  br i1 %24, label %29, label %25

25:                                               ; preds = %21
  %26 = load ptr, ptr %23, align 8
  %27 = getelementptr inbounds ptr, ptr %26, i64 1
  %28 = load ptr, ptr %27, align 8
  call void %28(ptr noundef nonnull align 8 dereferenceable(16) %23) #17
  br label %29

29:                                               ; preds = %25, %21
  %30 = call noundef ptr @_ZN7sc_core7sc_portINS_15sc_signal_in_ifIbEELi1ELNS_14sc_port_policyE0EED2Ev(ptr noundef nonnull align 8 dereferenceable(96) %4) #17
  %31 = load ptr, ptr %2, align 8
  ret ptr %31

32:                                               ; preds = %1
  %33 = landingpad { ptr, i32 }
          catch ptr null
  %34 = extractvalue { ptr, i32 } %33, 0
  call void @__clang_call_terminate(ptr %34) #18
  unreachable
}

declare void @_ZNK7sc_core5sc_inIbE13remove_tracesEv(ptr noundef nonnull align 8 dereferenceable(128)) #1

; Function Attrs: nounwind
declare noundef ptr @_ZN7sc_core7sc_portINS_15sc_signal_in_ifIbEELi1ELNS_14sc_port_policyE0EED2Ev(ptr noundef nonnull returned align 8 dereferenceable(96)) unnamed_addr #5

declare void @_ZN7sc_core8sc_startERKNS_7sc_timeENS_20sc_starvation_policyE(ptr noundef nonnull align 8 dereferenceable(8), i32 noundef) #1

declare noundef ptr @_ZN7sc_core7sc_timeC1EdNS_12sc_time_unitE(ptr noundef nonnull returned align 8 dereferenceable(8), double noundef, i32 noundef) unnamed_addr #1

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN14simple_counterD2Ev(ptr noundef nonnull returned align 8 dereferenceable(612) %0) unnamed_addr #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  store ptr getelementptr inbounds inrange(-16, 136) ({ [19 x ptr], [4 x ptr] }, ptr @_ZTV14simple_counter, i32 0, i32 0, i32 2), ptr %3, align 8
  %4 = getelementptr inbounds i8, ptr %3, i64 112
  store ptr getelementptr inbounds inrange(-16, 16) ({ [19 x ptr], [4 x ptr] }, ptr @_ZTV14simple_counter, i32 0, i32 1, i32 2), ptr %4, align 8
  %5 = getelementptr inbounds nuw %struct.simple_counter, ptr %3, i32 0, i32 3
  %6 = call noundef ptr @_ZN7sc_core6sc_outIiED1Ev(ptr noundef nonnull align 8 dereferenceable(120) %5) #17
  %7 = getelementptr inbounds nuw %struct.simple_counter, ptr %3, i32 0, i32 2
  %8 = call noundef ptr @_ZN7sc_core5sc_inIbED1Ev(ptr noundef nonnull align 8 dereferenceable(128) %7) #17
  %9 = getelementptr inbounds nuw %struct.simple_counter, ptr %3, i32 0, i32 1
  %10 = call noundef ptr @_ZN7sc_core5sc_inIbED1Ev(ptr noundef nonnull align 8 dereferenceable(128) %9) #17
  %11 = call noundef ptr @_ZN7sc_core9sc_moduleD2Ev(ptr noundef nonnull align 8 dereferenceable(232) %3) #17
  ret ptr %3
}

declare noundef ptr @_ZN7sc_core12sc_interfaceC2Ev(ptr noundef nonnull returned align 8 dereferenceable(8)) unnamed_addr #1

declare noundef ptr @_ZN7sc_core18sc_gen_unique_nameEPKcb(ptr noundef, i1 noundef zeroext) #1

declare noundef ptr @_ZN7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EEC2EPKcRKb(ptr noundef nonnull returned align 8 dereferenceable(130), ptr noundef, ptr noundef, ptr noundef nonnull align 1 dereferenceable(1)) unnamed_addr #1

; Function Attrs: nounwind
declare noundef ptr @_ZN7sc_core12sc_interfaceD2Ev(ptr noundef nonnull returned align 8 dereferenceable(8)) unnamed_addr #5

declare void @_ZN7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE13register_portERNS_12sc_port_baseEPKc(ptr noundef nonnull align 8 dereferenceable(130), ptr noundef nonnull align 8 dereferenceable(64), ptr noundef) unnamed_addr #1

declare noundef nonnull align 8 dereferenceable(160) ptr @_ZNK7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE13default_eventEv(ptr noundef nonnull align 8 dereferenceable(130)) unnamed_addr #1

; Function Attrs: nounwind
declare noundef ptr @_ZN7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EED1Ev(ptr noundef nonnull returned align 8 dereferenceable(130)) unnamed_addr #5

; Function Attrs: nounwind
declare void @_ZN7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EED0Ev(ptr noundef nonnull align 8 dereferenceable(130)) unnamed_addr #5

declare noundef nonnull align 8 dereferenceable(160) ptr @_ZNK7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE19value_changed_eventEv(ptr noundef nonnull align 8 dereferenceable(130)) unnamed_addr #1

declare void @__cxa_pure_virtual() unnamed_addr

declare noundef nonnull align 1 dereferenceable(1) ptr @_ZNK7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE4readEv(ptr noundef nonnull align 8 dereferenceable(130)) unnamed_addr #1

declare noundef nonnull align 1 dereferenceable(1) ptr @_ZNK7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE12get_data_refEv(ptr noundef nonnull align 8 dereferenceable(130)) unnamed_addr #1

declare noundef zeroext i1 @_ZNK7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE5eventEv(ptr noundef nonnull align 8 dereferenceable(130)) unnamed_addr #1

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZNK7sc_core15sc_signal_in_ifIbE8is_resetEv(ptr noundef nonnull align 8 dereferenceable(8) %0) unnamed_addr #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  ret ptr null
}

declare noundef ptr @_ZNK7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE4kindEv(ptr noundef nonnull align 8 dereferenceable(130)) unnamed_addr #1

declare noundef i32 @_ZNK7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE17get_writer_policyEv(ptr noundef nonnull align 8 dereferenceable(130)) unnamed_addr #1

declare void @_ZNK7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE5traceEPNS_13sc_trace_fileE(ptr noundef nonnull align 8 dereferenceable(130), ptr noundef) unnamed_addr #1

declare void @_ZNK7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE5printERNSt3__113basic_ostreamIcNS3_11char_traitsIcEEEE(ptr noundef nonnull align 8 dereferenceable(130), ptr noundef nonnull align 8 dereferenceable(8)) unnamed_addr #1

declare void @_ZNK7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE4dumpERNSt3__113basic_ostreamIcNS3_11char_traitsIcEEEE(ptr noundef nonnull align 8 dereferenceable(130), ptr noundef nonnull align 8 dereferenceable(8)) unnamed_addr #1

declare void @_ZN7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE6updateEv(ptr noundef nonnull align 8 dereferenceable(130)) unnamed_addr #1

; Function Attrs: nounwind
declare noundef ptr @_ZThn8_N7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EED1Ev(ptr noundef) unnamed_addr #5

; Function Attrs: nounwind
declare void @_ZThn8_N7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EED0Ev(ptr noundef) unnamed_addr #5

declare void @_ZThn8_N7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE5writeERKb(ptr noundef, ptr noundef nonnull align 1 dereferenceable(1)) unnamed_addr #1

declare noundef i32 @_ZThn8_NK7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE17get_writer_policyEv(ptr noundef) unnamed_addr #1

declare void @_ZN7sc_core12sc_interface13register_portERNS_12sc_port_baseEPKc(ptr noundef nonnull align 8 dereferenceable(8), ptr noundef nonnull align 8 dereferenceable(64), ptr noundef) unnamed_addr #1

declare noundef nonnull align 8 dereferenceable(160) ptr @_ZNK7sc_core12sc_interface13default_eventEv(ptr noundef nonnull align 8 dereferenceable(8)) unnamed_addr #1

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7sc_core18sc_signal_inout_ifIbED1Ev(ptr noundef nonnull returned align 8 dereferenceable(16) %0) unnamed_addr #4 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  store ptr %4, ptr %2, align 8
  call void @llvm.trap() #18
  unreachable
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr void @_ZN7sc_core18sc_signal_inout_ifIbED0Ev(ptr noundef nonnull align 8 dereferenceable(16) %0) unnamed_addr #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  call void @llvm.trap() #18
  unreachable
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZThn8_N7sc_core18sc_signal_inout_ifIbED1Ev(ptr noundef %0) unnamed_addr #6 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  store ptr %4, ptr %2, align 8
  %5 = getelementptr inbounds i8, ptr %4, i64 -8
  %6 = tail call noundef ptr @_ZN7sc_core18sc_signal_inout_ifIbED1Ev(ptr noundef nonnull align 8 dereferenceable(16) %5) #17
  ret ptr undef
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr void @_ZThn8_N7sc_core18sc_signal_inout_ifIbED0Ev(ptr noundef %0) unnamed_addr #6 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds i8, ptr %3, i64 -8
  tail call void @_ZN7sc_core18sc_signal_inout_ifIbED0Ev(ptr noundef nonnull align 8 dereferenceable(16) %4) #17
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef i32 @_ZNK7sc_core18sc_signal_write_ifIbE17get_writer_policyEv(ptr noundef nonnull align 8 dereferenceable(8) %0) unnamed_addr #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  ret i32 0
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7sc_core15sc_signal_in_ifIbED1Ev(ptr noundef nonnull returned align 8 dereferenceable(8) %0) unnamed_addr #4 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  store ptr %4, ptr %2, align 8
  call void @llvm.trap() #18
  unreachable
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr void @_ZN7sc_core15sc_signal_in_ifIbED0Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) unnamed_addr #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  call void @llvm.trap() #18
  unreachable
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7sc_core18sc_signal_write_ifIbED1Ev(ptr noundef nonnull returned align 8 dereferenceable(8) %0) unnamed_addr #4 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  store ptr %4, ptr %2, align 8
  call void @llvm.trap() #18
  unreachable
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr void @_ZN7sc_core18sc_signal_write_ifIbED0Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) unnamed_addr #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  call void @llvm.trap() #18
  unreachable
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZTv0_n40_N7sc_core18sc_signal_write_ifIbED1Ev(ptr noundef %0) unnamed_addr #6 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  store ptr %4, ptr %2, align 8
  %5 = load ptr, ptr %4, align 8
  %6 = getelementptr inbounds i8, ptr %5, i64 -40
  %7 = load i64, ptr %6, align 8
  %8 = getelementptr inbounds i8, ptr %4, i64 %7
  %9 = tail call noundef ptr @_ZN7sc_core18sc_signal_write_ifIbED1Ev(ptr noundef nonnull align 8 dereferenceable(8) %8) #17
  ret ptr undef
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr void @_ZTv0_n40_N7sc_core18sc_signal_write_ifIbED0Ev(ptr noundef %0) unnamed_addr #6 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = getelementptr inbounds i8, ptr %4, i64 -40
  %6 = load i64, ptr %5, align 8
  %7 = getelementptr inbounds i8, ptr %3, i64 %6
  tail call void @_ZN7sc_core18sc_signal_write_ifIbED0Ev(ptr noundef nonnull align 8 dereferenceable(8) %7) #17
  ret void
}

; Function Attrs: nounwind
declare void @_ZN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EED0Ev(ptr noundef nonnull align 8 dereferenceable(160)) unnamed_addr #5

declare noundef nonnull align 8 dereferenceable(160) ptr @_ZNK7sc_core9sc_signalIbLNS_16sc_writer_policyE0EE13posedge_eventEv(ptr noundef nonnull align 8 dereferenceable(160)) unnamed_addr #1

declare noundef nonnull align 8 dereferenceable(160) ptr @_ZNK7sc_core9sc_signalIbLNS_16sc_writer_policyE0EE13negedge_eventEv(ptr noundef nonnull align 8 dereferenceable(160)) unnamed_addr #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef zeroext i1 @_ZNK7sc_core9sc_signalIbLNS_16sc_writer_policyE0EE7posedgeEv(ptr noundef nonnull align 8 dereferenceable(160) %0) unnamed_addr #2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = getelementptr inbounds ptr, ptr %4, i64 9
  %6 = load ptr, ptr %5, align 8
  %7 = call noundef zeroext i1 %6(ptr noundef nonnull align 8 dereferenceable(130) %3)
  br i1 %7, label %8, label %12

8:                                                ; preds = %1
  %9 = getelementptr inbounds nuw %"class.sc_core::sc_signal_t", ptr %3, i32 0, i32 3
  %10 = load i8, ptr %9, align 8
  %11 = trunc i8 %10 to i1
  br label %12

12:                                               ; preds = %8, %1
  %13 = phi i1 [ false, %1 ], [ %11, %8 ]
  ret i1 %13
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef zeroext i1 @_ZNK7sc_core9sc_signalIbLNS_16sc_writer_policyE0EE7negedgeEv(ptr noundef nonnull align 8 dereferenceable(160) %0) unnamed_addr #2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = getelementptr inbounds ptr, ptr %4, i64 9
  %6 = load ptr, ptr %5, align 8
  %7 = call noundef zeroext i1 %6(ptr noundef nonnull align 8 dereferenceable(130) %3)
  br i1 %7, label %8, label %13

8:                                                ; preds = %1
  %9 = getelementptr inbounds nuw %"class.sc_core::sc_signal_t", ptr %3, i32 0, i32 3
  %10 = load i8, ptr %9, align 8
  %11 = trunc i8 %10 to i1
  %12 = xor i1 %11, true
  br label %13

13:                                               ; preds = %8, %1
  %14 = phi i1 [ false, %1 ], [ %12, %8 ]
  ret i1 %14
}

declare noundef ptr @_ZNK7sc_core9sc_signalIbLNS_16sc_writer_policyE0EE8is_resetEv(ptr noundef nonnull align 8 dereferenceable(160)) unnamed_addr #1

declare void @_ZN7sc_core9sc_signalIbLNS_16sc_writer_policyE0EE6updateEv(ptr noundef nonnull align 8 dereferenceable(160)) unnamed_addr #1

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef zeroext i1 @_ZNK7sc_core9sc_signalIbLNS_16sc_writer_policyE0EE8is_clockEv(ptr noundef nonnull align 8 dereferenceable(160) %0) unnamed_addr #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  ret i1 false
}

; Function Attrs: nounwind
declare noundef ptr @_ZThn8_N7sc_core9sc_signalIbLNS_16sc_writer_policyE0EED1Ev(ptr noundef) unnamed_addr #5

; Function Attrs: nounwind
declare void @_ZThn8_N7sc_core9sc_signalIbLNS_16sc_writer_policyE0EED0Ev(ptr noundef) unnamed_addr #5

declare void @_ZThn16_NK7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE5printERNSt3__113basic_ostreamIcNS3_11char_traitsIcEEEE(ptr noundef, ptr noundef nonnull align 8 dereferenceable(8)) unnamed_addr #1

declare void @_ZThn16_NK7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE4dumpERNSt3__113basic_ostreamIcNS3_11char_traitsIcEEEE(ptr noundef, ptr noundef nonnull align 8 dereferenceable(8)) unnamed_addr #1

declare void @_ZThn16_NK7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE5traceEPNS_13sc_trace_fileE(ptr noundef, ptr noundef) unnamed_addr #1

declare noundef ptr @_ZThn16_NK7sc_core11sc_signal_tIbLNS_16sc_writer_policyE0EE4kindEv(ptr noundef) unnamed_addr #1

; Function Attrs: nounwind
declare noundef ptr @_ZThn16_N7sc_core9sc_signalIbLNS_16sc_writer_policyE0EED1Ev(ptr noundef) unnamed_addr #5

; Function Attrs: nounwind
declare void @_ZThn16_N7sc_core9sc_signalIbLNS_16sc_writer_policyE0EED0Ev(ptr noundef) unnamed_addr #5

declare void @_ZThn16_N7sc_core9sc_signalIbLNS_16sc_writer_policyE0EE6updateEv(ptr noundef) unnamed_addr #1

declare void @_ZN7sc_core15sc_prim_channel25before_end_of_elaborationEv(ptr noundef nonnull align 8 dereferenceable(72)) unnamed_addr #1

declare void @_ZN7sc_core15sc_prim_channel18end_of_elaborationEv(ptr noundef nonnull align 8 dereferenceable(72)) unnamed_addr #1

declare void @_ZN7sc_core15sc_prim_channel19start_of_simulationEv(ptr noundef nonnull align 8 dereferenceable(72)) unnamed_addr #1

declare void @_ZN7sc_core15sc_prim_channel17end_of_simulationEv(ptr noundef nonnull align 8 dereferenceable(72)) unnamed_addr #1

; Function Attrs: cold noreturn nounwind memory(inaccessiblemem: write)
declare void @llvm.trap() #14

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZTv0_n40_N7sc_core18sc_signal_inout_ifIbED1Ev(ptr noundef %0) unnamed_addr #6 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  store ptr %4, ptr %2, align 8
  %5 = load ptr, ptr %4, align 8
  %6 = getelementptr inbounds i8, ptr %5, i64 -40
  %7 = load i64, ptr %6, align 8
  %8 = getelementptr inbounds i8, ptr %4, i64 %7
  %9 = tail call noundef ptr @_ZN7sc_core18sc_signal_inout_ifIbED1Ev(ptr noundef nonnull align 8 dereferenceable(16) %8) #17
  ret ptr undef
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr void @_ZTv0_n40_N7sc_core18sc_signal_inout_ifIbED0Ev(ptr noundef %0) unnamed_addr #6 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = getelementptr inbounds i8, ptr %4, i64 -40
  %6 = load i64, ptr %5, align 8
  %7 = getelementptr inbounds i8, ptr %3, i64 %6
  tail call void @_ZN7sc_core18sc_signal_inout_ifIbED0Ev(ptr noundef nonnull align 8 dereferenceable(16) %7) #17
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZTv0_n40_N7sc_core15sc_signal_in_ifIbED1Ev(ptr noundef %0) unnamed_addr #6 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  store ptr %4, ptr %2, align 8
  %5 = load ptr, ptr %4, align 8
  %6 = getelementptr inbounds i8, ptr %5, i64 -40
  %7 = load i64, ptr %6, align 8
  %8 = getelementptr inbounds i8, ptr %4, i64 %7
  %9 = tail call noundef ptr @_ZN7sc_core15sc_signal_in_ifIbED1Ev(ptr noundef nonnull align 8 dereferenceable(8) %8) #17
  ret ptr undef
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr void @_ZTv0_n40_N7sc_core15sc_signal_in_ifIbED0Ev(ptr noundef %0) unnamed_addr #6 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = getelementptr inbounds i8, ptr %4, i64 -40
  %6 = load i64, ptr %5, align 8
  %7 = getelementptr inbounds i8, ptr %3, i64 %6
  tail call void @_ZN7sc_core15sc_signal_in_ifIbED0Ev(ptr noundef nonnull align 8 dereferenceable(8) %7) #17
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEC2EPKcRKi(ptr noundef nonnull returned align 8 dereferenceable(136) %0, ptr noundef %1, ptr noundef %2, ptr noundef nonnull align 4 dereferenceable(4) %3) unnamed_addr #2 personality ptr @__gxx_personality_v0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  store ptr %3, ptr %8, align 8
  %11 = load ptr, ptr %5, align 8
  %12 = load ptr, ptr %6, align 8
  %13 = getelementptr inbounds ptr, ptr %12, i64 1
  %14 = call noundef ptr @_ZN7sc_core18sc_signal_inout_ifIiEC2Ev(ptr noundef nonnull align 8 dereferenceable(16) %11, ptr noundef %13)
  %15 = getelementptr inbounds i8, ptr %11, i64 16
  %16 = load ptr, ptr %7, align 8
  %17 = invoke noundef ptr @_ZN7sc_core17sc_signal_channelC2EPKc(ptr noundef nonnull align 8 dereferenceable(88) %15, ptr noundef %16)
          to label %18 unwind label %39

18:                                               ; preds = %4
  %19 = getelementptr inbounds i8, ptr %11, i64 104
  %20 = invoke noundef ptr @_ZN7sc_core22sc_writer_policy_checkILNS_16sc_writer_policyE0EEC2Ev(ptr noundef nonnull align 8 dereferenceable(24) %19)
          to label %21 unwind label %43

21:                                               ; preds = %18
  %22 = load ptr, ptr %12, align 8
  store ptr %22, ptr %11, align 8
  %23 = getelementptr inbounds ptr, ptr %12, i64 8
  %24 = load ptr, ptr %23, align 8
  %25 = load ptr, ptr %11, align 8
  %26 = getelementptr i8, ptr %25, i64 -48
  %27 = load i64, ptr %26, align 8
  %28 = getelementptr inbounds i8, ptr %11, i64 %27
  store ptr %24, ptr %28, align 8
  %29 = getelementptr inbounds ptr, ptr %12, i64 9
  %30 = load ptr, ptr %29, align 8
  %31 = getelementptr inbounds i8, ptr %11, i64 8
  store ptr %30, ptr %31, align 8
  %32 = getelementptr inbounds i8, ptr %11, i64 16
  store ptr getelementptr inbounds inrange(-16, 112) ({ [21 x ptr], [12 x ptr], [16 x ptr] }, ptr @_ZTVN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE, i32 0, i32 2, i32 2), ptr %32, align 8
  %33 = getelementptr inbounds nuw %"class.sc_core::sc_signal_t.2", ptr %11, i32 0, i32 3
  %34 = load ptr, ptr %8, align 8
  %35 = load i32, ptr %34, align 4
  store i32 %35, ptr %33, align 8
  %36 = getelementptr inbounds nuw %"class.sc_core::sc_signal_t.2", ptr %11, i32 0, i32 4
  %37 = load ptr, ptr %8, align 8
  %38 = load i32, ptr %37, align 4
  store i32 %38, ptr %36, align 4
  ret ptr %11

39:                                               ; preds = %4
  %40 = landingpad { ptr, i32 }
          cleanup
  %41 = extractvalue { ptr, i32 } %40, 0
  store ptr %41, ptr %9, align 8
  %42 = extractvalue { ptr, i32 } %40, 1
  store i32 %42, ptr %10, align 4
  br label %49

43:                                               ; preds = %18
  %44 = landingpad { ptr, i32 }
          cleanup
  %45 = extractvalue { ptr, i32 } %44, 0
  store ptr %45, ptr %9, align 8
  %46 = extractvalue { ptr, i32 } %44, 1
  store i32 %46, ptr %10, align 4
  %47 = getelementptr inbounds i8, ptr %11, i64 16
  %48 = call noundef ptr @_ZN7sc_core17sc_signal_channelD2Ev(ptr noundef nonnull align 8 dereferenceable(88) %47) #17
  br label %49

49:                                               ; preds = %43, %39
  %50 = getelementptr inbounds ptr, ptr %12, i64 1
  %51 = call noundef ptr @_ZN7sc_core18sc_signal_inout_ifIiED2Ev(ptr noundef nonnull align 8 dereferenceable(16) %11, ptr noundef %50) #17
  br label %52

52:                                               ; preds = %49
  %53 = load ptr, ptr %9, align 8
  %54 = load i32, ptr %10, align 4
  %55 = insertvalue { ptr, i32 } poison, ptr %53, 0
  %56 = insertvalue { ptr, i32 } %55, i32 %54, 1
  resume { ptr, i32 } %56
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE13register_portERNS_12sc_port_baseEPKc(ptr noundef nonnull align 8 dereferenceable(136) %0, ptr noundef nonnull align 8 dereferenceable(64) %1, ptr noundef %2) unnamed_addr #2 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i8, align 1
  %8 = alloca %"class.std::__1::basic_string", align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %9 = load ptr, ptr %4, align 8
  %10 = load ptr, ptr %6, align 8
  %11 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B8ne200100ILi0EEEPKc(ptr noundef nonnull align 8 dereferenceable(24) %8, ptr noundef %10)
  %12 = call noundef ptr @_ZNKSt9type_info4nameB8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(16) @_ZTIN7sc_core18sc_signal_inout_ifIiEE) #17
  %13 = call noundef zeroext i1 @_ZNSt3__1eqB8ne200100IcNS_11char_traitsIcEENS_9allocatorIcEEEEbRKNS_12basic_stringIT_T0_T1_EEPKS6_(ptr noundef nonnull align 8 dereferenceable(24) %8, ptr noundef %12) #17
  %14 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev(ptr noundef nonnull align 8 dereferenceable(24) %8) #17
  %15 = zext i1 %13 to i8
  store i8 %15, ptr %7, align 1
  %16 = getelementptr inbounds i8, ptr %9, i64 104
  %17 = getelementptr inbounds i8, ptr %9, i64 16
  %18 = load ptr, ptr %5, align 8
  %19 = load i8, ptr %7, align 1
  %20 = trunc i8 %19 to i1
  %21 = call noundef zeroext i1 @_ZN7sc_core27sc_writer_policy_check_port10check_portEPNS_9sc_objectEPNS_12sc_port_baseEb(ptr noundef nonnull align 8 dereferenceable(8) %16, ptr noundef %17, ptr noundef %18, i1 noundef zeroext %20)
  br i1 %21, label %23, label %22

22:                                               ; preds = %3
  br label %23

23:                                               ; preds = %22, %3
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef nonnull align 8 dereferenceable(160) ptr @_ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE13default_eventEv(ptr noundef nonnull align 8 dereferenceable(136) %0) unnamed_addr #2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = getelementptr inbounds ptr, ptr %4, i64 4
  %6 = load ptr, ptr %5, align 8
  %7 = call noundef nonnull align 8 dereferenceable(160) ptr %6(ptr noundef nonnull align 8 dereferenceable(136) %3)
  ret ptr %7
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED1Ev(ptr noundef nonnull returned align 8 dereferenceable(136) %0) unnamed_addr #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef ptr @_ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED2Ev(ptr noundef nonnull align 8 dereferenceable(136) %3, ptr noundef @_ZTTN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EEE) #17
  %5 = call noundef ptr @_ZN7sc_core12sc_interfaceD2Ev(ptr noundef nonnull align 8 dereferenceable(8) %3) #17
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr void @_ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED0Ev(ptr noundef nonnull align 8 dereferenceable(136) %0) unnamed_addr #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef ptr @_ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED1Ev(ptr noundef nonnull align 8 dereferenceable(136) %3) #17
  call void @_ZdlPvm(ptr noundef %3, i64 noundef 136) #19
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef nonnull align 8 dereferenceable(160) ptr @_ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE19value_changed_eventEv(ptr noundef nonnull align 8 dereferenceable(136) %0) unnamed_addr #2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds i8, ptr %3, i64 16
  %5 = call noundef nonnull align 8 dereferenceable(160) ptr @_ZNK7sc_core17sc_signal_channel19value_changed_eventEv(ptr noundef nonnull align 8 dereferenceable(88) %4)
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef nonnull align 4 dereferenceable(4) ptr @_ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE4readEv(ptr noundef nonnull align 8 dereferenceable(136) %0) unnamed_addr #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %"class.sc_core::sc_signal_t.2", ptr %3, i32 0, i32 3
  ret ptr %4
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef nonnull align 4 dereferenceable(4) ptr @_ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE12get_data_refEv(ptr noundef nonnull align 8 dereferenceable(136) %0) unnamed_addr #2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds i8, ptr %3, i64 16
  call void @_ZNK7sc_core17sc_signal_channel23deprecated_get_data_refEv(ptr noundef nonnull align 8 dereferenceable(88) %4)
  %5 = getelementptr inbounds nuw %"class.sc_core::sc_signal_t.2", ptr %3, i32 0, i32 3
  ret ptr %5
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef zeroext i1 @_ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5eventEv(ptr noundef nonnull align 8 dereferenceable(136) %0) unnamed_addr #2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds i8, ptr %3, i64 16
  %5 = call noundef zeroext i1 @_ZNK7sc_core17sc_signal_channel5eventEv(ptr noundef nonnull align 8 dereferenceable(88) %4)
  ret i1 %5
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE4kindEv(ptr noundef nonnull align 8 dereferenceable(136) %0) unnamed_addr #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  ret ptr @.str.18
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef i32 @_ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE17get_writer_policyEv(ptr noundef nonnull align 8 dereferenceable(136) %0) unnamed_addr #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  ret i32 0
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5writeERKi(ptr noundef nonnull align 8 dereferenceable(136) %0, ptr noundef nonnull align 4 dereferenceable(4) %1) unnamed_addr #2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i8, align 1
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = getelementptr inbounds nuw %"class.sc_core::sc_signal_t.2", ptr %6, i32 0, i32 4
  %8 = load i32, ptr %7, align 4
  %9 = load ptr, ptr %4, align 8
  %10 = load i32, ptr %9, align 4
  %11 = icmp eq i32 %8, %10
  %12 = xor i1 %11, true
  %13 = zext i1 %12 to i8
  store i8 %13, ptr %5, align 1
  %14 = getelementptr inbounds i8, ptr %6, i64 104
  %15 = getelementptr inbounds i8, ptr %14, i64 8
  %16 = getelementptr inbounds i8, ptr %6, i64 16
  %17 = load i8, ptr %5, align 1
  %18 = trunc i8 %17 to i1
  %19 = call noundef zeroext i1 @_ZN7sc_core28sc_writer_policy_check_write11check_writeEPNS_9sc_objectEb(ptr noundef nonnull align 8 dereferenceable(16) %15, ptr noundef %16, i1 noundef zeroext %18)
  br i1 %19, label %21, label %20

20:                                               ; preds = %2
  br label %33

21:                                               ; preds = %2
  %22 = load ptr, ptr %4, align 8
  %23 = load i32, ptr %22, align 4
  %24 = getelementptr inbounds nuw %"class.sc_core::sc_signal_t.2", ptr %6, i32 0, i32 4
  store i32 %23, ptr %24, align 4
  %25 = load i8, ptr %5, align 1
  %26 = trunc i8 %25 to i1
  br i1 %26, label %31, label %27

27:                                               ; preds = %21
  %28 = getelementptr inbounds i8, ptr %6, i64 104
  %29 = getelementptr inbounds i8, ptr %28, i64 8
  %30 = call noundef zeroext i1 @_ZNK7sc_core28sc_writer_policy_check_write12needs_updateEv(ptr noundef nonnull align 8 dereferenceable(16) %29)
  br i1 %30, label %31, label %33

31:                                               ; preds = %27, %21
  %32 = getelementptr inbounds i8, ptr %6, i64 16
  call void @_ZN7sc_core15sc_prim_channel14request_updateEv(ptr noundef nonnull align 8 dereferenceable(72) %32)
  br label %33

33:                                               ; preds = %20, %31, %27
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5traceEPNS_13sc_trace_fileE(ptr noundef nonnull align 8 dereferenceable(136) %0, ptr noundef %1) unnamed_addr #2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds i8, ptr %5, i64 16
  call void @_ZNK7sc_core17sc_signal_channel16deprecated_traceEv(ptr noundef nonnull align 8 dereferenceable(88) %6)
  %7 = load ptr, ptr %4, align 8
  %8 = icmp ne ptr %7, null
  br i1 %8, label %9, label %10

9:                                                ; preds = %2
  br label %10

10:                                               ; preds = %9, %2
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5printERNSt3__113basic_ostreamIcNS3_11char_traitsIcEEEE(ptr noundef nonnull align 8 dereferenceable(136) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) unnamed_addr #2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = getelementptr inbounds nuw %"class.sc_core::sc_signal_t.2", ptr %5, i32 0, i32 3
  %8 = load i32, ptr %7, align 8
  %9 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEi(ptr noundef nonnull align 8 dereferenceable(8) %6, i32 noundef %8)
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE4dumpERNSt3__113basic_ostreamIcNS3_11char_traitsIcEEEE(ptr noundef nonnull align 8 dereferenceable(136) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) unnamed_addr #2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne200100INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) %6, ptr noundef @.str.21)
  %8 = getelementptr inbounds i8, ptr %5, i64 16
  %9 = call noundef ptr @_ZNK7sc_core9sc_object4nameEv(ptr noundef nonnull align 8 dereferenceable(56) %8)
  %10 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne200100INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) %7, ptr noundef %9)
  %11 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsB8ne200100EPFRS3_S4_E(ptr noundef nonnull align 8 dereferenceable(8) %10, ptr noundef @_ZNSt3__14endlB8ne200100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_)
  %12 = load ptr, ptr %4, align 8
  %13 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne200100INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) %12, ptr noundef @.str.22)
  %14 = getelementptr inbounds nuw %"class.sc_core::sc_signal_t.2", ptr %5, i32 0, i32 3
  %15 = load i32, ptr %14, align 8
  %16 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEi(ptr noundef nonnull align 8 dereferenceable(8) %13, i32 noundef %15)
  %17 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsB8ne200100EPFRS3_S4_E(ptr noundef nonnull align 8 dereferenceable(8) %16, ptr noundef @_ZNSt3__14endlB8ne200100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_)
  %18 = load ptr, ptr %4, align 8
  %19 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__1lsB8ne200100INS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc(ptr noundef nonnull align 8 dereferenceable(8) %18, ptr noundef @.str.23)
  %20 = getelementptr inbounds nuw %"class.sc_core::sc_signal_t.2", ptr %5, i32 0, i32 4
  %21 = load i32, ptr %20, align 4
  %22 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEi(ptr noundef nonnull align 8 dereferenceable(8) %19, i32 noundef %21)
  %23 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsB8ne200100EPFRS3_S4_E(ptr noundef nonnull align 8 dereferenceable(8) %22, ptr noundef @_ZNSt3__14endlB8ne200100IcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_)
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE6updateEv(ptr noundef nonnull align 8 dereferenceable(136) %0) unnamed_addr #2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds i8, ptr %3, i64 104
  %5 = getelementptr inbounds i8, ptr %4, i64 8
  call void @_ZN7sc_core28sc_writer_policy_check_write6updateEv(ptr noundef nonnull align 8 dereferenceable(16) %5)
  %6 = getelementptr inbounds nuw %"class.sc_core::sc_signal_t.2", ptr %3, i32 0, i32 4
  %7 = load i32, ptr %6, align 4
  %8 = getelementptr inbounds nuw %"class.sc_core::sc_signal_t.2", ptr %3, i32 0, i32 3
  %9 = load i32, ptr %8, align 8
  %10 = icmp eq i32 %7, %9
  br i1 %10, label %12, label %11

11:                                               ; preds = %1
  call void @_ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE9do_updateEv(ptr noundef nonnull align 8 dereferenceable(136) %3)
  br label %12

12:                                               ; preds = %11, %1
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZThn8_N7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED1Ev(ptr noundef %0) unnamed_addr #6 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  store ptr %4, ptr %2, align 8
  %5 = getelementptr inbounds i8, ptr %4, i64 -8
  %6 = tail call noundef ptr @_ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED1Ev(ptr noundef nonnull align 8 dereferenceable(136) %5) #17
  ret ptr undef
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr void @_ZThn8_N7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED0Ev(ptr noundef %0) unnamed_addr #6 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds i8, ptr %3, i64 -8
  tail call void @_ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED0Ev(ptr noundef nonnull align 8 dereferenceable(136) %4) #17
  ret void
}

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZThn8_N7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5writeERKi(ptr noundef %0, ptr noundef nonnull align 4 dereferenceable(4) %1) unnamed_addr #15 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds i8, ptr %5, i64 -8
  %7 = load ptr, ptr %4, align 8
  tail call void @_ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5writeERKi(ptr noundef nonnull align 8 dereferenceable(136) %6, ptr noundef nonnull align 4 dereferenceable(4) %7)
  ret void
}

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef i32 @_ZThn8_NK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE17get_writer_policyEv(ptr noundef %0) unnamed_addr #15 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds i8, ptr %3, i64 -8
  %5 = tail call noundef i32 @_ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE17get_writer_policyEv(ptr noundef nonnull align 8 dereferenceable(136) %4)
  ret i32 %5
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7sc_core18sc_signal_inout_ifIiED1Ev(ptr noundef nonnull returned align 8 dereferenceable(16) %0) unnamed_addr #4 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  store ptr %4, ptr %2, align 8
  call void @llvm.trap() #18
  unreachable
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr void @_ZN7sc_core18sc_signal_inout_ifIiED0Ev(ptr noundef nonnull align 8 dereferenceable(16) %0) unnamed_addr #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  call void @llvm.trap() #18
  unreachable
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZThn8_N7sc_core18sc_signal_inout_ifIiED1Ev(ptr noundef %0) unnamed_addr #6 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  store ptr %4, ptr %2, align 8
  %5 = getelementptr inbounds i8, ptr %4, i64 -8
  %6 = tail call noundef ptr @_ZN7sc_core18sc_signal_inout_ifIiED1Ev(ptr noundef nonnull align 8 dereferenceable(16) %5) #17
  ret ptr undef
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr void @_ZThn8_N7sc_core18sc_signal_inout_ifIiED0Ev(ptr noundef %0) unnamed_addr #6 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds i8, ptr %3, i64 -8
  tail call void @_ZN7sc_core18sc_signal_inout_ifIiED0Ev(ptr noundef nonnull align 8 dereferenceable(16) %4) #17
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef i32 @_ZNK7sc_core18sc_signal_write_ifIiE17get_writer_policyEv(ptr noundef nonnull align 8 dereferenceable(8) %0) unnamed_addr #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  ret i32 0
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7sc_core15sc_signal_in_ifIiED1Ev(ptr noundef nonnull returned align 8 dereferenceable(8) %0) unnamed_addr #4 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  store ptr %4, ptr %2, align 8
  call void @llvm.trap() #18
  unreachable
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr void @_ZN7sc_core15sc_signal_in_ifIiED0Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) unnamed_addr #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  call void @llvm.trap() #18
  unreachable
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7sc_core18sc_signal_write_ifIiED1Ev(ptr noundef nonnull returned align 8 dereferenceable(8) %0) unnamed_addr #4 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  store ptr %4, ptr %2, align 8
  call void @llvm.trap() #18
  unreachable
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr void @_ZN7sc_core18sc_signal_write_ifIiED0Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) unnamed_addr #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  call void @llvm.trap() #18
  unreachable
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZTv0_n40_N7sc_core18sc_signal_write_ifIiED1Ev(ptr noundef %0) unnamed_addr #6 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  store ptr %4, ptr %2, align 8
  %5 = load ptr, ptr %4, align 8
  %6 = getelementptr inbounds i8, ptr %5, i64 -40
  %7 = load i64, ptr %6, align 8
  %8 = getelementptr inbounds i8, ptr %4, i64 %7
  %9 = tail call noundef ptr @_ZN7sc_core18sc_signal_write_ifIiED1Ev(ptr noundef nonnull align 8 dereferenceable(8) %8) #17
  ret ptr undef
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr void @_ZTv0_n40_N7sc_core18sc_signal_write_ifIiED0Ev(ptr noundef %0) unnamed_addr #6 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = getelementptr inbounds i8, ptr %4, i64 -40
  %6 = load i64, ptr %5, align 8
  %7 = getelementptr inbounds i8, ptr %3, i64 %6
  tail call void @_ZN7sc_core18sc_signal_write_ifIiED0Ev(ptr noundef nonnull align 8 dereferenceable(8) %7) #17
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr void @_ZN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED0Ev(ptr noundef nonnull align 8 dereferenceable(136) %0) unnamed_addr #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef ptr @_ZN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED1Ev(ptr noundef nonnull align 8 dereferenceable(136) %3) #17
  call void @_ZdlPvm(ptr noundef %3, i64 noundef 136) #19
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZThn8_N7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED1Ev(ptr noundef %0) unnamed_addr #6 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  store ptr %4, ptr %2, align 8
  %5 = getelementptr inbounds i8, ptr %4, i64 -8
  %6 = tail call noundef ptr @_ZN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED1Ev(ptr noundef nonnull align 8 dereferenceable(136) %5) #17
  ret ptr undef
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr void @_ZThn8_N7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED0Ev(ptr noundef %0) unnamed_addr #6 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds i8, ptr %3, i64 -8
  tail call void @_ZN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED0Ev(ptr noundef nonnull align 8 dereferenceable(136) %4) #17
  ret void
}

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZThn16_NK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5printERNSt3__113basic_ostreamIcNS3_11char_traitsIcEEEE(ptr noundef %0, ptr noundef nonnull align 8 dereferenceable(8) %1) unnamed_addr #15 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds i8, ptr %5, i64 -16
  %7 = load ptr, ptr %4, align 8
  tail call void @_ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5printERNSt3__113basic_ostreamIcNS3_11char_traitsIcEEEE(ptr noundef nonnull align 8 dereferenceable(136) %6, ptr noundef nonnull align 8 dereferenceable(8) %7)
  ret void
}

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZThn16_NK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE4dumpERNSt3__113basic_ostreamIcNS3_11char_traitsIcEEEE(ptr noundef %0, ptr noundef nonnull align 8 dereferenceable(8) %1) unnamed_addr #15 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds i8, ptr %5, i64 -16
  %7 = load ptr, ptr %4, align 8
  tail call void @_ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE4dumpERNSt3__113basic_ostreamIcNS3_11char_traitsIcEEEE(ptr noundef nonnull align 8 dereferenceable(136) %6, ptr noundef nonnull align 8 dereferenceable(8) %7)
  ret void
}

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZThn16_NK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5traceEPNS_13sc_trace_fileE(ptr noundef %0, ptr noundef %1) unnamed_addr #15 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds i8, ptr %5, i64 -16
  %7 = load ptr, ptr %4, align 8
  tail call void @_ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE5traceEPNS_13sc_trace_fileE(ptr noundef nonnull align 8 dereferenceable(136) %6, ptr noundef %7)
  ret void
}

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZThn16_NK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE4kindEv(ptr noundef %0) unnamed_addr #15 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds i8, ptr %3, i64 -16
  %5 = tail call noundef ptr @_ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE4kindEv(ptr noundef nonnull align 8 dereferenceable(136) %4)
  ret ptr %5
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZThn16_N7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED1Ev(ptr noundef %0) unnamed_addr #6 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  store ptr %4, ptr %2, align 8
  %5 = getelementptr inbounds i8, ptr %4, i64 -16
  %6 = tail call noundef ptr @_ZN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED1Ev(ptr noundef nonnull align 8 dereferenceable(136) %5) #17
  ret ptr undef
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr void @_ZThn16_N7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED0Ev(ptr noundef %0) unnamed_addr #6 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds i8, ptr %3, i64 -16
  tail call void @_ZN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED0Ev(ptr noundef nonnull align 8 dereferenceable(136) %4) #17
  ret void
}

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZThn16_N7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE6updateEv(ptr noundef %0) unnamed_addr #15 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds i8, ptr %3, i64 -16
  tail call void @_ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE6updateEv(ptr noundef nonnull align 8 dereferenceable(136) %4)
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7sc_core18sc_signal_inout_ifIiEC2Ev(ptr noundef nonnull returned align 8 dereferenceable(16) %0, ptr noundef %1) unnamed_addr #2 personality ptr @__gxx_personality_v0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = load ptr, ptr %4, align 8
  %9 = getelementptr inbounds ptr, ptr %8, i64 1
  %10 = call noundef ptr @_ZN7sc_core15sc_signal_in_ifIiEC2Ev(ptr noundef nonnull align 8 dereferenceable(8) %7, ptr noundef %9)
  %11 = getelementptr inbounds i8, ptr %7, i64 8
  %12 = getelementptr inbounds ptr, ptr %8, i64 3
  %13 = invoke noundef ptr @_ZN7sc_core18sc_signal_write_ifIiEC2Ev(ptr noundef nonnull align 8 dereferenceable(8) %11, ptr noundef %12)
          to label %14 unwind label %25

14:                                               ; preds = %2
  %15 = load ptr, ptr %8, align 8
  store ptr %15, ptr %7, align 8
  %16 = getelementptr inbounds ptr, ptr %8, i64 5
  %17 = load ptr, ptr %16, align 8
  %18 = load ptr, ptr %7, align 8
  %19 = getelementptr i8, ptr %18, i64 -48
  %20 = load i64, ptr %19, align 8
  %21 = getelementptr inbounds i8, ptr %7, i64 %20
  store ptr %17, ptr %21, align 8
  %22 = getelementptr inbounds ptr, ptr %8, i64 6
  %23 = load ptr, ptr %22, align 8
  %24 = getelementptr inbounds i8, ptr %7, i64 8
  store ptr %23, ptr %24, align 8
  ret ptr %7

25:                                               ; preds = %2
  %26 = landingpad { ptr, i32 }
          cleanup
  %27 = extractvalue { ptr, i32 } %26, 0
  store ptr %27, ptr %5, align 8
  %28 = extractvalue { ptr, i32 } %26, 1
  store i32 %28, ptr %6, align 4
  %29 = getelementptr inbounds ptr, ptr %8, i64 1
  %30 = call noundef ptr @_ZN7sc_core15sc_signal_in_ifIiED2Ev(ptr noundef nonnull align 8 dereferenceable(8) %7, ptr noundef %29) #17
  br label %31

31:                                               ; preds = %25
  %32 = load ptr, ptr %5, align 8
  %33 = load i32, ptr %6, align 4
  %34 = insertvalue { ptr, i32 } poison, ptr %32, 0
  %35 = insertvalue { ptr, i32 } %34, i32 %33, 1
  resume { ptr, i32 } %35
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7sc_core17sc_signal_channelC2EPKc(ptr noundef nonnull returned align 8 dereferenceable(88) %0, ptr noundef %1) unnamed_addr #2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = call noundef ptr @_ZN7sc_core15sc_prim_channelC2EPKc(ptr noundef nonnull align 8 dereferenceable(72) %5, ptr noundef %6)
  store ptr getelementptr inbounds inrange(-16, 112) ({ [16 x ptr] }, ptr @_ZTVN7sc_core17sc_signal_channelE, i32 0, i32 0, i32 2), ptr %5, align 8
  %8 = getelementptr inbounds nuw %"class.sc_core::sc_signal_channel", ptr %5, i32 0, i32 1
  store ptr null, ptr %8, align 8
  %9 = getelementptr inbounds nuw %"class.sc_core::sc_signal_channel", ptr %5, i32 0, i32 2
  store i64 -2, ptr %9, align 8
  ret ptr %5
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7sc_core22sc_writer_policy_checkILNS_16sc_writer_policyE0EEC2Ev(ptr noundef nonnull returned align 8 dereferenceable(24) %0) unnamed_addr #2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef ptr @_ZN7sc_core27sc_writer_policy_check_portC2Ev(ptr noundef nonnull align 8 dereferenceable(8) %3)
  %5 = getelementptr inbounds i8, ptr %3, i64 8
  %6 = call noundef zeroext i1 @_ZN7sc_core28sc_writer_policy_check_write10only_deltaEv()
  %7 = call noundef ptr @_ZN7sc_core28sc_writer_policy_check_writeC2Eb(ptr noundef nonnull align 8 dereferenceable(16) %5, i1 noundef zeroext %6)
  ret ptr %3
}

; Function Attrs: nounwind
declare noundef ptr @_ZN7sc_core17sc_signal_channelD2Ev(ptr noundef nonnull returned align 8 dereferenceable(88)) unnamed_addr #5

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7sc_core18sc_signal_inout_ifIiED2Ev(ptr noundef nonnull returned align 8 dereferenceable(16) %0, ptr noundef %1) unnamed_addr #4 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = getelementptr inbounds i8, ptr %5, i64 8
  %8 = getelementptr inbounds ptr, ptr %6, i64 3
  %9 = call noundef ptr @_ZN7sc_core18sc_signal_write_ifIiED2Ev(ptr noundef nonnull align 8 dereferenceable(8) %7, ptr noundef %8) #17
  %10 = getelementptr inbounds ptr, ptr %6, i64 1
  %11 = call noundef ptr @_ZN7sc_core15sc_signal_in_ifIiED2Ev(ptr noundef nonnull align 8 dereferenceable(8) %5, ptr noundef %10) #17
  ret ptr %5
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZThn16_N7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED1Ev(ptr noundef %0) unnamed_addr #6 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  store ptr %4, ptr %2, align 8
  %5 = getelementptr inbounds i8, ptr %4, i64 -16
  %6 = tail call noundef ptr @_ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED1Ev(ptr noundef nonnull align 8 dereferenceable(136) %5) #17
  ret ptr undef
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr void @_ZThn16_N7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED0Ev(ptr noundef %0) unnamed_addr #6 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds i8, ptr %3, i64 -16
  tail call void @_ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED0Ev(ptr noundef nonnull align 8 dereferenceable(136) %4) #17
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7sc_core15sc_signal_in_ifIiEC2Ev(ptr noundef nonnull returned align 8 dereferenceable(8) %0, ptr noundef %1) unnamed_addr #4 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = load ptr, ptr %6, align 8
  store ptr %7, ptr %5, align 8
  %8 = getelementptr inbounds ptr, ptr %6, i64 1
  %9 = load ptr, ptr %8, align 8
  %10 = load ptr, ptr %5, align 8
  %11 = getelementptr i8, ptr %10, i64 -48
  %12 = load i64, ptr %11, align 8
  %13 = getelementptr inbounds i8, ptr %5, i64 %12
  store ptr %9, ptr %13, align 8
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7sc_core18sc_signal_write_ifIiEC2Ev(ptr noundef nonnull returned align 8 dereferenceable(8) %0, ptr noundef %1) unnamed_addr #4 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = load ptr, ptr %6, align 8
  store ptr %7, ptr %5, align 8
  %8 = getelementptr inbounds ptr, ptr %6, i64 1
  %9 = load ptr, ptr %8, align 8
  %10 = load ptr, ptr %5, align 8
  %11 = getelementptr i8, ptr %10, i64 -48
  %12 = load i64, ptr %11, align 8
  %13 = getelementptr inbounds i8, ptr %5, i64 %12
  store ptr %9, ptr %13, align 8
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7sc_core15sc_signal_in_ifIiED2Ev(ptr noundef nonnull returned align 8 dereferenceable(8) %0, ptr noundef %1) unnamed_addr #4 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  ret ptr %5
}

declare noundef ptr @_ZN7sc_core15sc_prim_channelC2EPKc(ptr noundef nonnull returned align 8 dereferenceable(72), ptr noundef) unnamed_addr #1

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7sc_core27sc_writer_policy_check_portC2Ev(ptr noundef nonnull returned align 8 dereferenceable(8) %0) unnamed_addr #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %"struct.sc_core::sc_writer_policy_check_port", ptr %3, i32 0, i32 0
  store ptr null, ptr %4, align 8
  ret ptr %3
}

declare noundef zeroext i1 @_ZN7sc_core28sc_writer_policy_check_write10only_deltaEv() #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7sc_core28sc_writer_policy_check_writeC2Eb(ptr noundef nonnull returned align 8 dereferenceable(16) %0, i1 noundef zeroext %1) unnamed_addr #2 {
  %3 = alloca ptr, align 8
  %4 = alloca i8, align 1
  store ptr %0, ptr %3, align 8
  %5 = zext i1 %1 to i8
  store i8 %5, ptr %4, align 1
  %6 = load ptr, ptr %3, align 8
  %7 = getelementptr inbounds nuw %"struct.sc_core::sc_writer_policy_check_write", ptr %6, i32 0, i32 0
  %8 = load i8, ptr %4, align 1
  %9 = trunc i8 %8 to i1
  %10 = zext i1 %9 to i8
  store i8 %10, ptr %7, align 8
  %11 = getelementptr inbounds nuw %"struct.sc_core::sc_writer_policy_check_write", ptr %6, i32 0, i32 1
  %12 = call noundef ptr @_ZN7sc_core17sc_process_handleC1Ev(ptr noundef nonnull align 8 dereferenceable(8) %11)
  ret ptr %6
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7sc_core17sc_process_handleC1Ev(ptr noundef nonnull returned align 8 dereferenceable(8) %0) unnamed_addr #2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef ptr @_ZN7sc_core17sc_process_handleC2Ev(ptr noundef nonnull align 8 dereferenceable(8) %3)
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7sc_core17sc_process_handleC2Ev(ptr noundef nonnull returned align 8 dereferenceable(8) %0) unnamed_addr #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %"class.sc_core::sc_process_handle", ptr %3, i32 0, i32 0
  store ptr null, ptr %4, align 8
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7sc_core18sc_signal_write_ifIiED2Ev(ptr noundef nonnull returned align 8 dereferenceable(8) %0, ptr noundef %1) unnamed_addr #4 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef zeroext i1 @_ZNSt3__1eqB8ne200100IcNS_11char_traitsIcEENS_9allocatorIcEEEEbRKNS_12basic_stringIT_T0_T1_EEPKS6_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %1) #4 personality ptr @__gxx_personality_v0 {
  %3 = alloca i1, align 1
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %7 = load ptr, ptr %5, align 8
  %8 = call noundef i64 @_ZNSt3__111char_traitsIcE6lengthB8ne200100EPKc(ptr noundef %7) #17
  store i64 %8, ptr %6, align 8
  %9 = load i64, ptr %6, align 8
  %10 = call i1 @llvm.is.constant.i64(i64 %9)
  br i1 %10, label %11, label %20

11:                                               ; preds = %2
  %12 = load i64, ptr %6, align 8
  %13 = invoke noundef zeroext i1 @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE13__fits_in_ssoB8ne200100Em(i64 noundef %12)
          to label %14 unwind label %35

14:                                               ; preds = %11
  br i1 %13, label %20, label %15

15:                                               ; preds = %14
  %16 = load ptr, ptr %4, align 8
  %17 = call noundef zeroext i1 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE9__is_longB8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(24) %16) #17
  br i1 %17, label %19, label %18

18:                                               ; preds = %15
  store i1 false, ptr %3, align 1
  br label %33

19:                                               ; preds = %15
  br label %20

20:                                               ; preds = %19, %14, %2
  %21 = load i64, ptr %6, align 8
  %22 = load ptr, ptr %4, align 8
  %23 = call noundef i64 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4sizeB8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(24) %22) #17
  %24 = icmp ne i64 %21, %23
  br i1 %24, label %25, label %26

25:                                               ; preds = %20
  store i1 false, ptr %3, align 1
  br label %33

26:                                               ; preds = %20
  %27 = load ptr, ptr %4, align 8
  %28 = load ptr, ptr %5, align 8
  %29 = load i64, ptr %6, align 8
  %30 = invoke noundef i32 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE7compareEmmPKcm(ptr noundef nonnull align 8 dereferenceable(24) %27, i64 noundef 0, i64 noundef -1, ptr noundef %28, i64 noundef %29)
          to label %31 unwind label %35

31:                                               ; preds = %26
  %32 = icmp eq i32 %30, 0
  store i1 %32, ptr %3, align 1
  br label %33

33:                                               ; preds = %31, %25, %18
  %34 = load i1, ptr %3, align 1
  ret i1 %34

35:                                               ; preds = %26, %11
  %36 = landingpad { ptr, i32 }
          catch ptr null
  %37 = extractvalue { ptr, i32 } %36, 0
  call void @__clang_call_terminate(ptr %37) #18
  unreachable
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1B8ne200100ILi0EEEPKc(ptr noundef nonnull returned align 8 dereferenceable(24) %0, ptr noundef %1) unnamed_addr #2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = call noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2B8ne200100ILi0EEEPKc(ptr noundef nonnull align 8 dereferenceable(24) %5, ptr noundef %6)
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNKSt9type_info4nameB8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(16) %0) #4 {
  %2 = alloca i64, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = getelementptr inbounds nuw %"class.std::type_info", ptr %4, i32 0, i32 1
  %6 = load i64, ptr %5, align 8
  store i64 %6, ptr %2, align 8
  %7 = load i64, ptr %2, align 8
  %8 = and i64 %7, 9223372036854775807
  %9 = inttoptr i64 %8 to ptr
  ret ptr %9
}

declare noundef zeroext i1 @_ZN7sc_core27sc_writer_policy_check_port10check_portEPNS_9sc_objectEPNS_12sc_port_baseEb(ptr noundef nonnull align 8 dereferenceable(8), ptr noundef, ptr noundef, i1 noundef zeroext) #1

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZTv0_n24_N7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE13register_portERNS_12sc_port_baseEPKc(ptr noundef %0, ptr noundef nonnull align 8 dereferenceable(64) %1, ptr noundef %2) unnamed_addr #15 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load ptr, ptr %7, align 8
  %9 = getelementptr inbounds i8, ptr %8, i64 -24
  %10 = load i64, ptr %9, align 8
  %11 = getelementptr inbounds i8, ptr %7, i64 %10
  %12 = load ptr, ptr %5, align 8
  %13 = load ptr, ptr %6, align 8
  tail call void @_ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE13register_portERNS_12sc_port_baseEPKc(ptr noundef nonnull align 8 dereferenceable(136) %11, ptr noundef nonnull align 8 dereferenceable(64) %12, ptr noundef %13)
  ret void
}

; Function Attrs: convergent nocallback nofree nosync nounwind willreturn memory(none)
declare i1 @llvm.is.constant.i64(i64) #16

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef zeroext i1 @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE13__fits_in_ssoB8ne200100Em(i64 noundef %0) #4 {
  %2 = alloca i64, align 8
  store i64 %0, ptr %2, align 8
  %3 = load i64, ptr %2, align 8
  %4 = icmp ult i64 %3, 23
  ret i1 %4
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef i64 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4sizeB8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef zeroext i1 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE9__is_longB8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(24) %3) #17
  br i1 %4, label %5, label %7

5:                                                ; preds = %1
  %6 = call noundef i64 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE15__get_long_sizeB8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(24) %3) #17
  br label %9

7:                                                ; preds = %1
  %8 = call noundef i64 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE16__get_short_sizeB8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(24) %3) #17
  br label %9

9:                                                ; preds = %7, %5
  %10 = phi i64 [ %6, %5 ], [ %8, %7 ]
  ret i64 %10
}

declare noundef i32 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE7compareEmmPKcm(ptr noundef nonnull align 8 dereferenceable(24), i64 noundef, i64 noundef, ptr noundef, i64 noundef) #1

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef i64 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE15__get_long_sizeB8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %"class.std::__1::basic_string", ptr %3, i32 0, i32 0
  %5 = getelementptr inbounds nuw %"struct.std::__1::basic_string<char>::__long", ptr %4, i32 0, i32 1
  %6 = load i64, ptr %5, align 8
  ret i64 %6
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef i64 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE16__get_short_sizeB8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %"class.std::__1::basic_string", ptr %3, i32 0, i32 0
  %5 = getelementptr inbounds nuw %"struct.std::__1::basic_string<char>::__short", ptr %4, i32 0, i32 1
  %6 = load i8, ptr %5, align 1
  %7 = and i8 %6, 127
  %8 = zext i8 %7 to i64
  ret i64 %8
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2B8ne200100ILi0EEEPKc(ptr noundef nonnull returned align 8 dereferenceable(24) %0, ptr noundef %1) unnamed_addr #2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds nuw %"class.std::__1::basic_string", ptr %5, i32 0, i32 0
  %7 = call noundef ptr @_ZNSt3__19allocatorIcEC1B8ne200100Ev(ptr noundef nonnull align 1 dereferenceable(1) %5) #17
  %8 = load ptr, ptr %4, align 8
  %9 = load ptr, ptr %4, align 8
  %10 = call noundef i64 @_ZNSt3__111char_traitsIcE6lengthB8ne200100EPKc(ptr noundef %9) #17
  call void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6__initEPKcm(ptr noundef nonnull align 8 dereferenceable(24) %5, ptr noundef %8, i64 noundef %10)
  ret ptr %5
}

declare void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6__initEPKcm(ptr noundef nonnull align 8 dereferenceable(24), ptr noundef, i64 noundef) #1

; Function Attrs: noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZTv0_n32_NK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE13default_eventEv(ptr noundef %0) unnamed_addr #15 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = getelementptr inbounds i8, ptr %4, i64 -32
  %6 = load i64, ptr %5, align 8
  %7 = getelementptr inbounds i8, ptr %3, i64 %6
  %8 = tail call noundef nonnull align 8 dereferenceable(160) ptr @_ZNK7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE13default_eventEv(ptr noundef nonnull align 8 dereferenceable(136) %7)
  ret ptr %8
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED2Ev(ptr noundef nonnull returned align 8 dereferenceable(136) %0, ptr noundef %1) unnamed_addr #4 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = getelementptr inbounds i8, ptr %5, i64 104
  %8 = call noundef ptr @_ZN7sc_core22sc_writer_policy_checkILNS_16sc_writer_policyE0EED2Ev(ptr noundef nonnull align 8 dereferenceable(24) %7) #17
  %9 = getelementptr inbounds i8, ptr %5, i64 16
  %10 = call noundef ptr @_ZN7sc_core17sc_signal_channelD2Ev(ptr noundef nonnull align 8 dereferenceable(88) %9) #17
  %11 = getelementptr inbounds ptr, ptr %6, i64 1
  %12 = call noundef ptr @_ZN7sc_core18sc_signal_inout_ifIiED2Ev(ptr noundef nonnull align 8 dereferenceable(16) %5, ptr noundef %11) #17
  ret ptr %5
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZTv0_n40_N7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED1Ev(ptr noundef %0) unnamed_addr #6 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  store ptr %4, ptr %2, align 8
  %5 = load ptr, ptr %4, align 8
  %6 = getelementptr inbounds i8, ptr %5, i64 -40
  %7 = load i64, ptr %6, align 8
  %8 = getelementptr inbounds i8, ptr %4, i64 %7
  %9 = tail call noundef ptr @_ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED1Ev(ptr noundef nonnull align 8 dereferenceable(136) %8) #17
  ret ptr undef
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7sc_core22sc_writer_policy_checkILNS_16sc_writer_policyE0EED2Ev(ptr noundef nonnull returned align 8 dereferenceable(24) %0) unnamed_addr #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds i8, ptr %3, i64 8
  %5 = call noundef ptr @_ZN7sc_core28sc_writer_policy_check_writeD2Ev(ptr noundef nonnull align 8 dereferenceable(16) %4) #17
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7sc_core28sc_writer_policy_check_writeD2Ev(ptr noundef nonnull returned align 8 dereferenceable(16) %0) unnamed_addr #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %"struct.sc_core::sc_writer_policy_check_write", ptr %3, i32 0, i32 1
  %5 = call noundef ptr @_ZN7sc_core17sc_process_handleD1Ev(ptr noundef nonnull align 8 dereferenceable(8) %4) #17
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7sc_core17sc_process_handleD1Ev(ptr noundef nonnull returned align 8 dereferenceable(8) %0) unnamed_addr #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef ptr @_ZN7sc_core17sc_process_handleD2Ev(ptr noundef nonnull align 8 dereferenceable(8) %3) #17
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7sc_core17sc_process_handleD2Ev(ptr noundef nonnull returned align 8 dereferenceable(8) %0) unnamed_addr #4 personality ptr @__gxx_personality_v0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  store ptr %4, ptr %2, align 8
  %5 = getelementptr inbounds nuw %"class.sc_core::sc_process_handle", ptr %4, i32 0, i32 0
  %6 = load ptr, ptr %5, align 8
  %7 = icmp ne ptr %6, null
  br i1 %7, label %8, label %12

8:                                                ; preds = %1
  %9 = getelementptr inbounds nuw %"class.sc_core::sc_process_handle", ptr %4, i32 0, i32 0
  %10 = load ptr, ptr %9, align 8
  invoke void @_ZN7sc_core12sc_process_b19reference_decrementEv(ptr noundef nonnull align 8 dereferenceable(351) %10)
          to label %11 unwind label %14

11:                                               ; preds = %8
  br label %12

12:                                               ; preds = %11, %1
  %13 = load ptr, ptr %2, align 8
  ret ptr %13

14:                                               ; preds = %8
  %15 = landingpad { ptr, i32 }
          catch ptr null
  %16 = extractvalue { ptr, i32 } %15, 0
  call void @__clang_call_terminate(ptr %16) #18
  unreachable
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZN7sc_core12sc_process_b19reference_decrementEv(ptr noundef nonnull align 8 dereferenceable(351) %0) #2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %"class.sc_core::sc_process_b", ptr %3, i32 0, i32 21
  %5 = load i32, ptr %4, align 4
  %6 = add nsw i32 %5, -1
  store i32 %6, ptr %4, align 4
  %7 = getelementptr inbounds nuw %"class.sc_core::sc_process_b", ptr %3, i32 0, i32 21
  %8 = load i32, ptr %7, align 4
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %11

10:                                               ; preds = %1
  call void @_ZN7sc_core12sc_process_b14delete_processEv(ptr noundef nonnull align 8 dereferenceable(351) %3)
  br label %11

11:                                               ; preds = %10, %1
  ret void
}

declare void @_ZN7sc_core12sc_process_b14delete_processEv(ptr noundef nonnull align 8 dereferenceable(351)) #1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr void @_ZTv0_n40_N7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED0Ev(ptr noundef %0) unnamed_addr #6 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = getelementptr inbounds i8, ptr %4, i64 -40
  %6 = load i64, ptr %5, align 8
  %7 = getelementptr inbounds i8, ptr %3, i64 %6
  tail call void @_ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED0Ev(ptr noundef nonnull align 8 dereferenceable(136) %7) #17
  ret void
}

declare noundef nonnull align 8 dereferenceable(160) ptr @_ZNK7sc_core17sc_signal_channel19value_changed_eventEv(ptr noundef nonnull align 8 dereferenceable(88)) #1

declare void @_ZNK7sc_core17sc_signal_channel23deprecated_get_data_refEv(ptr noundef nonnull align 8 dereferenceable(88)) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef zeroext i1 @_ZNK7sc_core17sc_signal_channel5eventEv(ptr noundef nonnull align 8 dereferenceable(88) %0) #2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef ptr @_ZNK7sc_core9sc_object10simcontextEv(ptr noundef nonnull align 8 dereferenceable(56) %3)
  %5 = getelementptr inbounds nuw %"class.sc_core::sc_signal_channel", ptr %3, i32 0, i32 2
  %6 = load i64, ptr %5, align 8
  %7 = call noundef zeroext i1 @_ZNK7sc_core13sc_simcontext14event_occurredEy(ptr noundef nonnull align 8 dereferenceable(456) %4, i64 noundef %6)
  ret i1 %7
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZNK7sc_core9sc_object10simcontextEv(ptr noundef nonnull align 8 dereferenceable(56) %0) #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %"class.sc_core::sc_object", ptr %3, i32 0, i32 4
  %5 = load ptr, ptr %4, align 8
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef zeroext i1 @_ZNK7sc_core13sc_simcontext14event_occurredEy(ptr noundef nonnull align 8 dereferenceable(456) %0, i64 noundef %1) #4 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds nuw %"class.sc_core::sc_simcontext", ptr %5, i32 0, i32 27
  %7 = load i64, ptr %6, align 8
  %8 = load i64, ptr %4, align 8
  %9 = icmp eq i64 %7, %8
  ret i1 %9
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef zeroext i1 @_ZN7sc_core28sc_writer_policy_check_write11check_writeEPNS_9sc_objectEb(ptr noundef nonnull align 8 dereferenceable(16) %0, ptr noundef %1, i1 noundef zeroext %2) #2 personality ptr @__gxx_personality_v0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i8, align 1
  %7 = alloca ptr, align 8
  %8 = alloca %"class.sc_core::sc_process_handle", align 8
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  %11 = alloca %"class.sc_core::sc_process_handle", align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %12 = zext i1 %2 to i8
  store i8 %12, ptr %6, align 1
  %13 = load ptr, ptr %4, align 8
  %14 = call noundef ptr @_ZN7sc_core22sc_get_curr_simcontextEv()
  %15 = call noundef ptr @_ZNK7sc_core13sc_simcontext18get_current_writerEv(ptr noundef nonnull align 8 dereferenceable(456) %14)
  store ptr %15, ptr %7, align 8
  %16 = getelementptr inbounds nuw %"struct.sc_core::sc_writer_policy_check_write", ptr %13, i32 0, i32 1
  %17 = call noundef zeroext i1 @_ZNK7sc_core17sc_process_handle5validEv(ptr noundef nonnull align 8 dereferenceable(8) %16)
  %18 = xor i1 %17, true
  %19 = xor i1 %18, true
  %20 = xor i1 %19, true
  br i1 %20, label %21, label %32

21:                                               ; preds = %3
  %22 = load ptr, ptr %7, align 8
  %23 = call noundef ptr @_ZN7sc_core17sc_process_handleC1EPNS_12sc_process_bE(ptr noundef nonnull align 8 dereferenceable(8) %8, ptr noundef %22)
  %24 = getelementptr inbounds nuw %"struct.sc_core::sc_writer_policy_check_write", ptr %13, i32 0, i32 1
  invoke void @_ZN7sc_core17sc_process_handle4swapERS0_(ptr noundef nonnull align 8 dereferenceable(8) %8, ptr noundef nonnull align 8 dereferenceable(8) %24)
          to label %25 unwind label %27

25:                                               ; preds = %21
  %26 = call noundef ptr @_ZN7sc_core17sc_process_handleD1Ev(ptr noundef nonnull align 8 dereferenceable(8) %8) #17
  br label %63

27:                                               ; preds = %21
  %28 = landingpad { ptr, i32 }
          cleanup
  %29 = extractvalue { ptr, i32 } %28, 0
  store ptr %29, ptr %9, align 8
  %30 = extractvalue { ptr, i32 } %28, 1
  store i32 %30, ptr %10, align 4
  %31 = call noundef ptr @_ZN7sc_core17sc_process_handleD1Ev(ptr noundef nonnull align 8 dereferenceable(8) %8) #17
  br label %64

32:                                               ; preds = %3
  %33 = getelementptr inbounds nuw %"struct.sc_core::sc_writer_policy_check_write", ptr %13, i32 0, i32 1
  %34 = call noundef ptr @_ZN7sc_core17sc_process_handlecvPNS_12sc_process_bEEv(ptr noundef nonnull align 8 dereferenceable(8) %33)
  %35 = load ptr, ptr %7, align 8
  %36 = icmp ne ptr %34, %35
  br i1 %36, label %37, label %40

37:                                               ; preds = %32
  %38 = load ptr, ptr %7, align 8
  %39 = icmp ne ptr %38, null
  br label %40

40:                                               ; preds = %37, %32
  %41 = phi i1 [ false, %32 ], [ %39, %37 ]
  %42 = xor i1 %41, true
  %43 = xor i1 %42, true
  br i1 %43, label %44, label %62

44:                                               ; preds = %40
  %45 = load ptr, ptr %5, align 8
  %46 = getelementptr inbounds nuw %"struct.sc_core::sc_writer_policy_check_write", ptr %13, i32 0, i32 1
  %47 = call noundef ptr @_ZN7sc_core17sc_process_handlecvPNS_12sc_process_bEEv(ptr noundef nonnull align 8 dereferenceable(8) %46)
  %48 = load ptr, ptr %7, align 8
  %49 = getelementptr inbounds nuw %"struct.sc_core::sc_writer_policy_check_write", ptr %13, i32 0, i32 0
  %50 = load i8, ptr %49, align 8
  %51 = trunc i8 %50 to i1
  call void @_ZN7sc_core24sc_signal_invalid_writerEPNS_9sc_objectES1_S1_b(ptr noundef %45, ptr noundef %47, ptr noundef %48, i1 noundef zeroext %51)
  %52 = load ptr, ptr %7, align 8
  %53 = call noundef ptr @_ZN7sc_core17sc_process_handleC1EPNS_12sc_process_bE(ptr noundef nonnull align 8 dereferenceable(8) %11, ptr noundef %52)
  %54 = getelementptr inbounds nuw %"struct.sc_core::sc_writer_policy_check_write", ptr %13, i32 0, i32 1
  invoke void @_ZN7sc_core17sc_process_handle4swapERS0_(ptr noundef nonnull align 8 dereferenceable(8) %11, ptr noundef nonnull align 8 dereferenceable(8) %54)
          to label %55 unwind label %57

55:                                               ; preds = %44
  %56 = call noundef ptr @_ZN7sc_core17sc_process_handleD1Ev(ptr noundef nonnull align 8 dereferenceable(8) %11) #17
  br label %62

57:                                               ; preds = %44
  %58 = landingpad { ptr, i32 }
          cleanup
  %59 = extractvalue { ptr, i32 } %58, 0
  store ptr %59, ptr %9, align 8
  %60 = extractvalue { ptr, i32 } %58, 1
  store i32 %60, ptr %10, align 4
  %61 = call noundef ptr @_ZN7sc_core17sc_process_handleD1Ev(ptr noundef nonnull align 8 dereferenceable(8) %11) #17
  br label %64

62:                                               ; preds = %55, %40
  br label %63

63:                                               ; preds = %62, %25
  ret i1 true

64:                                               ; preds = %57, %27
  %65 = load ptr, ptr %9, align 8
  %66 = load i32, ptr %10, align 4
  %67 = insertvalue { ptr, i32 } poison, ptr %65, 0
  %68 = insertvalue { ptr, i32 } %67, i32 %66, 1
  resume { ptr, i32 } %68
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef zeroext i1 @_ZNK7sc_core28sc_writer_policy_check_write12needs_updateEv(ptr noundef nonnull align 8 dereferenceable(16) %0) #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %"struct.sc_core::sc_writer_policy_check_write", ptr %3, i32 0, i32 0
  %5 = load i8, ptr %4, align 8
  %6 = trunc i8 %5 to i1
  ret i1 %6
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZN7sc_core15sc_prim_channel14request_updateEv(ptr noundef nonnull align 8 dereferenceable(72) %0) #2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %"class.sc_core::sc_prim_channel", ptr %3, i32 0, i32 2
  %5 = load ptr, ptr %4, align 8
  %6 = icmp ne ptr %5, null
  br i1 %6, label %10, label %7

7:                                                ; preds = %1
  %8 = getelementptr inbounds nuw %"class.sc_core::sc_prim_channel", ptr %3, i32 0, i32 1
  %9 = load ptr, ptr %8, align 8
  call void @_ZN7sc_core24sc_prim_channel_registry14request_updateERNS_15sc_prim_channelE(ptr noundef nonnull align 8 dereferenceable(64) %9, ptr noundef nonnull align 8 dereferenceable(72) %3)
  br label %10

10:                                               ; preds = %7, %1
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZNK7sc_core13sc_simcontext18get_current_writerEv(ptr noundef nonnull align 8 dereferenceable(456) %0) #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %"class.sc_core::sc_simcontext", ptr %3, i32 0, i32 10
  %5 = load ptr, ptr %4, align 8
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef zeroext i1 @_ZNK7sc_core17sc_process_handle5validEv(ptr noundef nonnull align 8 dereferenceable(8) %0) #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %"class.sc_core::sc_process_handle", ptr %3, i32 0, i32 0
  %5 = load ptr, ptr %4, align 8
  %6 = icmp ne ptr %5, null
  %7 = zext i1 %6 to i64
  %8 = select i1 %6, i1 true, i1 false
  ret i1 %8
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7sc_core17sc_process_handleC1EPNS_12sc_process_bE(ptr noundef nonnull returned align 8 dereferenceable(8) %0, ptr noundef %1) unnamed_addr #2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = call noundef ptr @_ZN7sc_core17sc_process_handleC2EPNS_12sc_process_bE(ptr noundef nonnull align 8 dereferenceable(8) %5, ptr noundef %6)
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr void @_ZN7sc_core17sc_process_handle4swapERS0_(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) #4 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = getelementptr inbounds nuw %"class.sc_core::sc_process_handle", ptr %6, i32 0, i32 0
  %8 = load ptr, ptr %7, align 8
  store ptr %8, ptr %5, align 8
  %9 = load ptr, ptr %4, align 8
  %10 = getelementptr inbounds nuw %"class.sc_core::sc_process_handle", ptr %9, i32 0, i32 0
  %11 = load ptr, ptr %10, align 8
  %12 = getelementptr inbounds nuw %"class.sc_core::sc_process_handle", ptr %6, i32 0, i32 0
  store ptr %11, ptr %12, align 8
  %13 = load ptr, ptr %5, align 8
  %14 = load ptr, ptr %4, align 8
  %15 = getelementptr inbounds nuw %"class.sc_core::sc_process_handle", ptr %14, i32 0, i32 0
  store ptr %13, ptr %15, align 8
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7sc_core17sc_process_handlecvPNS_12sc_process_bEEv(ptr noundef nonnull align 8 dereferenceable(8) %0) #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %"class.sc_core::sc_process_handle", ptr %3, i32 0, i32 0
  %5 = load ptr, ptr %4, align 8
  ret ptr %5
}

declare void @_ZN7sc_core24sc_signal_invalid_writerEPNS_9sc_objectES1_S1_b(ptr noundef, ptr noundef, ptr noundef, i1 noundef zeroext) #1

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7sc_core17sc_process_handleC2EPNS_12sc_process_bE(ptr noundef nonnull returned align 8 dereferenceable(8) %0, ptr noundef %1) unnamed_addr #2 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %6 = load ptr, ptr %4, align 8
  store ptr %6, ptr %3, align 8
  %7 = getelementptr inbounds nuw %"class.sc_core::sc_process_handle", ptr %6, i32 0, i32 0
  %8 = load ptr, ptr %5, align 8
  store ptr %8, ptr %7, align 8
  %9 = getelementptr inbounds nuw %"class.sc_core::sc_process_handle", ptr %6, i32 0, i32 0
  %10 = load ptr, ptr %9, align 8
  %11 = icmp ne ptr %10, null
  br i1 %11, label %12, label %15

12:                                               ; preds = %2
  %13 = getelementptr inbounds nuw %"class.sc_core::sc_process_handle", ptr %6, i32 0, i32 0
  %14 = load ptr, ptr %13, align 8
  call void @_ZN7sc_core12sc_process_b19reference_incrementEv(ptr noundef nonnull align 8 dereferenceable(351) %14)
  br label %15

15:                                               ; preds = %12, %2
  %16 = load ptr, ptr %3, align 8
  ret ptr %16
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZN7sc_core12sc_process_b19reference_incrementEv(ptr noundef nonnull align 8 dereferenceable(351) %0) #2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %"class.sc_core::sc_process_b", ptr %3, i32 0, i32 21
  %5 = load i32, ptr %4, align 4
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %7, label %8

7:                                                ; preds = %1
  br label %10

8:                                                ; preds = %1
  call void @_ZN7sc_core19sc_assertion_failedEPKcS1_i(ptr noundef @.str.19, ptr noundef @.str.20, i32 noundef 582) #20
  unreachable

9:                                                ; No predecessors!
  br label %10

10:                                               ; preds = %9, %7
  %11 = phi i32 [ 0, %7 ], [ 0, %9 ]
  %12 = getelementptr inbounds nuw %"class.sc_core::sc_process_b", ptr %3, i32 0, i32 21
  %13 = load i32, ptr %12, align 4
  %14 = add nsw i32 %13, 1
  store i32 %14, ptr %12, align 4
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr void @_ZN7sc_core24sc_prim_channel_registry14request_updateERNS_15sc_prim_channelE(ptr noundef nonnull align 8 dereferenceable(64) %0, ptr noundef nonnull align 8 dereferenceable(72) %1) #4 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds nuw %"class.sc_core::sc_prim_channel_registry", ptr %5, i32 0, i32 5
  %7 = load ptr, ptr %6, align 8
  %8 = load ptr, ptr %4, align 8
  %9 = getelementptr inbounds nuw %"class.sc_core::sc_prim_channel", ptr %8, i32 0, i32 2
  store ptr %7, ptr %9, align 8
  %10 = load ptr, ptr %4, align 8
  %11 = getelementptr inbounds nuw %"class.sc_core::sc_prim_channel_registry", ptr %5, i32 0, i32 5
  store ptr %10, ptr %11, align 8
  ret void
}

declare void @_ZNK7sc_core17sc_signal_channel16deprecated_traceEv(ptr noundef nonnull align 8 dereferenceable(88)) #1

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZNK7sc_core9sc_object4nameEv(ptr noundef nonnull align 8 dereferenceable(56) %0) #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %"class.sc_core::sc_object", ptr %3, i32 0, i32 2
  %5 = call noundef ptr @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5c_strB8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(24) %4) #17
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5c_strB8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef ptr @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4dataB8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(24) %3) #17
  ret ptr %4
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4dataB8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef ptr @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE13__get_pointerB8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(24) %3) #17
  %5 = call noundef ptr @_ZNSt3__112__to_addressB8ne200100IKcEEPT_S3_(ptr noundef %4) #17
  ret ptr %5
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__112__to_addressB8ne200100IKcEEPT_S3_(ptr noundef %0) #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  ret ptr %3
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE13__get_pointerB8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef zeroext i1 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE9__is_longB8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(24) %3) #17
  br i1 %4, label %5, label %7

5:                                                ; preds = %1
  %6 = call noundef ptr @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE18__get_long_pointerB8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(24) %3) #17
  br label %9

7:                                                ; preds = %1
  %8 = call noundef ptr @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE19__get_short_pointerB8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(24) %3) #17
  br label %9

9:                                                ; preds = %7, %5
  %10 = phi ptr [ %6, %5 ], [ %8, %7 ]
  ret ptr %10
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE18__get_long_pointerB8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %"class.std::__1::basic_string", ptr %3, i32 0, i32 0
  %5 = getelementptr inbounds nuw %"struct.std::__1::basic_string<char>::__long", ptr %4, i32 0, i32 0
  %6 = load ptr, ptr %5, align 8
  ret ptr %6
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE19__get_short_pointerB8ne200100Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %"class.std::__1::basic_string", ptr %3, i32 0, i32 0
  %5 = getelementptr inbounds nuw %"struct.std::__1::basic_string<char>::__short", ptr %4, i32 0, i32 0
  %6 = getelementptr inbounds [23 x i8], ptr %5, i64 0, i64 0
  %7 = call noundef ptr @_ZNSt3__114pointer_traitsIPKcE10pointer_toB8ne200100ERS1_(ptr noundef nonnull align 1 dereferenceable(1) %6) #17
  ret ptr %7
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr hidden noundef ptr @_ZNSt3__114pointer_traitsIPKcE10pointer_toB8ne200100ERS1_(ptr noundef nonnull align 1 dereferenceable(1) %0) #4 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  ret ptr %3
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZN7sc_core28sc_writer_policy_check_write6updateEv(ptr noundef nonnull align 8 dereferenceable(16) %0) #2 {
  %2 = alloca ptr, align 8
  %3 = alloca %"class.sc_core::sc_process_handle", align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %"struct.sc_core::sc_writer_policy_check_write", ptr %4, i32 0, i32 0
  %6 = load i8, ptr %5, align 8
  %7 = trunc i8 %6 to i1
  br i1 %7, label %8, label %12

8:                                                ; preds = %1
  %9 = call noundef ptr @_ZN7sc_core17sc_process_handleC1Ev(ptr noundef nonnull align 8 dereferenceable(8) %3)
  %10 = getelementptr inbounds nuw %"struct.sc_core::sc_writer_policy_check_write", ptr %4, i32 0, i32 1
  call void @_ZN7sc_core17sc_process_handle4swapERS0_(ptr noundef nonnull align 8 dereferenceable(8) %3, ptr noundef nonnull align 8 dereferenceable(8) %10)
  %11 = call noundef ptr @_ZN7sc_core17sc_process_handleD1Ev(ptr noundef nonnull align 8 dereferenceable(8) %3) #17
  br label %12

12:                                               ; preds = %8, %1
  ret void
}

; Function Attrs: mustprogress noinline optnone ssp uwtable(sync)
define linkonce_odr void @_ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EE9do_updateEv(ptr noundef nonnull align 8 dereferenceable(136) %0) #2 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds i8, ptr %3, i64 16
  call void @_ZN7sc_core17sc_signal_channel9do_updateEv(ptr noundef nonnull align 8 dereferenceable(88) %4)
  %5 = getelementptr inbounds nuw %"class.sc_core::sc_signal_t.2", ptr %3, i32 0, i32 4
  %6 = load i32, ptr %5, align 4
  %7 = getelementptr inbounds nuw %"class.sc_core::sc_signal_t.2", ptr %3, i32 0, i32 3
  store i32 %6, ptr %7, align 8
  ret void
}

declare void @_ZN7sc_core17sc_signal_channel9do_updateEv(ptr noundef nonnull align 8 dereferenceable(88)) #1

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZTv0_n40_N7sc_core18sc_signal_inout_ifIiED1Ev(ptr noundef %0) unnamed_addr #6 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  store ptr %4, ptr %2, align 8
  %5 = load ptr, ptr %4, align 8
  %6 = getelementptr inbounds i8, ptr %5, i64 -40
  %7 = load i64, ptr %6, align 8
  %8 = getelementptr inbounds i8, ptr %4, i64 %7
  %9 = tail call noundef ptr @_ZN7sc_core18sc_signal_inout_ifIiED1Ev(ptr noundef nonnull align 8 dereferenceable(16) %8) #17
  ret ptr undef
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr void @_ZTv0_n40_N7sc_core18sc_signal_inout_ifIiED0Ev(ptr noundef %0) unnamed_addr #6 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = getelementptr inbounds i8, ptr %4, i64 -40
  %6 = load i64, ptr %5, align 8
  %7 = getelementptr inbounds i8, ptr %3, i64 %6
  tail call void @_ZN7sc_core18sc_signal_inout_ifIiED0Ev(ptr noundef nonnull align 8 dereferenceable(16) %7) #17
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZTv0_n40_N7sc_core15sc_signal_in_ifIiED1Ev(ptr noundef %0) unnamed_addr #6 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  store ptr %4, ptr %2, align 8
  %5 = load ptr, ptr %4, align 8
  %6 = getelementptr inbounds i8, ptr %5, i64 -40
  %7 = load i64, ptr %6, align 8
  %8 = getelementptr inbounds i8, ptr %4, i64 %7
  %9 = tail call noundef ptr @_ZN7sc_core15sc_signal_in_ifIiED1Ev(ptr noundef nonnull align 8 dereferenceable(8) %8) #17
  ret ptr undef
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr void @_ZTv0_n40_N7sc_core15sc_signal_in_ifIiED0Ev(ptr noundef %0) unnamed_addr #6 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = getelementptr inbounds i8, ptr %4, i64 -40
  %6 = load i64, ptr %5, align 8
  %7 = getelementptr inbounds i8, ptr %3, i64 %6
  tail call void @_ZN7sc_core15sc_signal_in_ifIiED0Ev(ptr noundef nonnull align 8 dereferenceable(8) %7) #17
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr void @_ZTv0_n40_N7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED0Ev(ptr noundef %0) unnamed_addr #6 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = getelementptr inbounds i8, ptr %4, i64 -40
  %6 = load i64, ptr %5, align 8
  %7 = getelementptr inbounds i8, ptr %3, i64 %6
  tail call void @_ZN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED0Ev(ptr noundef nonnull align 8 dereferenceable(136) %7) #17
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED2Ev(ptr noundef nonnull returned align 8 dereferenceable(136) %0, ptr noundef %1) unnamed_addr #4 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = getelementptr inbounds ptr, ptr %6, i64 1
  %8 = call noundef ptr @_ZN7sc_core11sc_signal_tIiLNS_16sc_writer_policyE0EED2Ev(ptr noundef nonnull align 8 dereferenceable(136) %5, ptr noundef %7) #17
  ret ptr %5
}

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define linkonce_odr noundef ptr @_ZTv0_n40_N7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED1Ev(ptr noundef %0) unnamed_addr #6 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  store ptr %4, ptr %2, align 8
  %5 = load ptr, ptr %4, align 8
  %6 = getelementptr inbounds i8, ptr %5, i64 -40
  %7 = load i64, ptr %6, align 8
  %8 = getelementptr inbounds i8, ptr %4, i64 %7
  %9 = tail call noundef ptr @_ZN7sc_core9sc_signalIiLNS_16sc_writer_policyE0EED1Ev(ptr noundef nonnull align 8 dereferenceable(136) %8) #17
  ret ptr undef
}

; Function Attrs: noinline ssp uwtable(sync)
define internal void @_GLOBAL__sub_I_simple_test_for_mir.cpp() #0 section "__TEXT,__StaticInit,regular,pure_instructions" {
  call void @__cxx_global_var_init()
  ret void
}

attributes #0 = { noinline ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #1 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #2 = { mustprogress noinline optnone ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #3 = { noinline noreturn nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #4 = { mustprogress noinline nounwind optnone ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #5 = { nounwind "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #6 = { noinline nounwind optnone ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #7 = { nobuiltin nounwind "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #8 = { nounwind willreturn memory(read) }
attributes #9 = { noreturn "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #10 = { mustprogress noinline noreturn optnone ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #11 = { nobuiltin allocsize(0) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #12 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }
attributes #13 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #14 = { cold noreturn nounwind memory(inaccessiblemem: write) }
attributes #15 = { noinline optnone ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+ccpp,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #16 = { convergent nocallback nofree nosync nounwind willreturn memory(none) }
attributes #17 = { nounwind }
attributes #18 = { noreturn nounwind }
attributes #19 = { builtin nounwind }
attributes #20 = { noreturn }
attributes #21 = { builtin allocsize(0) }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 5]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 1}
!5 = !{!"Homebrew clang version 20.1.8"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
!12 = distinct !{!12, !7}
!13 = distinct !{!13, !7}
!14 = distinct !{!14, !7}
!15 = !{}
