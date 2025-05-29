// --- client.h ---
#ifndef CLIENT_H
#define CLIENT_H

#include <netinet/in.h>
#include <string>

namespace tt::chat {

class Client {
public:
  Client(const std::string &server_ip, int port);
  void run(const std::string &message);

private:
  std::string server_ip_;
  int port_;
  int socket_;
  sockaddr_in server_address_;

  void connect_to_server();
  void send_and_receive_message(const std::string &message);
};

} // namespace tt::chat

#endif // CLIENT_H