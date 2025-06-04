# Makefile

CXX = g++
CXXFLAGS = -Wall -Wextra -std=c++17
BUILD_DIR = build

CLIENT_SRC = tcp_echo_client.cc
SERVER_SRC = tcp_echo_server.cc

CLIENT_BIN = $(BUILD_DIR)/client
SERVER_BIN = $(BUILD_DIR)/server

all: $(CLIENT_BIN) $(SERVER_BIN)

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(CLIENT_BIN): $(CLIENT_SRC) | $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) -o $@ $<

$(SERVER_BIN): $(SERVER_SRC) | $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) -o $@ $<

clean:
	rm -rf $(BUILD_DIR)
