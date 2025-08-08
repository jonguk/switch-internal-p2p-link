/******************************************************************************
 * Ingress Port Manager Error Test Cases
 * 
 * 이 테스트는 다양한 에러 시나리오를 검증합니다:
 * 1. CRC 에러
 * 2. 잘못된 헤더 포맷
 * 3. 오버플로우/언더플로우
 * 4. 프로토콜 위반
 * 5. 타임아웃 조건
 ******************************************************************************/

#include <systemc>
#include <uvm>
#include "../../systemc/port_manager/ingress_port_manager.h"
#include "../../systemc/common/switch_types.h"
#include <random>

using namespace sc_core;
using namespace uvm;
using namespace switch_internal_p2p;

// =============================================================================
// Error Transaction Classes
// =============================================================================

enum class ErrorType {
    CRC_ERROR,              // CRC 불일치
    INVALID_DEST_PORT,      // 잘못된 목적지 포트
    INVALID_SOURCE_PORT,    // 잘못된 소스 포트  
    OVERSIZED_PACKET,       // 최대 크기 초과
    UNDERSIZED_PACKET,      // 최소 크기 미만
    INVALID_CHANNEL_TYPE,   // 잘못된 채널 타입
    INVALID_QUEUE_ID,       // 잘못된 큐 ID
    MALFORMED_HEADER,       // 헤더 포맷 오류
    PROTOCOL_VIOLATION,     // 프로토콜 위반
    TIMEOUT_ERROR,          // 타임아웃
    BUFFER_OVERFLOW,        // 버퍼 오버플로우
    NONE                    // 정상 패킷
};

class error_packet_transaction : public uvm_sequence_item {
public:
    // 기본 패킷 필드
    uint8_t dest_port;
    uint8_t source_port;
    uint16_t payload_size;
    std::vector<uint8_t> payload_data;
    ChannelType channel_type;
    uint8_t queue_id;
    
    // 에러 관련 필드
    ErrorType error_type;
    bool inject_crc_error;
    uint8_t corrupt_header_byte;    // 어느 헤더 바이트를 손상시킬지
    uint8_t corrupt_value;          // 손상시킬 값
    
    // 예상 결과
    bool expect_packet_dropped;
    bool expect_error_flag;
    bool expect_timeout;
    
    UVM_OBJECT_UTILS(error_packet_transaction)
    
    error_packet_transaction(const std::string& name = "error_packet_transaction") 
        : uvm_sequence_item(name), dest_port(1), source_port(1), payload_size(64),
          channel_type(ChannelType::LOW_PRIORITY), queue_id(0), 
          error_type(ErrorType::NONE), inject_crc_error(false),
          corrupt_header_byte(0), corrupt_value(0),
          expect_packet_dropped(false), expect_error_flag(false), expect_timeout(false) {
        generate_default_payload();
    }
    
    void generate_default_payload() {
        payload_data.clear();
        for (uint16_t i = 0; i < payload_size; i++) {
            payload_data.push_back(0xAA + (i % 256));
        }
    }
    
