// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Vtb_ingress_queue_manager.h for the primary calling header

#ifndef VERILATED_VTB_INGRESS_QUEUE_MANAGER___024ROOT_H_
#define VERILATED_VTB_INGRESS_QUEUE_MANAGER___024ROOT_H_  // guard

#include "verilated.h"
#include "verilated_timing.h"


class Vtb_ingress_queue_manager__Syms;

class alignas(VL_CACHE_LINE_BYTES) Vtb_ingress_queue_manager___024root final : public VerilatedModule {
  public:

    // DESIGN SPECIFIC STATE
    // Anonymous structures to workaround compiler member-count bugs
    struct {
        CData/*0:0*/ tb_ingress_queue_manager__DOT__clk;
        CData/*0:0*/ tb_ingress_queue_manager__DOT__rst_n;
        CData/*0:0*/ tb_ingress_queue_manager__DOT__internal_valid;
        CData/*0:0*/ tb_ingress_queue_manager__DOT__internal_ready;
        CData/*0:0*/ tb_ingress_queue_manager__DOT__axi_master_valid;
        CData/*0:0*/ tb_ingress_queue_manager__DOT__axi_master_ready;
        CData/*0:0*/ tb_ingress_queue_manager__DOT__axi_slave_valid;
        CData/*0:0*/ tb_ingress_queue_manager__DOT__axi_slave_ready;
        CData/*0:0*/ tb_ingress_queue_manager__DOT__internal_out_s2m;
        CData/*0:0*/ tb_ingress_queue_manager__DOT__axi_out_s2m;
        CData/*0:0*/ tb_ingress_queue_manager__DOT__dut__DOT__axis_tready;
        CData/*0:0*/ tb_ingress_queue_manager__DOT__dut__DOT__internal_tvalid;
        CData/*7:0*/ tb_ingress_queue_manager__DOT__dut__DOT__internal_tkeep;
        CData/*7:0*/ tb_ingress_queue_manager__DOT__dut__DOT__internal_tdest;
        CData/*0:0*/ tb_ingress_queue_manager__DOT__dut__DOT__internal_tlast;
        CData/*1:0*/ tb_ingress_queue_manager__DOT__dut__DOT__axis_rx_state;
        CData/*1:0*/ tb_ingress_queue_manager__DOT__dut__DOT__processing_state;
        CData/*1:0*/ tb_ingress_queue_manager__DOT__dut__DOT__internal_tx_state;
        CData/*0:0*/ tb_ingress_queue_manager__DOT__dut__DOT__packet_in_assembly;
        QData/*63:0*/ tb_ingress_queue_manager__DOT__dut__DOT__queue_head;
        QData/*63:0*/ tb_ingress_queue_manager__DOT__dut__DOT__queue_tail;
        VlWide<1024>/*32767:0*/ tb_ingress_queue_manager__DOT__dut__DOT__global_to_local_lookup;
        CData/*0:0*/ tb_ingress_queue_manager__DOT__dut__DOT__lookup_table_initialized;
        CData/*0:0*/ tb_ingress_queue_manager__DOT__dut__DOT__tx_packet_valid;
        CData/*0:0*/ tb_ingress_queue_manager__DOT__dut__DOT__beat_tvalid;
        CData/*7:0*/ tb_ingress_queue_manager__DOT__dut__DOT__beat_tkeep;
        CData/*7:0*/ tb_ingress_queue_manager__DOT__dut__DOT__process_received_packet__Vstatic__queue_id;
        CData/*7:0*/ tb_ingress_queue_manager__DOT__dut__DOT__process_received_packet__Vstatic__local_dest_port;
        CData/*7:0*/ tb_ingress_queue_manager__DOT__dut__DOT__enqueue_packet__Vstatic__tail_idx;
        CData/*7:0*/ tb_ingress_queue_manager__DOT__dut__DOT__dequeue_packet__Vstatic__head_idx;
        CData/*0:0*/ __Vtrigprevexpr___TOP__tb_ingress_queue_manager__DOT__clk__0;
        CData/*0:0*/ __Vtrigprevexpr___TOP__tb_ingress_queue_manager__DOT__rst_n__0;
        CData/*0:0*/ __VactContinue;
        SData/*15:0*/ tb_ingress_queue_manager__DOT__dut__DOT__current_packet_size;
        VlWide<1024>/*32767:0*/ tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_size;
        VlWide<3>/*71:0*/ tb_ingress_queue_manager__DOT__dut__DOT__queue_count;
        SData/*15:0*/ tb_ingress_queue_manager__DOT__dut__DOT__tx_packet_size;
        SData/*15:0*/ tb_ingress_queue_manager__DOT__dut__DOT__tx_beat_count;
        SData/*15:0*/ tb_ingress_queue_manager__DOT__dut__DOT__tx_total_beats;
        SData/*11:0*/ tb_ingress_queue_manager__DOT__dut__DOT__process_received_packet__Vstatic__global_dest_port;
        SData/*15:0*/ tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__Vstatic__byte_offset;
        SData/*15:0*/ tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__Vstatic__bytes_remaining;
        SData/*15:0*/ tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__Vstatic__bytes_in_beat;
        SData/*8:0*/ tb_ingress_queue_manager__DOT__dut__DOT____Vlvbound_h3c135dfb__0;
        SData/*8:0*/ tb_ingress_queue_manager__DOT__dut__DOT____Vlvbound_h3c135dfb__1;
        VlWide<16>/*511:0*/ tb_ingress_queue_manager__DOT__internal_packet_data;
        IData/*31:0*/ tb_ingress_queue_manager__DOT__axi_master_addr;
        IData/*31:0*/ tb_ingress_queue_manager__DOT__axi_master_data;
        IData/*31:0*/ tb_ingress_queue_manager__DOT__axi_slave_addr;
        IData/*31:0*/ tb_ingress_queue_manager__DOT__axi_slave_data;
        IData/*31:0*/ tb_ingress_queue_manager__DOT__cycle_count;
        IData/*31:0*/ tb_ingress_queue_manager__DOT__total_packets_sent;
        VlWide<128>/*4095:0*/ tb_ingress_queue_manager__DOT__dut__DOT__current_packet_buffer;
        VlWide<262144>/*8388607:0*/ tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_data;
        VlWide<64>/*2047:0*/ tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_valid;
        VlWide<128>/*4095:0*/ tb_ingress_queue_manager__DOT__dut__DOT__tx_packet_data;
        IData/*31:0*/ tb_ingress_queue_manager__DOT__dut__DOT__i;
        IData/*31:0*/ tb_ingress_queue_manager__DOT__dut__DOT__j;
        IData/*31:0*/ tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__Vstatic__b;
        IData/*31:0*/ __VactIterCount;
        VlWide<5>/*137:0*/ tb_ingress_queue_manager__DOT__axis_in_m2s;
        VlWide<3>/*64:0*/ tb_ingress_queue_manager__DOT__axi_in_m2s;
        QData/*63:0*/ tb_ingress_queue_manager__DOT__test_axis_reception__Vstatic__header_data;
        QData/*63:0*/ tb_ingress_queue_manager__DOT__test_internal_header_processing__Vstatic__header_data;
    };
    struct {
        QData/*63:0*/ tb_ingress_queue_manager__DOT__test_credit_processing__Vstatic__header_data;
        QData/*63:0*/ tb_ingress_queue_manager__DOT__test_packet_conversion__Vstatic__header_data;
        QData/*63:0*/ tb_ingress_queue_manager__DOT__test_internal_transmission__Vstatic__header_data;
        QData/*63:0*/ tb_ingress_queue_manager__DOT__dut__DOT__internal_tdata;
        QData/*63:0*/ tb_ingress_queue_manager__DOT__dut__DOT__internal_tuser;
        QData/*63:0*/ tb_ingress_queue_manager__DOT__dut__DOT__current_header;
        VlWide<4096>/*131071:0*/ tb_ingress_queue_manager__DOT__dut__DOT__packet_queues_header;
        QData/*63:0*/ tb_ingress_queue_manager__DOT__dut__DOT__total_packets_processed;
        QData/*63:0*/ tb_ingress_queue_manager__DOT__dut__DOT__total_credits_added;
        QData/*63:0*/ tb_ingress_queue_manager__DOT__dut__DOT__tx_packet_header;
        QData/*63:0*/ tb_ingress_queue_manager__DOT__dut__DOT__beat_tdata;
        QData/*63:0*/ tb_ingress_queue_manager__DOT__dut__DOT__beat_tuser;
        VlUnpacked<CData/*7:0*/, 16> tb_ingress_queue_manager__DOT__test_axis_reception__Vstatic__packet_data;
        VlUnpacked<CData/*7:0*/, 8> tb_ingress_queue_manager__DOT__test_internal_header_processing__Vstatic__packet_data;
        VlUnpacked<CData/*7:0*/, 4> tb_ingress_queue_manager__DOT__test_credit_processing__Vstatic__packet_data;
        VlUnpacked<CData/*7:0*/, 16> tb_ingress_queue_manager__DOT__test_packet_conversion__Vstatic__packet_data;
        VlUnpacked<CData/*7:0*/, 4> tb_ingress_queue_manager__DOT__test_internal_transmission__Vstatic__packet_data;
        VlUnpacked<CData/*0:0*/, 5> __Vm_traceActivity;
    };
    VlDelayScheduler __VdlySched;
    VlTriggerScheduler __VtrigSched_hb4669660__0;
    VlTriggerVec<3> __VactTriggered;
    VlTriggerVec<3> __VnbaTriggered;

    // INTERNAL VARIABLES
    Vtb_ingress_queue_manager__Syms* const vlSymsp;

    // CONSTRUCTORS
    Vtb_ingress_queue_manager___024root(Vtb_ingress_queue_manager__Syms* symsp, const char* v__name);
    ~Vtb_ingress_queue_manager___024root();
    VL_UNCOPYABLE(Vtb_ingress_queue_manager___024root);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
};


#endif  // guard
