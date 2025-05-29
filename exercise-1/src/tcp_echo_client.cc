#include <arpa/inet.h>
#include <iostream>
#include <netinet/in.h>
#include <string>
#include <sys/socket.h>
#include <sys/types.h>
#include <unistd.h>
#include <netdb.h> // for getaddrinfo


int main(int argc, char **argv) {
  // #Question - are these the same type?
  // 
  std::string message = argc > 1 ? argv[1] : "";
  const int kPort = 35000;
  const std::string kServerAddress = "ip-172-31-25-255";
  sockaddr_in6 address;
  const int kBufferSize = 1024;
  char buffer[kBufferSize] = {0};
  // Creating socket file descriptor
  // int my_sock = socket(AF_INET6, SOCK_STREAM, 0);
  // if (my_sock < 0) {
  //   std::cerr << "Socket creation erron\n";
  //   return -1;
  // }
  address.sin6_family = AF_INET6;
  address.sin6_port = htons(kPort);
//
addrinfo hints{}, *res;
hints.ai_family = AF_INET; // or AF_UNSPEC for both IPv4 & IPv6
hints.ai_socktype = SOCK_STREAM;

int status = getaddrinfo(kServerAddress.c_str(), std::to_string(kPort).c_str(), &hints, &res);
if (status != 0) {
    std::cerr << "getaddrinfo error: " << gai_strerror(status) << "\n";
    return 1;
}
int my_sock = socket(res->ai_family, res->ai_socktype, res->ai_protocol);
if (my_sock < 0) {
    perror("socket");
    freeaddrinfo(res);
    return 1;
}

if (connect(my_sock, res->ai_addr, res->ai_addrlen) < 0) {
    perror("connect");
    freeaddrinfo(res);
    return 1;
}
freeaddrinfo(res);
//
  // // Convert IPv4 and IPv6 addresses from text to binary form
  // if (inet_pton(AF_INET6, kServerAddress.c_str(), &address.sin6_addr) <= 0) {
  //   std::cerr << "Invalid address/ Address not supported\n";
  //   return -1;
  // }
  // // Connect to the server
  // if (connect(my_sock, (sockaddr *)&address, sizeof(address)) < 0) {
  //   std::cerr << "Connection Failed\n";
  //   return -1;
  // }
  // Send message (./client "hello message from the command prompt"` should send "hello message from the command prompt" to the server)
  send(my_sock, message.c_str(), message.size(), 0);
  std::cout << "Sent: " << message << "\n";
  // Wait for reply
  ssize_t read_size = read(my_sock, buffer, kBufferSize);
  std::cout << "Received: " << buffer << "\n";
  // Close the socket
  close(my_sock);
  return 0;
}