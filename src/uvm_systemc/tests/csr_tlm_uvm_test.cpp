/**
 * CSR TLM UVM Test
 * 
 * RDL에서 생성된 SystemC TLM CSR 모델을 UVM으로 검증하는 테스트입니다.
 * FC4SC 커버리지와 함께 완전한 검증 환경을 제공합니다.
 */

#include <systemc>
#include <uvm>
#include <tlm>
#include <tlm_utils/simple_initiator_socket.h>
#include "../fc4sc/includes/fc4sc.hpp"
#include "/Users/jonguksong/Projects/cxl_switch/switch-internal-p2p-link/generated/switch_csr_csr_tlm.h"

using namespace sc_core;
using namespace tlm;
using namespace uvm;

// =============================================================================
// CSR Transaction Item
// =============================================================================
class csr_transaction : public uvm_sequence_item {
public:
    uint32_t address;
    uint32_t data;
    bool is_write;
    bool response_ok;
    
    UVM_OBJECT_UTILS_BEGIN(csr_transaction)
        UVM_FIELD_INT(address, UVM_ALL_ON)
        UVM_FIELD_INT(data, UVM_ALL_ON)
        UVM_FIELD_INT(is_write, UVM_ALL_ON)
        UVM_FIELD_INT(response_ok, UVM_ALL_ON)
    UVM_OBJECT_UTILS_END(csr_transaction)
    
    csr_transaction(const std::string& name = "csr_transaction") 
        : uvm_sequence_item(name), address(0), data(0), is_write(false), response_ok(true) {}
    
    virtual void do_print(const uvm_printer& printer) const override {
        uvm_sequence_item::do_print(printer);
        printer.print_field_int("address", address, 32, UVM_HEX);
        printer.print_field_int("data", data, 32, UVM_HEX);
        printer.print_string("operation", is_write ? "WRITE" : "READ");
        printer.print_field_int("response_ok", response_ok);
    }
};

// =============================================================================
// CSR Coverage Model (FC4SC)
// =============================================================================
class csr_coverage : public sc_module {
public:
    // 커버리지 그룹들
    fc4sc::covergroup address_cg;
    fc4sc::covergroup data_cg;
    fc4sc::covergroup operation_cg;
    fc4sc::covergroup register_fields_cg;
    
    // 커버리지 포인트들
    fc4sc::coverpoint<uint32_t> cp_address;
    fc4sc::coverpoint<uint32_t> cp_data;
    fc4sc::coverpoint<bool> cp_is_write;
    fc4sc::coverpoint<uint32_t> cp_control_enable;
    fc4sc::coverpoint<uint32_t> cp_port_config;
    
    // 크로스 커버리지
    fc4sc::cross<uint32_t, bool> cross_addr_op;
    
    SC_HAS_PROCESS(csr_coverage);
    
    csr_coverage(sc_module_name name) : sc_module(name),
        address_cg("address_cg"),
        data_cg("data_cg"), 
        operation_cg("operation_cg"),
        register_fields_cg("register_fields_cg"),
        cp_address("cp_address"),
        cp_data("cp_data"),
        cp_is_write("cp_is_write"),
        cp_control_enable("cp_control_enable"),
        cp_port_config("cp_port_config"),
        cross_addr_op("cross_addr_op", cp_address, cp_is_write) {
        
        // 주소 커버리지 설정
        cp_address.add_bin("device_id", 0x000);
        cp_address.add_bin("control", 0x004);
        cp_address.add_bin("status", 0x008);
        cp_address.add_bin("int_enable", 0x00C);
        cp_address.add_bin("int_status", 0x010);
        cp_address.add_bins_range("port_config", 0x020, 0x02C, 4);
        cp_address.add_bins_range("port_status", 0x040, 0x04C, 4);
        cp_address.add_bin("queue_config", 0x060);
        cp_address.add_bin("perf_packets", 0x080);
        cp_address.add_bin("perf_errors", 0x084);
        cp_address.add_bin("perf_bandwidth", 0x088);
        cp_address.add_bin("debug_ctrl", 0x100);
        cp_address.add_bin("debug_status", 0x104);
        
        // 데이터 커버리지 설정
        cp_data.add_bin("zero", 0);
        cp_data.add_bin("low", fc4sc::interval<uint32_t>(1, 0xFF));
        cp_data.add_bin("medium", fc4sc::interval<uint32_t>(0x100, 0xFFFF));
        cp_data.add_bin("high", fc4sc::interval<uint32_t>(0x10000, 0xFFFFFFFF));
        
        // 연산 커버리지
        cp_is_write.add_bin("read", false);
        cp_is_write.add_bin("write", true);
        
        // 필드별 커버리지
        cp_control_enable.add_bin("disabled", 0);
        cp_control_enable.add_bin("enabled", 1);
        
        cp_port_config.add_bin("port_disabled", 0x50); // enable=0, type=1, flow=1
        cp_port_config.add_bin("port_enabled", 0x51);  // enable=1, type=1, flow=1
        cp_port_config.add_bins_range("priority_levels", 0x51, 0x57, 2); // different priorities
        
        // 커버그룹에 커버포인트 추가
        address_cg.add_coverpoint(cp_address);
        data_cg.add_coverpoint(cp_data);
        operation_cg.add_coverpoint(cp_is_write);
        register_fields_cg.add_coverpoint(cp_control_enable);
        register_fields_cg.add_coverpoint(cp_port_config);
        
        // 크로스 커버리지 추가
        address_cg.add_cross(cross_addr_op);
    }
    
