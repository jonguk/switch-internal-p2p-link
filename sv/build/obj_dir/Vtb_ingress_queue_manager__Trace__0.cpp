// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "Vtb_ingress_queue_manager__Syms.h"


void Vtb_ingress_queue_manager___024root__trace_chg_0_sub_0(Vtb_ingress_queue_manager___024root* vlSelf, VerilatedVcd::Buffer* bufp);

void Vtb_ingress_queue_manager___024root__trace_chg_0(void* voidSelf, VerilatedVcd::Buffer* bufp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_ingress_queue_manager___024root__trace_chg_0\n"); );
    // Init
    Vtb_ingress_queue_manager___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<Vtb_ingress_queue_manager___024root*>(voidSelf);
    Vtb_ingress_queue_manager__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    if (VL_UNLIKELY(!vlSymsp->__Vm_activity)) return;
    // Body
    Vtb_ingress_queue_manager___024root__trace_chg_0_sub_0((&vlSymsp->TOP), bufp);
}

void Vtb_ingress_queue_manager___024root__trace_chg_0_sub_0(Vtb_ingress_queue_manager___024root* vlSelf, VerilatedVcd::Buffer* bufp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_ingress_queue_manager___024root__trace_chg_0_sub_0\n"); );
    Vtb_ingress_queue_manager__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    uint32_t* const oldp VL_ATTR_UNUSED = bufp->oldp(vlSymsp->__Vm_baseCode + 1);
    VlWide<5>/*159:0*/ __Vtemp_4;
    // Body
    if (VL_UNLIKELY(((vlSelfRef.__Vm_traceActivity[1U] 
                      | vlSelfRef.__Vm_traceActivity
                      [2U])))) {
        bufp->chgBit(oldp+0,(vlSelfRef.tb_ingress_queue_manager__DOT__rst_n));
        bufp->chgWData(oldp+1,(vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s),138);
        bufp->chgBit(oldp+6,(vlSelfRef.tb_ingress_queue_manager__DOT__axi_master_ready));
        bufp->chgBit(oldp+7,(vlSelfRef.tb_ingress_queue_manager__DOT__axi_slave_valid));
        bufp->chgIData(oldp+8,(vlSelfRef.tb_ingress_queue_manager__DOT__axi_slave_addr),32);
        bufp->chgIData(oldp+9,(vlSelfRef.tb_ingress_queue_manager__DOT__axi_slave_data),32);
        bufp->chgIData(oldp+10,(vlSelfRef.tb_ingress_queue_manager__DOT__total_packets_sent),32);
        bufp->chgBit(oldp+11,((1U & (vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[4U] 
                                     >> 9U))));
        bufp->chgQData(oldp+12,((((QData)((IData)(vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[4U])) 
                                  << 0x37U) | (((QData)((IData)(
                                                                vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[3U])) 
                                                << 0x17U) 
                                               | ((QData)((IData)(
                                                                  vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[2U])) 
                                                  >> 9U)))),64);
        bufp->chgCData(oldp+14,((0xffU & (vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[2U] 
                                          >> 1U))),8);
        bufp->chgQData(oldp+15,((((QData)((IData)(vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[2U])) 
                                  << 0x3fU) | (((QData)((IData)(
                                                                vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[1U])) 
                                                << 0x1fU) 
                                               | ((QData)((IData)(
                                                                  vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[0U])) 
                                                  >> 1U)))),64);
        bufp->chgBit(oldp+17,((1U & vlSelfRef.tb_ingress_queue_manager__DOT__axis_in_m2s[0U])));
        bufp->chgQData(oldp+18,(vlSelfRef.tb_ingress_queue_manager__DOT__test_axis_reception__Vstatic__header_data),64);
        bufp->chgCData(oldp+20,(vlSelfRef.tb_ingress_queue_manager__DOT__test_axis_reception__Vstatic__packet_data[0]),8);
        bufp->chgCData(oldp+21,(vlSelfRef.tb_ingress_queue_manager__DOT__test_axis_reception__Vstatic__packet_data[1]),8);
        bufp->chgCData(oldp+22,(vlSelfRef.tb_ingress_queue_manager__DOT__test_axis_reception__Vstatic__packet_data[2]),8);
        bufp->chgCData(oldp+23,(vlSelfRef.tb_ingress_queue_manager__DOT__test_axis_reception__Vstatic__packet_data[3]),8);
        bufp->chgCData(oldp+24,(vlSelfRef.tb_ingress_queue_manager__DOT__test_axis_reception__Vstatic__packet_data[4]),8);
        bufp->chgCData(oldp+25,(vlSelfRef.tb_ingress_queue_manager__DOT__test_axis_reception__Vstatic__packet_data[5]),8);
        bufp->chgCData(oldp+26,(vlSelfRef.tb_ingress_queue_manager__DOT__test_axis_reception__Vstatic__packet_data[6]),8);
        bufp->chgCData(oldp+27,(vlSelfRef.tb_ingress_queue_manager__DOT__test_axis_reception__Vstatic__packet_data[7]),8);
        bufp->chgCData(oldp+28,(vlSelfRef.tb_ingress_queue_manager__DOT__test_axis_reception__Vstatic__packet_data[8]),8);
        bufp->chgCData(oldp+29,(vlSelfRef.tb_ingress_queue_manager__DOT__test_axis_reception__Vstatic__packet_data[9]),8);
        bufp->chgCData(oldp+30,(vlSelfRef.tb_ingress_queue_manager__DOT__test_axis_reception__Vstatic__packet_data[10]),8);
        bufp->chgCData(oldp+31,(vlSelfRef.tb_ingress_queue_manager__DOT__test_axis_reception__Vstatic__packet_data[11]),8);
        bufp->chgCData(oldp+32,(vlSelfRef.tb_ingress_queue_manager__DOT__test_axis_reception__Vstatic__packet_data[12]),8);
        bufp->chgCData(oldp+33,(vlSelfRef.tb_ingress_queue_manager__DOT__test_axis_reception__Vstatic__packet_data[13]),8);
        bufp->chgCData(oldp+34,(vlSelfRef.tb_ingress_queue_manager__DOT__test_axis_reception__Vstatic__packet_data[14]),8);
        bufp->chgCData(oldp+35,(vlSelfRef.tb_ingress_queue_manager__DOT__test_axis_reception__Vstatic__packet_data[15]),8);
        bufp->chgQData(oldp+36,(vlSelfRef.tb_ingress_queue_manager__DOT__test_internal_header_processing__Vstatic__header_data),64);
        bufp->chgCData(oldp+38,(vlSelfRef.tb_ingress_queue_manager__DOT__test_internal_header_processing__Vstatic__packet_data[0]),8);
        bufp->chgCData(oldp+39,(vlSelfRef.tb_ingress_queue_manager__DOT__test_internal_header_processing__Vstatic__packet_data[1]),8);
        bufp->chgCData(oldp+40,(vlSelfRef.tb_ingress_queue_manager__DOT__test_internal_header_processing__Vstatic__packet_data[2]),8);
        bufp->chgCData(oldp+41,(vlSelfRef.tb_ingress_queue_manager__DOT__test_internal_header_processing__Vstatic__packet_data[3]),8);
        bufp->chgCData(oldp+42,(vlSelfRef.tb_ingress_queue_manager__DOT__test_internal_header_processing__Vstatic__packet_data[4]),8);
        bufp->chgCData(oldp+43,(vlSelfRef.tb_ingress_queue_manager__DOT__test_internal_header_processing__Vstatic__packet_data[5]),8);
        bufp->chgCData(oldp+44,(vlSelfRef.tb_ingress_queue_manager__DOT__test_internal_header_processing__Vstatic__packet_data[6]),8);
        bufp->chgCData(oldp+45,(vlSelfRef.tb_ingress_queue_manager__DOT__test_internal_header_processing__Vstatic__packet_data[7]),8);
        bufp->chgQData(oldp+46,(vlSelfRef.tb_ingress_queue_manager__DOT__test_credit_processing__Vstatic__header_data),64);
        bufp->chgCData(oldp+48,(vlSelfRef.tb_ingress_queue_manager__DOT__test_credit_processing__Vstatic__packet_data[0]),8);
        bufp->chgCData(oldp+49,(vlSelfRef.tb_ingress_queue_manager__DOT__test_credit_processing__Vstatic__packet_data[1]),8);
        bufp->chgCData(oldp+50,(vlSelfRef.tb_ingress_queue_manager__DOT__test_credit_processing__Vstatic__packet_data[2]),8);
        bufp->chgCData(oldp+51,(vlSelfRef.tb_ingress_queue_manager__DOT__test_credit_processing__Vstatic__packet_data[3]),8);
        bufp->chgQData(oldp+52,(vlSelfRef.tb_ingress_queue_manager__DOT__test_packet_conversion__Vstatic__header_data),64);
        bufp->chgCData(oldp+54,(vlSelfRef.tb_ingress_queue_manager__DOT__test_packet_conversion__Vstatic__packet_data[0]),8);
        bufp->chgCData(oldp+55,(vlSelfRef.tb_ingress_queue_manager__DOT__test_packet_conversion__Vstatic__packet_data[1]),8);
        bufp->chgCData(oldp+56,(vlSelfRef.tb_ingress_queue_manager__DOT__test_packet_conversion__Vstatic__packet_data[2]),8);
        bufp->chgCData(oldp+57,(vlSelfRef.tb_ingress_queue_manager__DOT__test_packet_conversion__Vstatic__packet_data[3]),8);
        bufp->chgCData(oldp+58,(vlSelfRef.tb_ingress_queue_manager__DOT__test_packet_conversion__Vstatic__packet_data[4]),8);
        bufp->chgCData(oldp+59,(vlSelfRef.tb_ingress_queue_manager__DOT__test_packet_conversion__Vstatic__packet_data[5]),8);
        bufp->chgCData(oldp+60,(vlSelfRef.tb_ingress_queue_manager__DOT__test_packet_conversion__Vstatic__packet_data[6]),8);
        bufp->chgCData(oldp+61,(vlSelfRef.tb_ingress_queue_manager__DOT__test_packet_conversion__Vstatic__packet_data[7]),8);
        bufp->chgCData(oldp+62,(vlSelfRef.tb_ingress_queue_manager__DOT__test_packet_conversion__Vstatic__packet_data[8]),8);
        bufp->chgCData(oldp+63,(vlSelfRef.tb_ingress_queue_manager__DOT__test_packet_conversion__Vstatic__packet_data[9]),8);
        bufp->chgCData(oldp+64,(vlSelfRef.tb_ingress_queue_manager__DOT__test_packet_conversion__Vstatic__packet_data[10]),8);
        bufp->chgCData(oldp+65,(vlSelfRef.tb_ingress_queue_manager__DOT__test_packet_conversion__Vstatic__packet_data[11]),8);
        bufp->chgCData(oldp+66,(vlSelfRef.tb_ingress_queue_manager__DOT__test_packet_conversion__Vstatic__packet_data[12]),8);
        bufp->chgCData(oldp+67,(vlSelfRef.tb_ingress_queue_manager__DOT__test_packet_conversion__Vstatic__packet_data[13]),8);
        bufp->chgCData(oldp+68,(vlSelfRef.tb_ingress_queue_manager__DOT__test_packet_conversion__Vstatic__packet_data[14]),8);
        bufp->chgCData(oldp+69,(vlSelfRef.tb_ingress_queue_manager__DOT__test_packet_conversion__Vstatic__packet_data[15]),8);
        bufp->chgQData(oldp+70,(vlSelfRef.tb_ingress_queue_manager__DOT__test_internal_transmission__Vstatic__header_data),64);
        bufp->chgCData(oldp+72,(vlSelfRef.tb_ingress_queue_manager__DOT__test_internal_transmission__Vstatic__packet_data[0]),8);
        bufp->chgCData(oldp+73,(vlSelfRef.tb_ingress_queue_manager__DOT__test_internal_transmission__Vstatic__packet_data[1]),8);
        bufp->chgCData(oldp+74,(vlSelfRef.tb_ingress_queue_manager__DOT__test_internal_transmission__Vstatic__packet_data[2]),8);
        bufp->chgCData(oldp+75,(vlSelfRef.tb_ingress_queue_manager__DOT__test_internal_transmission__Vstatic__packet_data[3]),8);
    }
    if (VL_UNLIKELY((vlSelfRef.__Vm_traceActivity[3U]))) {
        bufp->chgBit(oldp+76,(vlSelfRef.tb_ingress_queue_manager__DOT__internal_ready));
        bufp->chgIData(oldp+77,(vlSelfRef.tb_ingress_queue_manager__DOT__cycle_count),32);
        bufp->chgBit(oldp+78,(vlSelfRef.tb_ingress_queue_manager__DOT__axi_out_s2m));
        bufp->chgWData(oldp+79,(vlSelfRef.tb_ingress_queue_manager__DOT__axi_in_m2s),65);
        bufp->chgBit(oldp+82,((1U & vlSelfRef.tb_ingress_queue_manager__DOT__axi_in_m2s[2U])));
        bufp->chgIData(oldp+83,(vlSelfRef.tb_ingress_queue_manager__DOT__axi_in_m2s[1U]),32);
        bufp->chgIData(oldp+84,(vlSelfRef.tb_ingress_queue_manager__DOT__axi_in_m2s[0U]),32);
    }
    if (VL_UNLIKELY((vlSelfRef.__Vm_traceActivity[4U]))) {
        bufp->chgBit(oldp+85,(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__axis_tready));
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
        bufp->chgWData(oldp+86,(__Vtemp_4),138);
        bufp->chgBit(oldp+91,(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__internal_tvalid));
        bufp->chgQData(oldp+92,(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__internal_tdata),64);
        bufp->chgCData(oldp+94,(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__internal_tkeep),8);
        bufp->chgQData(oldp+95,(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__internal_tuser),64);
        bufp->chgBit(oldp+97,(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__internal_tlast));
        bufp->chgCData(oldp+98,(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__axis_rx_state),2);
        bufp->chgCData(oldp+99,(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__processing_state),2);
        bufp->chgCData(oldp+100,(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__internal_tx_state),2);
        bufp->chgBit(oldp+101,((0U == (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__axis_rx_state))));
        bufp->chgBit(oldp+102,((1U == (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__axis_rx_state))));
        bufp->chgBit(oldp+103,((2U == (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__axis_rx_state))));
        bufp->chgBit(oldp+104,((0U == (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__internal_tx_state))));
        bufp->chgBit(oldp+105,((3U == (IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__internal_tx_state))));
        bufp->chgBit(oldp+106,(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__packet_in_assembly));
        bufp->chgBit(oldp+107,(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__tx_packet_valid));
        bufp->chgSData(oldp+108,(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__current_packet_size),16);
        bufp->chgQData(oldp+109,(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__current_header),64);
        bufp->chgBit(oldp+111,(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__lookup_table_initialized));
        bufp->chgQData(oldp+112,(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__total_packets_processed),64);
        bufp->chgQData(oldp+114,(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__total_credits_added),64);
        bufp->chgSData(oldp+116,(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__tx_packet_size),16);
        bufp->chgQData(oldp+117,(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__tx_packet_header),64);
        bufp->chgSData(oldp+119,(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__tx_beat_count),16);
        bufp->chgSData(oldp+120,(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__tx_total_beats),16);
        bufp->chgBit(oldp+121,(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__beat_tvalid));
        bufp->chgQData(oldp+122,(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__beat_tdata),64);
        bufp->chgCData(oldp+124,(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__beat_tkeep),8);
        bufp->chgQData(oldp+125,(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__beat_tuser),64);
        bufp->chgIData(oldp+127,(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__i),32);
        bufp->chgIData(oldp+128,(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__j),32);
        bufp->chgCData(oldp+129,(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__process_received_packet__Vstatic__queue_id),8);
        bufp->chgCData(oldp+130,(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__process_received_packet__Vstatic__local_dest_port),8);
        bufp->chgSData(oldp+131,(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__process_received_packet__Vstatic__global_dest_port),12);
        bufp->chgCData(oldp+132,(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__enqueue_packet__Vstatic__tail_idx),8);
        bufp->chgCData(oldp+133,(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__dequeue_packet__Vstatic__head_idx),8);
        bufp->chgSData(oldp+134,(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__Vstatic__byte_offset),16);
        bufp->chgSData(oldp+135,(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__Vstatic__bytes_remaining),16);
        bufp->chgSData(oldp+136,(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__Vstatic__bytes_in_beat),16);
        bufp->chgIData(oldp+137,(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__send_internal_beat__Vstatic__b),32);
        bufp->chgIData(oldp+138,((IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__total_packets_processed)),32);
        bufp->chgIData(oldp+139,((IData)(vlSelfRef.tb_ingress_queue_manager__DOT__dut__DOT__total_credits_added)),32);
    }
    bufp->chgBit(oldp+140,(vlSelfRef.tb_ingress_queue_manager__DOT__clk));
    bufp->chgBit(oldp+141,(vlSelfRef.tb_ingress_queue_manager__DOT__internal_out_s2m));
}

void Vtb_ingress_queue_manager___024root__trace_cleanup(void* voidSelf, VerilatedVcd* /*unused*/) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_ingress_queue_manager___024root__trace_cleanup\n"); );
    // Init
    Vtb_ingress_queue_manager___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<Vtb_ingress_queue_manager___024root*>(voidSelf);
    Vtb_ingress_queue_manager__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    // Body
    vlSymsp->__Vm_activity = false;
    vlSymsp->TOP.__Vm_traceActivity[0U] = 0U;
    vlSymsp->TOP.__Vm_traceActivity[1U] = 0U;
    vlSymsp->TOP.__Vm_traceActivity[2U] = 0U;
    vlSymsp->TOP.__Vm_traceActivity[3U] = 0U;
    vlSymsp->TOP.__Vm_traceActivity[4U] = 0U;
}
