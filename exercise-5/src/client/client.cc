// --- client.cc ---
#include "client/client.h"
#include "net/chat-sockets.h"
#include "utils.h"
#include <arpa/inet.h>
#include <iostream>
#include <unistd.h>

namespace tt::chat {

Client::Client(const std::string &server_ip, int port)
    : server_ip_(server_ip), port_(port) {
  socket_ = net::create_socket();
  server_address_ = net::create_address(port_);

  int err_code = inet_pton(AF_INET, server_ip_.c_str(), &server_address_.sin_addr);
  check_error(err_code <= 0, "Invalid address/Address not supported");
}

void Client::connect_to_server() {
  int err_code = connect(socket_, (sockaddr *)&server_address_, sizeof(server_address_));
  check_error(err_code < 0, "Connection Failed");
}

void Client::send_and_receive_message(const std::string &message) {
  const int kBufferSize = 1024;
  char buffer[kBufferSize] = {0};
  send(socket_, message.c_str(), message.size(), 0);
  std::cout << "Sent: " << message << "\n";

  ssize_t read_size = read(socket_, buffer, kBufferSize);
  check_error(read_size < 0, "Read error");

  if (read_size > 0) {
    std::cout << "Received: " << buffer << "\n";
  } else if (read_size == 0) {
    std::cout << "Server closed connection\n";
  }
}

void Client::run(const std::string &message) {
  connect_to_server();
  send_and_receive_message(message);
  close(socket_);
}

} // namespace tt::chat