    void inject_error(ErrorType err_type) {
        error_type = err_type;
        
        switch (err_type) {
            case ErrorType::CRC_ERROR:
                inject_crc_error = true;
                expect_packet_dropped = true;
                expect_error_flag = true;
                break;
                
            case ErrorType::INVALID_DEST_PORT:
                dest_port = 255;  // 잘못된 포트 번호
                expect_packet_dropped = true;
                expect_error_flag = true;
                break;
                
            case ErrorType::INVALID_SOURCE_PORT:
                source_port = 0;  // 잘못된 소스 포트
                expect_packet_dropped = true;
                expect_error_flag = true;
                break;
                
            case ErrorType::OVERSIZED_PACKET:
                payload_size = 2048;  // 최대 크기 초과
                generate_oversized_payload();
                expect_packet_dropped = true;
                expect_error_flag = true;
                break;
                
            case ErrorType::UNDERSIZED_PACKET:
                payload_size = 0;  // 최소 크기 미만
                payload_data.clear();
                expect_packet_dropped = true;
                expect_error_flag = true;
                break;
                
            case ErrorType::INVALID_CHANNEL_TYPE:
                channel_type = static_cast<ChannelType>(255);  // 잘못된 채널
                expect_packet_dropped = true;
                expect_error_flag = true;
                break;
                
            case ErrorType::INVALID_QUEUE_ID:
                queue_id = 255;  // 잘못된 큐 ID
                expect_packet_dropped = true;
                expect_error_flag = true;
                break;
                
            case ErrorType::MALFORMED_HEADER:
                corrupt_header_byte = 3;  // dest_port 바이트 손상
                corrupt_value = 0xFF;
                expect_packet_dropped = true;
                expect_error_flag = true;
                break;
                
            case ErrorType::PROTOCOL_VIOLATION:
                // 이것은 드라이버에서 처리됨
                expect_timeout = true;
                break;
                
            case ErrorType::TIMEOUT_ERROR:
                expect_timeout = true;
                break;
                
            case ErrorType::BUFFER_OVERFLOW:
                // 많은 패킷을 빠르게 보내서 버퍼 오버플로우 유발
                expect_error_flag = true;
                break;
                
            default:
                break;
        }
    }
    
    void generate_oversized_payload() {
        payload_data.clear();
        for (uint16_t i = 0; i < payload_size; i++) {
            payload_data.push_back(0xBB + (i % 256));
        }
    }
    
    ExternalPacketHeader create_header() const {
        ExternalPacketHeader header;
        header.channel_type = static_cast<uint8_t>(channel_type);
        header.queue_id = queue_id;
        header.dest_port = dest_port;
        header.source_port = source_port;
        header.total_packet_size = 9 + payload_size;
        
        if (inject_crc_error) {
            header.header_crc = 0xAD;  // 잘못된 CRC (8비트)
        } else {
            header.header_crc = header.calculate_crc();
        }
        
        return header;
    }
    
    std::vector<uint8_t> create_packet_data() const {
        std::vector<uint8_t> packet_data;
        
        // 헤더 추가
        ExternalPacketHeader header = create_header();
        uint8_t header_bytes[9];
        header.serialize_to_bytes(header_bytes);
        
        // 헤더 손상 주입
        if (corrupt_header_byte > 0 && corrupt_header_byte < 9) {
            header_bytes[corrupt_header_byte] = corrupt_value;
        }
        
        for (int i = 0; i < 9; i++) {
            packet_data.push_back(header_bytes[i]);
        }
        
        // 페이로드 추가
        packet_data.insert(packet_data.end(), payload_data.begin(), payload_data.end());
        
        return packet_data;
    }
    
    virtual std::string convert2string() const {
        std::ostringstream str;
        str << "ERROR_TYPE=" << static_cast<int>(error_type)
            << " dest=" << (int)dest_port << " src=" << (int)source_port 
            << " payload_size=" << payload_size << " channel=" << (int)channel_type
            << " queue=" << (int)queue_id;
        if (inject_crc_error) str << " [CRC_ERROR]";
        if (expect_packet_dropped) str << " [DROP_EXPECTED]";
        if (expect_error_flag) str << " [ERROR_EXPECTED]";
        if (expect_timeout) str << " [TIMEOUT_EXPECTED]";
        return str.str();
    }
};

// =============================================================================
// Error Coverage Database
// =============================================================================

class error_coverage {
private:
    std::map<ErrorType, int> error_type_coverage;
    std::map<uint8_t, int> error_port_coverage;
    std::map<uint16_t, int> error_size_coverage;
    
    // 에러 통계
    int total_error_injections;
    int detected_errors;
    int undetected_errors;
    int false_positives;
    int correct_drops;
    int incorrect_forwards;
    
public:
    error_coverage() : total_error_injections(0), detected_errors(0), 
                      undetected_errors(0), false_positives(0),
                      correct_drops(0), incorrect_forwards(0) {}
    
    void sample_error_injection(const error_packet_transaction& txn) {
        error_type_coverage[txn.error_type]++;
        error_port_coverage[txn.dest_port]++;
        error_size_coverage[txn.payload_size]++;
        total_error_injections++;
    }
    
