// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtb_ingress_queue_manager.h for the primary calling header

#include "Vtb_ingress_queue_manager__pch.h"
#include "Vtb_ingress_queue_manager__Syms.h"
#include "Vtb_ingress_queue_manager___024unit.h"

void Vtb_ingress_queue_manager___024unit___ctor_var_reset(Vtb_ingress_queue_manager___024unit* vlSelf);

Vtb_ingress_queue_manager___024unit::Vtb_ingress_queue_manager___024unit(Vtb_ingress_queue_manager__Syms* symsp, const char* v__name)
    : VerilatedModule{v__name}
    , vlSymsp{symsp}
 {
    // Reset structure values
    Vtb_ingress_queue_manager___024unit___ctor_var_reset(this);
}

void Vtb_ingress_queue_manager___024unit::__Vconfigure(bool first) {
    (void)first;  // Prevent unused variable warning
}

Vtb_ingress_queue_manager___024unit::~Vtb_ingress_queue_manager___024unit() {
}
