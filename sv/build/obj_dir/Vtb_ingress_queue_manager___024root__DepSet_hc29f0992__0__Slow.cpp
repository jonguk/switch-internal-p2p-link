// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtb_ingress_queue_manager.h for the primary calling header

#include "Vtb_ingress_queue_manager__pch.h"
#include "Vtb_ingress_queue_manager___024root.h"

VL_ATTR_COLD void Vtb_ingress_queue_manager___024root___eval_static__TOP(Vtb_ingress_queue_manager___024root* vlSelf);
VL_ATTR_COLD void Vtb_ingress_queue_manager___024root____Vm_traceActivitySetAll(Vtb_ingress_queue_manager___024root* vlSelf);

VL_ATTR_COLD void Vtb_ingress_queue_manager___024root___eval_static(Vtb_ingress_queue_manager___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_ingress_queue_manager___024root___eval_static\n"); );
    Vtb_ingress_queue_manager__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    Vtb_ingress_queue_manager___024root___eval_static__TOP(vlSelf);
    Vtb_ingress_queue_manager___024root____Vm_traceActivitySetAll(vlSelf);
    vlSelfRef.__Vtrigprevexpr___TOP__tb_ingress_queue_manager__DOT__clk__0 = 0U;
    vlSelfRef.__Vtrigprevexpr___TOP__tb_ingress_queue_manager__DOT__rst_n__0 = 0U;
}

VL_ATTR_COLD void Vtb_ingress_queue_manager___024root___eval_static__TOP(Vtb_ingress_queue_manager___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_ingress_queue_manager___024root___eval_static__TOP\n"); );
    Vtb_ingress_queue_manager__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.tb_ingress_queue_manager__DOT__clk = 0U;
    vlSelfRef.tb_ingress_queue_manager__DOT__rst_n = 0U;
    vlSelfRef.tb_ingress_queue_manager__DOT__cycle_count = 0U;
    vlSelfRef.tb_ingress_queue_manager__DOT__total_packets_sent = 0U;
}

VL_ATTR_COLD void Vtb_ingress_queue_manager___024root___eval_final(Vtb_ingress_queue_manager___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_ingress_queue_manager___024root___eval_final\n"); );
    Vtb_ingress_queue_manager__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
}

VL_ATTR_COLD void Vtb_ingress_queue_manager___024root___eval_settle(Vtb_ingress_queue_manager___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_ingress_queue_manager___024root___eval_settle\n"); );
    Vtb_ingress_queue_manager__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vtb_ingress_queue_manager___024root___dump_triggers__act(Vtb_ingress_queue_manager___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_ingress_queue_manager___024root___dump_triggers__act\n"); );
    Vtb_ingress_queue_manager__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1U & (~ vlSelfRef.__VactTriggered.any()))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
    if ((1ULL & vlSelfRef.__VactTriggered.word(0U))) {
        VL_DBG_MSGF("         'act' region trigger index 0 is active: @(posedge tb_ingress_queue_manager.clk)\n");
    }
    if ((2ULL & vlSelfRef.__VactTriggered.word(0U))) {
        VL_DBG_MSGF("         'act' region trigger index 1 is active: @(negedge tb_ingress_queue_manager.rst_n)\n");
    }
    if ((4ULL & vlSelfRef.__VactTriggered.word(0U))) {
        VL_DBG_MSGF("         'act' region trigger index 2 is active: @([true] __VdlySched.awaitingCurrentTime())\n");
    }
}
#endif  // VL_DEBUG

#ifdef VL_DEBUG
VL_ATTR_COLD void Vtb_ingress_queue_manager___024root___dump_triggers__nba(Vtb_ingress_queue_manager___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_ingress_queue_manager___024root___dump_triggers__nba\n"); );
    Vtb_ingress_queue_manager__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1U & (~ vlSelfRef.__VnbaTriggered.any()))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
    if ((1ULL & vlSelfRef.__VnbaTriggered.word(0U))) {
        VL_DBG_MSGF("         'nba' region trigger index 0 is active: @(posedge tb_ingress_queue_manager.clk)\n");
    }
    if ((2ULL & vlSelfRef.__VnbaTriggered.word(0U))) {
        VL_DBG_MSGF("         'nba' region trigger index 1 is active: @(negedge tb_ingress_queue_manager.rst_n)\n");
    }
    if ((4ULL & vlSelfRef.__VnbaTriggered.word(0U))) {
        VL_DBG_MSGF("         'nba' region trigger index 2 is active: @([true] __VdlySched.awaitingCurrentTime())\n");
    }
}
#endif  // VL_DEBUG

