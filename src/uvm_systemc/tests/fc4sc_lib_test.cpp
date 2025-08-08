#include <iostream>
#include "../fc4sc/includes/fc4sc.hpp"

int main() {
    std::cout << "=== FC4SC Library Test ===" << std::endl;
    
    try {
        fc4sc::global* g = fc4sc::global::getter();
        if (g != nullptr) {
            std::cout << "✅ FC4SC global instance created successfully!" << std::endl;
            std::cout << "✅ FC4SC library loaded and working!" << std::endl;
        } else {
            std::cout << "❌ FC4SC global instance is null" << std::endl;
        }
    } catch (const std::exception& e) {
        std::cout << "❌ FC4SC error: " << e.what() << std::endl;
    }
    
    std::cout << "=== FC4SC Library Test Done ===" << std::endl;
    return 0;
}