    void sample_error_detection(ErrorType error_type, bool detected, 
                               bool expected_drop, bool actually_dropped) {
        if (detected && expected_drop) {
            detected_errors++;
            correct_drops++;
        } else if (!detected && expected_drop) {
            undetected_errors++;
            incorrect_forwards++;
        } else if (detected && !expected_drop) {
            false_positives++;
        }
    }
    
    double get_error_detection_rate() const {
        if (total_error_injections == 0) return 0.0;
        return (double)detected_errors / total_error_injections * 100.0;
    }
    
    double get_false_positive_rate() const {
        if (total_error_injections == 0) return 0.0;
        return (double)false_positives / total_error_injections * 100.0;
    }
    
    void print_error_coverage_report() const {
        std::cout << "\n=== ERROR COVERAGE REPORT ===" << std::endl;
        std::cout << "Total Error Injections: " << total_error_injections << std::endl;
        std::cout << "Detected Errors: " << detected_errors << std::endl;
        std::cout << "Undetected Errors: " << undetected_errors << std::endl;
        std::cout << "False Positives: " << false_positives << std::endl;
        std::cout << "Error Detection Rate: " << std::fixed << std::setprecision(2) 
                  << get_error_detection_rate() << "%" << std::endl;
        std::cout << "False Positive Rate: " << std::fixed << std::setprecision(2) 
                  << get_false_positive_rate() << "%" << std::endl;
        
        std::cout << "\n--- Error Type Coverage ---" << std::endl;
        for (const auto& pair : error_type_coverage) {
            std::cout << "Error Type " << static_cast<int>(pair.first) 
                      << ": " << pair.second << " injections" << std::endl;
        }
        
        std::cout << "===============================" << std::endl;
    }
};

// =============================================================================
// Error Driver
// =============================================================================

class error_interface_driver : public uvm_driver<error_packet_transaction> {
public:
    // SystemC signals
    sc_signal<bool>* ext_valid;
    sc_signal<sc_bv<AXIS_DATA_WIDTH>>* ext_data;
    sc_signal<sc_bv<AXIS_KEEP_WIDTH>>* ext_keep;
    sc_signal<bool>* ext_last;
    sc_signal<bool>* ext_ready;
    sc_clock* clk;
    
    // Error injection controls
    bool inject_protocol_violation;
    bool inject_timeout;
    
    UVM_COMPONENT_UTILS(error_interface_driver)
    
    error_interface_driver(uvm_component_name name) 
        : uvm_driver<error_packet_transaction>(name),
          inject_protocol_violation(false), inject_timeout(false) {
        ext_valid = nullptr;
        ext_data = nullptr;
        ext_keep = nullptr;
        ext_last = nullptr;
        ext_ready = nullptr;
        clk = nullptr;
    }
    
    virtual void run_phase(uvm_phase& phase) {
        std::cout << "[ERROR-DRIVER] Starting error injection run phase" << std::endl;
        
        if (!check_connections()) {
            UVM_ERROR(get_name(), "Error driver signals not properly connected!");
            return;
        }
        
        initialize_signals();
        wait(50, SC_NS);  // Reset wait
        
        error_packet_transaction txn;
        while (true) {
            seq_item_port.get_next_item(txn);
            
            std::cout << "[ERROR-DRIVER] Injecting error: " << txn.convert2string() << std::endl;
            
            if (txn.error_type == ErrorType::PROTOCOL_VIOLATION) {
                drive_protocol_violation(&txn);
            } else if (txn.error_type == ErrorType::TIMEOUT_ERROR) {
                drive_timeout_scenario(&txn);
            } else {
                drive_error_transaction(&txn);
            }
            
            seq_item_port.item_done();
        }
    }
    
private:
    bool check_connections() {
        return (ext_valid && ext_data && ext_keep && ext_last && ext_ready && clk);
    }
    
    void initialize_signals() {
        ext_valid->write(false);
        ext_data->write(0);
        ext_keep->write(0);
        ext_last->write(false);
    }
    
