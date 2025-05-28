CXX = g++
CXXFLAGS = -Wall -Wextra -std=c++17

CLIENT_SRC = tcp_echo_client.cpp socket_utilities.cc
SERVER_SRC = tcp_echo_server.cpp socket_utilities.cc

all: client server

client: $(CLIENT_SRC)
	$(CXX) $(CXXFLAGS) -o client $(CLIENT_SRC)

server: $(SERVER_SRC)
	$(CXX) $(CXXFLAGS) -o server $(SERVER_SRC)

clean:
	rm -f client server