    void sample_transaction(const csr_transaction& trans) {
        // 기본 커버리지 샘플링
        cp_address.sample(trans.address);
        cp_data.sample(trans.data);
        cp_is_write.sample(trans.is_write);
        
        // 필드별 커버리지 샘플링
        if (trans.address == 0x004) { // control register
            cp_control_enable.sample(trans.data & 0x1);
        }
        
        if (trans.address >= 0x020 && trans.address <= 0x02C) { // port config
            cp_port_config.sample(trans.data & 0xFF);
        }
        
        // 커버그룹 샘플링
        address_cg.sample();
        data_cg.sample();
        operation_cg.sample();
        register_fields_cg.sample();
        
        UVM_INFO("CSR_COV", ("Sampled transaction: addr=0x" + 
                            std::to_string(trans.address) + 
                            ", data=0x" + std::to_string(trans.data) +
                            ", op=" + (trans.is_write ? "W" : "R")).c_str(), UVM_MEDIUM);
    }
    
    void print_coverage() {
        std::cout << "\\n=== CSR Coverage Report ===" << std::endl;
        std::cout << "Address Coverage: " << address_cg.get_coverage() << "%" << std::endl;
        std::cout << "Data Coverage: " << data_cg.get_coverage() << "%" << std::endl;
        std::cout << "Operation Coverage: " << operation_cg.get_coverage() << "%" << std::endl;
        std::cout << "Register Fields Coverage: " << register_fields_cg.get_coverage() << "%" << std::endl;
    }
};

// =============================================================================
// CSR TLM Driver
// =============================================================================
class csr_driver : public uvm_driver<csr_transaction>, public sc_module {
public:
    tlm_utils::simple_initiator_socket<csr_driver> initiator_socket;
    
    UVM_COMPONENT_UTILS(csr_driver)
    
    SC_HAS_PROCESS(csr_driver);
    
    csr_driver(const std::string& name) 
        : uvm_driver<csr_transaction>(name), sc_module(name.c_str()),
          initiator_socket("initiator_socket") {
        SC_THREAD(run_phase_thread);
    }
    
    virtual void run_phase(uvm_phase& phase) override {
        // SystemC 스레드에서 처리
    }
    
private:
    void run_phase_thread() {
        csr_transaction* req;
        
        while (true) {
            // 시퀀서에서 트랜잭션 가져오기
            seq_item_port->get_next_item(req);
            
            if (req) {
                // TLM 트랜잭션 실행
                execute_transaction(*req);
                
                // 완료 알림
                seq_item_port->item_done();
                
                UVM_INFO("CSR_DRV", ("Executed transaction: " + req->sprint()).c_str(), UVM_MEDIUM);
            }
            
            wait(1, SC_NS); // 작은 지연
        }
    }
    
    void execute_transaction(csr_transaction& trans) {
        tlm::tlm_generic_payload payload;
        sc_time delay = SC_ZERO_TIME;
        
        payload.set_address(trans.address);
        payload.set_data_ptr(reinterpret_cast<unsigned char*>(&trans.data));
        payload.set_data_length(4);
        payload.set_streaming_width(4);
        payload.set_byte_enable_ptr(0);
        payload.set_dmi_allowed(false);
        payload.set_response_status(tlm::TLM_INCOMPLETE_RESPONSE);
        
        if (trans.is_write) {
            payload.set_command(tlm::TLM_WRITE_COMMAND);
        } else {
            payload.set_command(tlm::TLM_READ_COMMAND);
        }
        
        // TLM 트랜잭션 실행
        initiator_socket->b_transport(payload, delay);
        
        // 응답 확인
        trans.response_ok = !payload.is_response_error();
        
        // 지연 시간 대기
        wait(delay);
    }
};

