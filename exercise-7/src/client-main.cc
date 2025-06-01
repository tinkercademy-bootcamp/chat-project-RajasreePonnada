// #include <arpa/inet.h>
#include <cstdlib>
// #include <iostream>
// #include <netinet/in.h>
// #include <string>
#include <sys/socket.h>
#include <sys/types.h>
// #include <unistd.h>

#include "client/chat-client.h"

#include <iostream>
#include <string>
#include <unistd.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <thread>

void read_loop(int sock) {
  char buffer[1024];
  while (true) {
    ssize_t n = read(sock, buffer, sizeof(buffer) - 1);
    if (n > 0) {
      buffer[n] = '\0';
      std::cout << "\n" << buffer << std::endl;
      std::cout << "> " << std::flush;  // prompt user again
    }
  }
}

int main() {
  const int port = 8080;
  const char* server_ip = "127.0.0.1";

  int sock = socket(AF_INET, SOCK_STREAM, 0);
  sockaddr_in server_addr{};
  server_addr.sin_family = AF_INET;
  server_addr.sin_port = htons(port);
  inet_pton(AF_INET, server_ip, &server_addr.sin_addr);
  connect(sock, (sockaddr*)&server_addr, sizeof(server_addr));

  std::thread reader(read_loop, sock);

  std::string line;
  while (std::getline(std::cin, line)) {
    send(sock, line.c_str(), line.size(), 0);
  }

  reader.join();
  close(sock);
  return 0;
}
