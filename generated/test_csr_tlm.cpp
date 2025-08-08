/**
 * SystemC TLM CSR 모델 테스트벤치
 * 
 * RDL로부터 생성된 SystemC TLM CSR 모델을 테스트합니다.
 * TLM-2.0 소켓을 통해 레지스터 읽기/쓰기를 검증합니다.
 */

#include <systemc>
#include <tlm>
#include <tlm_utils/simple_initiator_socket.h>
#include "switch_csr_csr_tlm.h"

using namespace sc_core;
using namespace tlm;

/**
 * TLM 이니시에이터 (테스트 마스터)
 */
class csr_test_master : public sc_module {
public:
    // TLM-2.0 이니시에이터 소켓
    tlm_utils::simple_initiator_socket<csr_test_master> initiator_socket;
    
    SC_HAS_PROCESS(csr_test_master);
    
    csr_test_master(sc_module_name name) : sc_module(name), initiator_socket("initiator_socket") {
        SC_THREAD(test_process);
    }
    
    /**
     * TLM 읽기 트랜잭션
     */
    uint32_t tlm_read(uint32_t address) {
        tlm::tlm_generic_payload trans;
        uint32_t data = 0;
        sc_time delay = SC_ZERO_TIME;
        
        trans.set_command(tlm::TLM_READ_COMMAND);
        trans.set_address(address);
        trans.set_data_ptr(reinterpret_cast<unsigned char*>(&data));
        trans.set_data_length(4);
        trans.set_streaming_width(4);
        trans.set_byte_enable_ptr(0);
        trans.set_dmi_allowed(false);
        trans.set_response_status(tlm::TLM_INCOMPLETE_RESPONSE);
        
        initiator_socket->b_transport(trans, delay);
        
        if (trans.is_response_error()) {
            SC_REPORT_ERROR("TLM_READ", "Transaction error");
        }
        
        wait(delay);
        return data;
    }
    
    /**
     * TLM 쓰기 트랜잭션
     */
    void tlm_write(uint32_t address, uint32_t data) {
        tlm::tlm_generic_payload trans;
        sc_time delay = SC_ZERO_TIME;
        
        trans.set_command(tlm::TLM_WRITE_COMMAND);
        trans.set_address(address);
        trans.set_data_ptr(reinterpret_cast<unsigned char*>(&data));
        trans.set_data_length(4);
        trans.set_streaming_width(4);
        trans.set_byte_enable_ptr(0);
        trans.set_dmi_allowed(false);
        trans.set_response_status(tlm::TLM_INCOMPLETE_RESPONSE);
        
        initiator_socket->b_transport(trans, delay);
        
        if (trans.is_response_error()) {
            SC_REPORT_ERROR("TLM_WRITE", "Transaction error");
        }
        
        wait(delay);
    }
    
    /**
     * 메인 테스트 프로세스
     */
    void test_process() {
        wait(10, SC_NS); // 초기화 대기
        
        SC_REPORT_INFO("TEST", "Starting CSR TLM tests");
        
        // 테스트 1: 디바이스 ID 레지스터 읽기
        test_device_id();
        
        // 테스트 2: 컨트롤 레지스터 읽기/쓰기
        test_control_register();
        
        // 테스트 3: 포트 설정 레지스터 (배열) 테스트
        test_port_config_array();
        
        // 테스트 4: 인터럽트 레지스터 테스트
        test_interrupt_registers();
        
        // 테스트 5: 성능 카운터 테스트
        test_performance_counters();
        
        // 테스트 6: 잘못된 주소 접근 테스트
        test_invalid_address();
        
        SC_REPORT_INFO("TEST", "All CSR TLM tests completed");
        
        sc_stop();
    }
    
private:
    void test_device_id() {
        SC_REPORT_INFO("TEST", "Testing Device ID register");
        
        uint32_t device_id = tlm_read(0x000);
        uint32_t expected = (0x0100 << 16) | 0x1234; // version | device_id
        
        std::cout << "Device ID: 0x" << std::hex << device_id 
                  << " (expected: 0x" << expected << ")" << std::dec << std::endl;
        
        if (device_id == expected) {
            SC_REPORT_INFO("TEST", "Device ID test PASSED");
        } else {
            SC_REPORT_ERROR("TEST", "Device ID test FAILED");
        }
    }
    
