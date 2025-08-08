/******************************************************************************
 * UVM Error Injection Test
 * 
 * UVM-SystemC 기반의 완전한 에러 테스트 환경입니다.
 ******************************************************************************/

#include <systemc.h>
#include <uvm>
#include <iostream>
#include <vector>
#include <map>

using namespace sc_core;
using namespace uvm;

// =============================================================================
// Error Types and Packet Transaction
// =============================================================================

enum class ErrorType {
    CRC_ERROR,
    INVALID_PORT,
    OVERSIZED_PACKET,
    UNDERSIZED_PACKET,
    PROTOCOL_VIOLATION,
    TIMEOUT_ERROR,
    BUFFER_OVERFLOW,
    NONE
};

class error_packet_transaction : public uvm_sequence_item {
public:
    // 패킷 데이터
    uint8_t dest_port;
    uint8_t source_port;
    uint16_t payload_size;
    std::vector<uint8_t> payload_data;
    
    // 에러 정보
    ErrorType error_type;
    bool inject_error_flag;
    
    // 예상 결과
    bool expect_drop;
    bool expect_error_detection;
    
    UVM_OBJECT_UTILS(error_packet_transaction)
    
    error_packet_transaction(const std::string& name = "error_packet_transaction") 
        : uvm_sequence_item(name), dest_port(1), source_port(1), payload_size(64),
          error_type(ErrorType::NONE), inject_error_flag(false),
          expect_drop(false), expect_error_detection(false) {
        generate_payload();
    }
    
    void generate_payload() {
        payload_data.clear();
        for (uint16_t i = 0; i < payload_size; i++) {
            payload_data.push_back(0xAA + (i % 256));
        }
    }
    
    void set_error_type(ErrorType err_type) {
        error_type = err_type;
        inject_error_flag = true;
        
        switch (err_type) {
            case ErrorType::CRC_ERROR:
                expect_drop = true;
                expect_error_detection = true;
                break;
                
            case ErrorType::INVALID_PORT:
                dest_port = 255;  // 잘못된 포트
                expect_drop = true;
                expect_error_detection = true;
                break;
                
            case ErrorType::OVERSIZED_PACKET:
                payload_size = 2048;  // 최대 크기 초과
                generate_payload();
                expect_drop = true;
                expect_error_detection = true;
                break;
                
            case ErrorType::UNDERSIZED_PACKET:
                payload_size = 0;  // 최소 크기 미만
                payload_data.clear();
                expect_drop = true;
                expect_error_detection = true;
                break;
                
            case ErrorType::PROTOCOL_VIOLATION:
                expect_error_detection = true;
                break;
                
            case ErrorType::TIMEOUT_ERROR:
                expect_error_detection = true;
                break;
                
            case ErrorType::BUFFER_OVERFLOW:
                expect_error_detection = true;
                break;
                
            default:
                inject_error_flag = false;
                break;
        }
    }
    
    virtual std::string convert2string() const {
        std::ostringstream str;
        str << "ERROR_PKT: type=" << static_cast<int>(error_type)
            << " dest=" << (int)dest_port << " src=" << (int)source_port 
            << " size=" << payload_size;
        if (inject_error_flag) str << " [ERROR_INJECTED]";
        if (expect_drop) str << " [EXPECT_DROP]";
        return str.str();
    }
};

// =============================================================================
// Error Statistics Collector
// =============================================================================

class error_statistics : public uvm_component {
private:
    std::map<ErrorType, int> error_counts;
    int total_injections;
    int detected_errors;
    int dropped_packets;
    int false_positives;
    
public:
    UVM_COMPONENT_UTILS(error_statistics)
    
    error_statistics(uvm_component_name name) : uvm_component(name),
        total_injections(0), detected_errors(0), dropped_packets(0), false_positives(0) {}
    
    void record_error_injection(ErrorType type) {
        error_counts[type]++;
        total_injections++;
        UVM_INFO(get_name(), ("Error injected: " + std::to_string(static_cast<int>(type))).c_str(), UVM_MEDIUM);
    }
    
    void record_error_detection(bool detected, bool expected) {
        if (detected && expected) {
            detected_errors++;
        } else if (detected && !expected) {
            false_positives++;
        }
    }
    
    void record_packet_drop(bool dropped) {
        if (dropped) {
            dropped_packets++;
        }
    }
    
