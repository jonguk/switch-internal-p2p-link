// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "Vtb_ingress_queue_manager__Syms.h"


VL_ATTR_COLD void Vtb_ingress_queue_manager___024root__trace_init_sub__TOP__bus_interfaces_pkg__0(Vtb_ingress_queue_manager___024root* vlSelf, VerilatedVcd* tracep);

VL_ATTR_COLD void Vtb_ingress_queue_manager___024root__trace_init_sub__TOP__0(Vtb_ingress_queue_manager___024root* vlSelf, VerilatedVcd* tracep) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_ingress_queue_manager___024root__trace_init_sub__TOP__0\n"); );
    Vtb_ingress_queue_manager__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    const int c = vlSymsp->__Vm_baseCode;
    // Body
    tracep->pushPrefix("bus_interfaces_pkg", VerilatedTracePrefixType::SCOPE_MODULE);
    Vtb_ingress_queue_manager___024root__trace_init_sub__TOP__bus_interfaces_pkg__0(vlSelf, tracep);
    tracep->popPrefix();
    tracep->pushPrefix("tb_ingress_queue_manager", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBus(c+143,0,"AXIS_DATA_WIDTH",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+144,0,"AXIS_KEEP_WIDTH",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+143,0,"AXIS_USER_WIDTH",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+145,0,"BUFFER_SIZE",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+146,0,"MAX_PACKET_SIZE",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+147,0,"EXTERNAL_HEADER_SIZE",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+148,0,"DEFAULT_CREDITS",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+144,0,"MAX_QUEUES_PER_PORT",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+149,0,"MAX_CREDITS_PER_QUEUE",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+141,0,"clk",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1,0,"rst_n",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declArray(c+2,0,"axis_in_m2s",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 137,0);
    tracep->declBus(c+86,0,"axis_in_s2m",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 0,0);
    tracep->declBit(c+150,0,"internal_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declArray(c+151,0,"internal_packet_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 511,0);
    tracep->declBit(c+77,0,"internal_ready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+167,0,"axi_master_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+168,0,"axi_master_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+169,0,"axi_master_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+7,0,"axi_master_ready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+8,0,"axi_slave_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+9,0,"axi_slave_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+10,0,"axi_slave_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+170,0,"axi_slave_ready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+171,0,"test_phase",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::INT, false,-1, 31,0);
    tracep->declBus(c+78,0,"cycle_count",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::INT, false,-1, 31,0);
    tracep->declBit(c+172,0,"internal_ready_control",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+11,0,"total_packets_sent",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::INT, false,-1, 31,0);
    tracep->declBus(c+171,0,"packets_processed",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::INT, false,-1, 31,0);
    tracep->declArray(c+87,0,"internal_out_m2s",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 137,0);
    tracep->declBus(c+142,0,"internal_out_s2m",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 0,0);
    tracep->declArray(c+173,0,"axi_out_m2s",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 64,0);
    tracep->declBus(c+79,0,"axi_out_s2m",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 0,0);
    tracep->declArray(c+80,0,"axi_in_m2s",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 64,0);
    tracep->declBus(c+83,0,"axi_in_s2m",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 0,0);
    tracep->declBus(c+176,0,"port_id",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+12,0,"axis_in_m2s_dot_tvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declQuad(c+13,0,"axis_in_m2s_dot_tdata",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declBus(c+15,0,"axis_in_m2s_dot_tkeep",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declQuad(c+16,0,"axis_in_m2s_dot_tuser",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declBit(c+18,0,"axis_in_m2s_dot_tlast",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+86,0,"axis_in_s2m_dot_tready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+92,0,"internal_out_m2s_dot_tvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declQuad(c+93,0,"internal_out_m2s_dot_tdata",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declBus(c+95,0,"internal_out_m2s_dot_tkeep",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declQuad(c+96,0,"internal_out_m2s_dot_tuser",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declBit(c+98,0,"internal_out_m2s_dot_tlast",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+142,0,"internal_out_s2m_dot_tready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+177,0,"axi_out_m2s_dot_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+178,0,"axi_out_m2s_dot_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+178,0,"axi_out_m2s_dot_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+79,0,"axi_out_s2m_dot_ready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+83,0,"axi_in_m2s_dot_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+84,0,"axi_in_m2s_dot_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+85,0,"axi_in_m2s_dot_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+83,0,"axi_in_s2m_dot_ready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declQuad(c+19,0,"test_axis_reception__Vstatic__header_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->pushPrefix("test_axis_reception__Vstatic__packet_data", VerilatedTracePrefixType::ARRAY_UNPACKED);
    for (int i = 0; i < 16; ++i) {
        tracep->declBus(c+21+i*1,0,"",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, true,(i+0), 7,0);
    }
    tracep->popPrefix();
    tracep->declQuad(c+37,0,"test_internal_header_processing__Vstatic__header_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->pushPrefix("test_internal_header_processing__Vstatic__packet_data", VerilatedTracePrefixType::ARRAY_UNPACKED);
    for (int i = 0; i < 8; ++i) {
        tracep->declBus(c+39+i*1,0,"",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, true,(i+0), 7,0);
    }
    tracep->popPrefix();
    tracep->declQuad(c+47,0,"test_credit_processing__Vstatic__header_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->pushPrefix("test_credit_processing__Vstatic__packet_data", VerilatedTracePrefixType::ARRAY_UNPACKED);
    for (int i = 0; i < 4; ++i) {
        tracep->declBus(c+49+i*1,0,"",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, true,(i+0), 7,0);
    }
    tracep->popPrefix();
    tracep->declQuad(c+53,0,"test_packet_conversion__Vstatic__header_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->pushPrefix("test_packet_conversion__Vstatic__packet_data", VerilatedTracePrefixType::ARRAY_UNPACKED);
    for (int i = 0; i < 16; ++i) {
        tracep->declBus(c+55+i*1,0,"",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, true,(i+0), 7,0);
    }
    tracep->popPrefix();
    tracep->declQuad(c+71,0,"test_internal_transmission__Vstatic__header_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->pushPrefix("test_internal_transmission__Vstatic__packet_data", VerilatedTracePrefixType::ARRAY_UNPACKED);
    for (int i = 0; i < 4; ++i) {
        tracep->declBus(c+73+i*1,0,"",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, true,(i+0), 7,0);
    }
    tracep->popPrefix();
    tracep->pushPrefix("dut", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBus(c+143,0,"AXIS_DATA_WIDTH",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+144,0,"AXIS_KEEP_WIDTH",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+143,0,"AXIS_USER_WIDTH",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+144,0,"AXIS_DEST_WIDTH",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+144,0,"MAX_QUEUES_PER_PORT",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+179,0,"QUEUE_DEPTH",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+146,0,"MAX_PACKET_SIZE",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+148,0,"DEFAULT_CREDITS",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+145,0,"MAX_CREDITS_PER_QUEUE",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+180,0,"MAX_GLOBAL_PORTS",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+145,0,"BUFFER_SIZE",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+181,0,"BUFFER_ADDR_WIDTH",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+141,0,"clk",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1,0,"rst_n",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declArray(c+2,0,"axis_in_m2s",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 137,0);
    tracep->declBus(c+86,0,"axis_in_s2m",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 0,0);
    tracep->declArray(c+87,0,"internal_out_m2s",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 137,0);
    tracep->declBus(c+142,0,"internal_out_s2m",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 0,0);
    tracep->declArray(c+173,0,"axi_out_m2s",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 64,0);
    tracep->declBus(c+79,0,"axi_out_s2m",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 0,0);
    tracep->declArray(c+80,0,"axi_in_m2s",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 64,0);
    tracep->declBus(c+83,0,"axi_in_s2m",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 0,0);
    tracep->declBus(c+176,0,"port_id",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+12,0,"axis_tvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declQuad(c+13,0,"axis_tdata",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declBus(c+15,0,"axis_tkeep",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declQuad(c+16,0,"axis_tuser",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declBit(c+18,0,"axis_tlast",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+86,0,"axis_tready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+92,0,"internal_tvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declQuad(c+93,0,"internal_tdata",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declBus(c+95,0,"internal_tkeep",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declQuad(c+96,0,"internal_tuser",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declBus(c+182,0,"internal_tdest",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+98,0,"internal_tlast",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+142,0,"internal_tready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+12,0,"axis_in_m2s_dot_tvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declQuad(c+13,0,"axis_in_m2s_dot_tdata",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declBus(c+15,0,"axis_in_m2s_dot_tkeep",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declQuad(c+16,0,"axis_in_m2s_dot_tuser",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declBit(c+18,0,"axis_in_m2s_dot_tlast",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+86,0,"axis_in_s2m_dot_tready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+92,0,"internal_out_m2s_dot_tvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declQuad(c+93,0,"internal_out_m2s_dot_tdata",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declBus(c+95,0,"internal_out_m2s_dot_tkeep",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declQuad(c+96,0,"internal_out_m2s_dot_tuser",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declBit(c+98,0,"internal_out_m2s_dot_tlast",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+142,0,"internal_out_s2m_dot_tready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+83,0,"axi_in_m2s_dot_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+84,0,"axi_in_m2s_dot_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+85,0,"axi_in_m2s_dot_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+83,0,"axi_in_s2m_dot_ready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+177,0,"axi_out_m2s_dot_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+178,0,"axi_out_m2s_dot_addr",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+178,0,"axi_out_m2s_dot_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBit(c+79,0,"axi_out_s2m_dot_ready",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+99,0,"fsm_axis_rx_state",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+100,0,"fsm_processing_state",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+101,0,"fsm_internal_tx_state",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+102,0,"fsm_rx_idle",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+103,0,"fsm_rx_receiving",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+104,0,"fsm_rx_processing",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+105,0,"fsm_tx_idle",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+106,0,"fsm_tx_transmitting",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+107,0,"packet_assembly_active",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+108,0,"tx_active",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+183,0,"IDLE",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+184,0,"RECEIVING",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+185,0,"PROCESSING",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+186,0,"TRANSMITTING",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+183,0,"PKT_DATA",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+184,0,"PKT_CREDIT",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+185,0,"PKT_CONTROL",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+99,0,"axis_rx_state",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+100,0,"processing_state",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+101,0,"internal_tx_state",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBit(c+107,0,"packet_in_assembly",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+109,0,"current_packet_size",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 15,0);
    tracep->declQuad(c+110,0,"current_header",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declBit(c+112,0,"lookup_table_initialized",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declQuad(c+113,0,"total_packets_processed",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declQuad(c+115,0,"total_credits_added",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declBus(c+117,0,"tx_packet_size",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 15,0);
    tracep->declQuad(c+118,0,"tx_packet_header",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declBit(c+108,0,"tx_packet_valid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+120,0,"tx_beat_count",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 15,0);
    tracep->declBus(c+121,0,"tx_total_beats",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 15,0);
    tracep->declBit(c+122,0,"beat_tvalid",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declQuad(c+123,0,"beat_tdata",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declBus(c+125,0,"beat_tkeep",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declQuad(c+126,0,"beat_tuser",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 63,0);
    tracep->declBus(c+128,0,"i",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::INTEGER, false,-1, 31,0);
    tracep->declBus(c+129,0,"j",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::INTEGER, false,-1, 31,0);
    tracep->declBus(c+130,0,"process_received_packet__Vstatic__queue_id",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+131,0,"process_received_packet__Vstatic__local_dest_port",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+132,0,"process_received_packet__Vstatic__global_dest_port",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 11,0);
    tracep->declBus(c+133,0,"enqueue_packet__Vstatic__tail_idx",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+134,0,"dequeue_packet__Vstatic__head_idx",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+135,0,"send_internal_beat__Vstatic__byte_offset",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 15,0);
    tracep->declBus(c+136,0,"send_internal_beat__Vstatic__bytes_remaining",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 15,0);
    tracep->declBus(c+137,0,"send_internal_beat__Vstatic__bytes_in_beat",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 15,0);
    tracep->declBus(c+138,0,"send_internal_beat__Vstatic__b",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::INTEGER, false,-1, 31,0);
    tracep->declBus(c+176,0,"current_port_id_dot_debug",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+139,0,"total_packets_processed_dot_debug",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->declBus(c+140,0,"total_credits_added_dot_debug",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 31,0);
    tracep->popPrefix();
    tracep->popPrefix();
}

VL_ATTR_COLD void Vtb_ingress_queue_manager___024root__trace_init_sub__TOP__bus_interfaces_pkg__0(Vtb_ingress_queue_manager___024root* vlSelf, VerilatedVcd* tracep) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_ingress_queue_manager___024root__trace_init_sub__TOP__bus_interfaces_pkg__0\n"); );
    Vtb_ingress_queue_manager__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    const int c = vlSymsp->__Vm_baseCode;
    // Body
    tracep->declBus(c+187,0,"AXIS_DATA_WIDTH_DEFAULT",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::INT, false,-1, 31,0);
    tracep->declBus(c+188,0,"AXIS_KEEP_WIDTH_DEFAULT",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::INT, false,-1, 31,0);
    tracep->declBus(c+187,0,"AXIS_USER_WIDTH_DEFAULT",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::INT, false,-1, 31,0);
    tracep->declBus(c+189,0,"AXI_ADDR_WIDTH_DEFAULT",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::INT, false,-1, 31,0);
    tracep->declBus(c+189,0,"AXI_DATA_WIDTH_DEFAULT",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::INT, false,-1, 31,0);
}

VL_ATTR_COLD void Vtb_ingress_queue_manager___024root__trace_init_top(Vtb_ingress_queue_manager___024root* vlSelf, VerilatedVcd* tracep) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_ingress_queue_manager___024root__trace_init_top\n"); );
    Vtb_ingress_queue_manager__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    Vtb_ingress_queue_manager___024root__trace_init_sub__TOP__0(vlSelf, tracep);
}

VL_ATTR_COLD void Vtb_ingress_queue_manager___024root__trace_const_0(void* voidSelf, VerilatedVcd::Buffer* bufp);
VL_ATTR_COLD void Vtb_ingress_queue_manager___024root__trace_full_0(void* voidSelf, VerilatedVcd::Buffer* bufp);
void Vtb_ingress_queue_manager___024root__trace_chg_0(void* voidSelf, VerilatedVcd::Buffer* bufp);
void Vtb_ingress_queue_manager___024root__trace_cleanup(void* voidSelf, VerilatedVcd* /*unused*/);

VL_ATTR_COLD void Vtb_ingress_queue_manager___024root__trace_register(Vtb_ingress_queue_manager___024root* vlSelf, VerilatedVcd* tracep) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_ingress_queue_manager___024root__trace_register\n"); );
    Vtb_ingress_queue_manager__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    tracep->addConstCb(&Vtb_ingress_queue_manager___024root__trace_const_0, 0U, vlSelf);
    tracep->addFullCb(&Vtb_ingress_queue_manager___024root__trace_full_0, 0U, vlSelf);
    tracep->addChgCb(&Vtb_ingress_queue_manager___024root__trace_chg_0, 0U, vlSelf);
    tracep->addCleanupCb(&Vtb_ingress_queue_manager___024root__trace_cleanup, vlSelf);
}

VL_ATTR_COLD void Vtb_ingress_queue_manager___024root__trace_const_0_sub_0(Vtb_ingress_queue_manager___024root* vlSelf, VerilatedVcd::Buffer* bufp);

VL_ATTR_COLD void Vtb_ingress_queue_manager___024root__trace_const_0(void* voidSelf, VerilatedVcd::Buffer* bufp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_ingress_queue_manager___024root__trace_const_0\n"); );
    // Init
    Vtb_ingress_queue_manager___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<Vtb_ingress_queue_manager___024root*>(voidSelf);
    Vtb_ingress_queue_manager__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    // Body
    Vtb_ingress_queue_manager___024root__trace_const_0_sub_0((&vlSymsp->TOP), bufp);
}

VL_ATTR_COLD void Vtb_ingress_queue_manager___024root__trace_const_0_sub_0(Vtb_ingress_queue_manager___024root* vlSelf, VerilatedVcd::Buffer* bufp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_ingress_queue_manager___024root__trace_const_0_sub_0\n"); );
    Vtb_ingress_queue_manager__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    uint32_t* const oldp VL_ATTR_UNUSED = bufp->oldp(vlSymsp->__Vm_baseCode);
    VlWide<3>/*95:0*/ __Vtemp_1;
    // Body
    bufp->fullIData(oldp+143,(0x40U),32);
    bufp->fullIData(oldp+144,(8U),32);
    bufp->fullIData(oldp+145,(0x400U),32);
    bufp->fullIData(oldp+146,(0x200U),32);
    bufp->fullIData(oldp+147,(0x10U),32);
    bufp->fullIData(oldp+148,(0x64U),32);
    bufp->fullIData(oldp+149,(0x3e8U),32);
    bufp->fullBit(oldp+150,(vlSelfRef.tb_ingress_queue_manager__DOT__internal_valid));
    bufp->fullWData(oldp+151,(vlSelfRef.tb_ingress_queue_manager__DOT__internal_packet_data),512);
    bufp->fullBit(oldp+167,(vlSelfRef.tb_ingress_queue_manager__DOT__axi_master_valid));
    bufp->fullIData(oldp+168,(vlSelfRef.tb_ingress_queue_manager__DOT__axi_master_addr),32);
    bufp->fullIData(oldp+169,(vlSelfRef.tb_ingress_queue_manager__DOT__axi_master_data),32);
    bufp->fullBit(oldp+170,(vlSelfRef.tb_ingress_queue_manager__DOT__axi_slave_ready));
    bufp->fullIData(oldp+171,(0U),32);
    bufp->fullBit(oldp+172,(1U));
    __Vtemp_1[0U] = 0U;
    __Vtemp_1[1U] = 0U;
    __Vtemp_1[2U] = 0U;
    bufp->fullWData(oldp+173,(__Vtemp_1),65);
    bufp->fullCData(oldp+176,(2U),8);
    bufp->fullBit(oldp+177,(0U));
    bufp->fullIData(oldp+178,(0U),32);
    bufp->fullIData(oldp+179,(0x100U),32);
    bufp->fullIData(oldp+180,(0x1000U),32);
    bufp->fullIData(oldp+181,(9U),32);
    bufp->fullCData(oldp+182,(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__internal_tdest),8);
    bufp->fullCData(oldp+183,(0U),2);
    bufp->fullCData(oldp+184,(1U),2);
    bufp->fullCData(oldp+185,(2U),2);
    bufp->fullCData(oldp+186,(3U),2);
    bufp->fullIData(oldp+187,(0x40U),32);
    bufp->fullIData(oldp+188,(8U),32);
    bufp->fullIData(oldp+189,(0x20U),32);
}

VL_ATTR_COLD void Vtb_ingress_queue_manager___024root__trace_full_0_sub_0(Vtb_ingress_queue_manager___024root* vlSelf, VerilatedVcd::Buffer* bufp);

VL_ATTR_COLD void Vtb_ingress_queue_manager___024root__trace_full_0(void* voidSelf, VerilatedVcd::Buffer* bufp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_ingress_queue_manager___024root__trace_full_0\n"); );
    // Init
    Vtb_ingress_queue_manager___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<Vtb_ingress_queue_manager___024root*>(voidSelf);
    Vtb_ingress_queue_manager__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    // Body
    Vtb_ingress_queue_manager___024root__trace_full_0_sub_0((&vlSymsp->TOP), bufp);
}

VL_ATTR_COLD void Vtb_ingress_queue_manager___024root__trace_full_0_sub_0(Vtb_ingress_queue_manager___024root* vlSelf, VerilatedVcd::Buffer* bufp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_ingress_queue_manager___024root__trace_full_0_sub_0\n"); );
    Vtb_ingress_queue_manager__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    uint32_t* const oldp VL_ATTR_UNUSED = bufp->oldp(vlSymsp->__Vm_baseCode);
    VlWide<5>/*159:0*/ __Vtemp_4;
    // Body
    bufp->fullBit(oldp+1,(vlSelfRef.tb_ingress_queue_manager__DOT__rst_n));
    bufp->fullWData(oldp+2,(vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s),138);
    bufp->fullBit(oldp+7,(vlSelfRef.tb_ingress_queue_manager__DOT__axi_master_ready));
    bufp->fullBit(oldp+8,(vlSelfRef.tb_ingress_queue_manager__DOT__axi_slave_valid));
    bufp->fullIData(oldp+9,(vlSelfRef.tb_ingress_queue_manager__DOT__axi_slave_addr),32);
    bufp->fullIData(oldp+10,(vlSelfRef.tb_ingress_queue_manager__DOT__axi_slave_data),32);
    bufp->fullIData(oldp+11,(vlSelfRef.tb_ingress_queue_manager__DOT__total_packets_sent),32);
    bufp->fullBit(oldp+12,((1U & (vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[4U] 
                                  >> 9U))));
    bufp->fullQData(oldp+13,((((QData)((IData)(vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[4U])) 
                               << 0x37U) | (((QData)((IData)(
                                                             vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[3U])) 
                                             << 0x17U) 
                                            | ((QData)((IData)(
                                                               vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[2U])) 
                                               >> 9U)))),64);
    bufp->fullCData(oldp+15,((0xffU & (vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[2U] 
                                       >> 1U))),8);
    bufp->fullQData(oldp+16,((((QData)((IData)(vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[2U])) 
                               << 0x3fU) | (((QData)((IData)(
                                                             vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[1U])) 
                                             << 0x1fU) 
                                            | ((QData)((IData)(
                                                               vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[0U])) 
                                               >> 1U)))),64);
    bufp->fullBit(oldp+18,((1U & vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[0U])));
    bufp->fullQData(oldp+19,(vlSelfRef.tb_ingress_queue_manager__DOT__test_axis_reception__Vstatic__header_data),64);
    bufp->fullCData(oldp+21,(vlSelfRef.tb_ingress_queue_manager__DOT__test_axis_reception__Vstatic__packet_data[0]),8);
    bufp->fullCData(oldp+22,(vlSelfRef.tb_ingress_queue_manager__DOT__test_axis_reception__Vstatic__packet_data[1]),8);
    bufp->fullCData(oldp+23,(vlSelfRef.tb_ingress_queue_manager__DOT__test_axis_reception__Vstatic__packet_data[2]),8);
    bufp->fullCData(oldp+24,(vlSelfRef.tb_ingress_queue_manager__DOT__test_axis_reception__Vstatic__packet_data[3]),8);
    bufp->fullCData(oldp+25,(vlSelfRef.tb_ingress_queue_manager__DOT__test_axis_reception__Vstatic__packet_data[4]),8);
    bufp->fullCData(oldp+26,(vlSelfRef.tb_ingress_queue_manager__DOT__test_axis_reception__Vstatic__packet_data[5]),8);
    bufp->fullCData(oldp+27,(vlSelfRef.tb_ingress_queue_manager__DOT__test_axis_reception__Vstatic__packet_data[6]),8);
    bufp->fullCData(oldp+28,(vlSelfRef.tb_ingress_queue_manager__DOT__test_axis_reception__Vstatic__packet_data[7]),8);
    bufp->fullCData(oldp+29,(vlSelfRef.tb_ingress_queue_manager__DOT__test_axis_reception__Vstatic__packet_data[8]),8);
    bufp->fullCData(oldp+30,(vlSelfRef.tb_ingress_queue_manager__DOT__test_axis_reception__Vstatic__packet_data[9]),8);
    bufp->fullCData(oldp+31,(vlSelfRef.tb_ingress_queue_manager__DOT__test_axis_reception__Vstatic__packet_data[10]),8);
    bufp->fullCData(oldp+32,(vlSelfRef.tb_ingress_queue_manager__DOT__test_axis_reception__Vstatic__packet_data[11]),8);
    bufp->fullCData(oldp+33,(vlSelfRef.tb_ingress_queue_manager__DOT__test_axis_reception__Vstatic__packet_data[12]),8);
    bufp->fullCData(oldp+34,(vlSelfRef.tb_ingress_queue_manager__DOT__test_axis_reception__Vstatic__packet_data[13]),8);
    bufp->fullCData(oldp+35,(vlSelfRef.tb_ingress_queue_manager__DOT__test_axis_reception__Vstatic__packet_data[14]),8);
    bufp->fullCData(oldp+36,(vlSelfRef.tb_ingress_queue_manager__DOT__test_axis_reception__Vstatic__packet_data[15]),8);
    bufp->fullQData(oldp+37,(vlSelfRef.tb_ingress_queue_manager__DOT__test_internal_header_processing__Vstatic__header_data),64);
    bufp->fullCData(oldp+39,(vlSelfRef.tb_ingress_queue_manager__DOT__test_internal_header_processing__Vstatic__packet_data[0]),8);
    bufp->fullCData(oldp+40,(vlSelfRef.tb_ingress_queue_manager__DOT__test_internal_header_processing__Vstatic__packet_data[1]),8);
    bufp->fullCData(oldp+41,(vlSelfRef.tb_ingress_queue_manager__DOT__test_internal_header_processing__Vstatic__packet_data[2]),8);
    bufp->fullCData(oldp+42,(vlSelfRef.tb_ingress_queue_manager__DOT__test_internal_header_processing__Vstatic__packet_data[3]),8);
    bufp->fullCData(oldp+43,(vlSelfRef.tb_ingress_queue_manager__DOT__test_internal_header_processing__Vstatic__packet_data[4]),8);
    bufp->fullCData(oldp+44,(vlSelfRef.tb_ingress_queue_manager__DOT__test_internal_header_processing__Vstatic__packet_data[5]),8);
    bufp->fullCData(oldp+45,(vlSelfRef.tb_ingress_queue_manager__DOT__test_internal_header_processing__Vstatic__packet_data[6]),8);
    bufp->fullCData(oldp+46,(vlSelfRef.tb_ingress_queue_manager__DOT__test_internal_header_processing__Vstatic__packet_data[7]),8);
    bufp->fullQData(oldp+47,(vlSelfRef.tb_ingress_queue_manager__DOT__test_credit_processing__Vstatic__header_data),64);
    bufp->fullCData(oldp+49,(vlSelfRef.tb_ingress_queue_manager__DOT__test_credit_processing__Vstatic__packet_data[0]),8);
    bufp->fullCData(oldp+50,(vlSelfRef.tb_ingress_queue_manager__DOT__test_credit_processing__Vstatic__packet_data[1]),8);
    bufp->fullCData(oldp+51,(vlSelfRef.tb_ingress_queue_manager__DOT__test_credit_processing__Vstatic__packet_data[2]),8);
    bufp->fullCData(oldp+52,(vlSelfRef.tb_ingress_queue_manager__DOT__test_credit_processing__Vstatic__packet_data[3]),8);
    bufp->fullQData(oldp+53,(vlSelfRef.tb_ingress_queue_manager__DOT__test_packet_conversion__Vstatic__header_data),64);
    bufp->fullCData(oldp+55,(vlSelfRef.tb_ingress_queue_manager__DOT__test_packet_conversion__Vstatic__packet_data[0]),8);
    bufp->fullCData(oldp+56,(vlSelfRef.tb_ingress_queue_manager__DOT__test_packet_conversion__Vstatic__packet_data[1]),8);
    bufp->fullCData(oldp+57,(vlSelfRef.tb_ingress_queue_manager__DOT__test_packet_conversion__Vstatic__packet_data[2]),8);
    bufp->fullCData(oldp+58,(vlSelfRef.tb_ingress_queue_manager__DOT__test_packet_conversion__Vstatic__packet_data[3]),8);
    bufp->fullCData(oldp+59,(vlSelfRef.tb_ingress_queue_manager__DOT__test_packet_conversion__Vstatic__packet_data[4]),8);
    bufp->fullCData(oldp+60,(vlSelfRef.tb_ingress_queue_manager__DOT__test_packet_conversion__Vstatic__packet_data[5]),8);
    bufp->fullCData(oldp+61,(vlSelfRef.tb_ingress_queue_manager__DOT__test_packet_conversion__Vstatic__packet_data[6]),8);
    bufp->fullCData(oldp+62,(vlSelfRef.tb_ingress_queue_manager__DOT__test_packet_conversion__Vstatic__packet_data[7]),8);
    bufp->fullCData(oldp+63,(vlSelfRef.tb_ingress_queue_manager__DOT__test_packet_conversion__Vstatic__packet_data[8]),8);
    bufp->fullCData(oldp+64,(vlSelfRef.tb_ingress_queue_manager__DOT__test_packet_conversion__Vstatic__packet_data[9]),8);
    bufp->fullCData(oldp+65,(vlSelfRef.tb_ingress_queue_manager__DOT__test_packet_conversion__Vstatic__packet_data[10]),8);
    bufp->fullCData(oldp+66,(vlSelfRef.tb_ingress_queue_manager__DOT__test_packet_conversion__Vstatic__packet_data[11]),8);
    bufp->fullCData(oldp+67,(vlSelfRef.tb_ingress_queue_manager__DOT__test_packet_conversion__Vstatic__packet_data[12]),8);
    bufp->fullCData(oldp+68,(vlSelfRef.tb_ingress_queue_manager__DOT__test_packet_conversion__Vstatic__packet_data[13]),8);
    bufp->fullCData(oldp+69,(vlSelfRef.tb_ingress_queue_manager__DOT__test_packet_conversion__Vstatic__packet_data[14]),8);
    bufp->fullCData(oldp+70,(vlSelfRef.tb_ingress_queue_manager__DOT__test_packet_conversion__Vstatic__packet_data[15]),8);
    bufp->fullQData(oldp+71,(vlSelfRef.tb_ingress_queue_manager__DOT__test_internal_transmission__Vstatic__header_data),64);
    bufp->fullCData(oldp+73,(vlSelfRef.tb_ingress_queue_manager__DOT__test_internal_transmission__Vstatic__packet_data[0]),8);
    bufp->fullCData(oldp+74,(vlSelfRef.tb_ingress_queue_manager__DOT__test_internal_transmission__Vstatic__packet_data[1]),8);
    bufp->fullCData(oldp+75,(vlSelfRef.tb_ingress_queue_manager__DOT__test_internal_transmission__Vstatic__packet_data[2]),8);
    bufp->fullCData(oldp+76,(vlSelfRef.tb_ingress_queue_manager__DOT__test_internal_transmission__Vstatic__packet_data[3]),8);
    bufp->fullBit(oldp+77,(vlSelfRef.tb_ingress_queue_manager__DOT__internal_ready));
    bufp->fullIData(oldp+78,(vlSelfRef.tb_ingress_queue_manager__DOT__cycle_count),32);
    bufp->fullBit(oldp+79,(vlSelfRef.tb_ingress_queue_manager__DOT__axi_out_s2m));
    bufp->fullWData(oldp+80,(vlSelfRef.tb_ingress_queue_manager__DOT__axi_in_m2s),65);
    bufp->fullBit(oldp+83,((1U & vlSelfRef.tb_ingress_queue_manager__DOT__axi_in_m2s[2U])));
    bufp->fullIData(oldp+84,(vlSelfRef.tb_ingress_queue_manager__DOT__axi_in_m2s[1U]),32);
    bufp->fullIData(oldp+85,(vlSelfRef.tb_ingress_queue_manager__DOT__axi_in_m2s[0U]),32);
    bufp->fullBit(oldp+86,(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__axis_tready));
    __Vtemp_4[0U] = (((IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__internal_tuser) 
                      << 1U) | (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__internal_tlast));
    __Vtemp_4[1U] = (((IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__internal_tuser) 
                      >> 0x1fU) | ((IData)((vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__internal_tuser 
                                            >> 0x20U)) 
                                   << 1U));
    __Vtemp_4[2U] = (((IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__internal_tdata) 
                      << 9U) | (((IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__internal_tkeep) 
                                 << 1U) | ((IData)(
                                                   (vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__internal_tuser 
                                                    >> 0x20U)) 
                                           >> 0x1fU)));
    __Vtemp_4[3U] = (((IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__internal_tdata) 
                      >> 0x17U) | ((IData)((vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__internal_tdata 
                                            >> 0x20U)) 
                                   << 9U));
    __Vtemp_4[4U] = (((IData)((vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__internal_tdata 
                               >> 0x20U)) >> 0x17U) 
                     | ((IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__internal_tvalid) 
                        << 9U));
    bufp->fullWData(oldp+87,(__Vtemp_4),138);
    bufp->fullBit(oldp+92,(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__internal_tvalid));
    bufp->fullQData(oldp+93,(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__internal_tdata),64);
    bufp->fullCData(oldp+95,(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__internal_tkeep),8);
    bufp->fullQData(oldp+96,(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__internal_tuser),64);
    bufp->fullBit(oldp+98,(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__internal_tlast));
    bufp->fullCData(oldp+99,(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__axis_rx_state),2);
    bufp->fullCData(oldp+100,(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__processing_state),2);
    bufp->fullCData(oldp+101,(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__internal_tx_state),2);
    bufp->fullBit(oldp+102,((0U == (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__axis_rx_state))));
    bufp->fullBit(oldp+103,((1U == (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__axis_rx_state))));
    bufp->fullBit(oldp+104,((2U == (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__axis_rx_state))));
    bufp->fullBit(oldp+105,((0U == (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__internal_tx_state))));
    bufp->fullBit(oldp+106,((3U == (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__internal_tx_state))));
    bufp->fullBit(oldp+107,(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_in_assembly));
    bufp->fullBit(oldp+108,(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__tx_packet_valid));
    bufp->fullSData(oldp+109,(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__current_packet_size),16);
    bufp->fullQData(oldp+110,(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__current_header),64);
    bufp->fullBit(oldp+112,(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__lookup_table_initialized));
    bufp->fullQData(oldp+113,(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__total_packets_processed),64);
    bufp->fullQData(oldp+115,(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__total_credits_added),64);
    bufp->fullSData(oldp+117,(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__tx_packet_size),16);
    bufp->fullQData(oldp+118,(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__tx_packet_header),64);
    bufp->fullSData(oldp+120,(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__tx_beat_count),16);
    bufp->fullSData(oldp+121,(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__tx_total_beats),16);
    bufp->fullBit(oldp+122,(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__beat_tvalid));
    bufp->fullQData(oldp+123,(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__beat_tdata),64);
    bufp->fullCData(oldp+125,(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__beat_tkeep),8);
    bufp->fullQData(oldp+126,(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__beat_tuser),64);
    bufp->fullIData(oldp+128,(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__i),32);
    bufp->fullIData(oldp+129,(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j),32);
    bufp->fullCData(oldp+130,(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__process_received_packet__Vstatic__queue_id),8);
    bufp->fullCData(oldp+131,(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__process_received_packet__Vstatic__local_dest_port),8);
    bufp->fullSData(oldp+132,(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__process_received_packet__Vstatic__global_dest_port),12);
    bufp->fullCData(oldp+133,(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__enqueue_packet__Vstatic__tail_idx),8);
    bufp->fullCData(oldp+134,(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__dequeue_packet__Vstatic__head_idx),8);
    bufp->fullSData(oldp+135,(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__Vstatic__byte_offset),16);
    bufp->fullSData(oldp+136,(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__Vstatic__bytes_remaining),16);
    bufp->fullSData(oldp+137,(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__Vstatic__bytes_in_beat),16);
    bufp->fullIData(oldp+138,(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__Vstatic__b),32);
    bufp->fullIData(oldp+139,((IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__total_packets_processed)),32);
    bufp->fullIData(oldp+140,((IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__total_credits_added)),32);
    bufp->fullBit(oldp+141,(vlSelfRef.tb_ingress_queue_manager__DOT__clk));
    bufp->fullBit(oldp+142,(vlSelfRef.tb_ingress_queue_manager__DOT__internal_out_s2m));
}
