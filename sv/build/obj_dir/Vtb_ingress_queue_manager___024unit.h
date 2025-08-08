// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Vtb_ingress_queue_manager.h for the primary calling header

#ifndef VERILATED_VTB_INGRESS_QUEUE_MANAGER___024UNIT_H_
#define VERILATED_VTB_INGRESS_QUEUE_MANAGER___024UNIT_H_  // guard

#include "verilated.h"
#include "verilated_timing.h"


class Vtb_ingress_queue_manager__Syms;

class alignas(VL_CACHE_LINE_BYTES) Vtb_ingress_queue_manager___024unit final : public VerilatedModule {
  public:

    // INTERNAL VARIABLES
    Vtb_ingress_queue_manager__Syms* const vlSymsp;

    // CONSTRUCTORS
    Vtb_ingress_queue_manager___024unit(Vtb_ingress_queue_manager__Syms* symsp, const char* v__name);
    ~Vtb_ingress_queue_manager___024unit();
    VL_UNCOPYABLE(Vtb_ingress_queue_manager___024unit);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
};


#endif  // guard