    void print_final_report() {
        UVM_INFO(get_name(), "=== FINAL ERROR INJECTION REPORT ===", UVM_LOW);
        UVM_INFO(get_name(), ("Total Error Injections: " + std::to_string(total_injections)).c_str(), UVM_LOW);
        UVM_INFO(get_name(), ("Detected Errors: " + std::to_string(detected_errors)).c_str(), UVM_LOW);
        UVM_INFO(get_name(), ("Dropped Packets: " + std::to_string(dropped_packets)).c_str(), UVM_LOW);
        UVM_INFO(get_name(), ("False Positives: " + std::to_string(false_positives)).c_str(), UVM_LOW);
        
        if (total_injections > 0) {
            double detection_rate = (double)detected_errors / total_injections * 100.0;
            double drop_rate = (double)dropped_packets / total_injections * 100.0;
            UVM_INFO(get_name(), ("Error Detection Rate: " + std::to_string(detection_rate) + "%").c_str(), UVM_LOW);
            UVM_INFO(get_name(), ("Packet Drop Rate: " + std::to_string(drop_rate) + "%").c_str(), UVM_LOW);
        }
        
        UVM_INFO(get_name(), "--- Error Type Breakdown ---", UVM_LOW);
        for (const auto& pair : error_counts) {
            UVM_INFO(get_name(), ("Error Type " + std::to_string(static_cast<int>(pair.first)) + 
                                ": " + std::to_string(pair.second) + " injections").c_str(), UVM_LOW);
        }
        UVM_INFO(get_name(), "=====================================", UVM_LOW);
    }
};

// =============================================================================
// Error Driver
// =============================================================================

class error_driver : public uvm_driver<error_packet_transaction> {
public:
    // SystemC 인터페이스 신호들
    sc_signal<bool>* data_valid;
    sc_signal<sc_uint<64>>* data_word;
    sc_signal<bool>* data_ready;
    sc_signal<bool>* inject_error;
    sc_signal<int>* error_type_sig;
    
    error_statistics* stats;
    
    UVM_COMPONENT_UTILS(error_driver)
    
    error_driver(uvm_component_name name) : uvm_driver<error_packet_transaction>(name),
        data_valid(nullptr), data_word(nullptr), data_ready(nullptr), 
        inject_error(nullptr), error_type_sig(nullptr), stats(nullptr) {}
    
    virtual void build_phase(uvm_phase& phase) {
        uvm_driver<error_packet_transaction>::build_phase(phase);
        
        // Statistics 컴포넌트 찾기
        if (!uvm_config_db<error_statistics*>::get(this, "", "stats", stats)) {
            UVM_ERROR(get_name(), "Cannot get stats from config_db");
        }
    }
    
    virtual void run_phase(uvm_phase& phase) {
        UVM_INFO(get_name(), "Starting error driver run phase", UVM_MEDIUM);
        
        if (!check_interface_connections()) {
            UVM_ERROR(get_name(), "Interface signals not properly connected!");
            return;
        }
        
        // 신호 초기화
        initialize_signals();
        wait(50, SC_NS);
        
        error_packet_transaction req;
        while (true) {
            seq_item_port.get_next_item(req);
            
            UVM_INFO(get_name(), ("Driving transaction: " + req.convert2string()).c_str(), UVM_MEDIUM);
            
            // 통계 기록
            if (stats) {
                stats->record_error_injection(req.error_type);
            }
            
            // 에러 주입
            drive_error_transaction(req);
            
            seq_item_port.item_done();
            wait(100, SC_NS);  // 다음 트랜잭션 간격
        }
    }
    
private:
    bool check_interface_connections() {
        return (data_valid && data_word && data_ready && inject_error && error_type_sig);
    }
    
    void initialize_signals() {
        data_valid->write(false);
        data_word->write(0);
        inject_error->write(false);
        error_type_sig->write(static_cast<int>(ErrorType::NONE));
    }
    
