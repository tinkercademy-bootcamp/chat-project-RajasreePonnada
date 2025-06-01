#ifndef EPOLL_SERVER_H
#define EPOLL_SERVER_H



namespace tt::chat::server {

class EpollServer {
public:
  explicit EpollServer(int port);
  ~EpollServer();
  void run();

private:
  int listen_sock_;

  static constexpr int kBufferSize = 1024;

  std::unordered_map<int, std::string> client_usernames_;

  void setup_server_socket(int port);
  void handle_new_connection();
  void handle_client_data(int client_sock);
  };

}

#endif 