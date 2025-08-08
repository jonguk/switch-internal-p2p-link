// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtb_ingress_queue_manager.h for the primary calling header

#include "Vtb_ingress_queue_manager__pch.h"
#include "Vtb_ingress_queue_manager___024root.h"

VlCoroutine Vtb_ingress_queue_manager___024root___eval_initial__TOP__Vtiming__0(Vtb_ingress_queue_manager___024root* vlSelf);
VlCoroutine Vtb_ingress_queue_manager___024root___eval_initial__TOP__Vtiming__1(Vtb_ingress_queue_manager___024root* vlSelf);

void Vtb_ingress_queue_manager___024root___eval_initial(Vtb_ingress_queue_manager___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_ingress_queue_manager___024root___eval_initial\n"); );
    Vtb_ingress_queue_manager__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.__Vm_traceActivity[1U] = 1U;
    Vtb_ingress_queue_manager___024root___eval_initial__TOP__Vtiming__0(vlSelf);
    Vtb_ingress_queue_manager___024root___eval_initial__TOP__Vtiming__1(vlSelf);
}

void Vtb_ingress_queue_manager___024root___eval_act(Vtb_ingress_queue_manager___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_ingress_queue_manager___024root___eval_act\n"); );
    Vtb_ingress_queue_manager__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
}

void Vtb_ingress_queue_manager___024root___nba_sequent__TOP__0(Vtb_ingress_queue_manager___024root* vlSelf);
void Vtb_ingress_queue_manager___024root___nba_sequent__TOP__1(Vtb_ingress_queue_manager___024root* vlSelf);
void Vtb_ingress_queue_manager___024root___nba_sequent__TOP__2(Vtb_ingress_queue_manager___024root* vlSelf);

void Vtb_ingress_queue_manager___024root___eval_nba(Vtb_ingress_queue_manager___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_ingress_queue_manager___024root___eval_nba\n"); );
    Vtb_ingress_queue_manager__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1ULL & vlSelfRef.__VnbaTriggered.word(0U))) {
        Vtb_ingress_queue_manager___024root___nba_sequent__TOP__0(vlSelf);
        vlSelfRef.__Vm_traceActivity[3U] = 1U;
    }
    if ((3ULL & vlSelfRef.__VnbaTriggered.word(0U))) {
        Vtb_ingress_queue_manager___024root___nba_sequent__TOP__1(vlSelf);
        vlSelfRef.__Vm_traceActivity[4U] = 1U;
    }
    if ((1ULL & vlSelfRef.__VnbaTriggered.word(0U))) {
        Vtb_ingress_queue_manager___024root___nba_sequent__TOP__2(vlSelf);
    }
}

VL_INLINE_OPT void Vtb_ingress_queue_manager___024root___nba_sequent__TOP__0(Vtb_ingress_queue_manager___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_ingress_queue_manager___024root___nba_sequent__TOP__0\n"); );
    Vtb_ingress_queue_manager__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    IData/*31:0*/ __Vdly__tb_ingress_queue_manager__DOT__cycle_count;
    __Vdly__tb_ingress_queue_manager__DOT__cycle_count = 0;
    // Body
    __Vdly__tb_ingress_queue_manager__DOT__cycle_count 
        = vlSelfRef.tb_ingress_queue_manager__DOT__cycle_count;
    __Vdly__tb_ingress_queue_manager__DOT__cycle_count 
        = ((IData)(1U) + vlSelfRef.tb_ingress_queue_manager__DOT__cycle_count);
    if (VL_UNLIKELY((VL_LTES_III(32, 0x2710U, vlSelfRef.tb_ingress_queue_manager__DOT__cycle_count)))) {
        VL_WRITEF_NX("TIMEOUT: Reached 10000 cycles, finishing simulation\n",0);
        VL_FINISH_MT("../tb/tb_ingress_queue_manager.sv", 496, "");
    }
    vlSelfRef.tb_ingress_queue_manager__DOT__axi_in_m2s[0U] = 0U;
    vlSelfRef.tb_ingress_queue_manager__DOT__axi_in_m2s[1U] = 0U;
    vlSelfRef.tb_ingress_queue_manager__DOT__axi_in_m2s[2U] = 0U;
    vlSelfRef.tb_ingress_queue_manager__DOT__internal_ready = 1U;
    vlSelfRef.tb_ingress_queue_manager__DOT__axi_out_s2m 
        = vlSelfRef.tb_ingress_queue_manager__DOT__rst_n;
    vlSelfRef.tb_ingress_queue_manager__DOT__cycle_count 
        = __Vdly__tb_ingress_queue_manager__DOT__cycle_count;
}

extern const VlWide<128>/*4095:0*/ Vtb_ingress_queue_manager__ConstPool__CONST_h6e0f3f36_0;
extern const VlWide<64>/*2047:0*/ Vtb_ingress_queue_manager__ConstPool__CONST_h6be9aa18_0;