    void drive_error_transaction(const error_packet_transaction& req) {
        // 에러 타입 설정
        if (req.inject_error_flag) {
            inject_error->write(true);
            error_type_sig->write(static_cast<int>(req.error_type));
        }
        
        // 데이터 전송
        sc_uint<64> data_value = 0;
        
        // 패킷 데이터를 64비트 워드로 변환
        if (req.payload_data.size() >= 8) {
            for (int i = 0; i < 8; i++) {
                data_value.range(i*8+7, i*8) = req.payload_data[i];
            }
        } else {
            // 작은 패킷의 경우 헤더 정보 포함
            data_value.range(31, 24) = req.dest_port;
            data_value.range(23, 16) = req.source_port;
            data_value.range(15, 0) = req.payload_size;
        }
        
        // 특별한 에러 케이스 처리
        switch (req.error_type) {
            case ErrorType::CRC_ERROR:
                data_value = 0xDEADBEEF;  // CRC 에러 시그니처
                break;
            case ErrorType::INVALID_PORT:
                data_value.range(31, 24) = 255;  // 잘못된 포트
                break;
            case ErrorType::PROTOCOL_VIOLATION:
                // 프로토콜 위반: ready 신호 무시하고 전송
                data_ready->write(false);
                break;
            default:
                break;
        }
        
        // 데이터 전송
        data_word->write(data_value);
        data_valid->write(true);
        
        wait(20, SC_NS);
        
        data_valid->write(false);
        inject_error->write(false);
        error_type_sig->write(static_cast<int>(ErrorType::NONE));
        data_ready->write(true);  // ready 신호 복원
        
        wait(10, SC_NS);
    }
};

// =============================================================================
// Error Monitor
// =============================================================================

class error_monitor : public uvm_monitor {
public:
    // SystemC 인터페이스 신호들
    sc_signal<bool>* data_valid;
    sc_signal<sc_uint<64>>* data_word;
    sc_signal<bool>* data_ready;
    sc_signal<bool>* error_detected;
    sc_signal<bool>* packet_dropped;
    
    // Analysis port
    uvm_analysis_port<error_packet_transaction> analysis_port;
    
    error_statistics* stats;
    
    UVM_COMPONENT_UTILS(error_monitor)
    
    error_monitor(uvm_component_name name) : uvm_monitor(name), 
        data_valid(nullptr), data_word(nullptr),
        data_ready(nullptr), error_detected(nullptr), packet_dropped(nullptr), 
        analysis_port("analysis_port"), stats(nullptr) {}
    
    virtual void build_phase(uvm_phase& phase) {
        uvm_monitor::build_phase(phase);
        
        // Statistics 컴포넌트 찾기
        if (!uvm_config_db<error_statistics*>::get(this, "", "stats", stats)) {
            UVM_ERROR(get_name(), "Cannot get stats from config_db");
        }
    }
    
    virtual void run_phase(uvm_phase& phase) {
        UVM_INFO(get_name(), "Starting error monitor run phase", UVM_MEDIUM);
        
        if (!check_interface_connections()) {
            UVM_ERROR(get_name(), "Interface signals not properly connected!");
            return;
        }
        
        int transactions_monitored = 0;
        
        while (transactions_monitored < 20) {  // 20개 트랜잭션 모니터링
            wait(10, SC_NS);
            
            // 데이터 전송 감지
            if (data_valid && data_valid->read()) {
                sc_uint<64> data = data_word->read();
                
                UVM_INFO(get_name(), ("Data detected: 0x" + data.to_string(SC_HEX)).c_str(), UVM_HIGH);
                
                // 에러 감지 확인
                bool error_flag = error_detected ? error_detected->read() : false;
                bool drop_flag = packet_dropped ? packet_dropped->read() : false;
                
                if (stats) {
                    stats->record_error_detection(error_flag, true);  // 모든 에러가 감지되어야 함
                    stats->record_packet_drop(drop_flag);
                }
                
                if (error_flag) {
                    UVM_INFO(get_name(), "Error detection confirmed!", UVM_MEDIUM);
                }
                
                if (drop_flag) {
                    UVM_INFO(get_name(), "Packet drop confirmed!", UVM_MEDIUM);
                }
                
                transactions_monitored++;
            }
        }
        
        UVM_INFO(get_name(), "Error monitoring completed", UVM_MEDIUM);
    }
    
private:
    bool check_interface_connections() {
        return (data_valid && data_word && data_ready);
    }
};

// =============================================================================
// Error Sequence
// =============================================================================

class error_injection_sequence : public uvm_sequence<error_packet_transaction> {
public:
    UVM_OBJECT_UTILS(error_injection_sequence)
    
    error_injection_sequence(const std::string& name = "error_injection_sequence")
        : uvm_sequence<error_packet_transaction>(name) {}
    