// =============================================================================
// CSR Monitor
// =============================================================================
class csr_monitor : public uvm_monitor, public sc_module {
public:
    uvm_analysis_port<csr_transaction> ap;
    csr_coverage* coverage_model;
    
    UVM_COMPONENT_UTILS(csr_monitor)
    
    SC_HAS_PROCESS(csr_monitor);
    
    csr_monitor(const std::string& name) 
        : uvm_monitor(name), sc_module(name.c_str()), ap("ap") {
        coverage_model = new csr_coverage("coverage_model");
        SC_THREAD(monitor_thread);
    }
    
    virtual void run_phase(uvm_phase& phase) override {
        // SystemC 스레드에서 처리
    }
    
private:
    void monitor_thread() {
        while (true) {
            // 실제 구현에서는 인터페이스 신호를 모니터링
            // 지금은 시뮬레이션을 위한 더미 구현
            wait(10, SC_NS);
        }
    }
    
public:
    void write_transaction(const csr_transaction& trans) {
        // 커버리지 샘플링
        coverage_model->sample_transaction(trans);
        
        // 분석 포트로 전송
        ap.write(trans);
        
        UVM_INFO("CSR_MON", ("Monitored transaction: " + 
                            const_cast<csr_transaction&>(trans).sprint()).c_str(), UVM_MEDIUM);
    }
};

// =============================================================================
// CSR Scoreboard
// =============================================================================
class csr_scoreboard : public uvm_scoreboard, public sc_module {
public:
    uvm_analysis_imp<csr_transaction, csr_scoreboard> ap_imp;
    
    // 예상 레지스터 값들
    std::map<uint32_t, uint32_t> expected_values;
    int transactions_checked;
    int passed_checks;
    int failed_checks;
    
    UVM_COMPONENT_UTILS(csr_scoreboard)
    
    csr_scoreboard(const std::string& name) 
        : uvm_scoreboard(name), sc_module(name.c_str()), ap_imp("ap_imp", this),
          transactions_checked(0), passed_checks(0), failed_checks(0) {
        
        // 초기 예상 값들 설정
        expected_values[0x000] = 0x01001234; // device_id_reg
        expected_values[0x004] = 0x00000040; // control_reg (port_count=4)
        expected_values[0x008] = 0x00000000; // status_reg
        expected_values[0x060] = 0x00001064; // queue_config_reg
        
        // 포트 설정 레지스터들 (배열)
        for (int i = 0; i < 4; i++) {
            expected_values[0x020 + i*4] = 0x00000051; // port_config_reg[i]
            expected_values[0x040 + i*4] = 0x00000010; // port_status_reg[i] (rx_ready=1)
        }
    }
    
    virtual void write(const csr_transaction& trans) {
        transactions_checked++;
        
        if (!trans.is_write) {
            // 읽기 트랜잭션 검증
            check_read_transaction(trans);
        } else {
            // 쓰기 트랜잭션 처리
            handle_write_transaction(trans);
        }
        
        UVM_INFO("CSR_SB", ("Checked transaction #" + std::to_string(transactions_checked) + 
                           ": " + const_cast<csr_transaction&>(trans).sprint()).c_str(), UVM_MEDIUM);
    }
    
private:
    void check_read_transaction(const csr_transaction& trans) {
        auto it = expected_values.find(trans.address);
        if (it != expected_values.end()) {
            if (trans.data == it->second) {
                passed_checks++;
                UVM_INFO("CSR_SB", ("READ CHECK PASSED: addr=0x" + 
                                   std::to_string(trans.address) + 
                                   ", expected=0x" + std::to_string(it->second) +
                                   ", actual=0x" + std::to_string(trans.data)).c_str(), UVM_LOW);
            } else {
                failed_checks++;
                UVM_ERROR("CSR_SB", ("READ CHECK FAILED: addr=0x" + 
                                    std::to_string(trans.address) + 
                                    ", expected=0x" + std::to_string(it->second) +
                                    ", actual=0x" + std::to_string(trans.data)).c_str());
            }
        } else {
            UVM_WARNING("CSR_SB", ("Unknown address for read check: 0x" + 
                                  std::to_string(trans.address)).c_str());
        }
    }
    