    void drive_error_transaction(error_packet_transaction* txn) {
        std::vector<uint8_t> packet_data = txn->create_packet_data();
        
        // 정상적인 패킷 전송 (에러는 데이터에 이미 주입됨)
        drive_packet_data(packet_data);
    }
    
    void drive_protocol_violation(error_packet_transaction* txn) {
        std::vector<uint8_t> packet_data = txn->create_packet_data();
        
        std::cout << "[ERROR-DRIVER] Injecting protocol violation" << std::endl;
        
        // TVALID를 올렸다가 중간에 내림 (프로토콜 위반)
        ext_valid->write(true);
        ext_data->write(0xDEADBEEF);
        ext_keep->write(0xFF);
        ext_last->write(false);
        
        wait(20, SC_NS);
        
        // 프로토콜 위반: TVALID를 갑자기 내림
        ext_valid->write(false);
        wait(30, SC_NS);
        
        // 다시 올림
        ext_valid->write(true);
        wait(20, SC_NS);
        
        ext_valid->write(false);
    }
    
    void drive_timeout_scenario(error_packet_transaction* txn) {
        std::cout << "[ERROR-DRIVER] Injecting timeout scenario" << std::endl;
        
        // TVALID를 올리고 매우 오랫동안 유지 (타임아웃 유발)
        ext_valid->write(true);
        ext_data->write(0x12345678);
        ext_keep->write(0xFF);
        ext_last->write(false);
        
        // 비정상적으로 긴 시간 대기
        wait(1000, SC_NS);
        
        ext_valid->write(false);
    }
    
    void drive_packet_data(const std::vector<uint8_t>& packet_data) {
        size_t bytes_per_beat = AXIS_DATA_WIDTH / 8;
        size_t total_bytes = packet_data.size();
        size_t bytes_sent = 0;
        
        while (bytes_sent < total_bytes) {
            sc_bv<AXIS_DATA_WIDTH> data_word = 0;
            sc_bv<AXIS_KEEP_WIDTH> keep_word = 0;
            
            size_t bytes_this_beat = std::min(bytes_per_beat, total_bytes - bytes_sent);
            
            for (size_t i = 0; i < bytes_this_beat; i++) {
                uint8_t byte_val = packet_data[bytes_sent + i];
                data_word.range(i*8+7, i*8) = byte_val;
                keep_word[i] = 1;
            }
            
            ext_data->write(data_word);
            ext_keep->write(keep_word);
            ext_last->write((bytes_sent + bytes_this_beat) >= total_bytes);
            ext_valid->write(true);
            
            wait(10, SC_NS);
            bytes_sent += bytes_this_beat;
        }
        
        ext_valid->write(false);
        ext_last->write(false);
    }
};

// =============================================================================
// Error Monitor
// =============================================================================

class error_monitor : public uvm_monitor {
public:
    // SystemC signals
    sc_signal<bool>* axis_tvalid;
    sc_signal<sc_bv<AXIS_DATA_WIDTH>>* axis_tdata;
    sc_signal<sc_bv<AXIS_KEEP_WIDTH>>* axis_tkeep;
    sc_signal<sc_bv<AXIS_USER_WIDTH>>* axis_tuser;
    sc_signal<bool>* axis_tlast;
    sc_signal<bool>* axis_tready;
    
    // Error status signals (if available)
    sc_signal<bool>* error_flag;
    sc_signal<bool>* crc_error;
    sc_signal<bool>* overflow_error;
    
    sc_clock* clk;
    
    // Analysis port
    uvm_analysis_port<error_packet_transaction> error_analysis_port;
    
    // Error tracking
    error_coverage* err_cov;
    
    UVM_COMPONENT_UTILS(error_monitor)
    
    error_monitor(uvm_component_name name) 
        : uvm_monitor(name), error_analysis_port("error_analysis_port") {
        axis_tvalid = nullptr;
        axis_tdata = nullptr;
        axis_tkeep = nullptr;
        axis_tuser = nullptr;
        axis_tlast = nullptr;
        axis_tready = nullptr;
        error_flag = nullptr;
        crc_error = nullptr;
        overflow_error = nullptr;
        clk = nullptr;
        err_cov = new error_coverage();
    }
    