    virtual void body() {
        UVM_INFO(get_name(), "Starting error injection sequence", UVM_MEDIUM);
        
        // 다양한 에러 타입 테스트
        std::vector<ErrorType> error_types = {
            ErrorType::NONE,              // 정상 패킷
            ErrorType::CRC_ERROR,
            ErrorType::INVALID_PORT,
            ErrorType::OVERSIZED_PACKET,
            ErrorType::UNDERSIZED_PACKET,
            ErrorType::PROTOCOL_VIOLATION,
            ErrorType::TIMEOUT_ERROR,
            ErrorType::BUFFER_OVERFLOW
        };
        
        for (ErrorType err_type : error_types) {
            for (int i = 0; i < 2; i++) {  // 각 에러 타입을 2번씩 테스트
                error_packet_transaction* req = error_packet_transaction::type_id::create("error_req");
                
                // 기본 패킷 설정
                req->dest_port = (i % 4) + 1;  // 포트 1-4
                req->source_port = 1;
                req->payload_size = 64 + (i * 32);
                
                // 에러 주입
                req->set_error_type(err_type);
                
                UVM_INFO(get_name(), ("Sending: " + req->convert2string()).c_str(), UVM_MEDIUM);
                
                start_item(req);
                finish_item(req);
            }
        }
        
        UVM_INFO(get_name(), "Error injection sequence completed", UVM_MEDIUM);
    }
};

// =============================================================================
// Error Agent
// =============================================================================

class error_agent : public uvm_agent {
public:
    error_driver* driver;
    error_monitor* monitor;
    uvm_sequencer<error_packet_transaction>* sequencer;
    
    UVM_COMPONENT_UTILS(error_agent)
    
    error_agent(uvm_component_name name) : uvm_agent(name),
        driver(nullptr), monitor(nullptr), sequencer(nullptr) {}
    
    virtual void build_phase(uvm_phase& phase) {
        uvm_agent::build_phase(phase);
        
        driver = error_driver::type_id::create("error_driver", this);
        monitor = error_monitor::type_id::create("error_monitor", this);
        sequencer = new uvm_sequencer<error_packet_transaction>("error_sequencer");
        
        UVM_INFO(get_name(), "Error agent build phase completed", UVM_MEDIUM);
    }
    
    virtual void connect_phase(uvm_phase& phase) {
        uvm_agent::connect_phase(phase);
        
        driver->seq_item_port.connect(sequencer->seq_item_export);
        
        UVM_INFO(get_name(), "Error agent connect phase completed", UVM_MEDIUM);
    }
};

// =============================================================================
// Error Environment
// =============================================================================

class error_environment : public uvm_env {
public:
    error_agent* agent;
    error_statistics* stats;
    
    UVM_COMPONENT_UTILS(error_environment)
    
    error_environment(uvm_component_name name) : uvm_env(name),
        agent(nullptr), stats(nullptr) {}
    
    virtual void build_phase(uvm_phase& phase) {
        uvm_env::build_phase(phase);
        
        agent = error_agent::type_id::create("error_agent", this);
        stats = error_statistics::type_id::create("error_stats", this);
        
        // Statistics를 config_db에 등록
        uvm_config_db<error_statistics*>::set(this, "*", "stats", stats);
        
        UVM_INFO(get_name(), "Error environment build phase completed", UVM_MEDIUM);
    }
    
    virtual void end_of_elaboration_phase(uvm_phase& phase) {
        uvm_env::end_of_elaboration_phase(phase);
        
        // 최종 리포트 출력
        stats->print_final_report();
    }
};

// =============================================================================
// Error Test
// =============================================================================

class uvm_error_test : public uvm_test {
public:
    error_environment* env;
    
    UVM_COMPONENT_UTILS(uvm_error_test)
    
    uvm_error_test(uvm_component_name name) : uvm_test(name), env(nullptr) {}
    
    virtual void build_phase(uvm_phase& phase) {
        uvm_test::build_phase(phase);
        
        env = error_environment::type_id::create("error_env", this);
        
        UVM_INFO(get_name(), "UVM error test build phase completed", UVM_LOW);
    }
    
    virtual void run_phase(uvm_phase& phase) {
        UVM_INFO(get_name(), "Starting UVM error test run phase", UVM_LOW);
        phase.raise_objection(this);
        
        // Error injection sequence 실행
        error_injection_sequence* seq = error_injection_sequence::type_id::create("error_seq");
        seq->start(env->agent->sequencer);
        
        // 테스트 완료 대기
        wait(2000, SC_NS);
        
        UVM_INFO(get_name(), "UVM error test completed", UVM_LOW);
        phase.drop_objection(this);
    }
};

