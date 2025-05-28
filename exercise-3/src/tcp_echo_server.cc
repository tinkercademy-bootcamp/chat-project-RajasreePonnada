#include <iostream>
#include <netinet/in.h>
#include <string>
#include <sys/socket.h>
#include <sys/types.h>
#include <unistd.h>

const int kBufferSize = 1024;

void check_error(bool test, const std::string &message) {
  if (test) {
    std::cerr << message << "\n";
    exit(EXIT_FAILURE);
  }
}

int create_socket() {
  int my_sock = socket(AF_INET, SOCK_STREAM, 0);
  check_error(my_sock < 0, "Socket creation error");
  return my_sock;
}

void set_socket_options(int sock, int opt) {
  int result = setsockopt(sock, SOL_SOCKET, SO_REUSEADDR | SO_REUSEPORT, &opt, sizeof(opt));
  check_error(result < 0, "setsockopt() error");
}

sockaddr_in create_address(int port) {
  sockaddr_in address{};
  address.sin_family = AF_INET;
  address.sin_addr.s_addr = INADDR_ANY;
  address.sin_port = htons(port);
  return address;
}

void bind_address_to_socket(int sock, sockaddr_in &address) {
  int result = bind(sock, (sockaddr *)&address, sizeof(address));
  check_error(result < 0, "bind failed");
}

void listen_on_socket(int sock) {
  int result = listen(sock, 3);
  check_error(result < 0, "listen failed");
}

void start_listening_on_socket(int my_socket, sockaddr_in &address) {
  const int kSocketOptions = 1;
  set_socket_options(my_socket, kSocketOptions);
  bind_address_to_socket(my_socket, address);
  listen_on_socket(my_socket);
}

void handle_accept(int client_socket) {
  char buffer[kBufferSize] = {0};
  ssize_t valread = read(client_socket, buffer, kBufferSize);
  check_error(valread < 0, "Read error on client socket");

  if (valread == 0) {
    std::cout << "Client disconnected.\n";
  } else {
    std::cout << "Received: " << buffer << "\n";
    ssize_t sent = send(client_socket, buffer, valread, 0);
    check_error(sent < 0, "Send failed");
    std::cout << "Echo message sent\n";
  }

  close(client_socket);
}

void handle_connections(int sock, int port) {
  sockaddr_in address = create_address(port);
  socklen_t address_size = sizeof(address);

  while (true) {
    int accepted_socket = accept(sock, (sockaddr *)&address, &address_size);
    if (accepted_socket < 0) {
      std::cerr << "accept error\n";
      continue;
    }
    handle_accept(accepted_socket);
  }
}

int main() {
  const int kPort = 8080;
  int my_socket = create_socket();
  sockaddr_in address = create_address(kPort);

  start_listening_on_socket(my_socket, address);
  std::cout << "Server listening on port " << kPort << "\n";
  handle_connections(my_socket, kPort);
  close(my_socket);

  return 0;
}
