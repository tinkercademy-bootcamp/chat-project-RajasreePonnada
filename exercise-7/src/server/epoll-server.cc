#include "epoll-server.h"
#include "../utils.h"
#include "../net/chat-sockets.h"

#include "channel_manager.h"

#include <spdlog/spdlog.h>
#include <unistd.h>
#include <fcntl.h>
#include <iostream>
#include <cstring>

namespace tt::chat::server {

EpollServer::EpollServer(int port) {
  setup_server_socket(port);

  epoll_fd_ = epoll_create1(0);
  check_error(epoll_fd_ < 0, "epoll_create1 failed");

  // Initialize the ChannelManager
  channel_mgr_ = std::make_unique<ChannelManager>();

  epoll_event ev{};
  ev.events = EPOLLIN;
  ev.data.fd = listen_sock_;
  check_error(epoll_ctl(epoll_fd_, EPOLL_CTL_ADD, listen_sock_, &ev) < 0,
              "epoll_ctl listen_sock");

  
}

EpollServer::~EpollServer() {
  close(listen_sock_);
  close(epoll_fd_);
}

void EpollServer::setup_server_socket(int port) {
  listen_sock_ = net::create_socket();
  sockaddr_in address = net::create_address(port);
  address.sin_addr.s_addr = INADDR_ANY;

  int opt = 1;
  setsockopt(listen_sock_, SOL_SOCKET, SO_REUSEADDR, &opt, sizeof(opt));
  check_error(bind(listen_sock_, (sockaddr *)&address, sizeof(address)) < 0, "bind failed");
  check_error(listen(listen_sock_, 10) < 0, "listen failed");
}

void EpollServer::handle_new_connection() {
  sockaddr_in client_addr;
  socklen_t addrlen = sizeof(client_addr);
  int client_sock = accept(listen_sock_, (sockaddr *)&client_addr, &addrlen);
  check_error(client_sock < 0, "accept failed");

  epoll_event ev{};
  ev.events = EPOLLIN;
  ev.data.fd = client_sock;
  check_error(epoll_ctl(epoll_fd_, EPOLL_CTL_ADD, client_sock, &ev) < 0, "epoll_ctl client_sock");

  client_usernames_[client_sock] = "user_" + std::to_string(client_sock);  // temporary username
  SPDLOG_INFO("New connection: {}", client_usernames_[client_sock]);

}

void EpollServer::assign_username(int client_sock, const std::string& desired_name) {
  usernames_[client_sock] = desired_name;
  std::string welcome = "Welcome, " + desired_name + "!\n";
  send(client_sock, welcome.c_str(), welcome.size(), 0);
  SPDLOG_INFO("Client {} assigned username '{}'", client_sock, desired_name);
  }

void EpollServer::handle_client_data(int client_sock) {
  char buffer[1024];
  ssize_t len = read(client_sock, buffer, sizeof(buffer));
  if (len <= 0) {
    // cleanup
    return;
  }

  
}

void EpollServer::broadcast_to_channel(const std::string &channel, const std::string &msg, int sender_fd) {
  for (int fd : channel_mgr_->get_members(channel)) {
    if (fd != sender_fd) {
      send(fd, msg.c_str(), msg.size(), 0);
    }
  }
}

void EpollServer::broadcast_message(const std::string &message, int sender_fd) {
  for (const auto &[fd, name] : client_usernames_) {
    if (fd != sender_fd) {
      send(fd, message.c_str(), message.size(), 0);
    }
  }
}
void EpollServer::run() {
  SPDLOG_INFO("Server started with epoll");
  epoll_event events[kMaxEvents];

  while (true) {
    int nfds = epoll_wait(epoll_fd_, events, kMaxEvents, -1);
    for (int i = 0; i < nfds; ++i) {
      int fd = events[i].data.fd;
      if (fd == listen_sock_) {
        handle_new_connection();
      } else {
        handle_client_data(fd);
      }
    }
  }
}


} // namespace tt::chat::server
