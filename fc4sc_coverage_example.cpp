// 실제 FC4SC 라이브러리 사용 예시
#include "fc4sc.hpp"

// 1. 프로그래밍 방식으로 커버리지 확인
void check_coverage_programmatically() {
    // 개별 coverpoint 커버리지 확인
    double dest_coverage = my_covergroup.get_coverpoint("dest_port_cp")->get_coverage();
    double size_coverage = my_covergroup.get_coverpoint("payload_size_cp")->get_coverage();
    
    std::cout << "Destination Port Coverage: " << dest_coverage << "%" << std::endl;
    std::cout << "Payload Size Coverage: " << size_coverage << "%" << std::endl;
    
    // Cross coverage 확인
    double cross_coverage = my_covergroup.get_cross("dest_size_cross")->get_coverage();
    std::cout << "Cross Coverage: " << cross_coverage << "%" << std::endl;
    
    // 전체 covergroup 커버리지
    double overall = my_covergroup.get_coverage();
    std::cout << "Overall Coverage: " << overall << "%" << std::endl;
}

// 2. XML/UCIS 리포트 생성
void generate_coverage_reports() {
    // FC4SC는 UCIS 표준 지원
    fc4sc::global_coverage_db* db = fc4sc::global_coverage_db::get_instance();
    
    // XML 형식으로 출력
    db->print_xml("coverage_report.xml");
    
    // UCIS 형식으로 출력 (EDA 도구 호환)
    db->print_ucis("coverage_report.ucis");
    
    // HTML 리포트 (일부 구현체에서 지원)
    db->print_html("coverage_report.html");
}

// 3. 개별 bin 상태 확인
void check_individual_bins() {
    auto dest_cp = my_covergroup.get_coverpoint("dest_port_cp");
    
    // 각 bin의 hit count 확인
    for (auto& bin : dest_cp->get_bins()) {
        std::cout << "Bin " << bin.get_name() 
                  << ": " << bin.get_hit_count() << " hits" << std::endl;
    }
    
    // 커버되지 않은 bin 찾기
    auto uncovered_bins = dest_cp->get_uncovered_bins();
    for (auto& bin : uncovered_bins) {
        std::cout << "Uncovered bin: " << bin.get_name() << std::endl;
    }
}

// 4. 커버리지 goal 설정 및 확인
void check_coverage_goals() {
    // Goal 설정 (기본값은 100%)
    my_covergroup.set_coverage_goal(90.0);  // 90% goal
    
    // Goal 달성 여부 확인
    if (my_covergroup.is_goal_achieved()) {
        std::cout << "✅ Coverage goal achieved!" << std::endl;
    } else {
        std::cout << "❌ Coverage goal not achieved yet" << std::endl;
        std::cout << "Current: " << my_covergroup.get_coverage() << "%" << std::endl;
        std::cout << "Goal: " << my_covergroup.get_coverage_goal() << "%" << std::endl;
    }
}

// 5. 런타임 커버리지 모니터링
void monitor_coverage_runtime() {
    // 실시간으로 커버리지 체크
    while (simulation_running) {
        double current_coverage = my_covergroup.get_coverage();
        
        if (current_coverage >= 95.0) {
            std::cout << "High coverage achieved: " << current_coverage << "%" << std::endl;
            // 시뮬레이션 조기 종료 가능
            break;
        }
        
        // 커버리지 홀 식별
        auto holes = my_covergroup.get_coverage_holes();
        for (auto& hole : holes) {
            std::cout << "Coverage hole: " << hole << std::endl;
        }
        
        wait(1000, SC_NS);  // 주기적으로 체크
    }
}