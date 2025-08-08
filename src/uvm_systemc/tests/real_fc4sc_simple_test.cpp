/******************************************************************************
 * Real FC4SC Simple Test - Based on Official Examples
 * 
 * This test demonstrates proper FC4SC usage following the official benchmark
 * example from: https://github.com/accellera-official/fc4sc/blob/master/examples/benchmark/main.cpp
 ******************************************************************************/

#include <iostream>
#include <array>
#include "../fc4sc/includes/fc4sc.hpp"

using std::array;

// Define a simple coverage class following FC4SC official example pattern
class packet_coverage : public fc4sc::covergroup {
public:
    // Must call parent constructor to register a new covergroup
    CG_CONS(packet_coverage) { }

    // Sample points for our packet attributes
    int SAMPLE_POINT(dest_port, dest_port_cvp);
    int SAMPLE_POINT(payload_size, payload_size_cvp);
    int SAMPLE_POINT(channel_type, channel_type_cvp);
    
    void sample(int dest_port, int payload_size, int channel_type) {
        this->dest_port = dest_port;
        this->payload_size = payload_size;
        this->channel_type = channel_type;
        fc4sc::covergroup::sample();
    }

    // Define coverpoints with bins
    fc4sc::coverpoint<int> dest_port_cvp = fc4sc::coverpoint<int>(this,
        fc4sc::bin<int>("port_1", 1),
        fc4sc::bin<int>("port_2", 2),
        fc4sc::bin<int>("port_3", 3),
        fc4sc::bin<int>("port_4", 4)
    );
    
    fc4sc::coverpoint<int> payload_size_cvp = fc4sc::coverpoint<int>(this,
        fc4sc::bin<int>("small", fc4sc::interval(1, 64)),
        fc4sc::bin<int>("medium", fc4sc::interval(65, 256)),
        fc4sc::bin<int>("large", fc4sc::interval(257, 512)),
        fc4sc::bin<int>("huge", fc4sc::interval(513, 1024))
    );
    
    fc4sc::coverpoint<int> channel_type_cvp = fc4sc::coverpoint<int>(this,
        fc4sc::bin<int>("low_priority", 0),
        fc4sc::bin<int>("high_priority", 1)
    );
    
    // Cross coverage
    fc4sc::cross<int, int> dest_size_cross = fc4sc::cross<int, int>(this,
        &dest_port_cvp,
        &payload_size_cvp
    );
};

int main() {
    std::cout << "=== Real FC4SC Simple Test Started ===" << std::endl;
    
    // Create coverage instance following official example pattern
    array<packet_coverage, 1> coverage_array;
    
    // Sample various packet scenarios
    std::cout << "Sampling packet transactions..." << std::endl;
    
    // Small packets to different ports
    coverage_array[0].sample(1, 32, 0);   // port 1, small, low priority
    coverage_array[0].sample(2, 64, 0);   // port 2, small, low priority
    coverage_array[0].sample(3, 96, 1);   // port 3, medium, high priority
    coverage_array[0].sample(4, 128, 0);  // port 4, medium, low priority
    
    // Medium packets
    coverage_array[0].sample(1, 256, 1);  // port 1, medium, high priority
    coverage_array[0].sample(2, 200, 0);  // port 2, medium, low priority
    
    // Large packets  
    coverage_array[0].sample(3, 512, 0);  // port 3, large, low priority
    coverage_array[0].sample(4, 400, 1);  // port 4, large, high priority
    
    // Huge packets
    coverage_array[0].sample(1, 1024, 0); // port 1, huge, low priority
    coverage_array[0].sample(2, 800, 1);  // port 2, huge, high priority
    
    std::cout << "Sampling completed. Generating coverage report..." << std::endl;
    
    // Generate XML coverage report using official FC4SC method
    // This is the key line from the official example:
    fc4sc::global::coverage_save("build/real_fc4sc_coverage_report.xml");
    
    std::cout << "✅ Real FC4SC coverage report generated: build/real_fc4sc_coverage_report.xml" << std::endl;
    std::cout << "=== Real FC4SC Simple Test Completed ===" << std::endl;
    
    return 0;
}