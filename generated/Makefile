# SystemC TLM CSR 모델 Makefile
# SystemRDL에서 생성된 CSR 모델 컴파일

# SystemC 설정 (환경에 맞게 수정)
SYSTEMC_HOME ?= /usr/local/systemc
SYSTEMC_INCLUDE = $(SYSTEMC_HOME)/include
SYSTEMC_LIB = $(SYSTEMC_HOME)/lib-linux64

# 컴파일러 설정
CXX = g++
CXXFLAGS = -std=c++14 -Wall -Wextra -O2
CXXFLAGS += -I$(SYSTEMC_INCLUDE)
CXXFLAGS += -DNDEBUG

# 링커 설정
LDFLAGS = -L$(SYSTEMC_LIB)
LDLIBS = -lsystemc -lm

# 타겟 설정
TARGET = test_csr_tlm
SOURCES = switch_csr_csr_tlm.cpp test_csr_tlm.cpp
OBJECTS = $(SOURCES:.cpp=.o)
HEADERS = switch_csr_csr_tlm.h

# 기본 타겟
all: $(TARGET)

# 실행 파일 생성
$(TARGET): $(OBJECTS)
	$(CXX) $(OBJECTS) $(LDFLAGS) $(LDLIBS) -o $@

# 오브젝트 파일 생성
%.o: %.cpp $(HEADERS)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# 실행
run: $(TARGET)
	./$(TARGET)

# VCD 파일과 함께 실행
run-vcd: $(TARGET)
	./$(TARGET) --vcd-file=csr_test.vcd

# 정리
clean:
	rm -f $(OBJECTS) $(TARGET) *.vcd

# 도움말
help:
	@echo "Available targets:"
	@echo "  all      - Build the test executable"
	@echo "  run      - Build and run the test"
	@echo "  run-vcd  - Build and run with VCD trace"
	@echo "  clean    - Remove build artifacts"
	@echo "  help     - Show this help"
	@echo ""
	@echo "Environment variables:"
	@echo "  SYSTEMC_HOME - Path to SystemC installation (default: /usr/local/systemc)"

.PHONY: all run run-vcd clean help
