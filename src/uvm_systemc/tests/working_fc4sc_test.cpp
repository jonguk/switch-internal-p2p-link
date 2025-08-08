/******************************************************************************
 * Working FC4SC Test - Using xml_printer directly
 * 
 * This test uses the xml_printer class directly to generate coverage reports
 ******************************************************************************/

#include <iostream>
#include <fstream>
#include "../fc4sc/includes/fc4sc.hpp"

int main() {
    std::cout << "=== Working FC4SC Test Started ===" << std::endl;
    
    try {
        // Get FC4SC global instance
        fc4sc::global* g = fc4sc::global::getter();
        if (g != nullptr) {
            std::cout << "✅ FC4SC global instance created successfully!" << std::endl;
            
            // Create XML file using xml_printer
            std::ofstream xml_file("build/working_fc4sc_coverage.xml");
            if (xml_file.is_open()) {
                std::cout << "Creating XML coverage report..." << std::endl;
                
                // Use xml_printer to generate UCIS XML report
                xml_printer printer(xml_file);
                printer.print_data_xml(g);
                
                xml_file.close();
                std::cout << "✅ FC4SC XML coverage report generated: build/working_fc4sc_coverage.xml" << std::endl;
            } else {
                std::cout << "❌ Could not create XML file" << std::endl;
            }
        } else {
            std::cout << "❌ FC4SC global instance is null" << std::endl;
        }
    } catch (const std::exception& e) {
        std::cout << "❌ FC4SC error: " << e.what() << std::endl;
    }
    
    std::cout << "=== Working FC4SC Test Completed ===" << std::endl;
    return 0;
}