VL_INLINE_OPT void Vtb_ingress_queue_manager___024root___nba_sequent__TOP__1(Vtb_ingress_queue_manager___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_ingress_queue_manager___024root___nba_sequent__TOP__1\n"); );
    Vtb_ingress_queue_manager__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    VlWide<4>/*127:0*/ tb_ingress_queue_manager__DOT__dut__DOT__available_credits;
    VL_ZERO_W(128, tb_ingress_queue_manager__DOT__dut__DOT__available_credits);
    SData/*15:0*/ __Vfunc_tb_ingress_queue_manager__DOT__dut__DOT__count_keep_bits__18__Vfuncout;
    __Vfunc_tb_ingress_queue_manager__DOT__dut__DOT__count_keep_bits__18__Vfuncout = 0;
    CData/*7:0*/ __Vfunc_tb_ingress_queue_manager__DOT__dut__DOT__count_keep_bits__18__keep;
    __Vfunc_tb_ingress_queue_manager__DOT__dut__DOT__count_keep_bits__18__keep = 0;
    SData/*15:0*/ __Vfunc_tb_ingress_queue_manager__DOT__dut__DOT__count_keep_bits__19__Vfuncout;
    __Vfunc_tb_ingress_queue_manager__DOT__dut__DOT__count_keep_bits__19__Vfuncout = 0;
    CData/*7:0*/ __Vfunc_tb_ingress_queue_manager__DOT__dut__DOT__count_keep_bits__19__keep;
    __Vfunc_tb_ingress_queue_manager__DOT__dut__DOT__count_keep_bits__19__keep = 0;
    CData/*7:0*/ __Vtask_tb_ingress_queue_manager__DOT__dut__DOT__enqueue_packet__21__queue_id;
    __Vtask_tb_ingress_queue_manager__DOT__dut__DOT__enqueue_packet__21__queue_id = 0;
    VlWide<128>/*4095:0*/ __Vtask_tb_ingress_queue_manager__DOT__dut__DOT__enqueue_packet__21__packet_data;
    VL_ZERO_W(4096, __Vtask_tb_ingress_queue_manager__DOT__dut__DOT__enqueue_packet__21__packet_data);
    SData/*15:0*/ __Vtask_tb_ingress_queue_manager__DOT__dut__DOT__enqueue_packet__21__packet_size;
    __Vtask_tb_ingress_queue_manager__DOT__dut__DOT__enqueue_packet__21__packet_size = 0;
    QData/*63:0*/ __Vtask_tb_ingress_queue_manager__DOT__dut__DOT__enqueue_packet__21__packet_header;
    __Vtask_tb_ingress_queue_manager__DOT__dut__DOT__enqueue_packet__21__packet_header = 0;
    CData/*7:0*/ __Vtask_tb_ingress_queue_manager__DOT__dut__DOT__dequeue_packet__23__queue_id;
    __Vtask_tb_ingress_queue_manager__DOT__dut__DOT__dequeue_packet__23__queue_id = 0;
    SData/*15:0*/ __Vtask_tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__24__beat_index;
    __Vtask_tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__24__beat_index = 0;
    QData/*63:0*/ __Vtask_tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__24__internal_beat_tdata;
    __Vtask_tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__24__internal_beat_tdata = 0;
    CData/*7:0*/ __Vtask_tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__24__internal_beat_tkeep;
    __Vtask_tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__24__internal_beat_tkeep = 0;
    QData/*63:0*/ __Vtask_tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__24__internal_beat_tuser;
    __Vtask_tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__24__internal_beat_tuser = 0;
    VlWide<128>/*4095:0*/ __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__current_packet_buffer;
    VL_ZERO_W(4096, __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__current_packet_buffer);
    QData/*63:0*/ __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__current_header;
    __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__current_header = 0;
    CData/*1:0*/ __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__axis_rx_state;
    __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__axis_rx_state = 0;
    SData/*15:0*/ __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__current_packet_size;
    __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__current_packet_size = 0;
    CData/*0:0*/ __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__axis_tready;
    __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__axis_tready = 0;
    QData/*63:0*/ __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__queue_head;
    __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__queue_head = 0;
    QData/*63:0*/ __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__queue_head;
    __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__queue_head = 0;
    QData/*63:0*/ __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__queue_tail;
    __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__queue_tail = 0;
    QData/*63:0*/ __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__queue_tail;
    __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__queue_tail = 0;
    VlWide<3>/*71:0*/ __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__queue_count;
    VL_ZERO_W(72, __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__queue_count);
    VlWide<3>/*71:0*/ __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__queue_count;
    VL_ZERO_W(72, __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__queue_count);
    VlWide<64>/*2047:0*/ __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid;
    VL_ZERO_W(2048, __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid);
    VlWide<64>/*2047:0*/ __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid;
    VL_ZERO_W(2048, __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid);
    CData/*0:0*/ __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__internal_tvalid;
    __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__internal_tvalid = 0;
    SData/*15:0*/ __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__tx_total_beats;
    __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__tx_total_beats = 0;
    SData/*15:0*/ __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__tx_beat_count;
    __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__tx_beat_count = 0;
    CData/*1:0*/ __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__internal_tx_state;
    __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__internal_tx_state = 0;
    CData/*0:0*/ __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__tx_packet_valid;
    __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__tx_packet_valid = 0;
    CData/*0:0*/ __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__tx_packet_valid;
    __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__tx_packet_valid = 0;
    VlWide<64>/*2047:0*/ __Vtemp_33;
    VlWide<3>/*95:0*/ __Vtemp_37;
    // Body
    __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__internal_tvalid 
        = vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__internal_tvalid;
    __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__tx_total_beats 
        = vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__tx_total_beats;
    __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__tx_beat_count 
        = vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__tx_beat_count;
    __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__internal_tx_state 
        = vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__internal_tx_state;
    VL_ASSIGN_W(4096,__Vdly__tb_ingress_queue_manager__DOT__dut__DOT__current_packet_buffer, vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__current_packet_buffer);
    __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__current_header 
        = vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__current_header;
    __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__axis_rx_state 
        = vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__axis_rx_state;
    __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__current_packet_size 
        = vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__current_packet_size;
    __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__axis_tready 
        = vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__axis_tready;
    if (vlSelfRef.tb_ingress_queue_manager__DOT__rst_n) {
        if ((0U == (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__internal_tx_state))) {
            __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__internal_tvalid = 0U;
            vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__internal_tlast = 0U;
            if (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__tx_packet_valid) {
                __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__tx_total_beats 
                    = (0xffffU & (((IData)(7U) + (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__tx_packet_size)) 
                                  >> 3U));
                __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__tx_beat_count = 0U;
                __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__internal_tx_state = 3U;
            }
        } else if ((3U == (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__internal_tx_state))) {
            if ((1U & ((IData)(vlSelfRef.tb_ingress_queue_manager__DOT__internal_out_s2m) 
                       | (~ (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__internal_tvalid))))) {
                if (((IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__tx_beat_count) 
                     < (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__tx_total_beats))) {
                    __Vtask_tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__24__beat_index 
                        = vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__tx_beat_count;
                    vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__Vstatic__b = 8U;
                    vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__beat_tvalid = 1U;
                    vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__Vstatic__byte_offset 
                        = (0xffffU & VL_SHIFTL_III(16,32,32, (IData)(__Vtask_tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__24__beat_index), 3U));
                    __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__internal_tvalid = 1U;
                    vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__Vstatic__bytes_remaining 
                        = (0xffffU & ((IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__tx_packet_size) 
                                      - (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__Vstatic__byte_offset)));
                    vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__Vstatic__bytes_in_beat 
                        = ((8U < (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__Vstatic__bytes_remaining))
                            ? 8U : (0xffffU & (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__Vstatic__bytes_remaining)));
                    __Vtask_tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__24__internal_beat_tkeep = 0U;
                    __Vtask_tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__24__internal_beat_tdata = 0ULL;
                    __Vtask_tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__24__internal_beat_tuser 
                        = ((0U == (IData)(__Vtask_tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__24__beat_index))
                            ? vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__tx_packet_header
                            : 0ULL);
                    if ((0U < (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__Vstatic__bytes_in_beat))) {
                        __Vtask_tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__24__internal_beat_tkeep 
                            = (1U | (IData)(__Vtask_tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__24__internal_beat_tkeep));
                        __Vtask_tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__24__internal_beat_tdata 
                            = ((0xffffffffffffff00ULL 
                                & __Vtask_tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__24__internal_beat_tdata) 
                               | (IData)((IData)((0xffU 
                                                  & (((0U 
                                                       == 
                                                       (0x1fU 
                                                        & ((VL_SHIFTL_III(12,32,32, 
                                                                          ((IData)(1U) 
                                                                           + (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__Vstatic__byte_offset)), 3U) 
                                                            - (IData)(1U)) 
                                                           - (IData)(7U))))
                                                       ? 0U
                                                       : 
                                                      (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__tx_packet_data[
                                                       (((IData)(7U) 
                                                         + 
                                                         (0xfffU 
                                                          & ((VL_SHIFTL_III(12,32,32, 
                                                                            ((IData)(1U) 
                                                                             + (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__Vstatic__byte_offset)), 3U) 
                                                              - (IData)(1U)) 
                                                             - (IData)(7U)))) 
                                                        >> 5U)] 
                                                       << 
                                                       ((IData)(0x20U) 
                                                        - 
                                                        (0x1fU 
                                                         & ((VL_SHIFTL_III(12,32,32, 
                                                                           ((IData)(1U) 
                                                                            + (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__Vstatic__byte_offset)), 3U) 
                                                             - (IData)(1U)) 
                                                            - (IData)(7U)))))) 
                                                     | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__tx_packet_data[
                                                        (0x7fU 
                                                         & (((VL_SHIFTL_III(12,32,32, 
                                                                            ((IData)(1U) 
                                                                             + (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__Vstatic__byte_offset)), 3U) 
                                                              - (IData)(1U)) 
                                                             - (IData)(7U)) 
                                                            >> 5U))] 
                                                        >> 
                                                        (0x1fU 
                                                         & ((VL_SHIFTL_III(12,32,32, 
                                                                           ((IData)(1U) 
                                                                            + (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__Vstatic__byte_offset)), 3U) 
                                                             - (IData)(1U)) 
                                                            - (IData)(7U)))))))));
                    }
                    if ((1U < (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__Vstatic__bytes_in_beat))) {
                        __Vtask_tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__24__internal_beat_tkeep 
                            = (2U | (IData)(__Vtask_tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__24__internal_beat_tkeep));
                        __Vtask_tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__24__internal_beat_tdata 
                            = ((0xffffffffffff00ffULL 
                                & __Vtask_tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__24__internal_beat_tdata) 
                               | ((QData)((IData)((0xffU 
                                                   & (((0U 
                                                        == 
                                                        (0x1fU 
                                                         & ((VL_SHIFTL_III(12,32,32, 
                                                                           ((IData)(2U) 
                                                                            + (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__Vstatic__byte_offset)), 3U) 
                                                             - (IData)(1U)) 
                                                            - (IData)(7U))))
                                                        ? 0U
                                                        : 
                                                       (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__tx_packet_data[
                                                        (((IData)(7U) 
                                                          + 
                                                          (0xfffU 
                                                           & ((VL_SHIFTL_III(12,32,32, 
                                                                             ((IData)(2U) 
                                                                              + (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__Vstatic__byte_offset)), 3U) 
                                                               - (IData)(1U)) 
                                                              - (IData)(7U)))) 
                                                         >> 5U)] 
                                                        << 
                                                        ((IData)(0x20U) 
                                                         - 
                                                         (0x1fU 
                                                          & ((VL_SHIFTL_III(12,32,32, 
                                                                            ((IData)(2U) 
                                                                             + (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__Vstatic__byte_offset)), 3U) 
                                                              - (IData)(1U)) 
                                                             - (IData)(7U)))))) 
                                                      | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__tx_packet_data[
                                                         (0x7fU 
                                                          & (((VL_SHIFTL_III(12,32,32, 
                                                                             ((IData)(2U) 
                                                                              + (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__Vstatic__byte_offset)), 3U) 
                                                               - (IData)(1U)) 
                                                              - (IData)(7U)) 
                                                             >> 5U))] 
                                                         >> 
                                                         (0x1fU 
                                                          & ((VL_SHIFTL_III(12,32,32, 
                                                                            ((IData)(2U) 
                                                                             + (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__Vstatic__byte_offset)), 3U) 
                                                              - (IData)(1U)) 
                                                             - (IData)(7U)))))))) 
                                  << 8U));
                    }
                    if ((2U < (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__Vstatic__bytes_in_beat))) {
                        __Vtask_tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__24__internal_beat_tkeep 
                            = (4U | (IData)(__Vtask_tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__24__internal_beat_tkeep));
                        __Vtask_tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__24__internal_beat_tdata 
                            = ((0xffffffffff00ffffULL 
                                & __Vtask_tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__24__internal_beat_tdata) 
                               | ((QData)((IData)((0xffU 
                                                   & (((0U 
                                                        == 
                                                        (0x1fU 
                                                         & ((VL_SHIFTL_III(12,32,32, 
                                                                           ((IData)(3U) 
                                                                            + (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__Vstatic__byte_offset)), 3U) 
                                                             - (IData)(1U)) 
                                                            - (IData)(7U))))
                                                        ? 0U
                                                        : 
                                                       (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__tx_packet_data[
                                                        (((IData)(7U) 
                                                          + 
                                                          (0xfffU 
                                                           & ((VL_SHIFTL_III(12,32,32, 
                                                                             ((IData)(3U) 
                                                                              + (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__Vstatic__byte_offset)), 3U) 
                                                               - (IData)(1U)) 
                                                              - (IData)(7U)))) 
                                                         >> 5U)] 
                                                        << 
                                                        ((IData)(0x20U) 
                                                         - 
                                                         (0x1fU 
                                                          & ((VL_SHIFTL_III(12,32,32, 
                                                                            ((IData)(3U) 
                                                                             + (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__Vstatic__byte_offset)), 3U) 
                                                              - (IData)(1U)) 
                                                             - (IData)(7U)))))) 
                                                      | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__tx_packet_data[
                                                         (0x7fU 
                                                          & (((VL_SHIFTL_III(12,32,32, 
                                                                             ((IData)(3U) 
                                                                              + (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__Vstatic__byte_offset)), 3U) 
                                                               - (IData)(1U)) 
                                                              - (IData)(7U)) 
                                                             >> 5U))] 
                                                         >> 
                                                         (0x1fU 
                                                          & ((VL_SHIFTL_III(12,32,32, 
                                                                            ((IData)(3U) 
                                                                             + (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__Vstatic__byte_offset)), 3U) 
                                                              - (IData)(1U)) 
                                                             - (IData)(7U)))))))) 
                                  << 0x10U));
                    }
                    if ((3U < (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__Vstatic__bytes_in_beat))) {
                        __Vtask_tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__24__internal_beat_tkeep 
                            = (8U | (IData)(__Vtask_tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__24__internal_beat_tkeep));
                        __Vtask_tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__24__internal_beat_tdata 
                            = ((0xffffffff00ffffffULL 
                                & __Vtask_tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__24__internal_beat_tdata) 
                               | ((QData)((IData)((0xffU 
                                                   & (((0U 
                                                        == 
                                                        (0x1fU 
                                                         & ((VL_SHIFTL_III(12,32,32, 
                                                                           ((IData)(4U) 
                                                                            + (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__Vstatic__byte_offset)), 3U) 
                                                             - (IData)(1U)) 
                                                            - (IData)(7U))))
                                                        ? 0U
                                                        : 
                                                       (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__tx_packet_data[
                                                        (((IData)(7U) 
                                                          + 
                                                          (0xfffU 
                                                           & ((VL_SHIFTL_III(12,32,32, 
                                                                             ((IData)(4U) 
                                                                              + (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__Vstatic__byte_offset)), 3U) 
                                                               - (IData)(1U)) 
                                                              - (IData)(7U)))) 
                                                         >> 5U)] 
                                                        << 
                                                        ((IData)(0x20U) 
                                                         - 
                                                         (0x1fU 
                                                          & ((VL_SHIFTL_III(12,32,32, 
                                                                            ((IData)(4U) 
                                                                             + (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__Vstatic__byte_offset)), 3U) 
                                                              - (IData)(1U)) 
                                                             - (IData)(7U)))))) 
                                                      | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__tx_packet_data[
                                                         (0x7fU 
                                                          & (((VL_SHIFTL_III(12,32,32, 
                                                                             ((IData)(4U) 
                                                                              + (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__Vstatic__byte_offset)), 3U) 
                                                               - (IData)(1U)) 
                                                              - (IData)(7U)) 
                                                             >> 5U))] 
                                                         >> 
                                                         (0x1fU 
                                                          & ((VL_SHIFTL_III(12,32,32, 
                                                                            ((IData)(4U) 
                                                                             + (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__Vstatic__byte_offset)), 3U) 
                                                              - (IData)(1U)) 
                                                             - (IData)(7U)))))))) 
                                  << 0x18U));
                    }
                    if ((4U < (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__Vstatic__bytes_in_beat))) {
                        __Vtask_tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__24__internal_beat_tkeep 
                            = (0x10U | (IData)(__Vtask_tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__24__internal_beat_tkeep));
                        __Vtask_tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__24__internal_beat_tdata 
                            = ((0xffffff00ffffffffULL 
                                & __Vtask_tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__24__internal_beat_tdata) 
                               | ((QData)((IData)((0xffU 
                                                   & (((0U 
                                                        == 
                                                        (0x1fU 
                                                         & ((VL_SHIFTL_III(12,32,32, 
                                                                           ((IData)(5U) 
                                                                            + (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__Vstatic__byte_offset)), 3U) 
                                                             - (IData)(1U)) 
                                                            - (IData)(7U))))
                                                        ? 0U
                                                        : 
                                                       (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__tx_packet_data[
                                                        (((IData)(7U) 
                                                          + 
                                                          (0xfffU 
                                                           & ((VL_SHIFTL_III(12,32,32, 
                                                                             ((IData)(5U) 
                                                                              + (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__Vstatic__byte_offset)), 3U) 
                                                               - (IData)(1U)) 
                                                              - (IData)(7U)))) 
                                                         >> 5U)] 
                                                        << 
                                                        ((IData)(0x20U) 
                                                         - 
                                                         (0x1fU 
                                                          & ((VL_SHIFTL_III(12,32,32, 
                                                                            ((IData)(5U) 
                                                                             + (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__Vstatic__byte_offset)), 3U) 
                                                              - (IData)(1U)) 
                                                             - (IData)(7U)))))) 
                                                      | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__tx_packet_data[
                                                         (0x7fU 
                                                          & (((VL_SHIFTL_III(12,32,32, 
                                                                             ((IData)(5U) 
                                                                              + (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__Vstatic__byte_offset)), 3U) 
                                                               - (IData)(1U)) 
                                                              - (IData)(7U)) 
                                                             >> 5U))] 
                                                         >> 
                                                         (0x1fU 
                                                          & ((VL_SHIFTL_III(12,32,32, 
                                                                            ((IData)(5U) 
                                                                             + (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__Vstatic__byte_offset)), 3U) 
                                                              - (IData)(1U)) 
                                                             - (IData)(7U)))))))) 
                                  << 0x20U));
                    }
                    if ((5U < (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__Vstatic__bytes_in_beat))) {
                        __Vtask_tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__24__internal_beat_tkeep 
                            = (0x20U | (IData)(__Vtask_tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__24__internal_beat_tkeep));
                        __Vtask_tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__24__internal_beat_tdata 
                            = ((0xffff00ffffffffffULL 
                                & __Vtask_tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__24__internal_beat_tdata) 
                               | ((QData)((IData)((0xffU 
                                                   & (((0U 
                                                        == 
                                                        (0x1fU 
                                                         & ((VL_SHIFTL_III(12,32,32, 
                                                                           ((IData)(6U) 
                                                                            + (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__Vstatic__byte_offset)), 3U) 
                                                             - (IData)(1U)) 
                                                            - (IData)(7U))))
                                                        ? 0U
                                                        : 
                                                       (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__tx_packet_data[
                                                        (((IData)(7U) 
                                                          + 
                                                          (0xfffU 
                                                           & ((VL_SHIFTL_III(12,32,32, 
                                                                             ((IData)(6U) 
                                                                              + (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__Vstatic__byte_offset)), 3U) 
                                                               - (IData)(1U)) 
                                                              - (IData)(7U)))) 
                                                         >> 5U)] 
                                                        << 
                                                        ((IData)(0x20U) 
                                                         - 
                                                         (0x1fU 
                                                          & ((VL_SHIFTL_III(12,32,32, 
                                                                            ((IData)(6U) 
                                                                             + (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__Vstatic__byte_offset)), 3U) 
                                                              - (IData)(1U)) 
                                                             - (IData)(7U)))))) 
                                                      | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__tx_packet_data[
                                                         (0x7fU 
                                                          & (((VL_SHIFTL_III(12,32,32, 
                                                                             ((IData)(6U) 
                                                                              + (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__Vstatic__byte_offset)), 3U) 
                                                               - (IData)(1U)) 
                                                              - (IData)(7U)) 
                                                             >> 5U))] 
                                                         >> 
                                                         (0x1fU 
                                                          & ((VL_SHIFTL_III(12,32,32, 
                                                                            ((IData)(6U) 
                                                                             + (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__Vstatic__byte_offset)), 3U) 
                                                              - (IData)(1U)) 
                                                             - (IData)(7U)))))))) 
                                  << 0x28U));
                    }
                    if ((6U < (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__Vstatic__bytes_in_beat))) {
                        __Vtask_tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__24__internal_beat_tkeep 
                            = (0x40U | (IData)(__Vtask_tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__24__internal_beat_tkeep));
                        __Vtask_tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__24__internal_beat_tdata 
                            = ((0xff00ffffffffffffULL 
                                & __Vtask_tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__24__internal_beat_tdata) 
                               | ((QData)((IData)((0xffU 
                                                   & (((0U 
                                                        == 
                                                        (0x1fU 
                                                         & ((VL_SHIFTL_III(12,32,32, 
                                                                           ((IData)(7U) 
                                                                            + (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__Vstatic__byte_offset)), 3U) 
                                                             - (IData)(1U)) 
                                                            - (IData)(7U))))
                                                        ? 0U
                                                        : 
                                                       (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__tx_packet_data[
                                                        (((IData)(7U) 
                                                          + 
                                                          (0xfffU 
                                                           & ((VL_SHIFTL_III(12,32,32, 
                                                                             ((IData)(7U) 
                                                                              + (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__Vstatic__byte_offset)), 3U) 
                                                               - (IData)(1U)) 
                                                              - (IData)(7U)))) 
                                                         >> 5U)] 
                                                        << 
                                                        ((IData)(0x20U) 
                                                         - 
                                                         (0x1fU 
                                                          & ((VL_SHIFTL_III(12,32,32, 
                                                                            ((IData)(7U) 
                                                                             + (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__Vstatic__byte_offset)), 3U) 
                                                              - (IData)(1U)) 
                                                             - (IData)(7U)))))) 
                                                      | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__tx_packet_data[
                                                         (0x7fU 
                                                          & (((VL_SHIFTL_III(12,32,32, 
                                                                             ((IData)(7U) 
                                                                              + (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__Vstatic__byte_offset)), 3U) 
                                                               - (IData)(1U)) 
                                                              - (IData)(7U)) 
                                                             >> 5U))] 
                                                         >> 
                                                         (0x1fU 
                                                          & ((VL_SHIFTL_III(12,32,32, 
                                                                            ((IData)(7U) 
                                                                             + (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__Vstatic__byte_offset)), 3U) 
                                                              - (IData)(1U)) 
                                                             - (IData)(7U)))))))) 
                                  << 0x30U));
                    }
                    if ((7U < (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__Vstatic__bytes_in_beat))) {
                        __Vtask_tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__24__internal_beat_tkeep 
                            = (0x80U | (IData)(__Vtask_tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__24__internal_beat_tkeep));
                        __Vtask_tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__24__internal_beat_tdata 
                            = ((0xffffffffffffffULL 
                                & __Vtask_tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__24__internal_beat_tdata) 
                               | ((QData)((IData)((0xffU 
                                                   & (((0U 
                                                        == 
                                                        (0x1fU 
                                                         & ((VL_SHIFTL_III(12,32,32, 
                                                                           ((IData)(8U) 
                                                                            + (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__Vstatic__byte_offset)), 3U) 
                                                             - (IData)(1U)) 
                                                            - (IData)(7U))))
                                                        ? 0U
                                                        : 
                                                       (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__tx_packet_data[
                                                        (((IData)(7U) 
                                                          + 
                                                          (0xfffU 
                                                           & ((VL_SHIFTL_III(12,32,32, 
                                                                             ((IData)(8U) 
                                                                              + (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__Vstatic__byte_offset)), 3U) 
                                                               - (IData)(1U)) 
                                                              - (IData)(7U)))) 
                                                         >> 5U)] 
                                                        << 
                                                        ((IData)(0x20U) 
                                                         - 
                                                         (0x1fU 
                                                          & ((VL_SHIFTL_III(12,32,32, 
                                                                            ((IData)(8U) 
                                                                             + (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__Vstatic__byte_offset)), 3U) 
                                                              - (IData)(1U)) 
                                                             - (IData)(7U)))))) 
                                                      | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__tx_packet_data[
                                                         (0x7fU 
                                                          & (((VL_SHIFTL_III(12,32,32, 
                                                                             ((IData)(8U) 
                                                                              + (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__Vstatic__byte_offset)), 3U) 
                                                               - (IData)(1U)) 
                                                              - (IData)(7U)) 
                                                             >> 5U))] 
                                                         >> 
                                                         (0x1fU 
                                                          & ((VL_SHIFTL_III(12,32,32, 
                                                                            ((IData)(8U) 
                                                                             + (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__Vstatic__byte_offset)), 3U) 
                                                              - (IData)(1U)) 
                                                             - (IData)(7U)))))))) 
                                  << 0x38U));
                    }
                    vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__beat_tdata 
                        = __Vtask_tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__24__internal_beat_tdata;
                    vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__beat_tkeep 
                        = __Vtask_tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__24__internal_beat_tkeep;
                    vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__beat_tuser 
                        = __Vtask_tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__24__internal_beat_tuser;
                    vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__internal_tdata 
                        = vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__beat_tdata;
                    vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__internal_tkeep 
                        = vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__beat_tkeep;
                    vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__internal_tuser 
                        = vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__beat_tuser;
                    __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__tx_beat_count 
                        = (0xffffU & ((IData)(1U) + (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__tx_beat_count)));
                    if (((IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__tx_beat_count) 
                         == ((IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__tx_total_beats) 
                             - (IData)(1U)))) {
                        vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__internal_tlast = 1U;
                        __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__internal_tx_state = 0U;
                        __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__tx_packet_valid = 0U;
                        __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__tx_packet_valid = 1U;
                    }
                }
            }
        } else {
            __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__internal_tx_state = 0U;
        }
    } else {
        __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__internal_tx_state = 0U;
        __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__internal_tvalid = 0U;
        vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__internal_tdata = 0ULL;
        vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__internal_tkeep = 0U;
        vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__internal_tuser = 0ULL;
        vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__internal_tlast = 0U;
        __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__tx_packet_valid = 0U;
        __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__tx_packet_valid = 1U;
        __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__tx_beat_count = 0U;
        __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__tx_total_beats = 0U;
    }
    if (vlSelfRef.tb_ingress_queue_manager__DOT__rst_n) {
        if ((0U == (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__axis_rx_state))) {
            if (((vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[4U] 
                  >> 9U) & (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__axis_tready))) {
                vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__i = 8U;
                vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_in_assembly = 1U;
                VL_ASSIGN_W(4096,__Vdly__tb_ingress_queue_manager__DOT__dut__DOT__current_packet_buffer, Vtb_ingress_queue_manager__ConstPool__CONST_h6e0f3f36_0);
                __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__current_header 
                    = (((QData)((IData)(vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[2U])) 
                        << 0x3fU) | (((QData)((IData)(
                                                      vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[1U])) 
                                      << 0x1fU) | ((QData)((IData)(
                                                                   vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[0U])) 
                                                   >> 1U)));
                __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__axis_rx_state 
                    = ((1U & vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[0U])
                        ? 2U : 1U);
                if (((vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[2U] 
                      >> 1U) & (0x200U > (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__current_packet_size)))) {
                    VL_ASSIGNSEL_WI(4096,8,(0xfffU 
                                            & ((VL_SHIFTL_III(12,32,32, 
                                                              ((IData)(1U) 
                                                               + (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__current_packet_size)), 3U) 
                                                - (IData)(1U)) 
                                               - (IData)(7U))), __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__current_packet_buffer, 
                                    (0xffU & (vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[2U] 
                                              >> 9U)));
                }
                if (((vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[2U] 
                      >> 2U) & (0x200U > ((IData)(1U) 
                                          + (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__current_packet_size))))) {
                    VL_ASSIGNSEL_WI(4096,8,(0xfffU 
                                            & ((VL_SHIFTL_III(12,32,32, 
                                                              ((IData)(2U) 
                                                               + (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__current_packet_size)), 3U) 
                                                - (IData)(1U)) 
                                               - (IData)(7U))), __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__current_packet_buffer, 
                                    (0xffU & (vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[2U] 
                                              >> 0x11U)));
                }
                if (((vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[2U] 
                      >> 3U) & (0x200U > ((IData)(2U) 
                                          + (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__current_packet_size))))) {
                    VL_ASSIGNSEL_WI(4096,8,(0xfffU 
                                            & ((VL_SHIFTL_III(12,32,32, 
                                                              ((IData)(3U) 
                                                               + (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__current_packet_size)), 3U) 
                                                - (IData)(1U)) 
                                               - (IData)(7U))), __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__current_packet_buffer, 
                                    (0xffU & ((vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[3U] 
                                               << 7U) 
                                              | (vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[2U] 
                                                 >> 0x19U))));
                }
                if (((vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[2U] 
                      >> 4U) & (0x200U > ((IData)(3U) 
                                          + (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__current_packet_size))))) {
                    VL_ASSIGNSEL_WI(4096,8,(0xfffU 
                                            & ((VL_SHIFTL_III(12,32,32, 
                                                              ((IData)(4U) 
                                                               + (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__current_packet_size)), 3U) 
                                                - (IData)(1U)) 
                                               - (IData)(7U))), __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__current_packet_buffer, 
                                    (0xffU & (vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[3U] 
                                              >> 1U)));
                }
                if (((vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[2U] 
                      >> 5U) & (0x200U > ((IData)(4U) 
                                          + (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__current_packet_size))))) {
                    VL_ASSIGNSEL_WI(4096,8,(0xfffU 
                                            & ((VL_SHIFTL_III(12,32,32, 
                                                              ((IData)(5U) 
                                                               + (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__current_packet_size)), 3U) 
                                                - (IData)(1U)) 
                                               - (IData)(7U))), __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__current_packet_buffer, 
                                    (0xffU & (vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[3U] 
                                              >> 9U)));
                }
                if (((vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[2U] 
                      >> 6U) & (0x200U > ((IData)(5U) 
                                          + (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__current_packet_size))))) {
                    VL_ASSIGNSEL_WI(4096,8,(0xfffU 
                                            & ((VL_SHIFTL_III(12,32,32, 
                                                              ((IData)(6U) 
                                                               + (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__current_packet_size)), 3U) 
                                                - (IData)(1U)) 
                                               - (IData)(7U))), __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__current_packet_buffer, 
                                    (0xffU & (vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[3U] 
                                              >> 0x11U)));
                }
                if (((vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[2U] 
                      >> 7U) & (0x200U > ((IData)(6U) 
                                          + (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__current_packet_size))))) {
                    VL_ASSIGNSEL_WI(4096,8,(0xfffU 
                                            & ((VL_SHIFTL_III(12,32,32, 
                                                              ((IData)(7U) 
                                                               + (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__current_packet_size)), 3U) 
                                                - (IData)(1U)) 
                                               - (IData)(7U))), __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__current_packet_buffer, 
                                    (0xffU & ((vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[4U] 
                                               << 7U) 
                                              | (vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[3U] 
                                                 >> 0x19U))));
                }
                if (((vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[2U] 
                      >> 8U) & (0x200U > ((IData)(7U) 
                                          + (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__current_packet_size))))) {
                    VL_ASSIGNSEL_WI(4096,8,(0xfffU 
                                            & ((VL_SHIFTL_III(12,32,32, 
                                                              ((IData)(8U) 
                                                               + (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__current_packet_size)), 3U) 
                                                - (IData)(1U)) 
                                               - (IData)(7U))), __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__current_packet_buffer, 
                                    (0xffU & (vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[4U] 
                                              >> 1U)));
                }
                __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__current_packet_size = 0U;
                __Vfunc_tb_ingress_queue_manager__DOT__dut__DOT__count_keep_bits__18__keep 
                    = (0xffU & (vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[2U] 
                                >> 1U));
                __Vfunc_tb_ingress_queue_manager__DOT__dut__DOT__count_keep_bits__18__Vfuncout = 0U;
                if ((1U & (IData)(__Vfunc_tb_ingress_queue_manager__DOT__dut__DOT__count_keep_bits__18__keep))) {
                    __Vfunc_tb_ingress_queue_manager__DOT__dut__DOT__count_keep_bits__18__Vfuncout 
                        = (0xffffU & ((IData)(1U) + (IData)(__Vfunc_tb_ingress_queue_manager__DOT__dut__DOT__count_keep_bits__18__Vfuncout)));
                }
                if ((2U & (IData)(__Vfunc_tb_ingress_queue_manager__DOT__dut__DOT__count_keep_bits__18__keep))) {
                    __Vfunc_tb_ingress_queue_manager__DOT__dut__DOT__count_keep_bits__18__Vfuncout 
                        = (0xffffU & ((IData)(1U) + (IData)(__Vfunc_tb_ingress_queue_manager__DOT__dut__DOT__count_keep_bits__18__Vfuncout)));
                }
                if ((4U & (IData)(__Vfunc_tb_ingress_queue_manager__DOT__dut__DOT__count_keep_bits__18__keep))) {
                    __Vfunc_tb_ingress_queue_manager__DOT__dut__DOT__count_keep_bits__18__Vfuncout 
                        = (0xffffU & ((IData)(1U) + (IData)(__Vfunc_tb_ingress_queue_manager__DOT__dut__DOT__count_keep_bits__18__Vfuncout)));
                }
                if ((8U & (IData)(__Vfunc_tb_ingress_queue_manager__DOT__dut__DOT__count_keep_bits__18__keep))) {
                    __Vfunc_tb_ingress_queue_manager__DOT__dut__DOT__count_keep_bits__18__Vfuncout 
                        = (0xffffU & ((IData)(1U) + (IData)(__Vfunc_tb_ingress_queue_manager__DOT__dut__DOT__count_keep_bits__18__Vfuncout)));
                }
                if ((0x10U & (IData)(__Vfunc_tb_ingress_queue_manager__DOT__dut__DOT__count_keep_bits__18__keep))) {
                    __Vfunc_tb_ingress_queue_manager__DOT__dut__DOT__count_keep_bits__18__Vfuncout 
                        = (0xffffU & ((IData)(1U) + (IData)(__Vfunc_tb_ingress_queue_manager__DOT__dut__DOT__count_keep_bits__18__Vfuncout)));
                }
                if ((0x20U & (IData)(__Vfunc_tb_ingress_queue_manager__DOT__dut__DOT__count_keep_bits__18__keep))) {
                    __Vfunc_tb_ingress_queue_manager__DOT__dut__DOT__count_keep_bits__18__Vfuncout 
                        = (0xffffU & ((IData)(1U) + (IData)(__Vfunc_tb_ingress_queue_manager__DOT__dut__DOT__count_keep_bits__18__Vfuncout)));
                }
                if ((0x40U & (IData)(__Vfunc_tb_ingress_queue_manager__DOT__dut__DOT__count_keep_bits__18__keep))) {
                    __Vfunc_tb_ingress_queue_manager__DOT__dut__DOT__count_keep_bits__18__Vfuncout 
                        = (0xffffU & ((IData)(1U) + (IData)(__Vfunc_tb_ingress_queue_manager__DOT__dut__DOT__count_keep_bits__18__Vfuncout)));
                }
                if ((0x80U & (IData)(__Vfunc_tb_ingress_queue_manager__DOT__dut__DOT__count_keep_bits__18__keep))) {
                    __Vfunc_tb_ingress_queue_manager__DOT__dut__DOT__count_keep_bits__18__Vfuncout 
                        = (0xffffU & ((IData)(1U) + (IData)(__Vfunc_tb_ingress_queue_manager__DOT__dut__DOT__count_keep_bits__18__Vfuncout)));
                }
                __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__current_packet_size 
                    = __Vfunc_tb_ingress_queue_manager__DOT__dut__DOT__count_keep_bits__18__Vfuncout;
            }
            __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__axis_tready = 1U;
        } else if ((1U == (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__axis_rx_state))) {
            if (((vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[4U] 
                  >> 9U) & (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__axis_tready))) {
                vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__i = 8U;
                if (((vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[2U] 
                      >> 1U) & (0x200U > (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__current_packet_size)))) {
                    VL_ASSIGNSEL_WI(4096,8,(0xfffU 
                                            & ((VL_SHIFTL_III(12,32,32, 
                                                              ((IData)(1U) 
                                                               + (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__current_packet_size)), 3U) 
                                                - (IData)(1U)) 
                                               - (IData)(7U))), __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__current_packet_buffer, 
                                    (0xffU & (vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[2U] 
                                              >> 9U)));
                }
                if ((1U & vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[0U])) {
                    __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__axis_rx_state = 2U;
                }
                if (((vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[2U] 
                      >> 2U) & (0x200U > ((IData)(1U) 
                                          + (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__current_packet_size))))) {
                    VL_ASSIGNSEL_WI(4096,8,(0xfffU 
                                            & ((VL_SHIFTL_III(12,32,32, 
                                                              ((IData)(2U) 
                                                               + (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__current_packet_size)), 3U) 
                                                - (IData)(1U)) 
                                               - (IData)(7U))), __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__current_packet_buffer, 
                                    (0xffU & (vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[2U] 
                                              >> 0x11U)));
                }
                if (((vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[2U] 
                      >> 3U) & (0x200U > ((IData)(2U) 
                                          + (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__current_packet_size))))) {
                    VL_ASSIGNSEL_WI(4096,8,(0xfffU 
                                            & ((VL_SHIFTL_III(12,32,32, 
                                                              ((IData)(3U) 
                                                               + (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__current_packet_size)), 3U) 
                                                - (IData)(1U)) 
                                               - (IData)(7U))), __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__current_packet_buffer, 
                                    (0xffU & ((vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[3U] 
                                               << 7U) 
                                              | (vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[2U] 
                                                 >> 0x19U))));
                }
                if (((vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[2U] 
                      >> 4U) & (0x200U > ((IData)(3U) 
                                          + (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__current_packet_size))))) {
                    VL_ASSIGNSEL_WI(4096,8,(0xfffU 
                                            & ((VL_SHIFTL_III(12,32,32, 
                                                              ((IData)(4U) 
                                                               + (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__current_packet_size)), 3U) 
                                                - (IData)(1U)) 
                                               - (IData)(7U))), __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__current_packet_buffer, 
                                    (0xffU & (vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[3U] 
                                              >> 1U)));
                }
                if (((vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[2U] 
                      >> 5U) & (0x200U > ((IData)(4U) 
                                          + (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__current_packet_size))))) {
                    VL_ASSIGNSEL_WI(4096,8,(0xfffU 
                                            & ((VL_SHIFTL_III(12,32,32, 
                                                              ((IData)(5U) 
                                                               + (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__current_packet_size)), 3U) 
                                                - (IData)(1U)) 
                                               - (IData)(7U))), __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__current_packet_buffer, 
                                    (0xffU & (vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[3U] 
                                              >> 9U)));
                }
                if (((vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[2U] 
                      >> 6U) & (0x200U > ((IData)(5U) 
                                          + (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__current_packet_size))))) {
                    VL_ASSIGNSEL_WI(4096,8,(0xfffU 
                                            & ((VL_SHIFTL_III(12,32,32, 
                                                              ((IData)(6U) 
                                                               + (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__current_packet_size)), 3U) 
                                                - (IData)(1U)) 
                                               - (IData)(7U))), __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__current_packet_buffer, 
                                    (0xffU & (vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[3U] 
                                              >> 0x11U)));
                }
                if (((vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[2U] 
                      >> 7U) & (0x200U > ((IData)(6U) 
                                          + (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__current_packet_size))))) {
                    VL_ASSIGNSEL_WI(4096,8,(0xfffU 
                                            & ((VL_SHIFTL_III(12,32,32, 
                                                              ((IData)(7U) 
                                                               + (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__current_packet_size)), 3U) 
                                                - (IData)(1U)) 
                                               - (IData)(7U))), __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__current_packet_buffer, 
                                    (0xffU & ((vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[4U] 
                                               << 7U) 
                                              | (vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[3U] 
                                                 >> 0x19U))));
                }
                if (((vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[2U] 
                      >> 8U) & (0x200U > ((IData)(7U) 
                                          + (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__current_packet_size))))) {
                    VL_ASSIGNSEL_WI(4096,8,(0xfffU 
                                            & ((VL_SHIFTL_III(12,32,32, 
                                                              ((IData)(8U) 
                                                               + (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__current_packet_size)), 3U) 
                                                - (IData)(1U)) 
                                               - (IData)(7U))), __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__current_packet_buffer, 
                                    (0xffU & (vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[4U] 
                                              >> 1U)));
                }
                __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__current_packet_size 
                    = (0xffffU & ((IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__current_packet_size) 
                                  + ([&]() {
                                __Vfunc_tb_ingress_queue_manager__DOT__dut__DOT__count_keep_bits__19__keep 
                                    = (0xffU & (vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[2U] 
                                                >> 1U));
                                __Vfunc_tb_ingress_queue_manager__DOT__dut__DOT__count_keep_bits__19__Vfuncout = 0U;
                                if ((1U & (IData)(__Vfunc_tb_ingress_queue_manager__DOT__dut__DOT__count_keep_bits__19__keep))) {
                                    __Vfunc_tb_ingress_queue_manager__DOT__dut__DOT__count_keep_bits__19__Vfuncout 
                                        = (0xffffU 
                                           & ((IData)(1U) 
                                              + (IData)(__Vfunc_tb_ingress_queue_manager__DOT__dut__DOT__count_keep_bits__19__Vfuncout)));
                                }
                                if ((2U & (IData)(__Vfunc_tb_ingress_queue_manager__DOT__dut__DOT__count_keep_bits__19__keep))) {
                                    __Vfunc_tb_ingress_queue_manager__DOT__dut__DOT__count_keep_bits__19__Vfuncout 
                                        = (0xffffU 
                                           & ((IData)(1U) 
                                              + (IData)(__Vfunc_tb_ingress_queue_manager__DOT__dut__DOT__count_keep_bits__19__Vfuncout)));
                                }
                                if ((4U & (IData)(__Vfunc_tb_ingress_queue_manager__DOT__dut__DOT__count_keep_bits__19__keep))) {
                                    __Vfunc_tb_ingress_queue_manager__DOT__dut__DOT__count_keep_bits__19__Vfuncout 
                                        = (0xffffU 
                                           & ((IData)(1U) 
                                              + (IData)(__Vfunc_tb_ingress_queue_manager__DOT__dut__DOT__count_keep_bits__19__Vfuncout)));
                                }
                                if ((8U & (IData)(__Vfunc_tb_ingress_queue_manager__DOT__dut__DOT__count_keep_bits__19__keep))) {
                                    __Vfunc_tb_ingress_queue_manager__DOT__dut__DOT__count_keep_bits__19__Vfuncout 
                                        = (0xffffU 
                                           & ((IData)(1U) 
                                              + (IData)(__Vfunc_tb_ingress_queue_manager__DOT__dut__DOT__count_keep_bits__19__Vfuncout)));
                                }
                                if ((0x10U & (IData)(__Vfunc_tb_ingress_queue_manager__DOT__dut__DOT__count_keep_bits__19__keep))) {
                                    __Vfunc_tb_ingress_queue_manager__DOT__dut__DOT__count_keep_bits__19__Vfuncout 
                                        = (0xffffU 
                                           & ((IData)(1U) 
                                              + (IData)(__Vfunc_tb_ingress_queue_manager__DOT__dut__DOT__count_keep_bits__19__Vfuncout)));
                                }
                                if ((0x20U & (IData)(__Vfunc_tb_ingress_queue_manager__DOT__dut__DOT__count_keep_bits__19__keep))) {
                                    __Vfunc_tb_ingress_queue_manager__DOT__dut__DOT__count_keep_bits__19__Vfuncout 
                                        = (0xffffU 
                                           & ((IData)(1U) 
                                              + (IData)(__Vfunc_tb_ingress_queue_manager__DOT__dut__DOT__count_keep_bits__19__Vfuncout)));
                                }
                                if ((0x40U & (IData)(__Vfunc_tb_ingress_queue_manager__DOT__dut__DOT__count_keep_bits__19__keep))) {
                                    __Vfunc_tb_ingress_queue_manager__DOT__dut__DOT__count_keep_bits__19__Vfuncout 
                                        = (0xffffU 
                                           & ((IData)(1U) 
                                              + (IData)(__Vfunc_tb_ingress_queue_manager__DOT__dut__DOT__count_keep_bits__19__Vfuncout)));
                                }
                                if ((0x80U & (IData)(__Vfunc_tb_ingress_queue_manager__DOT__dut__DOT__count_keep_bits__19__keep))) {
                                    __Vfunc_tb_ingress_queue_manager__DOT__dut__DOT__count_keep_bits__19__Vfuncout 
                                        = (0xffffU 
                                           & ((IData)(1U) 
                                              + (IData)(__Vfunc_tb_ingress_queue_manager__DOT__dut__DOT__count_keep_bits__19__Vfuncout)));
                                }
                            }(), (IData)(__Vfunc_tb_ingress_queue_manager__DOT__dut__DOT__count_keep_bits__19__Vfuncout))));
            }
        } else if ((2U == (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__axis_rx_state))) {
            vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__process_received_packet__Vstatic__global_dest_port 
                = (0xfffU & (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__current_header));
            vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__process_received_packet__Vstatic__queue_id 
                = (0xfU & (IData)((vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__current_header 
                                   >> 0x10U)));
            vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__process_received_packet__Vstatic__local_dest_port 
                = (0xffU & (((0U == (0x1fU & VL_SHIFTL_III(15,32,32, (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__process_received_packet__Vstatic__global_dest_port), 3U)))
                              ? 0U : (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__global_to_local_lookup[
                                      (((IData)(7U) 
                                        + (0x7fffU 
                                           & VL_SHIFTL_III(15,32,32, (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__process_received_packet__Vstatic__global_dest_port), 3U))) 
                                       >> 5U)] << ((IData)(0x20U) 
                                                   - 
                                                   (0x1fU 
                                                    & VL_SHIFTL_III(15,32,32, (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__process_received_packet__Vstatic__global_dest_port), 3U))))) 
                            | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__global_to_local_lookup[
                               (0x3ffU & (VL_SHIFTL_III(15,32,32, (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__process_received_packet__Vstatic__global_dest_port), 3U) 
                                          >> 5U))] 
                               >> (0x1fU & VL_SHIFTL_III(15,32,32, (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__process_received_packet__Vstatic__global_dest_port), 3U)))));
            vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_in_assembly = 0U;
            __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__axis_rx_state = 0U;
            if ((8U <= (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__process_received_packet__Vstatic__queue_id))) {
                vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__process_received_packet__Vstatic__queue_id = 0U;
            }
            if ((0x100U > ((0x47U >= (0x7fU & ((IData)(9U) 
                                               * (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__process_received_packet__Vstatic__queue_id))))
                            ? (0x1ffU & (((0U == (0x1fU 
                                                  & ((IData)(9U) 
                                                     * (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__process_received_packet__Vstatic__queue_id))))
                                           ? 0U : (
                                                   vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__queue_count[
                                                   (((IData)(8U) 
                                                     + 
                                                     (0x7fU 
                                                      & ((IData)(9U) 
                                                         * (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__process_received_packet__Vstatic__queue_id)))) 
                                                    >> 5U)] 
                                                   << 
                                                   ((IData)(0x20U) 
                                                    - 
                                                    (0x1fU 
                                                     & ((IData)(9U) 
                                                        * (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__process_received_packet__Vstatic__queue_id)))))) 
                                         | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__queue_count[
                                            (3U & (
                                                   ((IData)(9U) 
                                                    * (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__process_received_packet__Vstatic__queue_id)) 
                                                   >> 5U))] 
                                            >> (0x1fU 
                                                & ((IData)(9U) 
                                                   * (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__process_received_packet__Vstatic__queue_id))))))
                            : 0U))) {
                __Vtask_tb_ingress_queue_manager__DOT__dut__DOT__enqueue_packet__21__packet_header 
                    = vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__current_header;
                __Vtask_tb_ingress_queue_manager__DOT__dut__DOT__enqueue_packet__21__packet_size 
                    = vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__current_packet_size;
                vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__total_packets_processed 
                    = (1ULL + vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__total_packets_processed);
                VL_ASSIGN_W(4096,__Vtask_tb_ingress_queue_manager__DOT__dut__DOT__enqueue_packet__21__packet_data, vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__current_packet_buffer);
                __Vtask_tb_ingress_queue_manager__DOT__dut__DOT__enqueue_packet__21__queue_id 
                    = vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__process_received_packet__Vstatic__queue_id;
                vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__enqueue_packet__Vstatic__tail_idx 
                    = (0xffU & (IData)((vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__queue_tail 
                                        >> (0x3fU & 
                                            VL_SHIFTL_III(6,32,32, (IData)(__Vtask_tb_ingress_queue_manager__DOT__dut__DOT__enqueue_packet__21__queue_id), 3U)))));
                VL_ASSIGNSEL_WW(8388608,4096,(0x7fffffU 
                                              & (VL_SHIFTL_III(23,32,32, (IData)(__Vtask_tb_ingress_queue_manager__DOT__dut__DOT__enqueue_packet__21__queue_id), 0x14U) 
                                                 + 
                                                 (0xfffffU 
                                                  & VL_SHIFTL_III(20,32,32, (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__enqueue_packet__Vstatic__tail_idx), 0xcU)))), vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_data, __Vtask_tb_ingress_queue_manager__DOT__dut__DOT__enqueue_packet__21__packet_data);
                VL_ASSIGNSEL_WI(32768,16,(0x7fffU & 
                                          (VL_SHIFTL_III(15,32,32, (IData)(__Vtask_tb_ingress_queue_manager__DOT__dut__DOT__enqueue_packet__21__queue_id), 0xcU) 
                                           + (0xfffU 
                                              & VL_SHIFTL_III(12,32,32, (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__enqueue_packet__Vstatic__tail_idx), 4U)))), vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_size, __Vtask_tb_ingress_queue_manager__DOT__dut__DOT__enqueue_packet__21__packet_size);
                VL_ASSIGNSEL_WQ(131072,64,(0x1ffffU 
                                           & (VL_SHIFTL_III(17,32,32, (IData)(__Vtask_tb_ingress_queue_manager__DOT__dut__DOT__enqueue_packet__21__queue_id), 0xeU) 
                                              + (0x3fffU 
                                                 & VL_SHIFTL_III(14,32,32, (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__enqueue_packet__Vstatic__tail_idx), 6U)))), vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_header, __Vtask_tb_ingress_queue_manager__DOT__dut__DOT__enqueue_packet__21__packet_header);
                vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[(0x3fU 
                                                                                & ((VL_SHIFTL_III(11,32,32, (IData)(__Vtask_tb_ingress_queue_manager__DOT__dut__DOT__enqueue_packet__21__queue_id), 8U) 
                                                                                + (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__enqueue_packet__Vstatic__tail_idx)) 
                                                                                >> 5U))] 
                    = (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[
                       (0x3fU & ((VL_SHIFTL_III(11,32,32, (IData)(__Vtask_tb_ingress_queue_manager__DOT__dut__DOT__enqueue_packet__21__queue_id), 8U) 
                                  + (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__enqueue_packet__Vstatic__tail_idx)) 
                                 >> 5U))] | ((IData)(1U) 
                                             << (0x1fU 
                                                 & (VL_SHIFTL_III(11,32,32, (IData)(__Vtask_tb_ingress_queue_manager__DOT__dut__DOT__enqueue_packet__21__queue_id), 8U) 
                                                    + (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__enqueue_packet__Vstatic__tail_idx)))));
                vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__queue_tail 
                    = (((~ (0xffULL << (0x3fU & VL_SHIFTL_III(6,32,32, (IData)(__Vtask_tb_ingress_queue_manager__DOT__dut__DOT__enqueue_packet__21__queue_id), 3U)))) 
                        & vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__queue_tail) 
                       | ((QData)((IData)((0xffU & 
                                           ((IData)(1U) 
                                            + (IData)(
                                                      (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__queue_tail 
                                                       >> 
                                                       (0x3fU 
                                                        & VL_SHIFTL_III(6,32,32, (IData)(__Vtask_tb_ingress_queue_manager__DOT__dut__DOT__enqueue_packet__21__queue_id), 3U)))))))) 
                          << (0x3fU & VL_SHIFTL_III(6,32,32, (IData)(__Vtask_tb_ingress_queue_manager__DOT__dut__DOT__enqueue_packet__21__queue_id), 3U))));
                vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT____Vlvbound_h3c135dfb__0 
                    = (0x1ffU & ((IData)(1U) + ((0x47U 
                                                 >= 
                                                 (0x7fU 
                                                  & ((IData)(9U) 
                                                     * (IData)(__Vtask_tb_ingress_queue_manager__DOT__dut__DOT__enqueue_packet__21__queue_id))))
                                                 ? 
                                                (((0U 
                                                   == 
                                                   (0x1fU 
                                                    & ((IData)(9U) 
                                                       * (IData)(__Vtask_tb_ingress_queue_manager__DOT__dut__DOT__enqueue_packet__21__queue_id))))
                                                   ? 0U
                                                   : 
                                                  (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__queue_count[
                                                   (((IData)(8U) 
                                                     + 
                                                     (0x7fU 
                                                      & ((IData)(9U) 
                                                         * (IData)(__Vtask_tb_ingress_queue_manager__DOT__dut__DOT__enqueue_packet__21__queue_id)))) 
                                                    >> 5U)] 
                                                   << 
                                                   ((IData)(0x20U) 
                                                    - 
                                                    (0x1fU 
                                                     & ((IData)(9U) 
                                                        * (IData)(__Vtask_tb_ingress_queue_manager__DOT__dut__DOT__enqueue_packet__21__queue_id)))))) 
                                                 | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__queue_count[
                                                    (3U 
                                                     & (((IData)(9U) 
                                                         * (IData)(__Vtask_tb_ingress_queue_manager__DOT__dut__DOT__enqueue_packet__21__queue_id)) 
                                                        >> 5U))] 
                                                    >> 
                                                    (0x1fU 
                                                     & ((IData)(9U) 
                                                        * (IData)(__Vtask_tb_ingress_queue_manager__DOT__dut__DOT__enqueue_packet__21__queue_id)))))
                                                 : 0U)));
                if ((0x47U >= (0x7fU & ((IData)(9U) 
                                        * (IData)(__Vtask_tb_ingress_queue_manager__DOT__dut__DOT__enqueue_packet__21__queue_id))))) {
                    VL_ASSIGNSEL_WI(72,9,(0x7fU & ((IData)(9U) 
                                                   * (IData)(__Vtask_tb_ingress_queue_manager__DOT__dut__DOT__enqueue_packet__21__queue_id))), vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__queue_count, vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT____Vlvbound_h3c135dfb__0);
                }
            }
        } else {
            __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__axis_rx_state = 0U;
        }
    } else {
        __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__axis_rx_state = 0U;
        __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__axis_tready = 1U;
        vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_in_assembly = 0U;
        __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__current_packet_size = 0U;
        VL_ASSIGN_W(4096,__Vdly__tb_ingress_queue_manager__DOT__dut__DOT__current_packet_buffer, Vtb_ingress_queue_manager__ConstPool__CONST_h6e0f3f36_0);
        __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__current_header = 0ULL;
    }
    if (vlSelfRef.tb_ingress_queue_manager__DOT__rst_n) {
        if ((1U & (~ (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__lookup_table_initialized)))) {
            vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__i = 0U;
            while (VL_GTS_III(32, 0x1000U, vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__i)) {
                VL_ASSIGNSEL_WI(32768,8,(0x7fffU & 
                                         VL_SHIFTL_III(15,32,32, vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__i, 3U)), vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__global_to_local_lookup, 
                                (VL_GTS_III(32, 8U, vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__i)
                                  ? (0xffU & vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__i)
                                  : 0U));
                vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__i 
                    = ((IData)(1U) + vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__i);
            }
            vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__lookup_table_initialized = 1U;
        }
        vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__i = 0U;
        {
            while (VL_GTS_III(32, 8U, vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__i)) {
                if (((0U < ((0x47U >= (0x7fU & ((IData)(9U) 
                                                * vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__i)))
                             ? (0x1ffU & (((0U == (0x1fU 
                                                   & ((IData)(9U) 
                                                      * vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__i)))
                                            ? 0U : 
                                           (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__queue_count[
                                            (((IData)(8U) 
                                              + (0x7fU 
                                                 & ((IData)(9U) 
                                                    * vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__i))) 
                                             >> 5U)] 
                                            << ((IData)(0x20U) 
                                                - (0x1fU 
                                                   & ((IData)(9U) 
                                                      * vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__i))))) 
                                          | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__queue_count[
                                             (3U & 
                                              (((IData)(9U) 
                                                * vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__i) 
                                               >> 5U))] 
                                             >> (0x1fU 
                                                 & ((IData)(9U) 
                                                    * vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__i)))))
                             : 0U)) & (~ (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__tx_packet_valid)))) {
                    __Vtask_tb_ingress_queue_manager__DOT__dut__DOT__dequeue_packet__23__queue_id 
                        = (0xffU & vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__i);
                    vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__dequeue_packet__Vstatic__head_idx 
                        = (0xffU & (IData)((vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__queue_head 
                                            >> (0x3fU 
                                                & VL_SHIFTL_III(6,32,32, (IData)(__Vtask_tb_ingress_queue_manager__DOT__dut__DOT__dequeue_packet__23__queue_id), 3U)))));
                    VL_SEL_WWII(4096, 8388608, vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__tx_packet_data, vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_data, 
                                (0x7fffffU & (VL_SHIFTL_III(23,32,32, (IData)(__Vtask_tb_ingress_queue_manager__DOT__dut__DOT__dequeue_packet__23__queue_id), 0x14U) 
                                              + (0xfffffU 
                                                 & VL_SHIFTL_III(20,32,32, (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__dequeue_packet__Vstatic__head_idx), 0xcU)))), 4096);
                    vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__tx_packet_size 
                        = (0xffffU & (((0U == (0x1fU 
                                               & (VL_SHIFTL_III(15,32,32, (IData)(__Vtask_tb_ingress_queue_manager__DOT__dut__DOT__dequeue_packet__23__queue_id), 0xcU) 
                                                  + 
                                                  (0xfffU 
                                                   & VL_SHIFTL_III(12,32,32, (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__dequeue_packet__Vstatic__head_idx), 4U)))))
                                        ? 0U : (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_size[
                                                (((IData)(0xfU) 
                                                  + 
                                                  (0x7fffU 
                                                   & (VL_SHIFTL_III(15,32,32, (IData)(__Vtask_tb_ingress_queue_manager__DOT__dut__DOT__dequeue_packet__23__queue_id), 0xcU) 
                                                      + 
                                                      (0xfffU 
                                                       & VL_SHIFTL_III(12,32,32, (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__dequeue_packet__Vstatic__head_idx), 4U))))) 
                                                 >> 5U)] 
                                                << 
                                                ((IData)(0x20U) 
                                                 - 
                                                 (0x1fU 
                                                  & (VL_SHIFTL_III(15,32,32, (IData)(__Vtask_tb_ingress_queue_manager__DOT__dut__DOT__dequeue_packet__23__queue_id), 0xcU) 
                                                     + 
                                                     (0xfffU 
                                                      & VL_SHIFTL_III(12,32,32, (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__dequeue_packet__Vstatic__head_idx), 4U))))))) 
                                      | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_size[
                                         (0x3ffU & 
                                          ((VL_SHIFTL_III(15,32,32, (IData)(__Vtask_tb_ingress_queue_manager__DOT__dut__DOT__dequeue_packet__23__queue_id), 0xcU) 
                                            + (0xfffU 
                                               & VL_SHIFTL_III(12,32,32, (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__dequeue_packet__Vstatic__head_idx), 4U))) 
                                           >> 5U))] 
                                         >> (0x1fU 
                                             & (VL_SHIFTL_III(15,32,32, (IData)(__Vtask_tb_ingress_queue_manager__DOT__dut__DOT__dequeue_packet__23__queue_id), 0xcU) 
                                                + (0xfffU 
                                                   & VL_SHIFTL_III(12,32,32, (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__dequeue_packet__Vstatic__head_idx), 4U)))))));
                    vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__tx_packet_header 
                        = (((QData)((IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_header[
                                            (((IData)(0x3fU) 
                                              + (0x1ffffU 
                                                 & (VL_SHIFTL_III(17,32,32, (IData)(__Vtask_tb_ingress_queue_manager__DOT__dut__DOT__dequeue_packet__23__queue_id), 0xeU) 
                                                    + 
                                                    (0x3fffU 
                                                     & VL_SHIFTL_III(14,32,32, (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__dequeue_packet__Vstatic__head_idx), 6U))))) 
                                             >> 5U)])) 
                            << ((0U == (0x1fU & (VL_SHIFTL_III(17,32,32, (IData)(__Vtask_tb_ingress_queue_manager__DOT__dut__DOT__dequeue_packet__23__queue_id), 0xeU) 
                                                 + 
                                                 (0x3fffU 
                                                  & VL_SHIFTL_III(14,32,32, (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__dequeue_packet__Vstatic__head_idx), 6U)))))
                                 ? 0x20U : ((IData)(0x40U) 
                                            - (0x1fU 
                                               & (VL_SHIFTL_III(17,32,32, (IData)(__Vtask_tb_ingress_queue_manager__DOT__dut__DOT__dequeue_packet__23__queue_id), 0xeU) 
                                                  + 
                                                  (0x3fffU 
                                                   & VL_SHIFTL_III(14,32,32, (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__dequeue_packet__Vstatic__head_idx), 6U))))))) 
                           | (((0U == (0x1fU & (VL_SHIFTL_III(17,32,32, (IData)(__Vtask_tb_ingress_queue_manager__DOT__dut__DOT__dequeue_packet__23__queue_id), 0xeU) 
                                                + (0x3fffU 
                                                   & VL_SHIFTL_III(14,32,32, (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__dequeue_packet__Vstatic__head_idx), 6U)))))
                                ? 0ULL : ((QData)((IData)(
                                                          vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_header[
                                                          (((IData)(0x1fU) 
                                                            + 
                                                            (0x1ffffU 
                                                             & (VL_SHIFTL_III(17,32,32, (IData)(__Vtask_tb_ingress_queue_manager__DOT__dut__DOT__dequeue_packet__23__queue_id), 0xeU) 
                                                                + 
                                                                (0x3fffU 
                                                                 & VL_SHIFTL_III(14,32,32, (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__dequeue_packet__Vstatic__head_idx), 6U))))) 
                                                           >> 5U)])) 
                                          << ((IData)(0x20U) 
                                              - (0x1fU 
                                                 & (VL_SHIFTL_III(17,32,32, (IData)(__Vtask_tb_ingress_queue_manager__DOT__dut__DOT__dequeue_packet__23__queue_id), 0xeU) 
                                                    + 
                                                    (0x3fffU 
                                                     & VL_SHIFTL_III(14,32,32, (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__dequeue_packet__Vstatic__head_idx), 6U))))))) 
                              | ((QData)((IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_header[
                                                 (0xfffU 
                                                  & ((VL_SHIFTL_III(17,32,32, (IData)(__Vtask_tb_ingress_queue_manager__DOT__dut__DOT__dequeue_packet__23__queue_id), 0xeU) 
                                                      + 
                                                      (0x3fffU 
                                                       & VL_SHIFTL_III(14,32,32, (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__dequeue_packet__Vstatic__head_idx), 6U))) 
                                                     >> 5U))])) 
                                 >> (0x1fU & (VL_SHIFTL_III(17,32,32, (IData)(__Vtask_tb_ingress_queue_manager__DOT__dut__DOT__dequeue_packet__23__queue_id), 0xeU) 
                                              + (0x3fffU 
                                                 & VL_SHIFTL_III(14,32,32, (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__dequeue_packet__Vstatic__head_idx), 6U)))))));
                    vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__tx_packet_valid = 1U;
                    vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[(0x3fU 
                                                                                & ((VL_SHIFTL_III(11,32,32, (IData)(__Vtask_tb_ingress_queue_manager__DOT__dut__DOT__dequeue_packet__23__queue_id), 8U) 
                                                                                + (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__dequeue_packet__Vstatic__head_idx)) 
                                                                                >> 5U))] 
                        = ((~ ((IData)(1U) << (0x1fU 
                                               & (VL_SHIFTL_III(11,32,32, (IData)(__Vtask_tb_ingress_queue_manager__DOT__dut__DOT__dequeue_packet__23__queue_id), 8U) 
                                                  + (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__dequeue_packet__Vstatic__head_idx))))) 
                           & vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[
                           (0x3fU & ((VL_SHIFTL_III(11,32,32, (IData)(__Vtask_tb_ingress_queue_manager__DOT__dut__DOT__dequeue_packet__23__queue_id), 8U) 
                                      + (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__dequeue_packet__Vstatic__head_idx)) 
                                     >> 5U))]);
                    vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__queue_head 
                        = (((~ (0xffULL << (0x3fU & 
                                            VL_SHIFTL_III(6,32,32, (IData)(__Vtask_tb_ingress_queue_manager__DOT__dut__DOT__dequeue_packet__23__queue_id), 3U)))) 
                            & vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__queue_head) 
                           | ((QData)((IData)((0xffU 
                                               & ((IData)(1U) 
                                                  + (IData)(
                                                            (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__queue_head 
                                                             >> 
                                                             (0x3fU 
                                                              & VL_SHIFTL_III(6,32,32, (IData)(__Vtask_tb_ingress_queue_manager__DOT__dut__DOT__dequeue_packet__23__queue_id), 3U)))))))) 
                              << (0x3fU & VL_SHIFTL_III(6,32,32, (IData)(__Vtask_tb_ingress_queue_manager__DOT__dut__DOT__dequeue_packet__23__queue_id), 3U))));
                    vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT____Vlvbound_h3c135dfb__1 
                        = (0x1ffU & (((0x47U >= (0x7fU 
                                                 & ((IData)(9U) 
                                                    * (IData)(__Vtask_tb_ingress_queue_manager__DOT__dut__DOT__dequeue_packet__23__queue_id))))
                                       ? (((0U == (0x1fU 
                                                   & ((IData)(9U) 
                                                      * (IData)(__Vtask_tb_ingress_queue_manager__DOT__dut__DOT__dequeue_packet__23__queue_id))))
                                            ? 0U : 
                                           (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__queue_count[
                                            (((IData)(8U) 
                                              + (0x7fU 
                                                 & ((IData)(9U) 
                                                    * (IData)(__Vtask_tb_ingress_queue_manager__DOT__dut__DOT__dequeue_packet__23__queue_id)))) 
                                             >> 5U)] 
                                            << ((IData)(0x20U) 
                                                - (0x1fU 
                                                   & ((IData)(9U) 
                                                      * (IData)(__Vtask_tb_ingress_queue_manager__DOT__dut__DOT__dequeue_packet__23__queue_id)))))) 
                                          | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__queue_count[
                                             (3U & 
                                              (((IData)(9U) 
                                                * (IData)(__Vtask_tb_ingress_queue_manager__DOT__dut__DOT__dequeue_packet__23__queue_id)) 
                                               >> 5U))] 
                                             >> (0x1fU 
                                                 & ((IData)(9U) 
                                                    * (IData)(__Vtask_tb_ingress_queue_manager__DOT__dut__DOT__dequeue_packet__23__queue_id)))))
                                       : 0U) - (IData)(1U)));
                    if (VL_LIKELY(((0x47U >= (0x7fU 
                                              & ((IData)(9U) 
                                                 * (IData)(__Vtask_tb_ingress_queue_manager__DOT__dut__DOT__dequeue_packet__23__queue_id))))))) {
                        VL_ASSIGNSEL_WI(72,9,(0x7fU 
                                              & ((IData)(9U) 
                                                 * (IData)(__Vtask_tb_ingress_queue_manager__DOT__dut__DOT__dequeue_packet__23__queue_id))), vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__queue_count, vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT____Vlvbound_h3c135dfb__1);
                    }
                    goto __Vlabel1;
                }
                vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__i 
                    = ((IData)(1U) + vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__i);
            }
            __Vlabel1: ;
        }
    } else {
        vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__processing_state = 0U;
        __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__queue_head 
            = (0xffffffffffffff00ULL & __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__queue_head);
        __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__queue_head 
            = (0xffULL | __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__queue_head);
        __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__queue_tail 
            = (0xffffffffffffff00ULL & __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__queue_tail);
        __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__queue_tail 
            = (0xffULL | __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__queue_tail);
        __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__queue_count[0U] 
            = (0xfffffe00U & __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__queue_count[0U]);
        __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__queue_count[0U] 
            = (0x1ffU | __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__queue_count[0U]);
        tb_ingress_queue_manager__DOT__dut__DOT__available_credits[0U] 
            = (0x64U | (0xffff0000U & tb_ingress_queue_manager__DOT__dut__DOT__available_credits[0U]));
        vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j = 0U;
        while (VL_GTS_III(32, 0x100U, vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j)) {
            __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[(7U 
                                                                                & (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j 
                                                                                >> 5U))] 
                = ((~ ((IData)(1U) << (0x1fU & vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j))) 
                   & __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[
                   (7U & (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j 
                          >> 5U))]);
            __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[(7U 
                                                                                & (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j 
                                                                                >> 5U))] 
                = (__VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[
                   (7U & (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j 
                          >> 5U))] | ((IData)(1U) << 
                                      (0x1fU & vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j)));
            vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j 
                = ((IData)(1U) + vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j);
        }
        __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__queue_head 
            = (0xffffffffffff00ffULL & __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__queue_head);
        __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__queue_head 
            = (0xff00ULL | __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__queue_head);
        __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__queue_tail 
            = (0xffffffffffff00ffULL & __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__queue_tail);
        __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__queue_tail 
            = (0xff00ULL | __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__queue_tail);
        __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__queue_count[0U] 
            = (0xfffc01ffU & __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__queue_count[0U]);
        __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__queue_count[0U] 
            = (0x3fe00U | __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__queue_count[0U]);
        tb_ingress_queue_manager__DOT__dut__DOT__available_credits[0U] 
            = (0x640000U | (0xffffU & tb_ingress_queue_manager__DOT__dut__DOT__available_credits[0U]));
        vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j = 0U;
        while (VL_GTS_III(32, 0x100U, vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j)) {
            __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[(0x3fU 
                                                                                & (((IData)(0x100U) 
                                                                                + 
                                                                                (0xffU 
                                                                                & vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j)) 
                                                                                >> 5U))] 
                = ((~ ((IData)(1U) << (0x1fU & ((IData)(0x100U) 
                                                + (0xffU 
                                                   & vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j))))) 
                   & __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[
                   (0x3fU & (((IData)(0x100U) + (0xffU 
                                                 & vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j)) 
                             >> 5U))]);
            __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[(0x3fU 
                                                                                & (((IData)(0x100U) 
                                                                                + 
                                                                                (0xffU 
                                                                                & vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j)) 
                                                                                >> 5U))] 
                = (__VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[
                   (0x3fU & (((IData)(0x100U) + (0xffU 
                                                 & vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j)) 
                             >> 5U))] | ((IData)(1U) 
                                         << (0x1fU 
                                             & ((IData)(0x100U) 
                                                + (0xffU 
                                                   & vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j)))));
            vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j 
                = ((IData)(1U) + vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j);
        }
        __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__queue_head 
            = (0xffffffffff00ffffULL & __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__queue_head);
        __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__queue_head 
            = (0xff0000ULL | __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__queue_head);
        __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__queue_tail 
            = (0xffffffffff00ffffULL & __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__queue_tail);
        __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__queue_tail 
            = (0xff0000ULL | __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__queue_tail);
        __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__queue_count[0U] 
            = (0xf803ffffU & __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__queue_count[0U]);
        __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__queue_count[0U] 
            = (0x7fc0000U | __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__queue_count[0U]);
        tb_ingress_queue_manager__DOT__dut__DOT__available_credits[1U] 
            = (0x64U | (0xffff0000U & tb_ingress_queue_manager__DOT__dut__DOT__available_credits[1U]));
        vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j = 0U;
        while (VL_GTS_III(32, 0x100U, vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j)) {
            __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[(0x3fU 
                                                                                & (((IData)(0x200U) 
                                                                                + 
                                                                                (0xffU 
                                                                                & vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j)) 
                                                                                >> 5U))] 
                = ((~ ((IData)(1U) << (0x1fU & ((IData)(0x200U) 
                                                + (0xffU 
                                                   & vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j))))) 
                   & __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[
                   (0x3fU & (((IData)(0x200U) + (0xffU 
                                                 & vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j)) 
                             >> 5U))]);
            __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[(0x3fU 
                                                                                & (((IData)(0x200U) 
                                                                                + 
                                                                                (0xffU 
                                                                                & vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j)) 
                                                                                >> 5U))] 
                = (__VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[
                   (0x3fU & (((IData)(0x200U) + (0xffU 
                                                 & vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j)) 
                             >> 5U))] | ((IData)(1U) 
                                         << (0x1fU 
                                             & ((IData)(0x200U) 
                                                + (0xffU 
                                                   & vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j)))));
            vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j 
                = ((IData)(1U) + vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j);
        }
        __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__queue_head 
            = (0xffffffff00ffffffULL & __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__queue_head);
        __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__queue_head 
            = (0xff000000ULL | __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__queue_head);
        __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__queue_tail 
            = (0xffffffff00ffffffULL & __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__queue_tail);
        __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__queue_tail 
            = (0xff000000ULL | __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__queue_tail);
        __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__queue_count[0U] 
            = (0x7ffffffU & __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__queue_count[0U]);
        __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__queue_count[1U] 
            = (0xfffffff0U & __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__queue_count[1U]);
        __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__queue_count[0U] 
            = (0xf8000000U | __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__queue_count[0U]);
        __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__queue_count[1U] 
            = (0xfU | __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__queue_count[1U]);
        tb_ingress_queue_manager__DOT__dut__DOT__available_credits[1U] 
            = (0x640000U | (0xffffU & tb_ingress_queue_manager__DOT__dut__DOT__available_credits[1U]));
        vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j = 0U;
        while (VL_GTS_III(32, 0x100U, vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j)) {
            __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[(0x3fU 
                                                                                & (((IData)(0x300U) 
                                                                                + 
                                                                                (0xffU 
                                                                                & vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j)) 
                                                                                >> 5U))] 
                = ((~ ((IData)(1U) << (0x1fU & ((IData)(0x300U) 
                                                + (0xffU 
                                                   & vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j))))) 
                   & __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[
                   (0x3fU & (((IData)(0x300U) + (0xffU 
                                                 & vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j)) 
                             >> 5U))]);
            __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[(0x3fU 
                                                                                & (((IData)(0x300U) 
                                                                                + 
                                                                                (0xffU 
                                                                                & vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j)) 
                                                                                >> 5U))] 
                = (__VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[
                   (0x3fU & (((IData)(0x300U) + (0xffU 
                                                 & vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j)) 
                             >> 5U))] | ((IData)(1U) 
                                         << (0x1fU 
                                             & ((IData)(0x300U) 
                                                + (0xffU 
                                                   & vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j)))));
            vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j 
                = ((IData)(1U) + vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j);
        }
        __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__queue_head 
            = (0xffffff00ffffffffULL & __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__queue_head);
        __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__queue_head 
            = (0xff00000000ULL | __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__queue_head);
        __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__queue_tail 
            = (0xffffff00ffffffffULL & __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__queue_tail);
        __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__queue_tail 
            = (0xff00000000ULL | __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__queue_tail);
        __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__queue_count[1U] 
            = (0xffffe00fU & __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__queue_count[1U]);
        __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__queue_count[1U] 
            = (0x1ff0U | __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__queue_count[1U]);
        tb_ingress_queue_manager__DOT__dut__DOT__available_credits[2U] 
            = (0x64U | (0xffff0000U & tb_ingress_queue_manager__DOT__dut__DOT__available_credits[2U]));
        vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j = 0U;
        while (VL_GTS_III(32, 0x100U, vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j)) {
            __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[(0x3fU 
                                                                                & (((IData)(0x400U) 
                                                                                + 
                                                                                (0xffU 
                                                                                & vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j)) 
                                                                                >> 5U))] 
                = ((~ ((IData)(1U) << (0x1fU & ((IData)(0x400U) 
                                                + (0xffU 
                                                   & vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j))))) 
                   & __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[
                   (0x3fU & (((IData)(0x400U) + (0xffU 
                                                 & vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j)) 
                             >> 5U))]);
            __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[(0x3fU 
                                                                                & (((IData)(0x400U) 
                                                                                + 
                                                                                (0xffU 
                                                                                & vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j)) 
                                                                                >> 5U))] 
                = (__VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[
                   (0x3fU & (((IData)(0x400U) + (0xffU 
                                                 & vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j)) 
                             >> 5U))] | ((IData)(1U) 
                                         << (0x1fU 
                                             & ((IData)(0x400U) 
                                                + (0xffU 
                                                   & vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j)))));
            vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j 
                = ((IData)(1U) + vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j);
        }
        __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__queue_head 
            = (0xffff00ffffffffffULL & __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__queue_head);
        __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__queue_head 
            = (0xff0000000000ULL | __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__queue_head);
        __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__queue_tail 
            = (0xffff00ffffffffffULL & __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__queue_tail);
        __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__queue_tail 
            = (0xff0000000000ULL | __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__queue_tail);
        __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__queue_count[1U] 
            = (0xffc01fffU & __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__queue_count[1U]);
        __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__queue_count[1U] 
            = (0x3fe000U | __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__queue_count[1U]);
        tb_ingress_queue_manager__DOT__dut__DOT__available_credits[2U] 
            = (0x640000U | (0xffffU & tb_ingress_queue_manager__DOT__dut__DOT__available_credits[2U]));
        vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j = 0U;
        while (VL_GTS_III(32, 0x100U, vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j)) {
            __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[(0x3fU 
                                                                                & (((IData)(0x500U) 
                                                                                + 
                                                                                (0xffU 
                                                                                & vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j)) 
                                                                                >> 5U))] 
                = ((~ ((IData)(1U) << (0x1fU & ((IData)(0x500U) 
                                                + (0xffU 
                                                   & vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j))))) 
                   & __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[
                   (0x3fU & (((IData)(0x500U) + (0xffU 
                                                 & vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j)) 
                             >> 5U))]);
            __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[(0x3fU 
                                                                                & (((IData)(0x500U) 
                                                                                + 
                                                                                (0xffU 
                                                                                & vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j)) 
                                                                                >> 5U))] 
                = (__VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[
                   (0x3fU & (((IData)(0x500U) + (0xffU 
                                                 & vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j)) 
                             >> 5U))] | ((IData)(1U) 
                                         << (0x1fU 
                                             & ((IData)(0x500U) 
                                                + (0xffU 
                                                   & vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j)))));
            vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j 
                = ((IData)(1U) + vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j);
        }
        __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__queue_head 
            = (0xff00ffffffffffffULL & __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__queue_head);
        __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__queue_head 
            = (0xff000000000000ULL | __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__queue_head);
        __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__queue_tail 
            = (0xff00ffffffffffffULL & __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__queue_tail);
        __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__queue_tail 
            = (0xff000000000000ULL | __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__queue_tail);
        __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__queue_count[1U] 
            = (0x803fffffU & __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__queue_count[1U]);
        __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__queue_count[1U] 
            = (0x7fc00000U | __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__queue_count[1U]);
        tb_ingress_queue_manager__DOT__dut__DOT__available_credits[3U] 
            = (0x64U | (0xffff0000U & tb_ingress_queue_manager__DOT__dut__DOT__available_credits[3U]));
        vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j = 0U;
        while (VL_GTS_III(32, 0x100U, vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j)) {
            __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[(0x3fU 
                                                                                & (((IData)(0x600U) 
                                                                                + 
                                                                                (0xffU 
                                                                                & vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j)) 
                                                                                >> 5U))] 
                = ((~ ((IData)(1U) << (0x1fU & ((IData)(0x600U) 
                                                + (0xffU 
                                                   & vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j))))) 
                   & __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[
                   (0x3fU & (((IData)(0x600U) + (0xffU 
                                                 & vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j)) 
                             >> 5U))]);
            __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[(0x3fU 
                                                                                & (((IData)(0x600U) 
                                                                                + 
                                                                                (0xffU 
                                                                                & vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j)) 
                                                                                >> 5U))] 
                = (__VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[
                   (0x3fU & (((IData)(0x600U) + (0xffU 
                                                 & vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j)) 
                             >> 5U))] | ((IData)(1U) 
                                         << (0x1fU 
                                             & ((IData)(0x600U) 
                                                + (0xffU 
                                                   & vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j)))));
            vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j 
                = ((IData)(1U) + vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j);
        }
        __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__queue_head 
            = (0xffffffffffffffULL & __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__queue_head);
        __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__queue_head 
            = (0xff00000000000000ULL | __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__queue_head);
        __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__queue_tail 
            = (0xffffffffffffffULL & __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__queue_tail);
        __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__queue_tail 
            = (0xff00000000000000ULL | __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__queue_tail);
        __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__queue_count[1U] 
            = (0x7fffffffU & __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__queue_count[1U]);
        __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__queue_count[2U] = 0U;
        __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__queue_count[1U] 
            = (0x80000000U | __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__queue_count[1U]);
        __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__queue_count[2U] 
            = (0xffU | __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__queue_count[2U]);
        tb_ingress_queue_manager__DOT__dut__DOT__available_credits[3U] 
            = (0x640000U | (0xffffU & tb_ingress_queue_manager__DOT__dut__DOT__available_credits[3U]));
        vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j = 0U;
        while (VL_GTS_III(32, 0x100U, vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j)) {
            __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[(0x3fU 
                                                                                & (((IData)(0x700U) 
                                                                                + 
                                                                                (0xffU 
                                                                                & vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j)) 
                                                                                >> 5U))] 
                = ((~ ((IData)(1U) << (0x1fU & ((IData)(0x700U) 
                                                + (0xffU 
                                                   & vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j))))) 
                   & __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[
                   (0x3fU & (((IData)(0x700U) + (0xffU 
                                                 & vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j)) 
                             >> 5U))]);
            __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[(0x3fU 
                                                                                & (((IData)(0x700U) 
                                                                                + 
                                                                                (0xffU 
                                                                                & vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j)) 
                                                                                >> 5U))] 
                = (__VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[
                   (0x3fU & (((IData)(0x700U) + (0xffU 
                                                 & vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j)) 
                             >> 5U))] | ((IData)(1U) 
                                         << (0x1fU 
                                             & ((IData)(0x700U) 
                                                + (0xffU 
                                                   & vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j)))));
            vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j 
                = ((IData)(1U) + vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j);
        }
        vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__i = 8U;
        vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__total_packets_processed = 0ULL;
        vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__total_credits_added = 0ULL;
        vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__lookup_table_initialized = 0U;
    }
    vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__internal_tvalid 
        = __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__internal_tvalid;
    vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__tx_total_beats 
        = __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__tx_total_beats;
    vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__tx_beat_count 
        = __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__tx_beat_count;
    vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__internal_tx_state 
        = __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__internal_tx_state;
    VL_ASSIGN_W(4096,vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__current_packet_buffer, __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__current_packet_buffer);
    vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__current_header 
        = __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__current_header;
    vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__axis_rx_state 
        = __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__axis_rx_state;
    vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__current_packet_size 
        = __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__current_packet_size;
    vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__axis_tready 
        = __Vdly__tb_ingress_queue_manager__DOT__dut__DOT__axis_tready;
    vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__queue_head 
        = ((__Vdly__tb_ingress_queue_manager__DOT__dut__DOT__queue_head 
            & __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__queue_head) 
           | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__queue_head 
              & (~ __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__queue_head)));
    __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__queue_head = 0ULL;
    vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__queue_tail 
        = ((__Vdly__tb_ingress_queue_manager__DOT__dut__DOT__queue_tail 
            & __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__queue_tail) 
           | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__queue_tail 
              & (~ __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__queue_tail)));
    __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__queue_tail = 0ULL;
    vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__tx_packet_valid 
        = (((IData)(__Vdly__tb_ingress_queue_manager__DOT__dut__DOT__tx_packet_valid) 
            & (IData)(__VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__tx_packet_valid)) 
           | ((IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__tx_packet_valid) 
              & (~ (IData)(__VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__tx_packet_valid))));
    __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__tx_packet_valid = 0U;
    __Vtemp_33[1U] = ((__Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[1U] 
                       & __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[1U]) 
                      | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[1U] 
                         & (~ __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[1U])));
    __Vtemp_33[2U] = ((__Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[2U] 
                       & __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[2U]) 
                      | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[2U] 
                         & (~ __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[2U])));
    __Vtemp_33[3U] = ((__Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[3U] 
                       & __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[3U]) 
                      | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[3U] 
                         & (~ __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[3U])));
    __Vtemp_33[4U] = ((__Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[4U] 
                       & __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[4U]) 
                      | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[4U] 
                         & (~ __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[4U])));
    __Vtemp_33[5U] = ((__Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[5U] 
                       & __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[5U]) 
                      | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[5U] 
                         & (~ __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[5U])));
    __Vtemp_33[6U] = ((__Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[6U] 
                       & __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[6U]) 
                      | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[6U] 
                         & (~ __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[6U])));
    __Vtemp_33[7U] = ((__Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[7U] 
                       & __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[7U]) 
                      | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[7U] 
                         & (~ __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[7U])));
    __Vtemp_33[8U] = ((__Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[8U] 
                       & __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[8U]) 
                      | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[8U] 
                         & (~ __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[8U])));
    __Vtemp_33[9U] = ((__Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[9U] 
                       & __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[9U]) 
                      | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[9U] 
                         & (~ __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[9U])));
    __Vtemp_33[0xaU] = ((__Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0xaU] 
                         & __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0xaU]) 
                        | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0xaU] 
                           & (~ __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0xaU])));
    __Vtemp_33[0xbU] = ((__Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0xbU] 
                         & __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0xbU]) 
                        | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0xbU] 
                           & (~ __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0xbU])));
    __Vtemp_33[0xcU] = ((__Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0xcU] 
                         & __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0xcU]) 
                        | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0xcU] 
                           & (~ __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0xcU])));
    __Vtemp_33[0xdU] = ((__Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0xdU] 
                         & __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0xdU]) 
                        | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0xdU] 
                           & (~ __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0xdU])));
    __Vtemp_33[0xeU] = ((__Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0xeU] 
                         & __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0xeU]) 
                        | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0xeU] 
                           & (~ __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0xeU])));
    __Vtemp_33[0xfU] = ((__Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0xfU] 
                         & __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0xfU]) 
                        | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0xfU] 
                           & (~ __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0xfU])));
    __Vtemp_33[0x10U] = ((__Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x10U] 
                          & __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x10U]) 
                         | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x10U] 
                            & (~ __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x10U])));
    __Vtemp_33[0x11U] = ((__Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x11U] 
                          & __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x11U]) 
                         | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x11U] 
                            & (~ __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x11U])));
    __Vtemp_33[0x12U] = ((__Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x12U] 
                          & __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x12U]) 
                         | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x12U] 
                            & (~ __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x12U])));
    __Vtemp_33[0x13U] = ((__Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x13U] 
                          & __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x13U]) 
                         | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x13U] 
                            & (~ __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x13U])));
    __Vtemp_33[0x14U] = ((__Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x14U] 
                          & __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x14U]) 
                         | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x14U] 
                            & (~ __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x14U])));
    __Vtemp_33[0x15U] = ((__Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x15U] 
                          & __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x15U]) 
                         | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x15U] 
                            & (~ __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x15U])));
    __Vtemp_33[0x16U] = ((__Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x16U] 
                          & __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x16U]) 
                         | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x16U] 
                            & (~ __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x16U])));
    __Vtemp_33[0x17U] = ((__Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x17U] 
                          & __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x17U]) 
                         | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x17U] 
                            & (~ __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x17U])));
    __Vtemp_33[0x18U] = ((__Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x18U] 
                          & __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x18U]) 
                         | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x18U] 
                            & (~ __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x18U])));
    __Vtemp_33[0x19U] = ((__Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x19U] 
                          & __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x19U]) 
                         | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x19U] 
                            & (~ __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x19U])));
    __Vtemp_33[0x1aU] = ((__Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x1aU] 
                          & __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x1aU]) 
                         | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x1aU] 
                            & (~ __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x1aU])));
    __Vtemp_33[0x1bU] = ((__Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x1bU] 
                          & __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x1bU]) 
                         | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x1bU] 
                            & (~ __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x1bU])));
    __Vtemp_33[0x1cU] = ((__Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x1cU] 
                          & __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x1cU]) 
                         | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x1cU] 
                            & (~ __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x1cU])));
    __Vtemp_33[0x1dU] = ((__Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x1dU] 
                          & __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x1dU]) 
                         | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x1dU] 
                            & (~ __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x1dU])));
    __Vtemp_33[0x1eU] = ((__Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x1eU] 
                          & __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x1eU]) 
                         | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x1eU] 
                            & (~ __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x1eU])));
    __Vtemp_33[0x1fU] = ((__Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x1fU] 
                          & __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x1fU]) 
                         | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x1fU] 
                            & (~ __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x1fU])));
    __Vtemp_33[0x20U] = ((__Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x20U] 
                          & __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x20U]) 
                         | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x20U] 
                            & (~ __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x20U])));
    __Vtemp_33[0x21U] = ((__Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x21U] 
                          & __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x21U]) 
                         | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x21U] 
                            & (~ __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x21U])));
    __Vtemp_33[0x22U] = ((__Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x22U] 
                          & __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x22U]) 
                         | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x22U] 
                            & (~ __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x22U])));
    __Vtemp_33[0x23U] = ((__Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x23U] 
                          & __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x23U]) 
                         | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x23U] 
                            & (~ __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x23U])));
    __Vtemp_33[0x24U] = ((__Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x24U] 
                          & __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x24U]) 
                         | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x24U] 
                            & (~ __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x24U])));
    __Vtemp_33[0x25U] = ((__Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x25U] 
                          & __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x25U]) 
                         | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x25U] 
                            & (~ __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x25U])));
    __Vtemp_33[0x26U] = ((__Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x26U] 
                          & __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x26U]) 
                         | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x26U] 
                            & (~ __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x26U])));
    __Vtemp_33[0x27U] = ((__Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x27U] 
                          & __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x27U]) 
                         | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x27U] 
                            & (~ __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x27U])));
    __Vtemp_33[0x28U] = ((__Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x28U] 
                          & __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x28U]) 
                         | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x28U] 
                            & (~ __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x28U])));
    __Vtemp_33[0x29U] = ((__Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x29U] 
                          & __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x29U]) 
                         | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x29U] 
                            & (~ __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x29U])));
    __Vtemp_33[0x2aU] = ((__Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x2aU] 
                          & __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x2aU]) 
                         | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x2aU] 
                            & (~ __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x2aU])));
    __Vtemp_33[0x2bU] = ((__Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x2bU] 
                          & __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x2bU]) 
                         | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x2bU] 
                            & (~ __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x2bU])));
    __Vtemp_33[0x2cU] = ((__Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x2cU] 
                          & __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x2cU]) 
                         | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x2cU] 
                            & (~ __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x2cU])));
    __Vtemp_33[0x2dU] = ((__Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x2dU] 
                          & __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x2dU]) 
                         | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x2dU] 
                            & (~ __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x2dU])));
    __Vtemp_33[0x2eU] = ((__Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x2eU] 
                          & __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x2eU]) 
                         | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x2eU] 
                            & (~ __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x2eU])));
    __Vtemp_33[0x2fU] = ((__Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x2fU] 
                          & __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x2fU]) 
                         | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x2fU] 
                            & (~ __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x2fU])));
    __Vtemp_33[0x30U] = ((__Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x30U] 
                          & __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x30U]) 
                         | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x30U] 
                            & (~ __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x30U])));
    __Vtemp_33[0x31U] = ((__Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x31U] 
                          & __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x31U]) 
                         | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x31U] 
                            & (~ __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x31U])));
    __Vtemp_33[0x32U] = ((__Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x32U] 
                          & __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x32U]) 
                         | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x32U] 
                            & (~ __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x32U])));
    __Vtemp_33[0x33U] = ((__Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x33U] 
                          & __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x33U]) 
                         | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x33U] 
                            & (~ __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x33U])));
    __Vtemp_33[0x34U] = ((__Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x34U] 
                          & __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x34U]) 
                         | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x34U] 
                            & (~ __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x34U])));
    __Vtemp_33[0x35U] = ((__Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x35U] 
                          & __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x35U]) 
                         | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x35U] 
                            & (~ __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x35U])));
    __Vtemp_33[0x36U] = ((__Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x36U] 
                          & __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x36U]) 
                         | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x36U] 
                            & (~ __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x36U])));
    __Vtemp_33[0x37U] = ((__Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x37U] 
                          & __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x37U]) 
                         | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x37U] 
                            & (~ __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x37U])));
    __Vtemp_33[0x38U] = ((__Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x38U] 
                          & __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x38U]) 
                         | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x38U] 
                            & (~ __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x38U])));
    __Vtemp_33[0x39U] = ((__Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x39U] 
                          & __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x39U]) 
                         | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x39U] 
                            & (~ __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x39U])));
    __Vtemp_33[0x3aU] = ((__Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x3aU] 
                          & __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x3aU]) 
                         | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x3aU] 
                            & (~ __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x3aU])));
    __Vtemp_33[0x3bU] = ((__Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x3bU] 
                          & __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x3bU]) 
                         | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x3bU] 
                            & (~ __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x3bU])));
    __Vtemp_33[0x3cU] = ((__Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x3cU] 
                          & __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x3cU]) 
                         | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x3cU] 
                            & (~ __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x3cU])));
    __Vtemp_33[0x3dU] = ((__Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x3dU] 
                          & __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x3dU]) 
                         | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x3dU] 
                            & (~ __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x3dU])));
    __Vtemp_33[0x3eU] = ((__Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x3eU] 
                          & __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x3eU]) 
                         | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x3eU] 
                            & (~ __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x3eU])));
    __Vtemp_33[0x3fU] = ((__Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x3fU] 
                          & __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x3fU]) 
                         | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x3fU] 
                            & (~ __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0x3fU])));
    vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0U] 
        = ((__Vdly__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0U] 
            & __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0U]) 
           | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0U] 
              & (~ __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[0U])));
    IData/*31:0*/ __Vilp1;
    __Vilp1 = 1U;
    while ((__Vilp1 <= 0x3fU)) {
        vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[__Vilp1] 
            = __Vtemp_33[__Vilp1];
        __Vilp1 = ((IData)(1U) + __Vilp1);
    }
    IData/*31:0*/ __Vilp2;
    __Vilp2 = 0U;
    while ((__Vilp2 <= 0x3fU)) {
        __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid[__Vilp2] 
            = Vtb_ingress_queue_manager__ConstPool__CONST_h6be9aa18_0[__Vilp2];
        __Vilp2 = ((IData)(1U) + __Vilp2);
    }
    __Vtemp_37[1U] = ((__Vdly__tb_ingress_queue_manager__DOT__dut__DOT__queue_count[1U] 
                       & __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__queue_count[1U]) 
                      | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__queue_count[1U] 
                         & (~ __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__queue_count[1U])));
    __Vtemp_37[2U] = ((__Vdly__tb_ingress_queue_manager__DOT__dut__DOT__queue_count[2U] 
                       & __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__queue_count[2U]) 
                      | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__queue_count[2U] 
                         & (~ __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__queue_count[2U])));
    vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__queue_count[0U] 
        = ((__Vdly__tb_ingress_queue_manager__DOT__dut__DOT__queue_count[0U] 
            & __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__queue_count[0U]) 
           | (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__queue_count[0U] 
              & (~ __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__queue_count[0U])));
    vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__queue_count[1U] 
        = __Vtemp_37[1U];
    vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__queue_count[2U] 
        = __Vtemp_37[2U];
    __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__queue_count[0U] = 0U;
    __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__queue_count[1U] = 0U;
    __VdlyMask__tb_ingress_queue_manager__DOT__dut__DOT__queue_count[2U] = 0U;
}