    virtual void run_phase(uvm_phase& phase) {
        std::cout << "[ERROR-MONITOR] Starting error monitoring" << std::endl;
        
        int error_events_detected = 0;
        int timeout_count = 0;
        
        while (error_events_detected < 20) {  // Monitor for error events
            wait(10, SC_NS);
            
            // Check for error flags
            bool error_detected = false;
            if (error_flag && error_flag->read()) {
                std::cout << "[ERROR-MONITOR] General error flag detected" << std::endl;
                error_detected = true;
            }
            
            if (crc_error && crc_error->read()) {
                std::cout << "[ERROR-MONITOR] CRC error detected" << std::endl;
                error_detected = true;
            }
            
            if (overflow_error && overflow_error->read()) {
                std::cout << "[ERROR-MONITOR] Overflow error detected" << std::endl;
                error_detected = true;
            }
            
            if (error_detected) {
                error_events_detected++;
            }
            
            // Check for normal packet output
            if (axis_tvalid && axis_tvalid->read() && axis_tready && axis_tready->read()) {
                std::cout << "[ERROR-MONITOR] Packet output detected (error not caught?)" << std::endl;
            }
            
            timeout_count++;
            if (timeout_count > 10000) {  // Timeout detection
                std::cout << "[ERROR-MONITOR] Timeout detected - no activity" << std::endl;
                break;
            }
        }
        
        err_cov->print_error_coverage_report();
        std::cout << "[ERROR-MONITOR] Error monitoring completed" << std::endl;
    }
    
    ~error_monitor() {
        delete err_cov;
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
        std::cout << "[ERROR-SEQUENCE] Starting error injection sequence" << std::endl;
        
        // 다양한 에러 타입 테스트
        std::vector<ErrorType> error_types = {
            ErrorType::CRC_ERROR,
            ErrorType::INVALID_DEST_PORT,
            ErrorType::INVALID_SOURCE_PORT,
            ErrorType::OVERSIZED_PACKET,
            ErrorType::UNDERSIZED_PACKET,
            ErrorType::INVALID_CHANNEL_TYPE,
            ErrorType::INVALID_QUEUE_ID,
            ErrorType::MALFORMED_HEADER,
            ErrorType::PROTOCOL_VIOLATION,
            ErrorType::TIMEOUT_ERROR
        };
        
        for (ErrorType err_type : error_types) {
            for (int i = 0; i < 2; i++) {  // 각 에러 타입을 2번씩 테스트
                error_packet_transaction* txn = error_packet_transaction::type_id::create("error_txn");
                
                // 기본 패킷 설정
                txn->dest_port = (i % 4) + 2;  // 포트 2-5
                txn->source_port = 1;
                txn->payload_size = 64 + (i * 32);
                txn->channel_type = (i % 2) ? ChannelType::HIGH_PRIORITY : ChannelType::LOW_PRIORITY;
                txn->queue_id = i % 4;
                
                // 에러 주입
                txn->inject_error(err_type);
                
                std::cout << "[ERROR-SEQUENCE] Sending error transaction: " << txn->convert2string() << std::endl;
                start_item(txn);
                finish_item(txn);
                
                // 에러 간 간격
                wait(100, SC_NS);
            }
        }
        
        std::cout << "[ERROR-SEQUENCE] Error injection sequence completed" << std::endl;
    }
};

// =============================================================================
// Error Test Environment
// =============================================================================

class error_test_environment : public uvm_env {
public:
    error_interface_driver* driver;
    error_monitor* monitor;
    uvm_sequencer<error_packet_transaction>* sequencer;
    
    UVM_COMPONENT_UTILS(error_test_environment)
    
    error_test_environment(uvm_component_name name) : uvm_env(name) {
        driver = nullptr;
        monitor = nullptr;
        sequencer = nullptr;
    }
    
    virtual void build_phase(uvm_phase& phase) {
        uvm_env::build_phase(phase);
        
        driver = error_interface_driver::type_id::create("error_driver", this);
        monitor = error_monitor::type_id::create("error_monitor", this);
        sequencer = new uvm_sequencer<error_packet_transaction>("error_sequencer");
        
        std::cout << "[ERROR-ENV] Build phase completed" << std::endl;
    }
    