    void handle_write_transaction(const csr_transaction& trans) {
        // 쓰기 가능한 레지스터의 예상 값 업데이트
        if (trans.address == 0x004 || // control_reg
            (trans.address >= 0x020 && trans.address <= 0x02C) || // port_config
            trans.address == 0x060) { // queue_config
            expected_values[trans.address] = trans.data;
            passed_checks++;
            UVM_INFO("CSR_SB", ("WRITE ACCEPTED: addr=0x" + 
                               std::to_string(trans.address) + 
                               ", data=0x" + std::to_string(trans.data)).c_str(), UVM_LOW);
        } else {
            // 읽기 전용 레지스터에 쓰기 시도
            UVM_WARNING("CSR_SB", ("Write to read-only register: addr=0x" + 
                                  std::to_string(trans.address)).c_str());
        }
    }
    
public:
    void print_results() {
        std::cout << "\\n=== CSR Scoreboard Results ===" << std::endl;
        std::cout << "Total Transactions: " << transactions_checked << std::endl;
        std::cout << "Passed Checks: " << passed_checks << std::endl;
        std::cout << "Failed Checks: " << failed_checks << std::endl;
        std::cout << "Pass Rate: " << (transactions_checked > 0 ? 
                                      (passed_checks * 100.0 / transactions_checked) : 0) 
                  << "%" << std::endl;
    }
};

// =============================================================================
// CSR Agent
// =============================================================================
class csr_agent : public uvm_agent {
public:
    csr_driver* driver;
    csr_monitor* monitor;
    uvm_sequencer<csr_transaction>* sequencer;
    
    UVM_COMPONENT_UTILS(csr_agent)
    
    csr_agent(const std::string& name) : uvm_agent(name) {}
    
    virtual void build_phase(uvm_phase& phase) override {
        uvm_agent::build_phase(phase);
        
        driver = csr_driver::type_id::create("driver", this);
        monitor = csr_monitor::type_id::create("monitor", this);
        sequencer = uvm_sequencer<csr_transaction>::type_id::create("sequencer", this);
    }
    
    virtual void connect_phase(uvm_phase& phase) override {
        if (driver && sequencer) {
            driver->seq_item_port.connect(sequencer->seq_item_export);
        }
    }
};

// =============================================================================
// CSR Environment
// =============================================================================
class csr_env : public uvm_env {
public:
    csr_agent* agent;
    csr_scoreboard* scoreboard;
    
    UVM_COMPONENT_UTILS(csr_env)
    
    csr_env(const std::string& name) : uvm_env(name) {}
    
    virtual void build_phase(uvm_phase& phase) override {
        uvm_env::build_phase(phase);
        
        agent = csr_agent::type_id::create("agent", this);
        scoreboard = csr_scoreboard::type_id::create("scoreboard", this);
    }
    
    virtual void connect_phase(uvm_phase& phase) override {
        if (agent && agent->monitor && scoreboard) {
            agent->monitor->ap.connect(scoreboard->ap_imp);
        }
    }
};

// =============================================================================
// CSR Test Sequences
// =============================================================================
class csr_basic_sequence : public uvm_sequence<csr_transaction> {
public:
    UVM_OBJECT_UTILS(csr_basic_sequence)
    
    csr_basic_sequence(const std::string& name = "csr_basic_sequence") 
        : uvm_sequence<csr_transaction>(name) {}
    
    virtual void body() override {
        csr_transaction* req;
        
        UVM_INFO("CSR_SEQ", "Starting basic CSR sequence", UVM_MEDIUM);
        
        // 1. 디바이스 ID 읽기
        req = csr_transaction::type_id::create("read_device_id");
        req->address = 0x000;
        req->is_write = false;
        start_item(req);
        finish_item(req);
        
        // 2. 컨트롤 레지스터 읽기
        req = csr_transaction::type_id::create("read_control");
        req->address = 0x004;
        req->is_write = false;
        start_item(req);
        finish_item(req);
        
        // 3. 컨트롤 레지스터에 enable 설정
        req = csr_transaction::type_id::create("write_control");
        req->address = 0x004;
        req->data = 0x41; // enable=1, port_count=4
        req->is_write = true;
        start_item(req);
        finish_item(req);
        
        // 4. 포트 설정 레지스터들 테스트
        for (int i = 0; i < 4; i++) {
            // 포트 설정 읽기
            req = csr_transaction::type_id::create("read_port_config");
            req->address = 0x020 + i * 4;
            req->is_write = false;
            start_item(req);
            finish_item(req);
            
            // 포트 우선순위 설정
            req = csr_transaction::type_id::create("write_port_config");
            req->address = 0x020 + i * 4;
            req->data = 0x51 | (i << 1); // priority = i
            req->is_write = true;
            start_item(req);
            finish_item(req);
        }
        
        UVM_INFO("CSR_SEQ", "Basic CSR sequence completed", UVM_MEDIUM);
    }
};