VL_INLINE_OPT void Vtb_ingress_queue_manager___024root___nba_sequent__TOP__2(Vtb_ingress_queue_manager___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_ingress_queue_manager___024root___nba_sequent__TOP__2\n"); );
    Vtb_ingress_queue_manager__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.tb_ingress_queue_manager__DOT__internal_out_s2m = 1U;
}

void Vtb_ingress_queue_manager___024root___timing_commit(Vtb_ingress_queue_manager___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_ingress_queue_manager___024root___timing_commit\n"); );
    Vtb_ingress_queue_manager__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((! (1ULL & vlSelfRef.__VactTriggered.word(0U)))) {
        vlSelfRef.__VtrigSched_hb4669660__0.commit(
                                                   "@(posedge tb_ingress_queue_manager.clk)");
    }
}

void Vtb_ingress_queue_manager___024root___timing_resume(Vtb_ingress_queue_manager___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_ingress_queue_manager___024root___timing_resume\n"); );
    Vtb_ingress_queue_manager__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1ULL & vlSelfRef.__VactTriggered.word(0U))) {
        vlSelfRef.__VtrigSched_hb4669660__0.resume(
                                                   "@(posedge tb_ingress_queue_manager.clk)");
    }
    if ((4ULL & vlSelfRef.__VactTriggered.word(0U))) {
        vlSelfRef.__VdlySched.resume();
    }
}