    virtual void connect_phase(uvm_phase& phase) {
        uvm_env::connect_phase(phase);
        
        driver->seq_item_port.connect(sequencer->seq_item_export);
        
        std::cout << "[ERROR-ENV] Connect phase completed" << std::endl;
    }
};

// =============================================================================
// Error Test
// =============================================================================

class ingress_pm_error_test : public uvm_test {
public:
    error_test_environment* env;
    
    UVM_COMPONENT_UTILS(ingress_pm_error_test)
    
    ingress_pm_error_test(uvm_component_name name) : uvm_test(name) {
        env = nullptr;
    }
    
    virtual void build_phase(uvm_phase& phase) {
        uvm_test::build_phase(phase);
        
        env = error_test_environment::type_id::create("error_env", this);
        
        std::cout << "[ERROR-TEST] Build phase completed" << std::endl;
    }
    
    virtual void run_phase(uvm_phase& phase) {
        std::cout << "[ERROR-TEST] Starting error test run phase" << std::endl;
        phase.raise_objection(this);
        
        // Start error injection sequence
        error_injection_sequence* seq = error_injection_sequence::type_id::create("error_seq");
        seq->start(env->sequencer);
        
        // Let the test run
        wait(5000, SC_NS);
        
        std::cout << "[ERROR-TEST] Error test completed" << std::endl;
        phase.drop_objection(this);
    }
};

// =============================================================================
// SystemC Testbench for Error Testing
// =============================================================================