VL_ATTR_COLD void Vtb_ingress_queue_manager___024root____Vm_traceActivitySetAll(Vtb_ingress_queue_manager___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_ingress_queue_manager___024root____Vm_traceActivitySetAll\n"); );
    Vtb_ingress_queue_manager__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.__Vm_traceActivity[0U] = 1U;
    vlSelfRef.__Vm_traceActivity[1U] = 1U;
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    vlSelfRef.__Vm_traceActivity[3U] = 1U;
    vlSelfRef.__Vm_traceActivity[4U] = 1U;
}

VL_ATTR_COLD void Vtb_ingress_queue_manager___024root___ctor_var_reset(Vtb_ingress_queue_manager___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_ingress_queue_manager___024root___ctor_var_reset\n"); );
    Vtb_ingress_queue_manager__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    const uint64_t __VscopeHash = VL_MURMUR64_HASH(vlSelf->name());
    vlSelf->tb_ingress_queue_manager__DOT__clk = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 1416358756440696527ull);
    vlSelf->tb_ingress_queue_manager__DOT__rst_n = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 18198190947845511374ull);
    VL_SCOPED_RAND_RESET_W(138, vlSelf->tb_ingress_queue_manager__DOT__axis_in_m2s, __VscopeHash, 13652637105681351729ull);
    vlSelf->tb_ingress_queue_manager__DOT__internal_valid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 10025579513842883823ull);
    VL_SCOPED_RAND_RESET_W(512, vlSelf->tb_ingress_queue_manager__DOT__internal_packet_data, __VscopeHash, 4612305192152314725ull);
    vlSelf->tb_ingress_queue_manager__DOT__internal_ready = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9585155200782203655ull);
    vlSelf->tb_ingress_queue_manager__DOT__axi_master_valid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 4567439436393060922ull);
    vlSelf->tb_ingress_queue_manager__DOT__axi_master_addr = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 6160045291495602535ull);
    vlSelf->tb_ingress_queue_manager__DOT__axi_master_data = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 13367119950250438697ull);
    vlSelf->tb_ingress_queue_manager__DOT__axi_master_ready = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 1325105769741661876ull);
    vlSelf->tb_ingress_queue_manager__DOT__axi_slave_valid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 14569276550615925249ull);
    vlSelf->tb_ingress_queue_manager__DOT__axi_slave_addr = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 180423527823895200ull);
    vlSelf->tb_ingress_queue_manager__DOT__axi_slave_data = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 7430023761314618874ull);
    vlSelf->tb_ingress_queue_manager__DOT__axi_slave_ready = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 17421459891580818791ull);
    vlSelf->tb_ingress_queue_manager__DOT__cycle_count = 0;
    vlSelf->tb_ingress_queue_manager__DOT__total_packets_sent = 0;
    vlSelf->tb_ingress_queue_manager__DOT__internal_out_s2m = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 1874626716817966067ull);
    vlSelf->tb_ingress_queue_manager__DOT__axi_out_s2m = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 5730744881820410882ull);
    VL_SCOPED_RAND_RESET_W(65, vlSelf->tb_ingress_queue_manager__DOT__axi_in_m2s, __VscopeHash, 3611931469560655536ull);
    vlSelf->tb_ingress_queue_manager__DOT__test_axis_reception__Vstatic__header_data = VL_SCOPED_RAND_RESET_Q(64, __VscopeHash, 6446758372673191059ull);
    for (int __Vi0 = 0; __Vi0 < 16; ++__Vi0) {
        vlSelf->tb_ingress_queue_manager__DOT__test_axis_reception__Vstatic__packet_data[__Vi0] = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 5862420985444608558ull);
    }
    vlSelf->tb_ingress_queue_manager__DOT__test_internal_header_processing__Vstatic__header_data = VL_SCOPED_RAND_RESET_Q(64, __VscopeHash, 9285169507253049427ull);
    for (int __Vi0 = 0; __Vi0 < 8; ++__Vi0) {
        vlSelf->tb_ingress_queue_manager__DOT__test_internal_header_processing__Vstatic__packet_data[__Vi0] = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 14137240776687758278ull);
    }
    vlSelf->tb_ingress_queue_manager__DOT__test_credit_processing__Vstatic__header_data = VL_SCOPED_RAND_RESET_Q(64, __VscopeHash, 17282221774435535469ull);
    for (int __Vi0 = 0; __Vi0 < 4; ++__Vi0) {
        vlSelf->tb_ingress_queue_manager__DOT__test_credit_processing__Vstatic__packet_data[__Vi0] = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 6699005116506400984ull);
    }
    vlSelf->tb_ingress_queue_manager__DOT__test_packet_conversion__Vstatic__header_data = VL_SCOPED_RAND_RESET_Q(64, __VscopeHash, 17197232306838118943ull);
    for (int __Vi0 = 0; __Vi0 < 16; ++__Vi0) {
        vlSelf->tb_ingress_queue_manager__DOT__test_packet_conversion__Vstatic__packet_data[__Vi0] = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 5889340480850687742ull);
    }
    vlSelf->tb_ingress_queue_manager__DOT__test_internal_transmission__Vstatic__header_data = VL_SCOPED_RAND_RESET_Q(64, __VscopeHash, 3948729278657303693ull);
    for (int __Vi0 = 0; __Vi0 < 4; ++__Vi0) {
        vlSelf->tb_ingress_queue_manager__DOT__test_internal_transmission__Vstatic__packet_data[__Vi0] = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 6342415823461923116ull);
    }
    vlSelf->tb_ingress_queue_manager__DOT__dut__DOT__axis_tready = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 10872025162416707126ull);
    vlSelf->tb_ingress_queue_manager__DOT__dut__DOT__internal_tvalid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9283343418626778469ull);
    vlSelf->tb_ingress_queue_manager__DOT__dut__DOT__internal_tdata = VL_SCOPED_RAND_RESET_Q(64, __VscopeHash, 5407757379478254445ull);
    vlSelf->tb_ingress_queue_manager__DOT__dut__DOT__internal_tkeep = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 15652702625358962023ull);
    vlSelf->tb_ingress_queue_manager__DOT__dut__DOT__internal_tuser = VL_SCOPED_RAND_RESET_Q(64, __VscopeHash, 15916626035441028880ull);
    vlSelf->tb_ingress_queue_manager__DOT__dut__DOT__internal_tdest = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 10957412548523492677ull);
    vlSelf->tb_ingress_queue_manager__DOT__dut__DOT__internal_tlast = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 454051858461873072ull);
    vlSelf->tb_ingress_queue_manager__DOT__dut__DOT__axis_rx_state = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 9776402447736003488ull);
    vlSelf->tb_ingress_queue_manager__DOT__dut__DOT__processing_state = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 15388915812955303444ull);
    vlSelf->tb_ingress_queue_manager__DOT__dut__DOT__internal_tx_state = VL_SCOPED_RAND_RESET_I(2, __VscopeHash, 12030044564472674914ull);
    vlSelf->tb_ingress_queue_manager__DOT__dut__DOT__packet_in_assembly = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12157614349157104950ull);
    vlSelf->tb_ingress_queue_manager__DOT__dut__DOT__current_packet_size = VL_SCOPED_RAND_RESET_I(16, __VscopeHash, 12973985485771629003ull);
    VL_SCOPED_RAND_RESET_W(4096, vlSelf->tb_ingress_queue_manager__DOT__dut__DOT__current_packet_buffer, __VscopeHash, 876105962679887054ull);
    vlSelf->tb_ingress_queue_manager__DOT__dut__DOT__current_header = VL_SCOPED_RAND_RESET_Q(64, __VscopeHash, 13200433997908022558ull);
    VL_SCOPED_RAND_RESET_W(8388608, vlSelf->tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_data, __VscopeHash, 13895750321297487067ull);
    VL_SCOPED_RAND_RESET_W(32768, vlSelf->tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_size, __VscopeHash, 7759578025239688137ull);
    VL_SCOPED_RAND_RESET_W(131072, vlSelf->tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_header, __VscopeHash, 616002224139325372ull);
    VL_SCOPED_RAND_RESET_W(2048, vlSelf->tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid, __VscopeHash, 9530427995126154091ull);
    vlSelf->tb_ingress_queue_manager__DOT__dut__DOT__queue_head = VL_SCOPED_RAND_RESET_Q(64, __VscopeHash, 9559852305324755157ull);
    vlSelf->tb_ingress_queue_manager__DOT__dut__DOT__queue_tail = VL_SCOPED_RAND_RESET_Q(64, __VscopeHash, 16534056704860744078ull);
    VL_SCOPED_RAND_RESET_W(72, vlSelf->tb_ingress_queue_manager__DOT__dut__DOT__queue_count, __VscopeHash, 15411448347361104634ull);
    VL_SCOPED_RAND_RESET_W(32768, vlSelf->tb_ingress_queue_manager__DOT__dut__DOT__global_to_local_lookup, __VscopeHash, 3687117156026704112ull);
    vlSelf->tb_ingress_queue_manager__DOT__dut__DOT__lookup_table_initialized = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 1232860527401038097ull);
    vlSelf->tb_ingress_queue_manager__DOT__dut__DOT__total_packets_processed = VL_SCOPED_RAND_RESET_Q(64, __VscopeHash, 13329099172543400201ull);
    vlSelf->tb_ingress_queue_manager__DOT__dut__DOT__total_credits_added = VL_SCOPED_RAND_RESET_Q(64, __VscopeHash, 6390629105309762957ull);
    VL_SCOPED_RAND_RESET_W(4096, vlSelf->tb_ingress_queue_manager__DOT__dut__DOT__tx_packet_data, __VscopeHash, 18217660675763665167ull);
    vlSelf->tb_ingress_queue_manager__DOT__dut__DOT__tx_packet_size = VL_SCOPED_RAND_RESET_I(16, __VscopeHash, 16743859305219220928ull);
    vlSelf->tb_ingress_queue_manager__DOT__dut__DOT__tx_packet_header = VL_SCOPED_RAND_RESET_Q(64, __VscopeHash, 12835126229178017340ull);
    vlSelf->tb_ingress_queue_manager__DOT__dut__DOT__tx_packet_valid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 7844983702231525168ull);
    vlSelf->tb_ingress_queue_manager__DOT__dut__DOT__tx_beat_count = VL_SCOPED_RAND_RESET_I(16, __VscopeHash, 512334453818553023ull);
    vlSelf->tb_ingress_queue_manager__DOT__dut__DOT__tx_total_beats = VL_SCOPED_RAND_RESET_I(16, __VscopeHash, 13809472939386728219ull);
    vlSelf->tb_ingress_queue_manager__DOT__dut__DOT__beat_tvalid = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 3832206198436144663ull);
    vlSelf->tb_ingress_queue_manager__DOT__dut__DOT__beat_tdata = VL_SCOPED_RAND_RESET_Q(64, __VscopeHash, 16521755407788129423ull);
    vlSelf->tb_ingress_queue_manager__DOT__dut__DOT__beat_tkeep = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 13543295318625770079ull);
    vlSelf->tb_ingress_queue_manager__DOT__dut__DOT__beat_tuser = VL_SCOPED_RAND_RESET_Q(64, __VscopeHash, 5310780115645180444ull);
    vlSelf->tb_ingress_queue_manager__DOT__dut__DOT__i = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 6354975123139685972ull);
    vlSelf->tb_ingress_queue_manager__DOT__dut__DOT__j = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 11713490655196040994ull);
    vlSelf->tb_ingress_queue_manager__DOT__dut__DOT__process_received_packet__Vstatic__queue_id = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 9607028805907403837ull);
    vlSelf->tb_ingress_queue_manager__DOT__dut__DOT__process_received_packet__Vstatic__local_dest_port = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 18218717923678027312ull);
    vlSelf->tb_ingress_queue_manager__DOT__dut__DOT__process_received_packet__Vstatic__global_dest_port = VL_SCOPED_RAND_RESET_I(12, __VscopeHash, 15717656241493909514ull);
    vlSelf->tb_ingress_queue_manager__DOT__dut__DOT__enqueue_packet__Vstatic__tail_idx = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 803552473867233977ull);
    vlSelf->tb_ingress_queue_manager__DOT__dut__DOT__dequeue_packet__Vstatic__head_idx = VL_SCOPED_RAND_RESET_I(8, __VscopeHash, 13365577185428316998ull);
    vlSelf->tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__Vstatic__byte_offset = VL_SCOPED_RAND_RESET_I(16, __VscopeHash, 3264762434389743514ull);
    vlSelf->tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__Vstatic__bytes_remaining = VL_SCOPED_RAND_RESET_I(16, __VscopeHash, 5513165125981030992ull);
    vlSelf->tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__Vstatic__bytes_in_beat = VL_SCOPED_RAND_RESET_I(16, __VscopeHash, 16185274370011699051ull);
    vlSelf->tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__Vstatic__b = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 11884618076572014636ull);
    vlSelf->tb_ingress_queue_manager__DOT__dut__DOT____Vlvbound_h3c135dfb__0 = VL_SCOPED_RAND_RESET_I(9, __VscopeHash, 2087961812772513195ull);
    vlSelf->tb_ingress_queue_manager__DOT__dut__DOT____Vlvbound_h3c135dfb__1 = VL_SCOPED_RAND_RESET_I(9, __VscopeHash, 9864903880943820027ull);
    vlSelf->__Vtrigprevexpr___TOP__tb_ingress_queue_manager__DOT__clk__0 = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 3197514324203006351ull);
    vlSelf->__Vtrigprevexpr___TOP__tb_ingress_queue_manager__DOT__rst_n__0 = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 13681301138327506019ull);
    for (int __Vi0 = 0; __Vi0 < 5; ++__Vi0) {
        vlSelf->__Vm_traceActivity[__Vi0] = 0;
    }
}
