// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtb_ingress_queue_manager.h for the primary calling header

#include "Vtb_ingress_queue_manager__pch.h"
#include "Vtb_ingress_queue_manager__Syms.h"
#include "Vtb_ingress_queue_manager___024root.h"

VL_INLINE_OPT VlCoroutine Vtb_ingress_queue_manager___024root___eval_initial__TOP__Vtiming__0(Vtb_ingress_queue_manager___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_ingress_queue_manager___024root___eval_initial__TOP__Vtiming__0\n"); );
    Vtb_ingress_queue_manager__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    IData/*31:0*/ __Vtask_tb_ingress_queue_manager__DOT__initialize_signals__0__tb_ingress_queue_manager__DOT__unnamedblk1_1__DOT____Vrepeat0;
    __Vtask_tb_ingress_queue_manager__DOT__initialize_signals__0__tb_ingress_queue_manager__DOT__unnamedblk1_1__DOT____Vrepeat0 = 0;
    IData/*31:0*/ __Vtask_tb_ingress_queue_manager__DOT__test_reset__1__tb_ingress_queue_manager__DOT__unnamedblk1_2__DOT____Vrepeat1;
    __Vtask_tb_ingress_queue_manager__DOT__test_reset__1__tb_ingress_queue_manager__DOT__unnamedblk1_2__DOT____Vrepeat1 = 0;
    IData/*31:0*/ __Vtask_tb_ingress_queue_manager__DOT__test_reset__1__tb_ingress_queue_manager__DOT__unnamedblk1_3__DOT____Vrepeat2;
    __Vtask_tb_ingress_queue_manager__DOT__test_reset__1__tb_ingress_queue_manager__DOT__unnamedblk1_3__DOT____Vrepeat2 = 0;
    IData/*31:0*/ __Vtask_tb_ingress_queue_manager__DOT__test_reset__1__tb_ingress_queue_manager__DOT__unnamedblk1_4__DOT____Vrepeat3;
    __Vtask_tb_ingress_queue_manager__DOT__test_reset__1__tb_ingress_queue_manager__DOT__unnamedblk1_4__DOT____Vrepeat3 = 0;
    IData/*31:0*/ __Vtask_tb_ingress_queue_manager__DOT__test_reset__1__tb_ingress_queue_manager__DOT__unnamedblk1_5__DOT____Vrepeat4;
    __Vtask_tb_ingress_queue_manager__DOT__test_reset__1__tb_ingress_queue_manager__DOT__unnamedblk1_5__DOT____Vrepeat4 = 0;
    IData/*31:0*/ __Vtask_tb_ingress_queue_manager__DOT__test_axis_reception__3__unnamedblk1__DOT__i;
    __Vtask_tb_ingress_queue_manager__DOT__test_axis_reception__3__unnamedblk1__DOT__i = 0;
    IData/*31:0*/ __Vtask_tb_ingress_queue_manager__DOT__test_axis_reception__3__tb_ingress_queue_manager__DOT__unnamedblk1_6__DOT____Vrepeat5;
    __Vtask_tb_ingress_queue_manager__DOT__test_axis_reception__3__tb_ingress_queue_manager__DOT__unnamedblk1_6__DOT____Vrepeat5 = 0;
    VlQueue<CData/*7:0*/> __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__packet_data;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__packet_data.atDefault() = 0;
    IData/*31:0*/ __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__data_size;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__data_size = 0;
    QData/*63:0*/ __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__header;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__header = 0;
    IData/*31:0*/ __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__unnamedblk8__DOT__beat;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__unnamedblk8__DOT__beat = 0;
    QData/*63:0*/ __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__unnamedblk8__DOT__unnamedblk9__DOT__data_beat;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__unnamedblk8__DOT__unnamedblk9__DOT__data_beat = 0;
    CData/*7:0*/ __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__unnamedblk8__DOT__unnamedblk9__DOT__keep_beat;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__unnamedblk8__DOT__unnamedblk9__DOT__keep_beat = 0;
    IData/*31:0*/ __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__unnamedblk8__DOT__unnamedblk9__DOT__bytes_in_beat;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__unnamedblk8__DOT__unnamedblk9__DOT__bytes_in_beat = 0;
    IData/*31:0*/ __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i = 0;
    IData/*31:0*/ __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__unnamedblk11__DOT__byte_idx;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__unnamedblk11__DOT__byte_idx = 0;
    IData/*31:0*/ __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__beats;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__beats = 0;
    IData/*31:0*/ __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__bytes_per_beat;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__bytes_per_beat = 0;
    IData/*31:0*/ __Vtask_tb_ingress_queue_manager__DOT__test_internal_header_processing__5__unnamedblk2__DOT__i;
    __Vtask_tb_ingress_queue_manager__DOT__test_internal_header_processing__5__unnamedblk2__DOT__i = 0;
    IData/*31:0*/ __Vtask_tb_ingress_queue_manager__DOT__test_internal_header_processing__5__tb_ingress_queue_manager__DOT__unnamedblk1_7__DOT____Vrepeat6;
    __Vtask_tb_ingress_queue_manager__DOT__test_internal_header_processing__5__tb_ingress_queue_manager__DOT__unnamedblk1_7__DOT____Vrepeat6 = 0;
    VlQueue<CData/*7:0*/> __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__packet_data;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__packet_data.atDefault() = 0;
    IData/*31:0*/ __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__data_size;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__data_size = 0;
    QData/*63:0*/ __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__header;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__header = 0;
    IData/*31:0*/ __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__unnamedblk8__DOT__beat;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__unnamedblk8__DOT__beat = 0;
    QData/*63:0*/ __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__unnamedblk8__DOT__unnamedblk9__DOT__data_beat;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__unnamedblk8__DOT__unnamedblk9__DOT__data_beat = 0;
    CData/*7:0*/ __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__unnamedblk8__DOT__unnamedblk9__DOT__keep_beat;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__unnamedblk8__DOT__unnamedblk9__DOT__keep_beat = 0;
    IData/*31:0*/ __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__unnamedblk8__DOT__unnamedblk9__DOT__bytes_in_beat;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__unnamedblk8__DOT__unnamedblk9__DOT__bytes_in_beat = 0;
    IData/*31:0*/ __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i = 0;
    IData/*31:0*/ __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__unnamedblk11__DOT__byte_idx;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__unnamedblk11__DOT__byte_idx = 0;
    IData/*31:0*/ __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__beats;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__beats = 0;
    IData/*31:0*/ __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__bytes_per_beat;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__bytes_per_beat = 0;
    IData/*31:0*/ __Vtask_tb_ingress_queue_manager__DOT__test_credit_processing__7__unnamedblk3__DOT__i;
    __Vtask_tb_ingress_queue_manager__DOT__test_credit_processing__7__unnamedblk3__DOT__i = 0;
    IData/*31:0*/ __Vtask_tb_ingress_queue_manager__DOT__test_credit_processing__7__tb_ingress_queue_manager__DOT__unnamedblk1_8__DOT____Vrepeat7;
    __Vtask_tb_ingress_queue_manager__DOT__test_credit_processing__7__tb_ingress_queue_manager__DOT__unnamedblk1_8__DOT____Vrepeat7 = 0;
    VlQueue<CData/*7:0*/> __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__packet_data;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__packet_data.atDefault() = 0;
    IData/*31:0*/ __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__data_size;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__data_size = 0;
    QData/*63:0*/ __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__header;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__header = 0;
    IData/*31:0*/ __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__unnamedblk8__DOT__beat;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__unnamedblk8__DOT__beat = 0;
    QData/*63:0*/ __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__unnamedblk8__DOT__unnamedblk9__DOT__data_beat;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__unnamedblk8__DOT__unnamedblk9__DOT__data_beat = 0;
    CData/*7:0*/ __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__unnamedblk8__DOT__unnamedblk9__DOT__keep_beat;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__unnamedblk8__DOT__unnamedblk9__DOT__keep_beat = 0;
    IData/*31:0*/ __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__unnamedblk8__DOT__unnamedblk9__DOT__bytes_in_beat;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__unnamedblk8__DOT__unnamedblk9__DOT__bytes_in_beat = 0;
    IData/*31:0*/ __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i = 0;
    IData/*31:0*/ __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__unnamedblk11__DOT__byte_idx;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__unnamedblk11__DOT__byte_idx = 0;
    IData/*31:0*/ __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__beats;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__beats = 0;
    IData/*31:0*/ __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__bytes_per_beat;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__bytes_per_beat = 0;
    IData/*31:0*/ __Vtask_tb_ingress_queue_manager__DOT__test_packet_conversion__9__unnamedblk4__DOT__i;
    __Vtask_tb_ingress_queue_manager__DOT__test_packet_conversion__9__unnamedblk4__DOT__i = 0;
    VlQueue<CData/*7:0*/> __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__packet_data;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__packet_data.atDefault() = 0;
    IData/*31:0*/ __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__data_size;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__data_size = 0;
    QData/*63:0*/ __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__header;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__header = 0;
    IData/*31:0*/ __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__unnamedblk8__DOT__beat;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__unnamedblk8__DOT__beat = 0;
    QData/*63:0*/ __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__unnamedblk8__DOT__unnamedblk9__DOT__data_beat;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__unnamedblk8__DOT__unnamedblk9__DOT__data_beat = 0;
    CData/*7:0*/ __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__unnamedblk8__DOT__unnamedblk9__DOT__keep_beat;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__unnamedblk8__DOT__unnamedblk9__DOT__keep_beat = 0;
    IData/*31:0*/ __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__unnamedblk8__DOT__unnamedblk9__DOT__bytes_in_beat;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__unnamedblk8__DOT__unnamedblk9__DOT__bytes_in_beat = 0;
    IData/*31:0*/ __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i = 0;
    IData/*31:0*/ __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__unnamedblk11__DOT__byte_idx;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__unnamedblk11__DOT__byte_idx = 0;
    IData/*31:0*/ __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__beats;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__beats = 0;
    IData/*31:0*/ __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__bytes_per_beat;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__bytes_per_beat = 0;
    IData/*31:0*/ __Vtask_tb_ingress_queue_manager__DOT__wait_for_internal_transmission__11__tb_ingress_queue_manager__DOT__unnamedblk1_11__DOT____Vrepeat10;
    __Vtask_tb_ingress_queue_manager__DOT__wait_for_internal_transmission__11__tb_ingress_queue_manager__DOT__unnamedblk1_11__DOT____Vrepeat10 = 0;
    IData/*31:0*/ __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__unnamedblk5__DOT__q;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__unnamedblk5__DOT__q = 0;
    QData/*63:0*/ __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__unnamedblk5__DOT__unnamedblk6__DOT__header_data;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__unnamedblk5__DOT__unnamedblk6__DOT__header_data = 0;
    VlUnpacked<CData/*7:0*/, 4> __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__unnamedblk5__DOT__unnamedblk6__DOT__packet_data;
    for (int __Vi0 = 0; __Vi0 < 4; ++__Vi0) {
        __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__unnamedblk5__DOT__unnamedblk6__DOT__packet_data[__Vi0] = 0;
    }
    IData/*31:0*/ __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__unnamedblk5__DOT__unnamedblk6__DOT__unnamedblk7__DOT__i;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__unnamedblk5__DOT__unnamedblk6__DOT__unnamedblk7__DOT__i = 0;
    IData/*31:0*/ __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__tb_ingress_queue_manager__DOT__unnamedblk5__DOT__unnamedblk6__DOT__unnamedblk1_9__DOT____Vrepeat8;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__tb_ingress_queue_manager__DOT__unnamedblk5__DOT__unnamedblk6__DOT__unnamedblk1_9__DOT____Vrepeat8 = 0;
    IData/*31:0*/ __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__tb_ingress_queue_manager__DOT__unnamedblk1_10__DOT____Vrepeat9;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__tb_ingress_queue_manager__DOT__unnamedblk1_10__DOT____Vrepeat9 = 0;
    VlQueue<CData/*7:0*/> __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__packet_data;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__packet_data.atDefault() = 0;
    IData/*31:0*/ __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__data_size;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__data_size = 0;
    QData/*63:0*/ __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__header;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__header = 0;
    IData/*31:0*/ __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__beat;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__beat = 0;
    QData/*63:0*/ __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__data_beat;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__data_beat = 0;
    CData/*7:0*/ __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__keep_beat;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__keep_beat = 0;
    IData/*31:0*/ __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__bytes_in_beat;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__bytes_in_beat = 0;
    IData/*31:0*/ __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i = 0;
    IData/*31:0*/ __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__unnamedblk11__DOT__byte_idx;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__unnamedblk11__DOT__byte_idx = 0;
    IData/*31:0*/ __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__beats;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__beats = 0;
    IData/*31:0*/ __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__bytes_per_beat;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__bytes_per_beat = 0;
    VlQueue<CData/*7:0*/> __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__packet_data;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__packet_data.atDefault() = 0;
    IData/*31:0*/ __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__data_size;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__data_size = 0;
    QData/*63:0*/ __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__header;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__header = 0;
    IData/*31:0*/ __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__unnamedblk8__DOT__beat;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__unnamedblk8__DOT__beat = 0;
    QData/*63:0*/ __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__unnamedblk8__DOT__unnamedblk9__DOT__data_beat;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__unnamedblk8__DOT__unnamedblk9__DOT__data_beat = 0;
    CData/*7:0*/ __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__unnamedblk8__DOT__unnamedblk9__DOT__keep_beat;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__unnamedblk8__DOT__unnamedblk9__DOT__keep_beat = 0;
    IData/*31:0*/ __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__unnamedblk8__DOT__unnamedblk9__DOT__bytes_in_beat;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__unnamedblk8__DOT__unnamedblk9__DOT__bytes_in_beat = 0;
    IData/*31:0*/ __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i = 0;
    IData/*31:0*/ __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__unnamedblk11__DOT__byte_idx;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__unnamedblk11__DOT__byte_idx = 0;
    IData/*31:0*/ __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__beats;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__beats = 0;
    IData/*31:0*/ __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__bytes_per_beat;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__bytes_per_beat = 0;
    IData/*31:0*/ __Vtask_tb_ingress_queue_manager__DOT__wait_for_internal_transmission__16__tb_ingress_queue_manager__DOT__unnamedblk1_11__DOT____Vrepeat10;
    __Vtask_tb_ingress_queue_manager__DOT__wait_for_internal_transmission__16__tb_ingress_queue_manager__DOT__unnamedblk1_11__DOT____Vrepeat10 = 0;
    VlWide<7>/*223:0*/ __Vtemp_1;
    // Body
    VL_WRITEF_NX("\n=== Testing IngressQueueManager ===\n",0);
    __Vtemp_1[0U] = 0x2e766364U;
    __Vtemp_1[1U] = 0x61676572U;
    __Vtemp_1[2U] = 0x5f6d616eU;
    __Vtemp_1[3U] = 0x75657565U;
    __Vtemp_1[4U] = 0x73735f71U;
    __Vtemp_1[5U] = 0x6e677265U;
    __Vtemp_1[6U] = 0x74625f69U;
    vlSymsp->_vm_contextp__->dumpfile(VL_CVT_PACK_STR_NW(7, __Vtemp_1));
    vlSymsp->_traceDumpOpen();
    __Vtask_tb_ingress_queue_manager__DOT__initialize_signals__0__tb_ingress_queue_manager__DOT__unnamedblk1_1__DOT____Vrepeat0 = 0;
    VL_WRITEF_NX("Initializing signals...\n",0);
    vlSelfRef.tb_ingress_queue_manager__DOT__rst_n = 0U;
    vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[0U] = 0U;
    vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[1U] = 0U;
    vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[2U] = 0U;
    vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[3U] = 0U;
    vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[4U] = 0U;
    vlSelfRef.tb_ingress_queue_manager__DOT__axi_master_ready = 1U;
    vlSelfRef.tb_ingress_queue_manager__DOT__axi_slave_valid = 0U;
    vlSelfRef.tb_ingress_queue_manager__DOT__axi_slave_addr = 0U;
    vlSelfRef.tb_ingress_queue_manager__DOT__axi_slave_data = 0U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         229);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__initialize_signals__0__tb_ingress_queue_manager__DOT__unnamedblk1_1__DOT____Vrepeat0 = 3U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         229);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__initialize_signals__0__tb_ingress_queue_manager__DOT__unnamedblk1_1__DOT____Vrepeat0 = 2U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         229);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__initialize_signals__0__tb_ingress_queue_manager__DOT__unnamedblk1_1__DOT____Vrepeat0 = 1U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         229);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__initialize_signals__0__tb_ingress_queue_manager__DOT__unnamedblk1_1__DOT____Vrepeat0 = 0U;
    __Vtask_tb_ingress_queue_manager__DOT__test_reset__1__tb_ingress_queue_manager__DOT__unnamedblk1_2__DOT____Vrepeat1 = 0;
    __Vtask_tb_ingress_queue_manager__DOT__test_reset__1__tb_ingress_queue_manager__DOT__unnamedblk1_3__DOT____Vrepeat2 = 0;
    __Vtask_tb_ingress_queue_manager__DOT__test_reset__1__tb_ingress_queue_manager__DOT__unnamedblk1_4__DOT____Vrepeat3 = 0;
    __Vtask_tb_ingress_queue_manager__DOT__test_reset__1__tb_ingress_queue_manager__DOT__unnamedblk1_5__DOT____Vrepeat4 = 0;
    VL_WRITEF_NX("Testing reset functionality...\n",0);
    vlSelfRef.tb_ingress_queue_manager__DOT__rst_n = 0U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         237);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_reset__1__tb_ingress_queue_manager__DOT__unnamedblk1_2__DOT____Vrepeat1 = 9U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         237);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_reset__1__tb_ingress_queue_manager__DOT__unnamedblk1_2__DOT____Vrepeat1 = 8U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         237);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_reset__1__tb_ingress_queue_manager__DOT__unnamedblk1_2__DOT____Vrepeat1 = 7U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         237);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_reset__1__tb_ingress_queue_manager__DOT__unnamedblk1_2__DOT____Vrepeat1 = 6U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         237);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_reset__1__tb_ingress_queue_manager__DOT__unnamedblk1_2__DOT____Vrepeat1 = 5U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         237);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_reset__1__tb_ingress_queue_manager__DOT__unnamedblk1_2__DOT____Vrepeat1 = 4U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         237);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_reset__1__tb_ingress_queue_manager__DOT__unnamedblk1_2__DOT____Vrepeat1 = 3U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         237);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_reset__1__tb_ingress_queue_manager__DOT__unnamedblk1_2__DOT____Vrepeat1 = 2U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         237);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_reset__1__tb_ingress_queue_manager__DOT__unnamedblk1_2__DOT____Vrepeat1 = 1U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         237);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_reset__1__tb_ingress_queue_manager__DOT__unnamedblk1_2__DOT____Vrepeat1 = 0U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         240);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_reset__1__tb_ingress_queue_manager__DOT__unnamedblk1_3__DOT____Vrepeat2 = 0x13U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         240);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_reset__1__tb_ingress_queue_manager__DOT__unnamedblk1_3__DOT____Vrepeat2 = 0x12U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         240);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_reset__1__tb_ingress_queue_manager__DOT__unnamedblk1_3__DOT____Vrepeat2 = 0x11U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         240);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_reset__1__tb_ingress_queue_manager__DOT__unnamedblk1_3__DOT____Vrepeat2 = 0x10U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         240);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_reset__1__tb_ingress_queue_manager__DOT__unnamedblk1_3__DOT____Vrepeat2 = 0xfU;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         240);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_reset__1__tb_ingress_queue_manager__DOT__unnamedblk1_3__DOT____Vrepeat2 = 0xeU;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         240);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_reset__1__tb_ingress_queue_manager__DOT__unnamedblk1_3__DOT____Vrepeat2 = 0xdU;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         240);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_reset__1__tb_ingress_queue_manager__DOT__unnamedblk1_3__DOT____Vrepeat2 = 0xcU;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         240);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_reset__1__tb_ingress_queue_manager__DOT__unnamedblk1_3__DOT____Vrepeat2 = 0xbU;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         240);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_reset__1__tb_ingress_queue_manager__DOT__unnamedblk1_3__DOT____Vrepeat2 = 0xaU;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         240);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_reset__1__tb_ingress_queue_manager__DOT__unnamedblk1_3__DOT____Vrepeat2 = 9U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         240);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_reset__1__tb_ingress_queue_manager__DOT__unnamedblk1_3__DOT____Vrepeat2 = 8U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         240);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_reset__1__tb_ingress_queue_manager__DOT__unnamedblk1_3__DOT____Vrepeat2 = 7U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         240);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_reset__1__tb_ingress_queue_manager__DOT__unnamedblk1_3__DOT____Vrepeat2 = 6U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         240);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_reset__1__tb_ingress_queue_manager__DOT__unnamedblk1_3__DOT____Vrepeat2 = 5U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         240);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_reset__1__tb_ingress_queue_manager__DOT__unnamedblk1_3__DOT____Vrepeat2 = 4U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         240);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_reset__1__tb_ingress_queue_manager__DOT__unnamedblk1_3__DOT____Vrepeat2 = 3U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         240);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_reset__1__tb_ingress_queue_manager__DOT__unnamedblk1_3__DOT____Vrepeat2 = 2U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         240);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_reset__1__tb_ingress_queue_manager__DOT__unnamedblk1_3__DOT____Vrepeat2 = 1U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         240);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_reset__1__tb_ingress_queue_manager__DOT__unnamedblk1_3__DOT____Vrepeat2 = 0U;
    if (VL_UNLIKELY(((1U & (~ (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__axis_tready)))))) {
        VL_WRITEF_NX("[%0t] %%Warning: tb_ingress_queue_manager.sv:241: %Ntb_ingress_queue_manager.test_reset: AXIS not ready after reset, but continuing...\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name());
    }
    if (vlSymsp->_vm_contextp__->assertOnGet(2, 1)) {
        if (VL_UNLIKELY((vlSelfRef.tb_ingress_queue_manager__DOT__internal_valid))) {
            VL_WRITEF_NX("[%0t] %%Error: tb_ingress_queue_manager.sv:242: Assertion failed in %Ntb_ingress_queue_manager.test_reset: Internal valid should be low after reset\n",0,
                         64,VL_TIME_UNITED_Q(1000),
                         -9,vlSymsp->name());
            VL_STOP_MT("../tb/tb_ingress_queue_manager.sv", 242, "");
        }
    }
    vlSelfRef.tb_ingress_queue_manager__DOT__rst_n = 1U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         246);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_reset__1__tb_ingress_queue_manager__DOT__unnamedblk1_4__DOT____Vrepeat3 = 9U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         246);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_reset__1__tb_ingress_queue_manager__DOT__unnamedblk1_4__DOT____Vrepeat3 = 8U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         246);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_reset__1__tb_ingress_queue_manager__DOT__unnamedblk1_4__DOT____Vrepeat3 = 7U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         246);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_reset__1__tb_ingress_queue_manager__DOT__unnamedblk1_4__DOT____Vrepeat3 = 6U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         246);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_reset__1__tb_ingress_queue_manager__DOT__unnamedblk1_4__DOT____Vrepeat3 = 5U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         246);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_reset__1__tb_ingress_queue_manager__DOT__unnamedblk1_4__DOT____Vrepeat3 = 4U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         246);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_reset__1__tb_ingress_queue_manager__DOT__unnamedblk1_4__DOT____Vrepeat3 = 3U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         246);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_reset__1__tb_ingress_queue_manager__DOT__unnamedblk1_4__DOT____Vrepeat3 = 2U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         246);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_reset__1__tb_ingress_queue_manager__DOT__unnamedblk1_4__DOT____Vrepeat3 = 1U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         246);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_reset__1__tb_ingress_queue_manager__DOT__unnamedblk1_4__DOT____Vrepeat3 = 0U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         249);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_reset__1__tb_ingress_queue_manager__DOT__unnamedblk1_5__DOT____Vrepeat4 = 0x13U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         249);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_reset__1__tb_ingress_queue_manager__DOT__unnamedblk1_5__DOT____Vrepeat4 = 0x12U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         249);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_reset__1__tb_ingress_queue_manager__DOT__unnamedblk1_5__DOT____Vrepeat4 = 0x11U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         249);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_reset__1__tb_ingress_queue_manager__DOT__unnamedblk1_5__DOT____Vrepeat4 = 0x10U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         249);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_reset__1__tb_ingress_queue_manager__DOT__unnamedblk1_5__DOT____Vrepeat4 = 0xfU;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         249);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_reset__1__tb_ingress_queue_manager__DOT__unnamedblk1_5__DOT____Vrepeat4 = 0xeU;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         249);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_reset__1__tb_ingress_queue_manager__DOT__unnamedblk1_5__DOT____Vrepeat4 = 0xdU;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         249);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_reset__1__tb_ingress_queue_manager__DOT__unnamedblk1_5__DOT____Vrepeat4 = 0xcU;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         249);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_reset__1__tb_ingress_queue_manager__DOT__unnamedblk1_5__DOT____Vrepeat4 = 0xbU;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         249);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_reset__1__tb_ingress_queue_manager__DOT__unnamedblk1_5__DOT____Vrepeat4 = 0xaU;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         249);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_reset__1__tb_ingress_queue_manager__DOT__unnamedblk1_5__DOT____Vrepeat4 = 9U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         249);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_reset__1__tb_ingress_queue_manager__DOT__unnamedblk1_5__DOT____Vrepeat4 = 8U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         249);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_reset__1__tb_ingress_queue_manager__DOT__unnamedblk1_5__DOT____Vrepeat4 = 7U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         249);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_reset__1__tb_ingress_queue_manager__DOT__unnamedblk1_5__DOT____Vrepeat4 = 6U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         249);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_reset__1__tb_ingress_queue_manager__DOT__unnamedblk1_5__DOT____Vrepeat4 = 5U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         249);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_reset__1__tb_ingress_queue_manager__DOT__unnamedblk1_5__DOT____Vrepeat4 = 4U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         249);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_reset__1__tb_ingress_queue_manager__DOT__unnamedblk1_5__DOT____Vrepeat4 = 3U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         249);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_reset__1__tb_ingress_queue_manager__DOT__unnamedblk1_5__DOT____Vrepeat4 = 2U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         249);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_reset__1__tb_ingress_queue_manager__DOT__unnamedblk1_5__DOT____Vrepeat4 = 1U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         249);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_reset__1__tb_ingress_queue_manager__DOT__unnamedblk1_5__DOT____Vrepeat4 = 0U;
    if (VL_UNLIKELY(((1U & (~ (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__axis_tready)))))) {
        VL_WRITEF_NX("[%0t] %%Warning: tb_ingress_queue_manager.sv:250: %Ntb_ingress_queue_manager.test_reset: AXIS not ready after reset release, but continuing...\n",0,
                     64,VL_TIME_UNITED_Q(1000),-9,vlSymsp->name());
    }
    VL_WRITEF_NX("  Reset test PASSED\n",0);
    VL_WRITEF_NX("Testing configuration...\n  Configuration test PASSED\n",0);
    __Vtask_tb_ingress_queue_manager__DOT__test_axis_reception__3__unnamedblk1__DOT__i = 0;
    __Vtask_tb_ingress_queue_manager__DOT__test_axis_reception__3__tb_ingress_queue_manager__DOT__unnamedblk1_6__DOT____Vrepeat5 = 0;
    VL_WRITEF_NX("Testing AXIS packet reception...\n",0);
    vlSelfRef.tb_ingress_queue_manager__DOT__test_axis_reception__Vstatic__header_data = 0x4000000201ULL;
    vlSelfRef.tb_ingress_queue_manager__DOT__test_axis_reception__Vstatic__packet_data[0U] = 0x10U;
    __Vtask_tb_ingress_queue_manager__DOT__test_axis_reception__3__unnamedblk1__DOT__i = 1U;
    vlSelfRef.tb_ingress_queue_manager__DOT__test_axis_reception__Vstatic__packet_data[1U] = 0x11U;
    __Vtask_tb_ingress_queue_manager__DOT__test_axis_reception__3__unnamedblk1__DOT__i = 2U;
    vlSelfRef.tb_ingress_queue_manager__DOT__test_axis_reception__Vstatic__packet_data[2U] = 0x12U;
    __Vtask_tb_ingress_queue_manager__DOT__test_axis_reception__3__unnamedblk1__DOT__i = 3U;
    vlSelfRef.tb_ingress_queue_manager__DOT__test_axis_reception__Vstatic__packet_data[3U] = 0x13U;
    __Vtask_tb_ingress_queue_manager__DOT__test_axis_reception__3__unnamedblk1__DOT__i = 4U;
    vlSelfRef.tb_ingress_queue_manager__DOT__test_axis_reception__Vstatic__packet_data[4U] = 0x14U;
    __Vtask_tb_ingress_queue_manager__DOT__test_axis_reception__3__unnamedblk1__DOT__i = 5U;
    vlSelfRef.tb_ingress_queue_manager__DOT__test_axis_reception__Vstatic__packet_data[5U] = 0x15U;
    __Vtask_tb_ingress_queue_manager__DOT__test_axis_reception__3__unnamedblk1__DOT__i = 6U;
    vlSelfRef.tb_ingress_queue_manager__DOT__test_axis_reception__Vstatic__packet_data[6U] = 0x16U;
    __Vtask_tb_ingress_queue_manager__DOT__test_axis_reception__3__unnamedblk1__DOT__i = 7U;
    vlSelfRef.tb_ingress_queue_manager__DOT__test_axis_reception__Vstatic__packet_data[7U] = 0x17U;
    __Vtask_tb_ingress_queue_manager__DOT__test_axis_reception__3__unnamedblk1__DOT__i = 8U;
    vlSelfRef.tb_ingress_queue_manager__DOT__test_axis_reception__Vstatic__packet_data[8U] = 0x18U;
    __Vtask_tb_ingress_queue_manager__DOT__test_axis_reception__3__unnamedblk1__DOT__i = 9U;
    vlSelfRef.tb_ingress_queue_manager__DOT__test_axis_reception__Vstatic__packet_data[9U] = 0x19U;
    __Vtask_tb_ingress_queue_manager__DOT__test_axis_reception__3__unnamedblk1__DOT__i = 0xaU;
    vlSelfRef.tb_ingress_queue_manager__DOT__test_axis_reception__Vstatic__packet_data[0xaU] = 0x1aU;
    __Vtask_tb_ingress_queue_manager__DOT__test_axis_reception__3__unnamedblk1__DOT__i = 0xbU;
    vlSelfRef.tb_ingress_queue_manager__DOT__test_axis_reception__Vstatic__packet_data[0xbU] = 0x1bU;
    __Vtask_tb_ingress_queue_manager__DOT__test_axis_reception__3__unnamedblk1__DOT__i = 0xcU;
    vlSelfRef.tb_ingress_queue_manager__DOT__test_axis_reception__Vstatic__packet_data[0xcU] = 0x1cU;
    __Vtask_tb_ingress_queue_manager__DOT__test_axis_reception__3__unnamedblk1__DOT__i = 0xdU;
    vlSelfRef.tb_ingress_queue_manager__DOT__test_axis_reception__Vstatic__packet_data[0xdU] = 0x1dU;
    __Vtask_tb_ingress_queue_manager__DOT__test_axis_reception__3__unnamedblk1__DOT__i = 0xeU;
    vlSelfRef.tb_ingress_queue_manager__DOT__test_axis_reception__Vstatic__packet_data[0xeU] = 0x1eU;
    __Vtask_tb_ingress_queue_manager__DOT__test_axis_reception__3__unnamedblk1__DOT__i = 0xfU;
    vlSelfRef.tb_ingress_queue_manager__DOT__test_axis_reception__Vstatic__packet_data[0xfU] = 0x1fU;
    __Vtask_tb_ingress_queue_manager__DOT__test_axis_reception__3__unnamedblk1__DOT__i = 0x10U;
    VL_WRITEF_NX("  Sending AXIS packet...\n",0);
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__header 
        = vlSelfRef.tb_ingress_queue_manager__DOT__test_axis_reception__Vstatic__header_data;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__data_size = 0x10U;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__packet_data 
        = VL_CVT_UNPACK_TO_Q(vlSelfRef.tb_ingress_queue_manager__DOT__test_axis_reception__Vstatic__packet_data);
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__unnamedblk8__DOT__beat = 0;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__unnamedblk8__DOT__unnamedblk9__DOT__data_beat = 0;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__unnamedblk8__DOT__unnamedblk9__DOT__keep_beat = 0;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__unnamedblk8__DOT__unnamedblk9__DOT__bytes_in_beat = 0;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i = 0;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__unnamedblk11__DOT__byte_idx = 0;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__beats = 0;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__bytes_per_beat = 0;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__bytes_per_beat = 8U;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__beats 
        = VL_DIVS_III(32, ((__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__data_size 
                            + __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__bytes_per_beat) 
                           - (IData)(1U)), __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__bytes_per_beat);
    VL_WRITEF_NX("    [TestBench] Sending packet: size=%0d bytes in %0d beats\n",0,
                 32,__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__data_size,
                 32,__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__beats);
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__unnamedblk8__DOT__beat = 0U;
    while (VL_LTS_III(32, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__unnamedblk8__DOT__beat, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__beats)) {
        __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__unnamedblk8__DOT__unnamedblk9__DOT__data_beat = 0ULL;
        __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__unnamedblk8__DOT__unnamedblk9__DOT__keep_beat = 0U;
        co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                             nullptr, 
                                                             "@(posedge tb_ingress_queue_manager.clk)", 
                                                             "../tb/tb_ingress_queue_manager.sv", 
                                                             448);
        vlSelfRef.__Vm_traceActivity[2U] = 1U;
        vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[4U] 
            = (0x200U | vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[4U]);
        __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__unnamedblk8__DOT__unnamedblk9__DOT__bytes_in_beat 
            = (VL_GTS_III(32, (__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__data_size 
                               - VL_MULS_III(32, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__unnamedblk8__DOT__beat, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__bytes_per_beat)), __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__bytes_per_beat)
                ? __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__bytes_per_beat
                : (__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__data_size 
                   - VL_MULS_III(32, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__unnamedblk8__DOT__beat, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__bytes_per_beat)));
        __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i = 0U;
        while (VL_LTS_III(32, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__unnamedblk8__DOT__unnamedblk9__DOT__bytes_in_beat)) {
            __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__unnamedblk11__DOT__byte_idx 
                = (VL_MULS_III(32, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__unnamedblk8__DOT__beat, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__bytes_per_beat) 
                   + __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i);
            if (VL_LTS_III(32, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__unnamedblk11__DOT__byte_idx, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__data_size)) {
                __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__unnamedblk8__DOT__unnamedblk9__DOT__data_beat 
                    = (((~ (0xffULL << (0x3fU & VL_MULS_III(32, (IData)(8U), __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i)))) 
                        & __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__unnamedblk8__DOT__unnamedblk9__DOT__data_beat) 
                       | ((QData)((IData)(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__packet_data.at(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__unnamedblk11__DOT__byte_idx))) 
                          << (0x3fU & VL_MULS_III(32, (IData)(8U), __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i))));
                __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__unnamedblk8__DOT__unnamedblk9__DOT__keep_beat 
                    = ((IData)(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__unnamedblk8__DOT__unnamedblk9__DOT__keep_beat) 
                       | (0xffU & ((IData)(1U) << (7U 
                                                   & __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i))));
            }
            __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i 
                = ((IData)(1U) + __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i);
        }
        vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[0U] 
            = (((IData)(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__header) 
                << 1U) | (__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__unnamedblk8__DOT__beat 
                          == (__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__beats 
                              - (IData)(1U))));
        vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[1U] 
            = (((IData)(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__header) 
                >> 0x1fU) | ((IData)((__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__header 
                                      >> 0x20U)) << 1U));
        vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[2U] 
            = ((0xfffffffeU & vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[2U]) 
               | ((IData)((__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__header 
                           >> 0x20U)) >> 0x1fU));
        vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[2U] 
            = ((1U & vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[2U]) 
               | (((IData)(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__unnamedblk8__DOT__unnamedblk9__DOT__data_beat) 
                   << 9U) | ((IData)(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__unnamedblk8__DOT__unnamedblk9__DOT__keep_beat) 
                             << 1U)));
        vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[3U] 
            = (((1U & ((IData)(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__unnamedblk8__DOT__unnamedblk9__DOT__data_beat) 
                       >> 0x17U)) | ((IData)(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__unnamedblk8__DOT__unnamedblk9__DOT__keep_beat) 
                                     >> 0x1fU)) | (
                                                   (0x1feU 
                                                    & ((IData)(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__unnamedblk8__DOT__unnamedblk9__DOT__data_beat) 
                                                       >> 0x17U)) 
                                                   | ((IData)(
                                                              (__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__unnamedblk8__DOT__unnamedblk9__DOT__data_beat 
                                                               >> 0x20U)) 
                                                      << 9U)));
        vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[4U] 
            = ((0x200U & vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[4U]) 
               | (0x3ffU & ((1U & ((IData)((__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__unnamedblk8__DOT__unnamedblk9__DOT__data_beat 
                                            >> 0x20U)) 
                                   >> 0x17U)) | (0x1feU 
                                                 & ((IData)(
                                                            (__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__unnamedblk8__DOT__unnamedblk9__DOT__data_beat 
                                                             >> 0x20U)) 
                                                    >> 0x17U)))));
        while ((1U & (~ (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__axis_tready)))) {
            co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                                 nullptr, 
                                                                 "@(posedge tb_ingress_queue_manager.clk)", 
                                                                 "../tb/tb_ingress_queue_manager.sv", 
                                                                 471);
            vlSelfRef.__Vm_traceActivity[2U] = 1U;
        }
        __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__unnamedblk8__DOT__beat 
            = ((IData)(1U) + __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__4__unnamedblk8__DOT__beat);
    }
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         475);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[4U] 
        = (0x1ffU & vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[4U]);
    vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[0U] 
        = (0xfffffffeU & vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[0U]);
    VL_WRITEF_NX("  Waiting for packet processing...\n",0);
    __Vtask_tb_ingress_queue_manager__DOT__test_axis_reception__3__tb_ingress_queue_manager__DOT__unnamedblk1_6__DOT____Vrepeat5 = 0x64U;
    while (VL_LTS_III(32, 0U, __Vtask_tb_ingress_queue_manager__DOT__test_axis_reception__3__tb_ingress_queue_manager__DOT__unnamedblk1_6__DOT____Vrepeat5)) {
        co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                             nullptr, 
                                                             "@(posedge tb_ingress_queue_manager.clk)", 
                                                             "../tb/tb_ingress_queue_manager.sv", 
                                                             289);
        vlSelfRef.__Vm_traceActivity[2U] = 1U;
        __Vtask_tb_ingress_queue_manager__DOT__test_axis_reception__3__tb_ingress_queue_manager__DOT__unnamedblk1_6__DOT____Vrepeat5 
            = (__Vtask_tb_ingress_queue_manager__DOT__test_axis_reception__3__tb_ingress_queue_manager__DOT__unnamedblk1_6__DOT____Vrepeat5 
               - (IData)(1U));
    }
    vlSelfRef.tb_ingress_queue_manager__DOT__total_packets_sent 
        = ((IData)(1U) + vlSelfRef.tb_ingress_queue_manager__DOT__total_packets_sent);
    VL_WRITEF_NX("  AXIS reception test PASSED\n",0);
    __Vtask_tb_ingress_queue_manager__DOT__test_internal_header_processing__5__unnamedblk2__DOT__i = 0;
    __Vtask_tb_ingress_queue_manager__DOT__test_internal_header_processing__5__tb_ingress_queue_manager__DOT__unnamedblk1_7__DOT____Vrepeat6 = 0;
    VL_WRITEF_NX("Testing internal header processing...\n",0);
    vlSelfRef.tb_ingress_queue_manager__DOT__test_internal_header_processing__Vstatic__header_data = 0x8001010403ULL;
    vlSelfRef.tb_ingress_queue_manager__DOT__test_internal_header_processing__Vstatic__packet_data[0U] = 0xa0U;
    __Vtask_tb_ingress_queue_manager__DOT__test_internal_header_processing__5__unnamedblk2__DOT__i = 1U;
    vlSelfRef.tb_ingress_queue_manager__DOT__test_internal_header_processing__Vstatic__packet_data[1U] = 0xa1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_internal_header_processing__5__unnamedblk2__DOT__i = 2U;
    vlSelfRef.tb_ingress_queue_manager__DOT__test_internal_header_processing__Vstatic__packet_data[2U] = 0xa2U;
    __Vtask_tb_ingress_queue_manager__DOT__test_internal_header_processing__5__unnamedblk2__DOT__i = 3U;
    vlSelfRef.tb_ingress_queue_manager__DOT__test_internal_header_processing__Vstatic__packet_data[3U] = 0xa3U;
    __Vtask_tb_ingress_queue_manager__DOT__test_internal_header_processing__5__unnamedblk2__DOT__i = 4U;
    vlSelfRef.tb_ingress_queue_manager__DOT__test_internal_header_processing__Vstatic__packet_data[4U] = 0xa4U;
    __Vtask_tb_ingress_queue_manager__DOT__test_internal_header_processing__5__unnamedblk2__DOT__i = 5U;
    vlSelfRef.tb_ingress_queue_manager__DOT__test_internal_header_processing__Vstatic__packet_data[5U] = 0xa5U;
    __Vtask_tb_ingress_queue_manager__DOT__test_internal_header_processing__5__unnamedblk2__DOT__i = 6U;
    vlSelfRef.tb_ingress_queue_manager__DOT__test_internal_header_processing__Vstatic__packet_data[6U] = 0xa6U;
    __Vtask_tb_ingress_queue_manager__DOT__test_internal_header_processing__5__unnamedblk2__DOT__i = 7U;
    vlSelfRef.tb_ingress_queue_manager__DOT__test_internal_header_processing__Vstatic__packet_data[7U] = 0xa7U;
    __Vtask_tb_ingress_queue_manager__DOT__test_internal_header_processing__5__unnamedblk2__DOT__i = 8U;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__header 
        = vlSelfRef.tb_ingress_queue_manager__DOT__test_internal_header_processing__Vstatic__header_data;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__data_size = 8U;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__packet_data 
        = VL_CVT_UNPACK_TO_Q(vlSelfRef.tb_ingress_queue_manager__DOT__test_internal_header_processing__Vstatic__packet_data);
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__unnamedblk8__DOT__beat = 0;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__unnamedblk8__DOT__unnamedblk9__DOT__data_beat = 0;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__unnamedblk8__DOT__unnamedblk9__DOT__keep_beat = 0;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__unnamedblk8__DOT__unnamedblk9__DOT__bytes_in_beat = 0;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i = 0;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__unnamedblk11__DOT__byte_idx = 0;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__beats = 0;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__bytes_per_beat = 0;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__bytes_per_beat = 8U;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__beats 
        = VL_DIVS_III(32, ((__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__data_size 
                            + __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__bytes_per_beat) 
                           - (IData)(1U)), __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__bytes_per_beat);
    VL_WRITEF_NX("    [TestBench] Sending packet: size=%0d bytes in %0d beats\n",0,
                 32,__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__data_size,
                 32,__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__beats);
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__unnamedblk8__DOT__beat = 0U;
    while (VL_LTS_III(32, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__unnamedblk8__DOT__beat, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__beats)) {
        __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__unnamedblk8__DOT__unnamedblk9__DOT__data_beat = 0ULL;
        __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__unnamedblk8__DOT__unnamedblk9__DOT__keep_beat = 0U;
        co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                             nullptr, 
                                                             "@(posedge tb_ingress_queue_manager.clk)", 
                                                             "../tb/tb_ingress_queue_manager.sv", 
                                                             448);
        vlSelfRef.__Vm_traceActivity[2U] = 1U;
        vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[4U] 
            = (0x200U | vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[4U]);
        __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__unnamedblk8__DOT__unnamedblk9__DOT__bytes_in_beat 
            = (VL_GTS_III(32, (__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__data_size 
                               - VL_MULS_III(32, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__unnamedblk8__DOT__beat, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__bytes_per_beat)), __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__bytes_per_beat)
                ? __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__bytes_per_beat
                : (__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__data_size 
                   - VL_MULS_III(32, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__unnamedblk8__DOT__beat, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__bytes_per_beat)));
        __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i = 0U;
        while (VL_LTS_III(32, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__unnamedblk8__DOT__unnamedblk9__DOT__bytes_in_beat)) {
            __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__unnamedblk11__DOT__byte_idx 
                = (VL_MULS_III(32, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__unnamedblk8__DOT__beat, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__bytes_per_beat) 
                   + __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i);
            if (VL_LTS_III(32, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__unnamedblk11__DOT__byte_idx, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__data_size)) {
                __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__unnamedblk8__DOT__unnamedblk9__DOT__data_beat 
                    = (((~ (0xffULL << (0x3fU & VL_MULS_III(32, (IData)(8U), __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i)))) 
                        & __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__unnamedblk8__DOT__unnamedblk9__DOT__data_beat) 
                       | ((QData)((IData)(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__packet_data.at(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__unnamedblk11__DOT__byte_idx))) 
                          << (0x3fU & VL_MULS_III(32, (IData)(8U), __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i))));
                __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__unnamedblk8__DOT__unnamedblk9__DOT__keep_beat 
                    = ((IData)(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__unnamedblk8__DOT__unnamedblk9__DOT__keep_beat) 
                       | (0xffU & ((IData)(1U) << (7U 
                                                   & __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i))));
            }
            __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i 
                = ((IData)(1U) + __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i);
        }
        vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[0U] 
            = (((IData)(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__header) 
                << 1U) | (__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__unnamedblk8__DOT__beat 
                          == (__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__beats 
                              - (IData)(1U))));
        vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[1U] 
            = (((IData)(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__header) 
                >> 0x1fU) | ((IData)((__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__header 
                                      >> 0x20U)) << 1U));
        vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[2U] 
            = ((0xfffffffeU & vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[2U]) 
               | ((IData)((__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__header 
                           >> 0x20U)) >> 0x1fU));
        vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[2U] 
            = ((1U & vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[2U]) 
               | (((IData)(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__unnamedblk8__DOT__unnamedblk9__DOT__data_beat) 
                   << 9U) | ((IData)(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__unnamedblk8__DOT__unnamedblk9__DOT__keep_beat) 
                             << 1U)));
        vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[3U] 
            = (((1U & ((IData)(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__unnamedblk8__DOT__unnamedblk9__DOT__data_beat) 
                       >> 0x17U)) | ((IData)(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__unnamedblk8__DOT__unnamedblk9__DOT__keep_beat) 
                                     >> 0x1fU)) | (
                                                   (0x1feU 
                                                    & ((IData)(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__unnamedblk8__DOT__unnamedblk9__DOT__data_beat) 
                                                       >> 0x17U)) 
                                                   | ((IData)(
                                                              (__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__unnamedblk8__DOT__unnamedblk9__DOT__data_beat 
                                                               >> 0x20U)) 
                                                      << 9U)));
        vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[4U] 
            = ((0x200U & vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[4U]) 
               | (0x3ffU & ((1U & ((IData)((__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__unnamedblk8__DOT__unnamedblk9__DOT__data_beat 
                                            >> 0x20U)) 
                                   >> 0x17U)) | (0x1feU 
                                                 & ((IData)(
                                                            (__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__unnamedblk8__DOT__unnamedblk9__DOT__data_beat 
                                                             >> 0x20U)) 
                                                    >> 0x17U)))));
        while ((1U & (~ (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__axis_tready)))) {
            co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                                 nullptr, 
                                                                 "@(posedge tb_ingress_queue_manager.clk)", 
                                                                 "../tb/tb_ingress_queue_manager.sv", 
                                                                 471);
            vlSelfRef.__Vm_traceActivity[2U] = 1U;
        }
        __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__unnamedblk8__DOT__beat 
            = ((IData)(1U) + __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__6__unnamedblk8__DOT__beat);
    }
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         475);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[4U] 
        = (0x1ffU & vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[4U]);
    vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[0U] 
        = (0xfffffffeU & vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[0U]);
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         314);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_internal_header_processing__5__tb_ingress_queue_manager__DOT__unnamedblk1_7__DOT____Vrepeat6 = 0x13U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         314);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_internal_header_processing__5__tb_ingress_queue_manager__DOT__unnamedblk1_7__DOT____Vrepeat6 = 0x12U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         314);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_internal_header_processing__5__tb_ingress_queue_manager__DOT__unnamedblk1_7__DOT____Vrepeat6 = 0x11U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         314);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_internal_header_processing__5__tb_ingress_queue_manager__DOT__unnamedblk1_7__DOT____Vrepeat6 = 0x10U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         314);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_internal_header_processing__5__tb_ingress_queue_manager__DOT__unnamedblk1_7__DOT____Vrepeat6 = 0xfU;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         314);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_internal_header_processing__5__tb_ingress_queue_manager__DOT__unnamedblk1_7__DOT____Vrepeat6 = 0xeU;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         314);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_internal_header_processing__5__tb_ingress_queue_manager__DOT__unnamedblk1_7__DOT____Vrepeat6 = 0xdU;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         314);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_internal_header_processing__5__tb_ingress_queue_manager__DOT__unnamedblk1_7__DOT____Vrepeat6 = 0xcU;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         314);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_internal_header_processing__5__tb_ingress_queue_manager__DOT__unnamedblk1_7__DOT____Vrepeat6 = 0xbU;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         314);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_internal_header_processing__5__tb_ingress_queue_manager__DOT__unnamedblk1_7__DOT____Vrepeat6 = 0xaU;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         314);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_internal_header_processing__5__tb_ingress_queue_manager__DOT__unnamedblk1_7__DOT____Vrepeat6 = 9U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         314);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_internal_header_processing__5__tb_ingress_queue_manager__DOT__unnamedblk1_7__DOT____Vrepeat6 = 8U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         314);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_internal_header_processing__5__tb_ingress_queue_manager__DOT__unnamedblk1_7__DOT____Vrepeat6 = 7U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         314);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_internal_header_processing__5__tb_ingress_queue_manager__DOT__unnamedblk1_7__DOT____Vrepeat6 = 6U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         314);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_internal_header_processing__5__tb_ingress_queue_manager__DOT__unnamedblk1_7__DOT____Vrepeat6 = 5U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         314);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_internal_header_processing__5__tb_ingress_queue_manager__DOT__unnamedblk1_7__DOT____Vrepeat6 = 4U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         314);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_internal_header_processing__5__tb_ingress_queue_manager__DOT__unnamedblk1_7__DOT____Vrepeat6 = 3U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         314);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_internal_header_processing__5__tb_ingress_queue_manager__DOT__unnamedblk1_7__DOT____Vrepeat6 = 2U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         314);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_internal_header_processing__5__tb_ingress_queue_manager__DOT__unnamedblk1_7__DOT____Vrepeat6 = 1U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         314);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_internal_header_processing__5__tb_ingress_queue_manager__DOT__unnamedblk1_7__DOT____Vrepeat6 = 0U;
    VL_WRITEF_NX("  Internal header processing test PASSED\n",0);
    __Vtask_tb_ingress_queue_manager__DOT__test_credit_processing__7__unnamedblk3__DOT__i = 0;
    __Vtask_tb_ingress_queue_manager__DOT__test_credit_processing__7__tb_ingress_queue_manager__DOT__unnamedblk1_8__DOT____Vrepeat7 = 0;
    VL_WRITEF_NX("Testing credit processing...\n",0);
    vlSelfRef.tb_ingress_queue_manager__DOT__test_credit_processing__Vstatic__header_data = 0xa02000201ULL;
    vlSelfRef.tb_ingress_queue_manager__DOT__test_credit_processing__Vstatic__packet_data[0U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_credit_processing__7__unnamedblk3__DOT__i = 1U;
    vlSelfRef.tb_ingress_queue_manager__DOT__test_credit_processing__Vstatic__packet_data[1U] = 2U;
    __Vtask_tb_ingress_queue_manager__DOT__test_credit_processing__7__unnamedblk3__DOT__i = 2U;
    vlSelfRef.tb_ingress_queue_manager__DOT__test_credit_processing__Vstatic__packet_data[2U] = 3U;
    __Vtask_tb_ingress_queue_manager__DOT__test_credit_processing__7__unnamedblk3__DOT__i = 3U;
    vlSelfRef.tb_ingress_queue_manager__DOT__test_credit_processing__Vstatic__packet_data[3U] = 4U;
    __Vtask_tb_ingress_queue_manager__DOT__test_credit_processing__7__unnamedblk3__DOT__i = 4U;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__header 
        = vlSelfRef.tb_ingress_queue_manager__DOT__test_credit_processing__Vstatic__header_data;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__data_size = 4U;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__packet_data 
        = VL_CVT_UNPACK_TO_Q(vlSelfRef.tb_ingress_queue_manager__DOT__test_credit_processing__Vstatic__packet_data);
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__unnamedblk8__DOT__beat = 0;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__unnamedblk8__DOT__unnamedblk9__DOT__data_beat = 0;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__unnamedblk8__DOT__unnamedblk9__DOT__keep_beat = 0;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__unnamedblk8__DOT__unnamedblk9__DOT__bytes_in_beat = 0;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i = 0;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__unnamedblk11__DOT__byte_idx = 0;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__beats = 0;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__bytes_per_beat = 0;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__bytes_per_beat = 8U;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__beats 
        = VL_DIVS_III(32, ((__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__data_size 
                            + __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__bytes_per_beat) 
                           - (IData)(1U)), __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__bytes_per_beat);
    VL_WRITEF_NX("    [TestBench] Sending packet: size=%0d bytes in %0d beats\n",0,
                 32,__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__data_size,
                 32,__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__beats);
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__unnamedblk8__DOT__beat = 0U;
    while (VL_LTS_III(32, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__unnamedblk8__DOT__beat, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__beats)) {
        __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__unnamedblk8__DOT__unnamedblk9__DOT__data_beat = 0ULL;
        __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__unnamedblk8__DOT__unnamedblk9__DOT__keep_beat = 0U;
        co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                             nullptr, 
                                                             "@(posedge tb_ingress_queue_manager.clk)", 
                                                             "../tb/tb_ingress_queue_manager.sv", 
                                                             448);
        vlSelfRef.__Vm_traceActivity[2U] = 1U;
        vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[4U] 
            = (0x200U | vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[4U]);
        __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__unnamedblk8__DOT__unnamedblk9__DOT__bytes_in_beat 
            = (VL_GTS_III(32, (__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__data_size 
                               - VL_MULS_III(32, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__unnamedblk8__DOT__beat, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__bytes_per_beat)), __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__bytes_per_beat)
                ? __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__bytes_per_beat
                : (__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__data_size 
                   - VL_MULS_III(32, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__unnamedblk8__DOT__beat, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__bytes_per_beat)));
        __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i = 0U;
        while (VL_LTS_III(32, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__unnamedblk8__DOT__unnamedblk9__DOT__bytes_in_beat)) {
            __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__unnamedblk11__DOT__byte_idx 
                = (VL_MULS_III(32, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__unnamedblk8__DOT__beat, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__bytes_per_beat) 
                   + __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i);
            if (VL_LTS_III(32, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__unnamedblk11__DOT__byte_idx, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__data_size)) {
                __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__unnamedblk8__DOT__unnamedblk9__DOT__data_beat 
                    = (((~ (0xffULL << (0x3fU & VL_MULS_III(32, (IData)(8U), __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i)))) 
                        & __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__unnamedblk8__DOT__unnamedblk9__DOT__data_beat) 
                       | ((QData)((IData)(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__packet_data.at(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__unnamedblk11__DOT__byte_idx))) 
                          << (0x3fU & VL_MULS_III(32, (IData)(8U), __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i))));
                __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__unnamedblk8__DOT__unnamedblk9__DOT__keep_beat 
                    = ((IData)(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__unnamedblk8__DOT__unnamedblk9__DOT__keep_beat) 
                       | (0xffU & ((IData)(1U) << (7U 
                                                   & __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i))));
            }
            __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i 
                = ((IData)(1U) + __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i);
        }
        vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[0U] 
            = (((IData)(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__header) 
                << 1U) | (__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__unnamedblk8__DOT__beat 
                          == (__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__beats 
                              - (IData)(1U))));
        vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[1U] 
            = (((IData)(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__header) 
                >> 0x1fU) | ((IData)((__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__header 
                                      >> 0x20U)) << 1U));
        vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[2U] 
            = ((0xfffffffeU & vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[2U]) 
               | ((IData)((__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__header 
                           >> 0x20U)) >> 0x1fU));
        vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[2U] 
            = ((1U & vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[2U]) 
               | (((IData)(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__unnamedblk8__DOT__unnamedblk9__DOT__data_beat) 
                   << 9U) | ((IData)(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__unnamedblk8__DOT__unnamedblk9__DOT__keep_beat) 
                             << 1U)));
        vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[3U] 
            = (((1U & ((IData)(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__unnamedblk8__DOT__unnamedblk9__DOT__data_beat) 
                       >> 0x17U)) | ((IData)(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__unnamedblk8__DOT__unnamedblk9__DOT__keep_beat) 
                                     >> 0x1fU)) | (
                                                   (0x1feU 
                                                    & ((IData)(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__unnamedblk8__DOT__unnamedblk9__DOT__data_beat) 
                                                       >> 0x17U)) 
                                                   | ((IData)(
                                                              (__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__unnamedblk8__DOT__unnamedblk9__DOT__data_beat 
                                                               >> 0x20U)) 
                                                      << 9U)));
        vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[4U] 
            = ((0x200U & vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[4U]) 
               | (0x3ffU & ((1U & ((IData)((__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__unnamedblk8__DOT__unnamedblk9__DOT__data_beat 
                                            >> 0x20U)) 
                                   >> 0x17U)) | (0x1feU 
                                                 & ((IData)(
                                                            (__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__unnamedblk8__DOT__unnamedblk9__DOT__data_beat 
                                                             >> 0x20U)) 
                                                    >> 0x17U)))));
        while ((1U & (~ (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__axis_tready)))) {
            co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                                 nullptr, 
                                                                 "@(posedge tb_ingress_queue_manager.clk)", 
                                                                 "../tb/tb_ingress_queue_manager.sv", 
                                                                 471);
            vlSelfRef.__Vm_traceActivity[2U] = 1U;
        }
        __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__unnamedblk8__DOT__beat 
            = ((IData)(1U) + __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__8__unnamedblk8__DOT__beat);
    }
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         475);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[4U] 
        = (0x1ffU & vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[4U]);
    vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[0U] 
        = (0xfffffffeU & vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[0U]);
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         338);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_credit_processing__7__tb_ingress_queue_manager__DOT__unnamedblk1_8__DOT____Vrepeat7 = 0x27U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         338);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_credit_processing__7__tb_ingress_queue_manager__DOT__unnamedblk1_8__DOT____Vrepeat7 = 0x26U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         338);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_credit_processing__7__tb_ingress_queue_manager__DOT__unnamedblk1_8__DOT____Vrepeat7 = 0x25U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         338);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_credit_processing__7__tb_ingress_queue_manager__DOT__unnamedblk1_8__DOT____Vrepeat7 = 0x24U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         338);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_credit_processing__7__tb_ingress_queue_manager__DOT__unnamedblk1_8__DOT____Vrepeat7 = 0x23U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         338);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_credit_processing__7__tb_ingress_queue_manager__DOT__unnamedblk1_8__DOT____Vrepeat7 = 0x22U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         338);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_credit_processing__7__tb_ingress_queue_manager__DOT__unnamedblk1_8__DOT____Vrepeat7 = 0x21U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         338);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_credit_processing__7__tb_ingress_queue_manager__DOT__unnamedblk1_8__DOT____Vrepeat7 = 0x20U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         338);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_credit_processing__7__tb_ingress_queue_manager__DOT__unnamedblk1_8__DOT____Vrepeat7 = 0x1fU;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         338);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_credit_processing__7__tb_ingress_queue_manager__DOT__unnamedblk1_8__DOT____Vrepeat7 = 0x1eU;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         338);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_credit_processing__7__tb_ingress_queue_manager__DOT__unnamedblk1_8__DOT____Vrepeat7 = 0x1dU;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         338);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_credit_processing__7__tb_ingress_queue_manager__DOT__unnamedblk1_8__DOT____Vrepeat7 = 0x1cU;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         338);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_credit_processing__7__tb_ingress_queue_manager__DOT__unnamedblk1_8__DOT____Vrepeat7 = 0x1bU;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         338);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_credit_processing__7__tb_ingress_queue_manager__DOT__unnamedblk1_8__DOT____Vrepeat7 = 0x1aU;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         338);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_credit_processing__7__tb_ingress_queue_manager__DOT__unnamedblk1_8__DOT____Vrepeat7 = 0x19U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         338);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_credit_processing__7__tb_ingress_queue_manager__DOT__unnamedblk1_8__DOT____Vrepeat7 = 0x18U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         338);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_credit_processing__7__tb_ingress_queue_manager__DOT__unnamedblk1_8__DOT____Vrepeat7 = 0x17U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         338);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_credit_processing__7__tb_ingress_queue_manager__DOT__unnamedblk1_8__DOT____Vrepeat7 = 0x16U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         338);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_credit_processing__7__tb_ingress_queue_manager__DOT__unnamedblk1_8__DOT____Vrepeat7 = 0x15U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         338);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_credit_processing__7__tb_ingress_queue_manager__DOT__unnamedblk1_8__DOT____Vrepeat7 = 0x14U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         338);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_credit_processing__7__tb_ingress_queue_manager__DOT__unnamedblk1_8__DOT____Vrepeat7 = 0x13U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         338);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_credit_processing__7__tb_ingress_queue_manager__DOT__unnamedblk1_8__DOT____Vrepeat7 = 0x12U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         338);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_credit_processing__7__tb_ingress_queue_manager__DOT__unnamedblk1_8__DOT____Vrepeat7 = 0x11U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         338);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_credit_processing__7__tb_ingress_queue_manager__DOT__unnamedblk1_8__DOT____Vrepeat7 = 0x10U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         338);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_credit_processing__7__tb_ingress_queue_manager__DOT__unnamedblk1_8__DOT____Vrepeat7 = 0xfU;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         338);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_credit_processing__7__tb_ingress_queue_manager__DOT__unnamedblk1_8__DOT____Vrepeat7 = 0xeU;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         338);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_credit_processing__7__tb_ingress_queue_manager__DOT__unnamedblk1_8__DOT____Vrepeat7 = 0xdU;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         338);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_credit_processing__7__tb_ingress_queue_manager__DOT__unnamedblk1_8__DOT____Vrepeat7 = 0xcU;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         338);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_credit_processing__7__tb_ingress_queue_manager__DOT__unnamedblk1_8__DOT____Vrepeat7 = 0xbU;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         338);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_credit_processing__7__tb_ingress_queue_manager__DOT__unnamedblk1_8__DOT____Vrepeat7 = 0xaU;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         338);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_credit_processing__7__tb_ingress_queue_manager__DOT__unnamedblk1_8__DOT____Vrepeat7 = 9U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         338);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_credit_processing__7__tb_ingress_queue_manager__DOT__unnamedblk1_8__DOT____Vrepeat7 = 8U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         338);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_credit_processing__7__tb_ingress_queue_manager__DOT__unnamedblk1_8__DOT____Vrepeat7 = 7U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         338);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_credit_processing__7__tb_ingress_queue_manager__DOT__unnamedblk1_8__DOT____Vrepeat7 = 6U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         338);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_credit_processing__7__tb_ingress_queue_manager__DOT__unnamedblk1_8__DOT____Vrepeat7 = 5U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         338);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_credit_processing__7__tb_ingress_queue_manager__DOT__unnamedblk1_8__DOT____Vrepeat7 = 4U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         338);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_credit_processing__7__tb_ingress_queue_manager__DOT__unnamedblk1_8__DOT____Vrepeat7 = 3U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         338);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_credit_processing__7__tb_ingress_queue_manager__DOT__unnamedblk1_8__DOT____Vrepeat7 = 2U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         338);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_credit_processing__7__tb_ingress_queue_manager__DOT__unnamedblk1_8__DOT____Vrepeat7 = 1U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         338);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_credit_processing__7__tb_ingress_queue_manager__DOT__unnamedblk1_8__DOT____Vrepeat7 = 0U;
    VL_WRITEF_NX("  Credit processing test PASSED\n",0);
    __Vtask_tb_ingress_queue_manager__DOT__test_packet_conversion__9__unnamedblk4__DOT__i = 0;
    VL_WRITEF_NX("Testing packet format conversion...\n",0);
    vlSelfRef.tb_ingress_queue_manager__DOT__test_packet_conversion__Vstatic__header_data = 0x1000000100ULL;
    vlSelfRef.tb_ingress_queue_manager__DOT__test_packet_conversion__Vstatic__packet_data[0U] = 0x12U;
    __Vtask_tb_ingress_queue_manager__DOT__test_packet_conversion__9__unnamedblk4__DOT__i = 1U;
    vlSelfRef.tb_ingress_queue_manager__DOT__test_packet_conversion__Vstatic__packet_data[1U] = 0x13U;
    __Vtask_tb_ingress_queue_manager__DOT__test_packet_conversion__9__unnamedblk4__DOT__i = 2U;
    vlSelfRef.tb_ingress_queue_manager__DOT__test_packet_conversion__Vstatic__packet_data[2U] = 0x14U;
    __Vtask_tb_ingress_queue_manager__DOT__test_packet_conversion__9__unnamedblk4__DOT__i = 3U;
    vlSelfRef.tb_ingress_queue_manager__DOT__test_packet_conversion__Vstatic__packet_data[3U] = 0x15U;
    __Vtask_tb_ingress_queue_manager__DOT__test_packet_conversion__9__unnamedblk4__DOT__i = 4U;
    vlSelfRef.tb_ingress_queue_manager__DOT__test_packet_conversion__Vstatic__packet_data[4U] = 0x16U;
    __Vtask_tb_ingress_queue_manager__DOT__test_packet_conversion__9__unnamedblk4__DOT__i = 5U;
    vlSelfRef.tb_ingress_queue_manager__DOT__test_packet_conversion__Vstatic__packet_data[5U] = 0x17U;
    __Vtask_tb_ingress_queue_manager__DOT__test_packet_conversion__9__unnamedblk4__DOT__i = 6U;
    vlSelfRef.tb_ingress_queue_manager__DOT__test_packet_conversion__Vstatic__packet_data[6U] = 0x18U;
    __Vtask_tb_ingress_queue_manager__DOT__test_packet_conversion__9__unnamedblk4__DOT__i = 7U;
    vlSelfRef.tb_ingress_queue_manager__DOT__test_packet_conversion__Vstatic__packet_data[7U] = 0x19U;
    __Vtask_tb_ingress_queue_manager__DOT__test_packet_conversion__9__unnamedblk4__DOT__i = 8U;
    vlSelfRef.tb_ingress_queue_manager__DOT__test_packet_conversion__Vstatic__packet_data[8U] = 0x12U;
    __Vtask_tb_ingress_queue_manager__DOT__test_packet_conversion__9__unnamedblk4__DOT__i = 9U;
    vlSelfRef.tb_ingress_queue_manager__DOT__test_packet_conversion__Vstatic__packet_data[9U] = 0x13U;
    __Vtask_tb_ingress_queue_manager__DOT__test_packet_conversion__9__unnamedblk4__DOT__i = 0xaU;
    vlSelfRef.tb_ingress_queue_manager__DOT__test_packet_conversion__Vstatic__packet_data[0xaU] = 0x14U;
    __Vtask_tb_ingress_queue_manager__DOT__test_packet_conversion__9__unnamedblk4__DOT__i = 0xbU;
    vlSelfRef.tb_ingress_queue_manager__DOT__test_packet_conversion__Vstatic__packet_data[0xbU] = 0x15U;
    __Vtask_tb_ingress_queue_manager__DOT__test_packet_conversion__9__unnamedblk4__DOT__i = 0xcU;
    vlSelfRef.tb_ingress_queue_manager__DOT__test_packet_conversion__Vstatic__packet_data[0xcU] = 0x16U;
    __Vtask_tb_ingress_queue_manager__DOT__test_packet_conversion__9__unnamedblk4__DOT__i = 0xdU;
    vlSelfRef.tb_ingress_queue_manager__DOT__test_packet_conversion__Vstatic__packet_data[0xdU] = 0x17U;
    __Vtask_tb_ingress_queue_manager__DOT__test_packet_conversion__9__unnamedblk4__DOT__i = 0xeU;
    vlSelfRef.tb_ingress_queue_manager__DOT__test_packet_conversion__Vstatic__packet_data[0xeU] = 0x18U;
    __Vtask_tb_ingress_queue_manager__DOT__test_packet_conversion__9__unnamedblk4__DOT__i = 0xfU;
    vlSelfRef.tb_ingress_queue_manager__DOT__test_packet_conversion__Vstatic__packet_data[0xfU] = 0x19U;
    __Vtask_tb_ingress_queue_manager__DOT__test_packet_conversion__9__unnamedblk4__DOT__i = 0x10U;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__header 
        = vlSelfRef.tb_ingress_queue_manager__DOT__test_packet_conversion__Vstatic__header_data;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__data_size = 0x10U;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__packet_data 
        = VL_CVT_UNPACK_TO_Q(vlSelfRef.tb_ingress_queue_manager__DOT__test_packet_conversion__Vstatic__packet_data);
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__unnamedblk8__DOT__beat = 0;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__unnamedblk8__DOT__unnamedblk9__DOT__data_beat = 0;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__unnamedblk8__DOT__unnamedblk9__DOT__keep_beat = 0;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__unnamedblk8__DOT__unnamedblk9__DOT__bytes_in_beat = 0;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i = 0;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__unnamedblk11__DOT__byte_idx = 0;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__beats = 0;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__bytes_per_beat = 0;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__bytes_per_beat = 8U;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__beats 
        = VL_DIVS_III(32, ((__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__data_size 
                            + __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__bytes_per_beat) 
                           - (IData)(1U)), __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__bytes_per_beat);
    VL_WRITEF_NX("    [TestBench] Sending packet: size=%0d bytes in %0d beats\n",0,
                 32,__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__data_size,
                 32,__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__beats);
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__unnamedblk8__DOT__beat = 0U;
    while (VL_LTS_III(32, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__unnamedblk8__DOT__beat, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__beats)) {
        __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__unnamedblk8__DOT__unnamedblk9__DOT__data_beat = 0ULL;
        __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__unnamedblk8__DOT__unnamedblk9__DOT__keep_beat = 0U;
        co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                             nullptr, 
                                                             "@(posedge tb_ingress_queue_manager.clk)", 
                                                             "../tb/tb_ingress_queue_manager.sv", 
                                                             448);
        vlSelfRef.__Vm_traceActivity[2U] = 1U;
        vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[4U] 
            = (0x200U | vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[4U]);
        __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__unnamedblk8__DOT__unnamedblk9__DOT__bytes_in_beat 
            = (VL_GTS_III(32, (__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__data_size 
                               - VL_MULS_III(32, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__unnamedblk8__DOT__beat, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__bytes_per_beat)), __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__bytes_per_beat)
                ? __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__bytes_per_beat
                : (__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__data_size 
                   - VL_MULS_III(32, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__unnamedblk8__DOT__beat, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__bytes_per_beat)));
        __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i = 0U;
        while (VL_LTS_III(32, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__unnamedblk8__DOT__unnamedblk9__DOT__bytes_in_beat)) {
            __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__unnamedblk11__DOT__byte_idx 
                = (VL_MULS_III(32, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__unnamedblk8__DOT__beat, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__bytes_per_beat) 
                   + __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i);
            if (VL_LTS_III(32, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__unnamedblk11__DOT__byte_idx, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__data_size)) {
                __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__unnamedblk8__DOT__unnamedblk9__DOT__data_beat 
                    = (((~ (0xffULL << (0x3fU & VL_MULS_III(32, (IData)(8U), __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i)))) 
                        & __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__unnamedblk8__DOT__unnamedblk9__DOT__data_beat) 
                       | ((QData)((IData)(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__packet_data.at(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__unnamedblk11__DOT__byte_idx))) 
                          << (0x3fU & VL_MULS_III(32, (IData)(8U), __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i))));
                __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__unnamedblk8__DOT__unnamedblk9__DOT__keep_beat 
                    = ((IData)(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__unnamedblk8__DOT__unnamedblk9__DOT__keep_beat) 
                       | (0xffU & ((IData)(1U) << (7U 
                                                   & __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i))));
            }
            __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i 
                = ((IData)(1U) + __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i);
        }
        vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[0U] 
            = (((IData)(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__header) 
                << 1U) | (__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__unnamedblk8__DOT__beat 
                          == (__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__beats 
                              - (IData)(1U))));
        vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[1U] 
            = (((IData)(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__header) 
                >> 0x1fU) | ((IData)((__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__header 
                                      >> 0x20U)) << 1U));
        vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[2U] 
            = ((0xfffffffeU & vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[2U]) 
               | ((IData)((__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__header 
                           >> 0x20U)) >> 0x1fU));
        vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[2U] 
            = ((1U & vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[2U]) 
               | (((IData)(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__unnamedblk8__DOT__unnamedblk9__DOT__data_beat) 
                   << 9U) | ((IData)(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__unnamedblk8__DOT__unnamedblk9__DOT__keep_beat) 
                             << 1U)));
        vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[3U] 
            = (((1U & ((IData)(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__unnamedblk8__DOT__unnamedblk9__DOT__data_beat) 
                       >> 0x17U)) | ((IData)(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__unnamedblk8__DOT__unnamedblk9__DOT__keep_beat) 
                                     >> 0x1fU)) | (
                                                   (0x1feU 
                                                    & ((IData)(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__unnamedblk8__DOT__unnamedblk9__DOT__data_beat) 
                                                       >> 0x17U)) 
                                                   | ((IData)(
                                                              (__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__unnamedblk8__DOT__unnamedblk9__DOT__data_beat 
                                                               >> 0x20U)) 
                                                      << 9U)));
        vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[4U] 
            = ((0x200U & vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[4U]) 
               | (0x3ffU & ((1U & ((IData)((__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__unnamedblk8__DOT__unnamedblk9__DOT__data_beat 
                                            >> 0x20U)) 
                                   >> 0x17U)) | (0x1feU 
                                                 & ((IData)(
                                                            (__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__unnamedblk8__DOT__unnamedblk9__DOT__data_beat 
                                                             >> 0x20U)) 
                                                    >> 0x17U)))));
        while ((1U & (~ (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__axis_tready)))) {
            co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                                 nullptr, 
                                                                 "@(posedge tb_ingress_queue_manager.clk)", 
                                                                 "../tb/tb_ingress_queue_manager.sv", 
                                                                 471);
            vlSelfRef.__Vm_traceActivity[2U] = 1U;
        }
        __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__unnamedblk8__DOT__beat 
            = ((IData)(1U) + __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__10__unnamedblk8__DOT__beat);
    }
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         475);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[4U] 
        = (0x1ffU & vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[4U]);
    vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[0U] 
        = (0xfffffffeU & vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[0U]);
    __Vtask_tb_ingress_queue_manager__DOT__wait_for_internal_transmission__11__tb_ingress_queue_manager__DOT__unnamedblk1_11__DOT____Vrepeat10 = 0;
    while ((1U & (~ (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__internal_valid)))) {
        co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                             nullptr, 
                                                             "@(posedge tb_ingress_queue_manager.clk)", 
                                                             "../tb/tb_ingress_queue_manager.sv", 
                                                             483);
        vlSelfRef.__Vm_traceActivity[2U] = 1U;
    }
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         486);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__wait_for_internal_transmission__11__tb_ingress_queue_manager__DOT__unnamedblk1_11__DOT____Vrepeat10 = 1U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         486);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__wait_for_internal_transmission__11__tb_ingress_queue_manager__DOT__unnamedblk1_11__DOT____Vrepeat10 = 0U;
    VL_WRITEF_NX("  Packet conversion test PASSED\n",0);
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__unnamedblk5__DOT__q = 0;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__unnamedblk5__DOT__unnamedblk6__DOT__header_data = 0;
    for (int __Vi0 = 0; __Vi0 < 4; ++__Vi0) {
        __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__unnamedblk5__DOT__unnamedblk6__DOT__packet_data[__Vi0] = 0;
    }
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__unnamedblk5__DOT__unnamedblk6__DOT__unnamedblk7__DOT__i = 0;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__tb_ingress_queue_manager__DOT__unnamedblk5__DOT__unnamedblk6__DOT__unnamedblk1_9__DOT____Vrepeat8 = 0;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__tb_ingress_queue_manager__DOT__unnamedblk1_10__DOT____Vrepeat9 = 0;
    VL_WRITEF_NX("Testing queue management...\n",0);
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__unnamedblk5__DOT__unnamedblk6__DOT__header_data = 0x400000000ULL;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__unnamedblk5__DOT__unnamedblk6__DOT__packet_data[0U] = 0x10U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__unnamedblk5__DOT__unnamedblk6__DOT__unnamedblk7__DOT__i = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__unnamedblk5__DOT__unnamedblk6__DOT__packet_data[1U] = 0x11U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__unnamedblk5__DOT__unnamedblk6__DOT__unnamedblk7__DOT__i = 2U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__unnamedblk5__DOT__unnamedblk6__DOT__packet_data[2U] = 0x12U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__unnamedblk5__DOT__unnamedblk6__DOT__unnamedblk7__DOT__i = 3U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__unnamedblk5__DOT__unnamedblk6__DOT__packet_data[3U] = 0x13U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__unnamedblk5__DOT__unnamedblk6__DOT__unnamedblk7__DOT__i = 4U;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__header 
        = __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__unnamedblk5__DOT__unnamedblk6__DOT__header_data;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__data_size = 4U;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__packet_data 
        = VL_CVT_UNPACK_TO_Q(__Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__unnamedblk5__DOT__unnamedblk6__DOT__packet_data);
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__beat = 0;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__data_beat = 0;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__keep_beat = 0;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__bytes_in_beat = 0;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i = 0;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__unnamedblk11__DOT__byte_idx = 0;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__beats = 0;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__bytes_per_beat = 0;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__bytes_per_beat = 8U;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__beats 
        = VL_DIVS_III(32, ((__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__data_size 
                            + __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__bytes_per_beat) 
                           - (IData)(1U)), __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__bytes_per_beat);
    VL_WRITEF_NX("    [TestBench] Sending packet: size=%0d bytes in %0d beats\n",0,
                 32,__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__data_size,
                 32,__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__beats);
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__beat = 0U;
    while (VL_LTS_III(32, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__beat, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__beats)) {
        __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__data_beat = 0ULL;
        __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__keep_beat = 0U;
        co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                             nullptr, 
                                                             "@(posedge tb_ingress_queue_manager.clk)", 
                                                             "../tb/tb_ingress_queue_manager.sv", 
                                                             448);
        vlSelfRef.__Vm_traceActivity[2U] = 1U;
        vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[4U] 
            = (0x200U | vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[4U]);
        __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__bytes_in_beat 
            = (VL_GTS_III(32, (__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__data_size 
                               - VL_MULS_III(32, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__beat, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__bytes_per_beat)), __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__bytes_per_beat)
                ? __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__bytes_per_beat
                : (__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__data_size 
                   - VL_MULS_III(32, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__beat, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__bytes_per_beat)));
        __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i = 0U;
        while (VL_LTS_III(32, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__bytes_in_beat)) {
            __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__unnamedblk11__DOT__byte_idx 
                = (VL_MULS_III(32, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__beat, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__bytes_per_beat) 
                   + __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i);
            if (VL_LTS_III(32, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__unnamedblk11__DOT__byte_idx, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__data_size)) {
                __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__data_beat 
                    = (((~ (0xffULL << (0x3fU & VL_MULS_III(32, (IData)(8U), __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i)))) 
                        & __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__data_beat) 
                       | ((QData)((IData)(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__packet_data.at(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__unnamedblk11__DOT__byte_idx))) 
                          << (0x3fU & VL_MULS_III(32, (IData)(8U), __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i))));
                __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__keep_beat 
                    = ((IData)(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__keep_beat) 
                       | (0xffU & ((IData)(1U) << (7U 
                                                   & __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i))));
            }
            __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i 
                = ((IData)(1U) + __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i);
        }
        vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[0U] 
            = (((IData)(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__header) 
                << 1U) | (__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__beat 
                          == (__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__beats 
                              - (IData)(1U))));
        vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[1U] 
            = (((IData)(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__header) 
                >> 0x1fU) | ((IData)((__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__header 
                                      >> 0x20U)) << 1U));
        vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[2U] 
            = ((0xfffffffeU & vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[2U]) 
               | ((IData)((__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__header 
                           >> 0x20U)) >> 0x1fU));
        vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[2U] 
            = ((1U & vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[2U]) 
               | (((IData)(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__data_beat) 
                   << 9U) | ((IData)(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__keep_beat) 
                             << 1U)));
        vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[3U] 
            = (((1U & ((IData)(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__data_beat) 
                       >> 0x17U)) | ((IData)(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__keep_beat) 
                                     >> 0x1fU)) | (
                                                   (0x1feU 
                                                    & ((IData)(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__data_beat) 
                                                       >> 0x17U)) 
                                                   | ((IData)(
                                                              (__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__data_beat 
                                                               >> 0x20U)) 
                                                      << 9U)));
        vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[4U] 
            = ((0x200U & vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[4U]) 
               | (0x3ffU & ((1U & ((IData)((__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__data_beat 
                                            >> 0x20U)) 
                                   >> 0x17U)) | (0x1feU 
                                                 & ((IData)(
                                                            (__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__data_beat 
                                                             >> 0x20U)) 
                                                    >> 0x17U)))));
        while ((1U & (~ (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__axis_tready)))) {
            co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                                 nullptr, 
                                                                 "@(posedge tb_ingress_queue_manager.clk)", 
                                                                 "../tb/tb_ingress_queue_manager.sv", 
                                                                 471);
            vlSelfRef.__Vm_traceActivity[2U] = 1U;
        }
        __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__beat 
            = ((IData)(1U) + __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__beat);
    }
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         475);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[4U] 
        = (0x1ffU & vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[4U]);
    vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[0U] 
        = (0xfffffffeU & vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[0U]);
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         388);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__tb_ingress_queue_manager__DOT__unnamedblk5__DOT__unnamedblk6__DOT__unnamedblk1_9__DOT____Vrepeat8 = 9U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         388);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__tb_ingress_queue_manager__DOT__unnamedblk5__DOT__unnamedblk6__DOT__unnamedblk1_9__DOT____Vrepeat8 = 8U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         388);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__tb_ingress_queue_manager__DOT__unnamedblk5__DOT__unnamedblk6__DOT__unnamedblk1_9__DOT____Vrepeat8 = 7U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         388);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__tb_ingress_queue_manager__DOT__unnamedblk5__DOT__unnamedblk6__DOT__unnamedblk1_9__DOT____Vrepeat8 = 6U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         388);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__tb_ingress_queue_manager__DOT__unnamedblk5__DOT__unnamedblk6__DOT__unnamedblk1_9__DOT____Vrepeat8 = 5U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         388);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__tb_ingress_queue_manager__DOT__unnamedblk5__DOT__unnamedblk6__DOT__unnamedblk1_9__DOT____Vrepeat8 = 4U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         388);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__tb_ingress_queue_manager__DOT__unnamedblk5__DOT__unnamedblk6__DOT__unnamedblk1_9__DOT____Vrepeat8 = 3U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         388);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__tb_ingress_queue_manager__DOT__unnamedblk5__DOT__unnamedblk6__DOT__unnamedblk1_9__DOT____Vrepeat8 = 2U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         388);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__tb_ingress_queue_manager__DOT__unnamedblk5__DOT__unnamedblk6__DOT__unnamedblk1_9__DOT____Vrepeat8 = 1U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         388);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__tb_ingress_queue_manager__DOT__unnamedblk5__DOT__unnamedblk6__DOT__unnamedblk1_9__DOT____Vrepeat8 = 0U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__unnamedblk5__DOT__q = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__unnamedblk5__DOT__unnamedblk6__DOT__header_data = 0x400000100ULL;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__unnamedblk5__DOT__unnamedblk6__DOT__packet_data[0U] = 0x11U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__unnamedblk5__DOT__unnamedblk6__DOT__unnamedblk7__DOT__i = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__unnamedblk5__DOT__unnamedblk6__DOT__packet_data[1U] = 0x12U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__unnamedblk5__DOT__unnamedblk6__DOT__unnamedblk7__DOT__i = 2U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__unnamedblk5__DOT__unnamedblk6__DOT__packet_data[2U] = 0x13U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__unnamedblk5__DOT__unnamedblk6__DOT__unnamedblk7__DOT__i = 3U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__unnamedblk5__DOT__unnamedblk6__DOT__packet_data[3U] = 0x14U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__unnamedblk5__DOT__unnamedblk6__DOT__unnamedblk7__DOT__i = 4U;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__header 
        = __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__unnamedblk5__DOT__unnamedblk6__DOT__header_data;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__data_size = 4U;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__packet_data 
        = VL_CVT_UNPACK_TO_Q(__Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__unnamedblk5__DOT__unnamedblk6__DOT__packet_data);
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__beat = 0;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__data_beat = 0;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__keep_beat = 0;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__bytes_in_beat = 0;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i = 0;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__unnamedblk11__DOT__byte_idx = 0;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__beats = 0;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__bytes_per_beat = 0;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__bytes_per_beat = 8U;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__beats 
        = VL_DIVS_III(32, ((__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__data_size 
                            + __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__bytes_per_beat) 
                           - (IData)(1U)), __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__bytes_per_beat);
    VL_WRITEF_NX("    [TestBench] Sending packet: size=%0d bytes in %0d beats\n",0,
                 32,__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__data_size,
                 32,__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__beats);
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__beat = 0U;
    while (VL_LTS_III(32, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__beat, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__beats)) {
        __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__data_beat = 0ULL;
        __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__keep_beat = 0U;
        co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                             nullptr, 
                                                             "@(posedge tb_ingress_queue_manager.clk)", 
                                                             "../tb/tb_ingress_queue_manager.sv", 
                                                             448);
        vlSelfRef.__Vm_traceActivity[2U] = 1U;
        vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[4U] 
            = (0x200U | vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[4U]);
        __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__bytes_in_beat 
            = (VL_GTS_III(32, (__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__data_size 
                               - VL_MULS_III(32, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__beat, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__bytes_per_beat)), __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__bytes_per_beat)
                ? __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__bytes_per_beat
                : (__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__data_size 
                   - VL_MULS_III(32, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__beat, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__bytes_per_beat)));
        __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i = 0U;
        while (VL_LTS_III(32, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__bytes_in_beat)) {
            __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__unnamedblk11__DOT__byte_idx 
                = (VL_MULS_III(32, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__beat, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__bytes_per_beat) 
                   + __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i);
            if (VL_LTS_III(32, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__unnamedblk11__DOT__byte_idx, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__data_size)) {
                __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__data_beat 
                    = (((~ (0xffULL << (0x3fU & VL_MULS_III(32, (IData)(8U), __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i)))) 
                        & __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__data_beat) 
                       | ((QData)((IData)(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__packet_data.at(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__unnamedblk11__DOT__byte_idx))) 
                          << (0x3fU & VL_MULS_III(32, (IData)(8U), __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i))));
                __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__keep_beat 
                    = ((IData)(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__keep_beat) 
                       | (0xffU & ((IData)(1U) << (7U 
                                                   & __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i))));
            }
            __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i 
                = ((IData)(1U) + __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i);
        }
        vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[0U] 
            = (((IData)(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__header) 
                << 1U) | (__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__beat 
                          == (__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__beats 
                              - (IData)(1U))));
        vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[1U] 
            = (((IData)(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__header) 
                >> 0x1fU) | ((IData)((__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__header 
                                      >> 0x20U)) << 1U));
        vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[2U] 
            = ((0xfffffffeU & vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[2U]) 
               | ((IData)((__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__header 
                           >> 0x20U)) >> 0x1fU));
        vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[2U] 
            = ((1U & vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[2U]) 
               | (((IData)(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__data_beat) 
                   << 9U) | ((IData)(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__keep_beat) 
                             << 1U)));
        vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[3U] 
            = (((1U & ((IData)(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__data_beat) 
                       >> 0x17U)) | ((IData)(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__keep_beat) 
                                     >> 0x1fU)) | (
                                                   (0x1feU 
                                                    & ((IData)(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__data_beat) 
                                                       >> 0x17U)) 
                                                   | ((IData)(
                                                              (__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__data_beat 
                                                               >> 0x20U)) 
                                                      << 9U)));
        vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[4U] 
            = ((0x200U & vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[4U]) 
               | (0x3ffU & ((1U & ((IData)((__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__data_beat 
                                            >> 0x20U)) 
                                   >> 0x17U)) | (0x1feU 
                                                 & ((IData)(
                                                            (__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__data_beat 
                                                             >> 0x20U)) 
                                                    >> 0x17U)))));
        while ((1U & (~ (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__axis_tready)))) {
            co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                                 nullptr, 
                                                                 "@(posedge tb_ingress_queue_manager.clk)", 
                                                                 "../tb/tb_ingress_queue_manager.sv", 
                                                                 471);
            vlSelfRef.__Vm_traceActivity[2U] = 1U;
        }
        __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__beat 
            = ((IData)(1U) + __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__beat);
    }
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         475);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[4U] 
        = (0x1ffU & vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[4U]);
    vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[0U] 
        = (0xfffffffeU & vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[0U]);
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         388);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__tb_ingress_queue_manager__DOT__unnamedblk5__DOT__unnamedblk6__DOT__unnamedblk1_9__DOT____Vrepeat8 = 9U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         388);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__tb_ingress_queue_manager__DOT__unnamedblk5__DOT__unnamedblk6__DOT__unnamedblk1_9__DOT____Vrepeat8 = 8U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         388);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__tb_ingress_queue_manager__DOT__unnamedblk5__DOT__unnamedblk6__DOT__unnamedblk1_9__DOT____Vrepeat8 = 7U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         388);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__tb_ingress_queue_manager__DOT__unnamedblk5__DOT__unnamedblk6__DOT__unnamedblk1_9__DOT____Vrepeat8 = 6U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         388);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__tb_ingress_queue_manager__DOT__unnamedblk5__DOT__unnamedblk6__DOT__unnamedblk1_9__DOT____Vrepeat8 = 5U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         388);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__tb_ingress_queue_manager__DOT__unnamedblk5__DOT__unnamedblk6__DOT__unnamedblk1_9__DOT____Vrepeat8 = 4U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         388);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__tb_ingress_queue_manager__DOT__unnamedblk5__DOT__unnamedblk6__DOT__unnamedblk1_9__DOT____Vrepeat8 = 3U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         388);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__tb_ingress_queue_manager__DOT__unnamedblk5__DOT__unnamedblk6__DOT__unnamedblk1_9__DOT____Vrepeat8 = 2U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         388);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__tb_ingress_queue_manager__DOT__unnamedblk5__DOT__unnamedblk6__DOT__unnamedblk1_9__DOT____Vrepeat8 = 1U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         388);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__tb_ingress_queue_manager__DOT__unnamedblk5__DOT__unnamedblk6__DOT__unnamedblk1_9__DOT____Vrepeat8 = 0U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__unnamedblk5__DOT__q = 2U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__unnamedblk5__DOT__unnamedblk6__DOT__header_data = 0x400000200ULL;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__unnamedblk5__DOT__unnamedblk6__DOT__packet_data[0U] = 0x12U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__unnamedblk5__DOT__unnamedblk6__DOT__unnamedblk7__DOT__i = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__unnamedblk5__DOT__unnamedblk6__DOT__packet_data[1U] = 0x13U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__unnamedblk5__DOT__unnamedblk6__DOT__unnamedblk7__DOT__i = 2U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__unnamedblk5__DOT__unnamedblk6__DOT__packet_data[2U] = 0x14U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__unnamedblk5__DOT__unnamedblk6__DOT__unnamedblk7__DOT__i = 3U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__unnamedblk5__DOT__unnamedblk6__DOT__packet_data[3U] = 0x15U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__unnamedblk5__DOT__unnamedblk6__DOT__unnamedblk7__DOT__i = 4U;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__header 
        = __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__unnamedblk5__DOT__unnamedblk6__DOT__header_data;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__data_size = 4U;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__packet_data 
        = VL_CVT_UNPACK_TO_Q(__Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__unnamedblk5__DOT__unnamedblk6__DOT__packet_data);
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__beat = 0;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__data_beat = 0;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__keep_beat = 0;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__bytes_in_beat = 0;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i = 0;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__unnamedblk11__DOT__byte_idx = 0;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__beats = 0;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__bytes_per_beat = 0;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__bytes_per_beat = 8U;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__beats 
        = VL_DIVS_III(32, ((__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__data_size 
                            + __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__bytes_per_beat) 
                           - (IData)(1U)), __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__bytes_per_beat);
    VL_WRITEF_NX("    [TestBench] Sending packet: size=%0d bytes in %0d beats\n",0,
                 32,__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__data_size,
                 32,__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__beats);
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__beat = 0U;
    while (VL_LTS_III(32, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__beat, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__beats)) {
        __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__data_beat = 0ULL;
        __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__keep_beat = 0U;
        co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                             nullptr, 
                                                             "@(posedge tb_ingress_queue_manager.clk)", 
                                                             "../tb/tb_ingress_queue_manager.sv", 
                                                             448);
        vlSelfRef.__Vm_traceActivity[2U] = 1U;
        vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[4U] 
            = (0x200U | vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[4U]);
        __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__bytes_in_beat 
            = (VL_GTS_III(32, (__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__data_size 
                               - VL_MULS_III(32, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__beat, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__bytes_per_beat)), __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__bytes_per_beat)
                ? __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__bytes_per_beat
                : (__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__data_size 
                   - VL_MULS_III(32, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__beat, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__bytes_per_beat)));
        __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i = 0U;
        while (VL_LTS_III(32, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__bytes_in_beat)) {
            __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__unnamedblk11__DOT__byte_idx 
                = (VL_MULS_III(32, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__beat, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__bytes_per_beat) 
                   + __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i);
            if (VL_LTS_III(32, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__unnamedblk11__DOT__byte_idx, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__data_size)) {
                __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__data_beat 
                    = (((~ (0xffULL << (0x3fU & VL_MULS_III(32, (IData)(8U), __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i)))) 
                        & __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__data_beat) 
                       | ((QData)((IData)(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__packet_data.at(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__unnamedblk11__DOT__byte_idx))) 
                          << (0x3fU & VL_MULS_III(32, (IData)(8U), __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i))));
                __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__keep_beat 
                    = ((IData)(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__keep_beat) 
                       | (0xffU & ((IData)(1U) << (7U 
                                                   & __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i))));
            }
            __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i 
                = ((IData)(1U) + __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i);
        }
        vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[0U] 
            = (((IData)(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__header) 
                << 1U) | (__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__beat 
                          == (__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__beats 
                              - (IData)(1U))));
        vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[1U] 
            = (((IData)(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__header) 
                >> 0x1fU) | ((IData)((__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__header 
                                      >> 0x20U)) << 1U));
        vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[2U] 
            = ((0xfffffffeU & vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[2U]) 
               | ((IData)((__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__header 
                           >> 0x20U)) >> 0x1fU));
        vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[2U] 
            = ((1U & vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[2U]) 
               | (((IData)(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__data_beat) 
                   << 9U) | ((IData)(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__keep_beat) 
                             << 1U)));
        vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[3U] 
            = (((1U & ((IData)(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__data_beat) 
                       >> 0x17U)) | ((IData)(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__keep_beat) 
                                     >> 0x1fU)) | (
                                                   (0x1feU 
                                                    & ((IData)(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__data_beat) 
                                                       >> 0x17U)) 
                                                   | ((IData)(
                                                              (__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__data_beat 
                                                               >> 0x20U)) 
                                                      << 9U)));
        vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[4U] 
            = ((0x200U & vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[4U]) 
               | (0x3ffU & ((1U & ((IData)((__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__data_beat 
                                            >> 0x20U)) 
                                   >> 0x17U)) | (0x1feU 
                                                 & ((IData)(
                                                            (__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__unnamedblk9__DOT__data_beat 
                                                             >> 0x20U)) 
                                                    >> 0x17U)))));
        while ((1U & (~ (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__axis_tready)))) {
            co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                                 nullptr, 
                                                                 "@(posedge tb_ingress_queue_manager.clk)", 
                                                                 "../tb/tb_ingress_queue_manager.sv", 
                                                                 471);
            vlSelfRef.__Vm_traceActivity[2U] = 1U;
        }
        __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__beat 
            = ((IData)(1U) + __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__13__unnamedblk8__DOT__beat);
    }
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         475);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[4U] 
        = (0x1ffU & vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[4U]);
    vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[0U] 
        = (0xfffffffeU & vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[0U]);
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         388);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__tb_ingress_queue_manager__DOT__unnamedblk5__DOT__unnamedblk6__DOT__unnamedblk1_9__DOT____Vrepeat8 = 9U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         388);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__tb_ingress_queue_manager__DOT__unnamedblk5__DOT__unnamedblk6__DOT__unnamedblk1_9__DOT____Vrepeat8 = 8U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         388);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__tb_ingress_queue_manager__DOT__unnamedblk5__DOT__unnamedblk6__DOT__unnamedblk1_9__DOT____Vrepeat8 = 7U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         388);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__tb_ingress_queue_manager__DOT__unnamedblk5__DOT__unnamedblk6__DOT__unnamedblk1_9__DOT____Vrepeat8 = 6U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         388);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__tb_ingress_queue_manager__DOT__unnamedblk5__DOT__unnamedblk6__DOT__unnamedblk1_9__DOT____Vrepeat8 = 5U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         388);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__tb_ingress_queue_manager__DOT__unnamedblk5__DOT__unnamedblk6__DOT__unnamedblk1_9__DOT____Vrepeat8 = 4U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         388);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__tb_ingress_queue_manager__DOT__unnamedblk5__DOT__unnamedblk6__DOT__unnamedblk1_9__DOT____Vrepeat8 = 3U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         388);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__tb_ingress_queue_manager__DOT__unnamedblk5__DOT__unnamedblk6__DOT__unnamedblk1_9__DOT____Vrepeat8 = 2U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         388);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__tb_ingress_queue_manager__DOT__unnamedblk5__DOT__unnamedblk6__DOT__unnamedblk1_9__DOT____Vrepeat8 = 1U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         388);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__tb_ingress_queue_manager__DOT__unnamedblk5__DOT__unnamedblk6__DOT__unnamedblk1_9__DOT____Vrepeat8 = 0U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__unnamedblk5__DOT__q = 3U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         391);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__tb_ingress_queue_manager__DOT__unnamedblk1_10__DOT____Vrepeat9 = 0x27U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         391);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__tb_ingress_queue_manager__DOT__unnamedblk1_10__DOT____Vrepeat9 = 0x26U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         391);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__tb_ingress_queue_manager__DOT__unnamedblk1_10__DOT____Vrepeat9 = 0x25U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         391);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__tb_ingress_queue_manager__DOT__unnamedblk1_10__DOT____Vrepeat9 = 0x24U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         391);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__tb_ingress_queue_manager__DOT__unnamedblk1_10__DOT____Vrepeat9 = 0x23U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         391);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__tb_ingress_queue_manager__DOT__unnamedblk1_10__DOT____Vrepeat9 = 0x22U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         391);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__tb_ingress_queue_manager__DOT__unnamedblk1_10__DOT____Vrepeat9 = 0x21U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         391);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__tb_ingress_queue_manager__DOT__unnamedblk1_10__DOT____Vrepeat9 = 0x20U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         391);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__tb_ingress_queue_manager__DOT__unnamedblk1_10__DOT____Vrepeat9 = 0x1fU;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         391);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__tb_ingress_queue_manager__DOT__unnamedblk1_10__DOT____Vrepeat9 = 0x1eU;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         391);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__tb_ingress_queue_manager__DOT__unnamedblk1_10__DOT____Vrepeat9 = 0x1dU;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         391);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__tb_ingress_queue_manager__DOT__unnamedblk1_10__DOT____Vrepeat9 = 0x1cU;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         391);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__tb_ingress_queue_manager__DOT__unnamedblk1_10__DOT____Vrepeat9 = 0x1bU;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         391);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__tb_ingress_queue_manager__DOT__unnamedblk1_10__DOT____Vrepeat9 = 0x1aU;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         391);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__tb_ingress_queue_manager__DOT__unnamedblk1_10__DOT____Vrepeat9 = 0x19U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         391);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__tb_ingress_queue_manager__DOT__unnamedblk1_10__DOT____Vrepeat9 = 0x18U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         391);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__tb_ingress_queue_manager__DOT__unnamedblk1_10__DOT____Vrepeat9 = 0x17U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         391);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__tb_ingress_queue_manager__DOT__unnamedblk1_10__DOT____Vrepeat9 = 0x16U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         391);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__tb_ingress_queue_manager__DOT__unnamedblk1_10__DOT____Vrepeat9 = 0x15U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         391);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__tb_ingress_queue_manager__DOT__unnamedblk1_10__DOT____Vrepeat9 = 0x14U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         391);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__tb_ingress_queue_manager__DOT__unnamedblk1_10__DOT____Vrepeat9 = 0x13U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         391);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__tb_ingress_queue_manager__DOT__unnamedblk1_10__DOT____Vrepeat9 = 0x12U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         391);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__tb_ingress_queue_manager__DOT__unnamedblk1_10__DOT____Vrepeat9 = 0x11U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         391);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__tb_ingress_queue_manager__DOT__unnamedblk1_10__DOT____Vrepeat9 = 0x10U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         391);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__tb_ingress_queue_manager__DOT__unnamedblk1_10__DOT____Vrepeat9 = 0xfU;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         391);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__tb_ingress_queue_manager__DOT__unnamedblk1_10__DOT____Vrepeat9 = 0xeU;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         391);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__tb_ingress_queue_manager__DOT__unnamedblk1_10__DOT____Vrepeat9 = 0xdU;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         391);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__tb_ingress_queue_manager__DOT__unnamedblk1_10__DOT____Vrepeat9 = 0xcU;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         391);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__tb_ingress_queue_manager__DOT__unnamedblk1_10__DOT____Vrepeat9 = 0xbU;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         391);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__tb_ingress_queue_manager__DOT__unnamedblk1_10__DOT____Vrepeat9 = 0xaU;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         391);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__tb_ingress_queue_manager__DOT__unnamedblk1_10__DOT____Vrepeat9 = 9U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         391);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__tb_ingress_queue_manager__DOT__unnamedblk1_10__DOT____Vrepeat9 = 8U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         391);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__tb_ingress_queue_manager__DOT__unnamedblk1_10__DOT____Vrepeat9 = 7U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         391);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__tb_ingress_queue_manager__DOT__unnamedblk1_10__DOT____Vrepeat9 = 6U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         391);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__tb_ingress_queue_manager__DOT__unnamedblk1_10__DOT____Vrepeat9 = 5U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         391);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__tb_ingress_queue_manager__DOT__unnamedblk1_10__DOT____Vrepeat9 = 4U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         391);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__tb_ingress_queue_manager__DOT__unnamedblk1_10__DOT____Vrepeat9 = 3U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         391);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__tb_ingress_queue_manager__DOT__unnamedblk1_10__DOT____Vrepeat9 = 2U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         391);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__tb_ingress_queue_manager__DOT__unnamedblk1_10__DOT____Vrepeat9 = 1U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         391);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__test_queue_management__12__tb_ingress_queue_manager__DOT__unnamedblk1_10__DOT____Vrepeat9 = 0U;
    VL_WRITEF_NX("  Queue management test PASSED\n",0);
    VL_WRITEF_NX("Testing internal bus transmission...\n",0);
    vlSelfRef.tb_ingress_queue_manager__DOT__test_internal_transmission__Vstatic__header_data = 0x400000301ULL;
    vlSelfRef.tb_ingress_queue_manager__DOT__test_internal_transmission__Vstatic__packet_data[0U] = 0xffU;
    vlSelfRef.tb_ingress_queue_manager__DOT__test_internal_transmission__Vstatic__packet_data[1U] = 0xeeU;
    vlSelfRef.tb_ingress_queue_manager__DOT__test_internal_transmission__Vstatic__packet_data[2U] = 0xddU;
    vlSelfRef.tb_ingress_queue_manager__DOT__test_internal_transmission__Vstatic__packet_data[3U] = 0xccU;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__header 
        = vlSelfRef.tb_ingress_queue_manager__DOT__test_internal_transmission__Vstatic__header_data;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__data_size = 4U;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__packet_data 
        = VL_CVT_UNPACK_TO_Q(vlSelfRef.tb_ingress_queue_manager__DOT__test_internal_transmission__Vstatic__packet_data);
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__unnamedblk8__DOT__beat = 0;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__unnamedblk8__DOT__unnamedblk9__DOT__data_beat = 0;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__unnamedblk8__DOT__unnamedblk9__DOT__keep_beat = 0;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__unnamedblk8__DOT__unnamedblk9__DOT__bytes_in_beat = 0;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i = 0;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__unnamedblk11__DOT__byte_idx = 0;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__beats = 0;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__bytes_per_beat = 0;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__bytes_per_beat = 8U;
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__beats 
        = VL_DIVS_III(32, ((__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__data_size 
                            + __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__bytes_per_beat) 
                           - (IData)(1U)), __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__bytes_per_beat);
    VL_WRITEF_NX("    [TestBench] Sending packet: size=%0d bytes in %0d beats\n",0,
                 32,__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__data_size,
                 32,__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__beats);
    __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__unnamedblk8__DOT__beat = 0U;
    while (VL_LTS_III(32, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__unnamedblk8__DOT__beat, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__beats)) {
        __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__unnamedblk8__DOT__unnamedblk9__DOT__data_beat = 0ULL;
        __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__unnamedblk8__DOT__unnamedblk9__DOT__keep_beat = 0U;
        co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                             nullptr, 
                                                             "@(posedge tb_ingress_queue_manager.clk)", 
                                                             "../tb/tb_ingress_queue_manager.sv", 
                                                             448);
        vlSelfRef.__Vm_traceActivity[2U] = 1U;
        vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[4U] 
            = (0x200U | vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[4U]);
        __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__unnamedblk8__DOT__unnamedblk9__DOT__bytes_in_beat 
            = (VL_GTS_III(32, (__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__data_size 
                               - VL_MULS_III(32, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__unnamedblk8__DOT__beat, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__bytes_per_beat)), __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__bytes_per_beat)
                ? __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__bytes_per_beat
                : (__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__data_size 
                   - VL_MULS_III(32, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__unnamedblk8__DOT__beat, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__bytes_per_beat)));
        __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i = 0U;
        while (VL_LTS_III(32, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__unnamedblk8__DOT__unnamedblk9__DOT__bytes_in_beat)) {
            __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__unnamedblk11__DOT__byte_idx 
                = (VL_MULS_III(32, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__unnamedblk8__DOT__beat, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__bytes_per_beat) 
                   + __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i);
            if (VL_LTS_III(32, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__unnamedblk11__DOT__byte_idx, __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__data_size)) {
                __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__unnamedblk8__DOT__unnamedblk9__DOT__data_beat 
                    = (((~ (0xffULL << (0x3fU & VL_MULS_III(32, (IData)(8U), __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i)))) 
                        & __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__unnamedblk8__DOT__unnamedblk9__DOT__data_beat) 
                       | ((QData)((IData)(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__packet_data.at(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__unnamedblk11__DOT__byte_idx))) 
                          << (0x3fU & VL_MULS_III(32, (IData)(8U), __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i))));
                __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__unnamedblk8__DOT__unnamedblk9__DOT__keep_beat 
                    = ((IData)(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__unnamedblk8__DOT__unnamedblk9__DOT__keep_beat) 
                       | (0xffU & ((IData)(1U) << (7U 
                                                   & __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i))));
            }
            __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i 
                = ((IData)(1U) + __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__unnamedblk8__DOT__unnamedblk9__DOT__unnamedblk10__DOT__i);
        }
        vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[0U] 
            = (((IData)(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__header) 
                << 1U) | (__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__unnamedblk8__DOT__beat 
                          == (__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__beats 
                              - (IData)(1U))));
        vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[1U] 
            = (((IData)(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__header) 
                >> 0x1fU) | ((IData)((__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__header 
                                      >> 0x20U)) << 1U));
        vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[2U] 
            = ((0xfffffffeU & vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[2U]) 
               | ((IData)((__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__header 
                           >> 0x20U)) >> 0x1fU));
        vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[2U] 
            = ((1U & vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[2U]) 
               | (((IData)(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__unnamedblk8__DOT__unnamedblk9__DOT__data_beat) 
                   << 9U) | ((IData)(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__unnamedblk8__DOT__unnamedblk9__DOT__keep_beat) 
                             << 1U)));
        vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[3U] 
            = (((1U & ((IData)(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__unnamedblk8__DOT__unnamedblk9__DOT__data_beat) 
                       >> 0x17U)) | ((IData)(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__unnamedblk8__DOT__unnamedblk9__DOT__keep_beat) 
                                     >> 0x1fU)) | (
                                                   (0x1feU 
                                                    & ((IData)(__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__unnamedblk8__DOT__unnamedblk9__DOT__data_beat) 
                                                       >> 0x17U)) 
                                                   | ((IData)(
                                                              (__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__unnamedblk8__DOT__unnamedblk9__DOT__data_beat 
                                                               >> 0x20U)) 
                                                      << 9U)));
        vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[4U] 
            = ((0x200U & vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[4U]) 
               | (0x3ffU & ((1U & ((IData)((__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__unnamedblk8__DOT__unnamedblk9__DOT__data_beat 
                                            >> 0x20U)) 
                                   >> 0x17U)) | (0x1feU 
                                                 & ((IData)(
                                                            (__Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__unnamedblk8__DOT__unnamedblk9__DOT__data_beat 
                                                             >> 0x20U)) 
                                                    >> 0x17U)))));
        while ((1U & (~ (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__axis_tready)))) {
            co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                                 nullptr, 
                                                                 "@(posedge tb_ingress_queue_manager.clk)", 
                                                                 "../tb/tb_ingress_queue_manager.sv", 
                                                                 471);
            vlSelfRef.__Vm_traceActivity[2U] = 1U;
        }
        __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__unnamedblk8__DOT__beat 
            = ((IData)(1U) + __Vtask_tb_ingress_queue_manager__DOT__send_axis_packet__15__unnamedblk8__DOT__beat);
    }
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         475);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[4U] 
        = (0x1ffU & vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[4U]);
    vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[0U] 
        = (0xfffffffeU & vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[0U]);
    __Vtask_tb_ingress_queue_manager__DOT__wait_for_internal_transmission__16__tb_ingress_queue_manager__DOT__unnamedblk1_11__DOT____Vrepeat10 = 0;
    while ((1U & (~ (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__internal_valid)))) {
        co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                             nullptr, 
                                                             "@(posedge tb_ingress_queue_manager.clk)", 
                                                             "../tb/tb_ingress_queue_manager.sv", 
                                                             483);
        vlSelfRef.__Vm_traceActivity[2U] = 1U;
    }
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         486);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__wait_for_internal_transmission__16__tb_ingress_queue_manager__DOT__unnamedblk1_11__DOT____Vrepeat10 = 1U;
    co_await vlSelfRef.__VtrigSched_hb4669660__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_ingress_queue_manager.clk)", 
                                                         "../tb/tb_ingress_queue_manager.sv", 
                                                         486);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    __Vtask_tb_ingress_queue_manager__DOT__wait_for_internal_transmission__16__tb_ingress_queue_manager__DOT__unnamedblk1_11__DOT____Vrepeat10 = 0U;
    if (vlSymsp->_vm_contextp__->assertOnGet(2, 1)) {
        if (VL_UNLIKELY(((1U & (~ (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__internal_valid)))))) {
            VL_WRITEF_NX("[%0t] %%Error: tb_ingress_queue_manager.sv:417: Assertion failed in %Ntb_ingress_queue_manager.test_internal_transmission: Internal valid should be asserted\n",0,
                         64,VL_TIME_UNITED_Q(1000),
                         -9,vlSymsp->name());
            VL_STOP_MT("../tb/tb_ingress_queue_manager.sv", 417, "");
        }
    }
    VL_WRITEF_NX("  Internal transmission test PASSED\n",0);
    VL_WRITEF_NX("Testing shared credit variables...\n  Shared credits test PASSED\n=== All IngressQueueManager tests PASSED ===\n",0);
    VL_FINISH_MT("../tb/tb_ingress_queue_manager.sv", 211, "");
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
}