// =============================================================================
// SystemC Testbench
// =============================================================================

SC_MODULE(uvm_error_testbench) {
    // Clock and reset
    sc_clock clk;
    sc_signal<bool> rst_n;
    
    // Interface signals
    sc_signal<bool> data_valid;
    sc_signal<sc_uint<64>> data_word;
    sc_signal<bool> data_ready;
    sc_signal<bool> inject_error;
    sc_signal<int> error_type_sig;
    
    // Error detection signals
    sc_signal<bool> error_detected;
    sc_signal<bool> packet_dropped;
    
    // UVM 테스트 인스턴스
    uvm_error_test* test;
    
    SC_CTOR(uvm_error_testbench) : clk("clk", 10, SC_NS) {
        // 신호 초기화
        data_valid.write(false);
        data_word.write(0);
        data_ready.write(true);
        inject_error.write(false);
        error_type_sig.write(0);
        error_detected.write(false);
        packet_dropped.write(false);
        
        // UVM 테스트 생성
        test = uvm_error_test::type_id::create("uvm_error_test", nullptr);
        
        // SystemC 신호를 UVM 컴포넌트에 연결
        connect_uvm_interface();
        
        // SystemC 프로세스들
        SC_THREAD(reset_process);
        SC_METHOD(error_detector_process);
        sensitive << data_valid << inject_error << error_type_sig;
        
        SC_METHOD(packet_dropper_process);
        sensitive << error_detected;
    }
    
    void connect_uvm_interface() {
        if (test && test->env && test->env->agent) {
            if (test->env->agent->driver) {
                test->env->agent->driver->data_valid = &data_valid;
                test->env->agent->driver->data_word = &data_word;
                test->env->agent->driver->data_ready = &data_ready;
                test->env->agent->driver->inject_error = &inject_error;
                test->env->agent->driver->error_type_sig = &error_type_sig;
            }
            
            if (test->env->agent->monitor) {
                test->env->agent->monitor->data_valid = &data_valid;
                test->env->agent->monitor->data_word = &data_word;
                test->env->agent->monitor->data_ready = &data_ready;
                test->env->agent->monitor->error_detected = &error_detected;
                test->env->agent->monitor->packet_dropped = &packet_dropped;
            }
        }
    }
    
    void reset_process() {
        rst_n.write(false);
        wait(25, SC_NS);
        rst_n.write(true);
        std::cout << "[TB] Reset sequence completed" << std::endl;
    }
    
    void error_detector_process() {
        bool error_flag = false;
        
        if (data_valid.read() && inject_error.read()) {
            ErrorType err_type = static_cast<ErrorType>(error_type_sig.read());
            
            switch (err_type) {
                case ErrorType::CRC_ERROR:
                    if (data_word.read() == 0xDEADBEEF) {
                        error_flag = true;
                        std::cout << "[TB] CRC error detected!" << std::endl;
                    }
                    break;
                    
                case ErrorType::INVALID_PORT:
                    if (data_word.read().range(31, 24) == 255) {
                        error_flag = true;
                        std::cout << "[TB] Invalid port error detected!" << std::endl;
                    }
                    break;
                    
                case ErrorType::PROTOCOL_VIOLATION:
                    if (!data_ready.read()) {
                        error_flag = true;
                        std::cout << "[TB] Protocol violation detected!" << std::endl;
                    }
                    break;
                    
                default:
                    if (err_type != ErrorType::NONE) {
                        error_flag = true;
                        std::cout << "[TB] Error type " << static_cast<int>(err_type) << " detected!" << std::endl;
                    }
                    break;
            }
        }
        
        error_detected.write(error_flag);
    }
    
    void packet_dropper_process() {
        // 에러가 감지되면 패킷 드롭
        packet_dropped.write(error_detected.read());
    }
};

int sc_main(int argc, char* argv[]) {
    std::cout << "=== UVM Error Injection Test ===" << std::endl;
    
    // UVM testbench 생성
    uvm_error_testbench tb("uvm_error_testbench");
    
    // UVM 테스트 실행
    run_test();
    
    std::cout << "=== UVM Error Test Completed ===" << std::endl;
    return 0;
}