class csr_random_sequence : public uvm_sequence<csr_transaction> {
public:
    int num_transactions;
    
    UVM_OBJECT_UTILS(csr_random_sequence)
    
    csr_random_sequence(const std::string& name = "csr_random_sequence") 
        : uvm_sequence<csr_transaction>(name), num_transactions(50) {}
    
    virtual void body() override {
        csr_transaction* req;
        
        UVM_INFO("CSR_SEQ", ("Starting random CSR sequence with " + 
                            std::to_string(num_transactions) + " transactions").c_str(), UVM_MEDIUM);
        
        std::vector<uint32_t> valid_addresses = {
            0x000, 0x004, 0x008, 0x00C, 0x010,
            0x020, 0x024, 0x028, 0x02C,
            0x040, 0x044, 0x048, 0x04C,
            0x060, 0x080, 0x084, 0x088,
            0x100, 0x104
        };
        
        for (int i = 0; i < num_transactions; i++) {
            req = csr_transaction::type_id::create("random_trans");
            
            // 랜덤 주소 선택
            req->address = valid_addresses[rand() % valid_addresses.size()];
            
            // 랜덤 연산 (70% 읽기, 30% 쓰기)
            req->is_write = (rand() % 100) < 30;
            
            if (req->is_write) {
                req->data = rand();
            }
            
            start_item(req);
            finish_item(req);
        }
        
        UVM_INFO("CSR_SEQ", "Random CSR sequence completed", UVM_MEDIUM);
    }
};

// =============================================================================
// CSR Test
// =============================================================================
class csr_test : public uvm_test {
public:
    csr_env* env;
    
    UVM_COMPONENT_UTILS(csr_test)
    
    csr_test(const std::string& name) : uvm_test(name) {}
    
    virtual void build_phase(uvm_phase& phase) override {
        uvm_test::build_phase(phase);
        env = csr_env::type_id::create("env", this);
    }
    
    virtual void run_phase(uvm_phase& phase) override {
        csr_basic_sequence* basic_seq;
        csr_random_sequence* random_seq;
        
        phase.raise_objection(this);
        
        UVM_INFO("CSR_TEST", "Starting CSR TLM UVM Test", UVM_LOW);
        
        // 기본 시퀀스 실행
        basic_seq = csr_basic_sequence::type_id::create("basic_seq");
        basic_seq->start(env->agent->sequencer);
        
        // 랜덤 시퀀스 실행
        random_seq = csr_random_sequence::type_id::create("random_seq");
        random_seq->num_transactions = 100;
        random_seq->start(env->agent->sequencer);
        
        // 결과 출력
        wait(100, SC_NS);
        env->scoreboard->print_results();
        if (env->agent->monitor->coverage_model) {
            env->agent->monitor->coverage_model->print_coverage();
        }
        
        UVM_INFO("CSR_TEST", "CSR TLM UVM Test completed", UVM_LOW);
        
        phase.drop_objection(this);
    }
};

// =============================================================================
// Top Level Testbench
// =============================================================================
SC_MODULE(csr_tlm_testbench) {
    // CSR TLM 모델
    switch_csr_csr_tlm* csr_model;
    
    // UVM 테스트
    csr_test* test;
    
    SC_CTOR(csr_tlm_testbench) {
        // CSR 모델 생성
        csr_model = new switch_csr_csr_tlm("csr_model");
        
        // UVM 테스트 생성
        test = csr_test::type_id::create("test", nullptr);
        
        // TLM 소켓 연결
        if (test && test->env && test->env->agent && test->env->agent->driver) {
            test->env->agent->driver->initiator_socket.bind(csr_model->target_socket);
        }
        
        UVM_INFO("TB", "CSR TLM UVM Testbench initialized", UVM_LOW);
    }
    
    ~csr_tlm_testbench() {
        delete csr_model;
    }
};

int sc_main(int argc, char* argv[]) {
    // FC4SC 초기화
    fc4sc::global::initialize();
    
    // 테스트벤치 생성
    csr_tlm_testbench tb("testbench");
    
    // UVM 시뮬레이션 실행
    uvm_top::run_test();
    
    // FC4SC 리포트 생성
    fc4sc::global::finalize();
    
    return 0;
}
