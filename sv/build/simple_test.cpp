#include <iostream>
#include <verilated.h>

// SystemC time stamp function
double sc_time_stamp() { return 0; }

int main() {
    std::cout << "SV Build folder test - Verilator version: " << Verilated::productVersion() << std::endl;
    return 0;
}