    void test_control_register() {
        SC_REPORT_INFO("TEST", "Testing Control register");
        
        // 초기값 읽기 (port_count = 4가 설정되어 있어야 함)
        uint32_t initial_val = tlm_read(0x004);
        uint32_t expected_initial = 0x40; // port_count = 4 at bits [7:4]
        
        if (initial_val == expected_initial) {
            SC_REPORT_INFO("TEST", "Control register initial value PASSED");
        } else {
            SC_REPORT_ERROR("TEST", "Control register initial value FAILED");
        }
        
        // enable 비트 설정
        tlm_write(0x004, 0x41); // enable=1, port_count=4
        uint32_t new_val = tlm_read(0x004);
        
        if (new_val == 0x41) {
            SC_REPORT_INFO("TEST", "Control register write/read PASSED");
        } else {
            SC_REPORT_ERROR("TEST", "Control register write/read FAILED");
        }
        
        std::cout << "Control reg: initial=0x" << std::hex << initial_val 
                  << ", after write=0x" << new_val << std::dec << std::endl;
    }
    
    void test_port_config_array() {
        SC_REPORT_INFO("TEST", "Testing Port Config array registers");
        
        // 포트 0~3 설정 테스트
        for (int i = 0; i < 4; i++) {
            uint32_t addr = 0x020 + i * 4;
            
            // 초기값 읽기 (port_enable=1, port_type=1, flow_control=1)
            uint32_t initial_val = tlm_read(addr);
            uint32_t expected = 0x51; // flow_control=1, port_type=1, port_enable=1
            
            if (initial_val == expected) {
                SC_REPORT_INFO("TEST", ("Port " + std::to_string(i) + " config initial value PASSED").c_str());
            } else {
                SC_REPORT_ERROR("TEST", ("Port " + std::to_string(i) + " config initial value FAILED").c_str());
            }
            
            // 우선순위 설정 테스트
            uint32_t new_val = 0x51 | (i << 1); // priority = i
            tlm_write(addr, new_val);
            uint32_t read_back = tlm_read(addr);
            
            if (read_back == new_val) {
                SC_REPORT_INFO("TEST", ("Port " + std::to_string(i) + " config write/read PASSED").c_str());
            } else {
                SC_REPORT_ERROR("TEST", ("Port " + std::to_string(i) + " config write/read FAILED").c_str());
            }
            
            std::cout << "Port " << i << " config: 0x" << std::hex << read_back << std::dec << std::endl;
        }
    }
    
    void test_interrupt_registers() {
        SC_REPORT_INFO("TEST", "Testing Interrupt registers");
        
        // 인터럽트 활성화
        tlm_write(0x00C, 0x07); // 모든 인터럽트 활성화
        uint32_t int_enable = tlm_read(0x00C);
        
        if (int_enable == 0x07) {
            SC_REPORT_INFO("TEST", "Interrupt enable PASSED");
        } else {
            SC_REPORT_ERROR("TEST", "Interrupt enable FAILED");
        }
        
        // 인터럽트 상태 설정 (일반적으로 HW에서 설정하지만 테스트용)
        tlm_write(0x010, 0x05); // error_int=1, packet_int=1
        uint32_t int_status = tlm_read(0x010);
        
        if (int_status == 0x05) {
            SC_REPORT_INFO("TEST", "Interrupt status PASSED");
        } else {
            SC_REPORT_ERROR("TEST", "Interrupt status FAILED");
        }
        
        // 인터럽트 클리어 (write 1 to clear)
        tlm_write(0x010, 0x01); // error_int 클리어
        int_status = tlm_read(0x010);
        
        if (int_status == 0x04) { // packet_int만 남아있어야 함
            SC_REPORT_INFO("TEST", "Interrupt clear PASSED");
        } else {
            SC_REPORT_ERROR("TEST", "Interrupt clear FAILED");
        }
        
        std::cout << "Interrupt status after clear: 0x" << std::hex << int_status << std::dec << std::endl;
    }
    
