// --- server.h ---
#ifndef SERVER_H
#define SERVER_H

#include <netinet/in.h>

namespace tt::chat {

class Server {
public:
  Server(int port);
  void run();

private:
  int port_;
  int socket_;
  sockaddr_in address_;

  void bind_and_listen();
  void handle_client(int client_socket);
};

} // namespace tt::chat

#endif // SERVER_H
