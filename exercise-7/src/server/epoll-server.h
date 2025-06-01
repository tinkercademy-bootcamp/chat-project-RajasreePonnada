#ifndef EPOLL_SERVER_H
#define EPOLL_SERVER_H



namespace tt::chat::server {

class EpollServer {
public:
  explicit EpollServer(int port);
  ~EpollServer();
  void run();

private:
  };

}

#endif 