    void test_performance_counters() {
        SC_REPORT_INFO("TEST", "Testing Performance counters");
        
        // 패킷 카운터 설정
        tlm_write(0x080, 0x12345678);
        uint32_t packet_count = tlm_read(0x080);
        
        if (packet_count == 0x12345678) {
            SC_REPORT_INFO("TEST", "Packet counter PASSED");
        } else {
            SC_REPORT_ERROR("TEST", "Packet counter FAILED");
        }
        
        // 에러 카운터 설정
        tlm_write(0x084, 0xABCDEF00);
        uint32_t error_count = tlm_read(0x084);
        
        if (error_count == 0xABCDEF00) {
            SC_REPORT_INFO("TEST", "Error counter PASSED");
        } else {
            SC_REPORT_ERROR("TEST", "Error counter FAILED");
        }
        
        // 대역폭 사용률 (8비트 필드)
        tlm_write(0x088, 0x85); // 85% 사용률
        uint32_t bandwidth = tlm_read(0x088);
        
        if ((bandwidth & 0xFF) == 0x85) {
            SC_REPORT_INFO("TEST", "Bandwidth counter PASSED");
        } else {
            SC_REPORT_ERROR("TEST", "Bandwidth counter FAILED");
        }
        
        std::cout << "Performance counters: packets=0x" << std::hex << packet_count 
                  << ", errors=0x" << error_count 
                  << ", bandwidth=" << std::dec << (bandwidth & 0xFF) << "%" << std::endl;
    }
    
    void test_invalid_address() {
        SC_REPORT_INFO("TEST", "Testing invalid address access");
        
        // 잘못된 주소에 접근 (에러 응답이 와야 함)
        tlm::tlm_generic_payload trans;
        uint32_t data = 0;
        sc_time delay = SC_ZERO_TIME;
        
        trans.set_command(tlm::TLM_READ_COMMAND);
        trans.set_address(0xDEADBEEF); // 잘못된 주소
        trans.set_data_ptr(reinterpret_cast<unsigned char*>(&data));
        trans.set_data_length(4);
        trans.set_streaming_width(4);
        trans.set_byte_enable_ptr(0);
        trans.set_dmi_allowed(false);
        trans.set_response_status(tlm::TLM_INCOMPLETE_RESPONSE);
        
        initiator_socket->b_transport(trans, delay);
        
        if (trans.get_response_status() == tlm::TLM_ADDRESS_ERROR_RESPONSE) {
            SC_REPORT_INFO("TEST", "Invalid address test PASSED");
        } else {
            SC_REPORT_ERROR("TEST", "Invalid address test FAILED");
        }
    }
};

/**
 * 탑 레벨 테스트벤치
 */
class csr_testbench : public sc_module {
public:
    csr_test_master* master;
    switch_csr_csr_tlm* csr_model;
    
    csr_testbench(sc_module_name name) : sc_module(name) {
        // 컴포넌트 생성
        master = new csr_test_master("master");
        csr_model = new switch_csr_csr_tlm("csr_model");
        
        // TLM 소켓 연결
        master->initiator_socket.bind(csr_model->target_socket);
        
        SC_REPORT_INFO("TESTBENCH", "CSR TLM testbench initialized");
    }
    
    ~csr_testbench() {
        delete master;
        delete csr_model;
    }
};

int sc_main(int argc, char* argv[]) {
    // 테스트벤치 생성
    csr_testbench tb("testbench");
    
    // 시뮬레이션 실행
    sc_start();
    
    return 0;
}
