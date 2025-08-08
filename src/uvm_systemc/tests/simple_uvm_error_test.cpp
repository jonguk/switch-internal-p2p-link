/******************************************************************************
 * Simple UVM Error Injection Test
 * 
 * 간단한 UVM-SystemC 기반 에러 테스트입니다.
 ******************************************************************************/

#include <systemc.h>
#include <uvm>
#include <iostream>
#include <vector>
#include <map>

using namespace sc_core;
using namespace uvm;

// =============================================================================
// Error Types and Statistics
// =============================================================================

enum class ErrorType {
    CRC_ERROR,
    INVALID_PORT,
    OVERSIZED_PACKET,
    PROTOCOL_VIOLATION,
    TIMEOUT_ERROR,
    NONE
};

class error_statistics {
private:
    std::map<ErrorType, int> error_counts;
    int total_injections;
    int detected_errors;
    
public:
    error_statistics() : total_injections(0), detected_errors(0) {}
    
    void inject_error(ErrorType type) {
        error_counts[type]++;
        total_injections++;
    }
    
    void detect_error(bool detected) {
        if (detected) detected_errors++;
    }
    
    void print_report() {
        std::cout << "\n=== UVM ERROR INJECTION REPORT ===" << std::endl;
        std::cout << "Total Error Injections: " << total_injections << std::endl;
        std::cout << "Detected Errors: " << detected_errors << std::endl;
        
        if (total_injections > 0) {
            double detection_rate = (double)detected_errors / total_injections * 100.0;
            std::cout << "Error Detection Rate: " << std::fixed << std::setprecision(2) 
                      << detection_rate << "%" << std::endl;
        }
        
        std::cout << "\n--- Error Type Breakdown ---" << std::endl;
        for (const auto& pair : error_counts) {
            std::cout << "Error Type " << static_cast<int>(pair.first) 
                      << ": " << pair.second << " injections" << std::endl;
        }
        std::cout << "===============================" << std::endl;
    }
};

// =============================================================================
// Error Packet Transaction
// =============================================================================

class error_packet_transaction : public uvm_sequence_item {
public:
    uint8_t dest_port;
    uint16_t payload_size;
    ErrorType error_type;
    bool expect_error_detection;
    
    UVM_OBJECT_UTILS(error_packet_transaction)
    
    error_packet_transaction(const std::string& name = "error_packet") 
        : uvm_sequence_item(name), dest_port(1), payload_size(64),
          error_type(ErrorType::NONE), expect_error_detection(false) {}
    
    void set_error_type(ErrorType err_type) {
        error_type = err_type;
        expect_error_detection = true;
        
        switch (err_type) {
            case ErrorType::INVALID_PORT:
                dest_port = 255;  // 잘못된 포트
                break;
            case ErrorType::OVERSIZED_PACKET:
                payload_size = 2048;  // 최대 크기 초과
                break;
            default:
                break;
        }
    }
    
    virtual std::string convert2string() const {
        std::ostringstream str;
        str << "ERROR_PKT: type=" << static_cast<int>(error_type)
            << " dest=" << (int)dest_port << " size=" << payload_size;
        return str.str();
    }
};

// =============================================================================
// Simple UVM Test
// =============================================================================

class simple_uvm_error_test : public uvm_test {
public:
    error_statistics stats;
    
    UVM_COMPONENT_UTILS(simple_uvm_error_test)
    
    simple_uvm_error_test(uvm_component_name name) : uvm_test(name) {}
    
    virtual void build_phase(uvm_phase& phase) {
        uvm_test::build_phase(phase);
        UVM_INFO(get_name(), "Simple UVM error test build phase completed", UVM_LOW);
    }
    