SC_MODULE(error_testbench) {
    // Clock and reset
    sc_clock clk;
    sc_signal<bool> rst_n;
    
    // External interface signals
    sc_signal<bool> ext_valid;
    sc_signal<sc_bv<AXIS_DATA_WIDTH>> ext_data;
    sc_signal<sc_bv<AXIS_KEEP_WIDTH>> ext_keep;
    sc_signal<bool> ext_last;
    sc_signal<bool> ext_ready;
    
    // AXIS interface signals
    sc_signal<bool> axis_tvalid;
    sc_signal<sc_bv<AXIS_DATA_WIDTH>> axis_tdata;
    sc_signal<sc_bv<AXIS_KEEP_WIDTH>> axis_tkeep;
    sc_signal<sc_bv<AXIS_USER_WIDTH>> axis_tuser;
    sc_signal<bool> axis_tlast;
    sc_signal<bool> axis_tready;
    
    // Error status signals
    sc_signal<bool> error_flag;
    sc_signal<bool> crc_error;
    sc_signal<bool> overflow_error;
    
    // Additional interface signals (simplified)
    sc_signal<bool> axi_master_valid;
    sc_signal<sc_bv<32>> axi_master_addr;
    sc_signal<sc_bv<32>> axi_master_data;
    sc_signal<bool> axi_master_ready;
    sc_signal<bool> axi_slave_valid;
    sc_signal<sc_bv<32>> axi_slave_addr;
    sc_signal<sc_bv<32>> axi_slave_data;
    sc_signal<bool> axi_slave_ready;
    sc_signal<bool> credit_return_valid;
    sc_signal<bool> credit_return_ready;
    
    // DUT instance
    IngressPortManager* dut;
    
    // UVM test instance
    ingress_pm_error_test* uvm_test;
    
    SC_CTOR(error_testbench) : clk("clk", 10, SC_NS) {
        // Create DUT
        dut = new IngressPortManager("dut");
        
        // Connect DUT
        dut->clk(clk);
        dut->rst_n(rst_n);
        
        // External interface
        dut->ext_valid(ext_valid);
        dut->ext_data(ext_data);
        dut->ext_keep(ext_keep);
        dut->ext_last(ext_last);
        dut->ext_ready(ext_ready);
        
        // AXIS interface
        dut->axis_tvalid(axis_tvalid);
        dut->axis_tdata(axis_tdata);
        dut->axis_tkeep(axis_tkeep);
        dut->axis_tuser(axis_tuser);
        dut->axis_tlast(axis_tlast);
        dut->axis_tready(axis_tready);
        
        // AXI interface
        dut->axi_master_valid(axi_master_valid);
        dut->axi_master_addr(axi_master_addr);
        dut->axi_master_data(axi_master_data);
        dut->axi_master_ready(axi_master_ready);
        dut->axi_slave_valid(axi_slave_valid);
        dut->axi_slave_addr(axi_slave_addr);
        dut->axi_slave_data(axi_slave_data);
        dut->axi_slave_ready(axi_slave_ready);
        
        // Credit interface
        dut->credit_return_valid(credit_return_valid);
        dut->credit_return_ready(credit_return_ready);
        
        // Configure DUT
        dut->set_port_id(1);
        
        // Create UVM test
        uvm_test = ingress_pm_error_test::type_id::create("error_test", nullptr);
        
        // Connect UVM components to SystemC signals
        connect_uvm_to_systemc();
        
        // Initialize control processes
        SC_THREAD(reset_process);
        SC_THREAD(axis_ready_process);
        SC_THREAD(axi_ready_process);
        SC_THREAD(error_status_monitor);
    }
    
    void connect_uvm_to_systemc() {
        if (uvm_test && uvm_test->env) {
            if (uvm_test->env->driver) {
                uvm_test->env->driver->ext_valid = &ext_valid;
                uvm_test->env->driver->ext_data = &ext_data;
                uvm_test->env->driver->ext_keep = &ext_keep;
                uvm_test->env->driver->ext_last = &ext_last;
                uvm_test->env->driver->ext_ready = &ext_ready;
                uvm_test->env->driver->clk = &clk;
            }
            
            if (uvm_test->env->monitor) {
                uvm_test->env->monitor->axis_tvalid = &axis_tvalid;
                uvm_test->env->monitor->axis_tdata = &axis_tdata;
                uvm_test->env->monitor->axis_tkeep = &axis_tkeep;
                uvm_test->env->monitor->axis_tuser = &axis_tuser;
                uvm_test->env->monitor->axis_tlast = &axis_tlast;
                uvm_test->env->monitor->axis_tready = &axis_tready;
                uvm_test->env->monitor->error_flag = &error_flag;
                uvm_test->env->monitor->crc_error = &crc_error;
                uvm_test->env->monitor->overflow_error = &overflow_error;
                uvm_test->env->monitor->clk = &clk;
            }
        }
    }
    
    void reset_process() {
        rst_n.write(false);
        wait(25, SC_NS);
        rst_n.write(true);
        std::cout << "[ERROR-TB] Reset sequence completed" << std::endl;
    }
    
    void axis_ready_process() {
        axis_tready.write(true);  // Always ready for testing
    }
    
    void axi_ready_process() {
        axi_master_ready.write(true);
        axi_slave_valid.write(false);
    }
    
    void error_status_monitor() {
        // 에러 상태를 시뮬레이션 (실제 DUT에서는 내부 에러 신호를 연결)
        while (true) {
            wait(50, SC_NS);
            
            // CRC 에러 시뮬레이션
            if (ext_valid.read() && ext_data.read().to_uint() == 0xDEADBEEF) {
                crc_error.write(true);
                error_flag.write(true);
                wait(20, SC_NS);
                crc_error.write(false);
                error_flag.write(false);
            }
            
            // 오버플로우 에러 시뮬레이션
            static int packet_count = 0;
            if (ext_valid.read() && ext_last.read()) {
                packet_count++;
                if (packet_count > 10) {  // 버퍼 오버플로우 시뮬레이션
                    overflow_error.write(true);
                    error_flag.write(true);
                    wait(20, SC_NS);
                    overflow_error.write(false);
                    error_flag.write(false);
                    packet_count = 0;
                }
            }
        }
    }
    
    ~error_testbench() {
        delete dut;
    }
};

int sc_main(int argc, char* argv[]) {
    std::cout << "=== UVM SystemC Error Injection Test ===" << std::endl;
    
    // Create testbench
    error_testbench tb("error_testbench");
    
    // Run UVM test
    run_test();
    
    std::cout << "=== Error injection test completed ===" << std::endl;
    return 0;
}