void Vtb_ingress_queue_manager___024root___eval_triggers__act(Vtb_ingress_queue_manager___024root* vlSelf);

bool Vtb_ingress_queue_manager___024root___eval_phase__act(Vtb_ingress_queue_manager___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_ingress_queue_manager___024root___eval_phase__act\n"); );
    Vtb_ingress_queue_manager__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    VlTriggerVec<3> __VpreTriggered;
    CData/*0:0*/ __VactExecute;
    // Body
    Vtb_ingress_queue_manager___024root___eval_triggers__act(vlSelf);
    Vtb_ingress_queue_manager___024root___timing_commit(vlSelf);
    __VactExecute = vlSelfRef.__VactTriggered.any();
    if (__VactExecute) {
        __VpreTriggered.andNot(vlSelfRef.__VactTriggered, vlSelfRef.__VnbaTriggered);
        vlSelfRef.__VnbaTriggered.thisOr(vlSelfRef.__VactTriggered);
        Vtb_ingress_queue_manager___024root___timing_resume(vlSelf);
        Vtb_ingress_queue_manager___024root___eval_act(vlSelf);
    }
    return (__VactExecute);
}

bool Vtb_ingress_queue_manager___024root___eval_phase__nba(Vtb_ingress_queue_manager___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_ingress_queue_manager___024root___eval_phase__nba\n"); );
    Vtb_ingress_queue_manager__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    CData/*0:0*/ __VnbaExecute;
    // Body
    __VnbaExecute = vlSelfRef.__VnbaTriggered.any();
    if (__VnbaExecute) {
        Vtb_ingress_queue_manager___024root___eval_nba(vlSelf);
        vlSelfRef.__VnbaTriggered.clear();
    }
    return (__VnbaExecute);
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vtb_ingress_queue_manager___024root___dump_triggers__nba(Vtb_ingress_queue_manager___024root* vlSelf);
#endif  // VL_DEBUG
#ifdef VL_DEBUG
VL_ATTR_COLD void Vtb_ingress_queue_manager___024root___dump_triggers__act(Vtb_ingress_queue_manager___024root* vlSelf);
#endif  // VL_DEBUG

void Vtb_ingress_queue_manager___024root___eval(Vtb_ingress_queue_manager___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_ingress_queue_manager___024root___eval\n"); );
    Vtb_ingress_queue_manager__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    IData/*31:0*/ __VnbaIterCount;
    CData/*0:0*/ __VnbaContinue;
    // Body
    __VnbaIterCount = 0U;
    __VnbaContinue = 1U;
    while (__VnbaContinue) {
        if (VL_UNLIKELY(((0x64U < __VnbaIterCount)))) {
#ifdef VL_DEBUG
            Vtb_ingress_queue_manager___024root___dump_triggers__nba(vlSelf);
#endif
            VL_FATAL_MT("../tb/tb_ingress_queue_manager.sv", 10, "", "NBA region did not converge.");
        }
        __VnbaIterCount = ((IData)(1U) + __VnbaIterCount);
        __VnbaContinue = 0U;
        vlSelfRef.__VactIterCount = 0U;
        vlSelfRef.__VactContinue = 1U;
        while (vlSelfRef.__VactContinue) {
            if (VL_UNLIKELY(((0x64U < vlSelfRef.__VactIterCount)))) {
#ifdef VL_DEBUG
                Vtb_ingress_queue_manager___024root___dump_triggers__act(vlSelf);
#endif
                VL_FATAL_MT("../tb/tb_ingress_queue_manager.sv", 10, "", "Active region did not converge.");
            }
            vlSelfRef.__VactIterCount = ((IData)(1U) 
                                         + vlSelfRef.__VactIterCount);
            vlSelfRef.__VactContinue = 0U;
            if (Vtb_ingress_queue_manager___024root___eval_phase__act(vlSelf)) {
                vlSelfRef.__VactContinue = 1U;
            }
        }
        if (Vtb_ingress_queue_manager___024root___eval_phase__nba(vlSelf)) {
            __VnbaContinue = 1U;
        }
    }
}

#ifdef VL_DEBUG
void Vtb_ingress_queue_manager___024root___eval_debug_assertions(Vtb_ingress_queue_manager___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_ingress_queue_manager___024root___eval_debug_assertions\n"); );
    Vtb_ingress_queue_manager__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
}
#endif  // VL_DEBUG
