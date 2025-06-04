#pragma once
#include <string>
#include <netinet/in.h>

void check_error(bool test, std::string error_message);
int create_socket();
sockaddr_in create_address(const std::string &ip, int port); // for client
sockaddr_in create_address(int port); // for server