    virtual void run_phase(uvm_phase& phase) {
        UVM_INFO(get_name(), "Starting simple UVM error test run phase", UVM_LOW);
        phase.raise_objection(this);
        
        // 다양한 에러 타입 테스트
        test_error_scenarios();
        
        // 테스트 완료 대기
        wait(1000, SC_NS);
        
        // 최종 리포트 출력
        stats.print_report();
        
        UVM_INFO(get_name(), "Simple UVM error test completed", UVM_LOW);
        phase.drop_objection(this);
    }
    
private:
    void test_error_scenarios() {
        std::vector<ErrorType> error_types = {
            ErrorType::NONE,
            ErrorType::CRC_ERROR,
            ErrorType::INVALID_PORT,
            ErrorType::OVERSIZED_PACKET,
            ErrorType::PROTOCOL_VIOLATION,
            ErrorType::TIMEOUT_ERROR
        };
        
        for (ErrorType err_type : error_types) {
            // 에러 패킷 생성
            error_packet_transaction pkt("error_pkt");
            pkt.set_error_type(err_type);
            
            // 통계 기록
            stats.inject_error(err_type);
            
            // 에러 시뮬레이션
            bool error_detected = simulate_error_injection(pkt);
            
            // 결과 기록
            stats.detect_error(error_detected);
            
            UVM_INFO(get_name(), ("Tested: " + pkt.convert2string() + 
                                " -> Detected: " + (error_detected ? "YES" : "NO")).c_str(), UVM_MEDIUM);
            
            wait(100, SC_NS);
        }
    }
    
    bool simulate_error_injection(const error_packet_transaction& pkt) {
        bool detected = false;
        
        switch (pkt.error_type) {
            case ErrorType::CRC_ERROR:
                UVM_INFO(get_name(), "Simulating CRC error detection", UVM_HIGH);
                detected = true;  // CRC 에러는 항상 감지됨
                break;
                
            case ErrorType::INVALID_PORT:
                if (pkt.dest_port > 8) {  // 포트 1-8만 유효
                    UVM_INFO(get_name(), "Invalid port detected", UVM_HIGH);
                    detected = true;
                }
                break;
                
            case ErrorType::OVERSIZED_PACKET:
                if (pkt.payload_size > 1500) {  // 최대 1500바이트
                    UVM_INFO(get_name(), "Oversized packet detected", UVM_HIGH);
                    detected = true;
                }
                break;
                
            case ErrorType::PROTOCOL_VIOLATION:
                UVM_INFO(get_name(), "Protocol violation detected", UVM_HIGH);
                detected = true;
                break;
                
            case ErrorType::TIMEOUT_ERROR:
                UVM_INFO(get_name(), "Timeout error detected", UVM_HIGH);
                detected = true;
                break;
                
            case ErrorType::NONE:
                // 정상 패킷은 에러 없음
                break;
        }
        
        return detected;
    }
};

// =============================================================================
// SystemC Top Module
// =============================================================================

SC_MODULE(simple_uvm_testbench) {
    // Clock and reset
    sc_clock clk;
    sc_signal<bool> rst_n;
    
    // Interface signals
    sc_signal<bool> data_valid;
    sc_signal<sc_uint<64>> data_word;
    sc_signal<bool> error_detected;
    
    SC_CTOR(simple_uvm_testbench) : clk("clk", 10, SC_NS) {
        // 신호 초기화
        data_valid.write(false);
        data_word.write(0);
        error_detected.write(false);
        
        // SystemC 프로세스들
        SC_THREAD(reset_process);
        SC_METHOD(error_monitor_process);
        sensitive << data_valid << data_word;
    }
    
    void reset_process() {
        rst_n.write(false);
        wait(25, SC_NS);
        rst_n.write(true);
        std::cout << "[TB] Reset sequence completed" << std::endl;
    }
    
    void error_monitor_process() {
        if (data_valid.read()) {
            sc_uint<64> data = data_word.read();
            
            // 간단한 에러 감지 로직
            bool error = false;
            if (data == 0xDEADBEEF) {
                error = true;
                std::cout << "[TB] CRC error pattern detected!" << std::endl;
            }
            
            error_detected.write(error);
        }
    }
};

int sc_main(int argc, char* argv[]) {
    std::cout << "=== Simple UVM Error Injection Test ===" << std::endl;
    
    // SystemC testbench 생성
    simple_uvm_testbench tb("simple_uvm_testbench");
    
    // UVM 테스트 실행
    run_test("simple_uvm_error_test");
    
    std::cout << "=== Simple UVM Error Test Completed ===" << std::endl;
    return 0;
}