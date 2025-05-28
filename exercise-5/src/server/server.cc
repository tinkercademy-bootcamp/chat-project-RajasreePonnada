// --- server.cc ---
#include "server/server.h"
#include "net/chat-sockets.h"
#include "utils.h"
#include <iostream>
#include <unistd.h>

namespace tt::chat {

Server::Server(int port) : port_(port) {
  socket_ = net::create_socket();

  int opt = 1;
  int err_code = setsockopt(socket_, SOL_SOCKET, SO_REUSEADDR | SO_REUSEPORT, &opt, sizeof(opt));
  check_error(err_code < 0, "setsockopt error");

  address_ = net::create_address(port_);
  address_.sin_addr.s_addr = INADDR_ANY;
}

void Server::bind_and_listen() {
  int err_code = bind(socket_, (sockaddr *)&address_, sizeof(address_));
  check_error(err_code < 0, "Bind failed");

  err_code = listen(socket_, 3);
  check_error(err_code < 0, "Listen failed");

  std::cout << "Server listening on port " << port_ << "\n";
}

void Server::handle_client(int client_socket) {
  const int kBufferSize = 1024;
  char buffer[kBufferSize] = {0};
  ssize_t read_size = read(client_socket, buffer, kBufferSize);

  if (read_size > 0) {
    std::cout << "Received: " << buffer << "\n";
    send(client_socket, buffer, read_size, 0);
    std::cout << "Echo message sent\n";
  } else {
    std::cerr << "Read error or client disconnected\n";
  }
  close(client_socket);
}

void Server::run() {
  bind_and_listen();
  socklen_t addrlen = sizeof(address_);
  while (true) {
    int client_socket = accept(socket_, (sockaddr *)&address_, &addrlen);
    check_error(client_socket < 0, "Accept failed");
    handle_client(client_socket);
  }
  close(socket_);
}

} // namespace tt::chat