VL_INLINE_OPT VlCoroutine Vtb_ingress_queue_manager___024root___eval_initial__TOP__Vtiming__1(Vtb_ingress_queue_manager___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_ingress_queue_manager___024root___eval_initial__TOP__Vtiming__1\n"); );
    Vtb_ingress_queue_manager__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    while (VL_LIKELY(!vlSymsp->_vm_contextp__->gotFinish())) {
        co_await vlSelfRef.__VdlySched.delay(0x1388ULL, 
                                             nullptr, 
                                             "../tb/tb_ingress_queue_manager.sv", 
                                             31);
        vlSelfRef.tb_ingress_queue_manager__DOT__clk 
            = (1U & (~ (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__clk)));
    }
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vtb_ingress_queue_manager___024root___dump_triggers__act(Vtb_ingress_queue_manager___024root* vlSelf);
#endif  // VL_DEBUG

void Vtb_ingress_queue_manager___024root___eval_triggers__act(Vtb_ingress_queue_manager___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_ingress_queue_manager___024root___eval_triggers__act\n"); );
    Vtb_ingress_queue_manager__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.__VactTriggered.setBit(0U, ((IData)(vlSelfRef.tb_ingress_queue_manager__DOT__clk) 
                                          & (~ (IData)(vlSelfRef.__Vtrigprevexpr___TOP__tb_ingress_queue_manager__DOT__clk__0))));
    vlSelfRef.__VactTriggered.setBit(1U, ((~ (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__rst_n)) 
                                          & (IData)(vlSelfRef.__Vtrigprevexpr___TOP__tb_ingress_queue_manager__DOT__rst_n__0)));
    vlSelfRef.__VactTriggered.setBit(2U, vlSelfRef.__VdlySched.awaitingCurrentTime());
    vlSelfRef.__Vtrigprevexpr___TOP__tb_ingress_queue_manager__DOT__clk__0 
        = vlSelfRef.tb_ingress_queue_manager__DOT__clk;
    vlSelfRef.__Vtrigprevexpr___TOP__tb_ingress_queue_manager__DOT__rst_n__0 
        = vlSelfRef.tb_ingress_queue_manager__DOT__rst_n;
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        Vtb_ingress_queue_manager___024root___dump_triggers__act(vlSelf);
    }
#endif
}
