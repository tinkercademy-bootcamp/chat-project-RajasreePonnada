#include "socket_utilities.h"
#include <iostream>
#include <arpa/inet.h>
#include <unistd.h>
#include <cstdlib>

void check_error(bool test, std::string error_message) {
    if (test) {
        std::cerr << error_message << "\n";
        exit(EXIT_FAILURE);
    }
}

int create_socket() {
    int sock = socket(AF_INET, SOCK_STREAM, 0);
    check_error(sock < 0, "Socket creation error\n");
    return sock;
}

sockaddr_in create_address(const std::string &ip, int port) {
    sockaddr_in address;
    address.sin_family = AF_INET;
    address.sin_port = htons(port);
    check_error(inet_pton(AF_INET, ip.c_str(), &address.sin_addr) <= 0,
                "Invalid address/ Address not supported.");
    return address;
}

sockaddr_in create_address(int port) {
    sockaddr_in address;
    address.sin_family = AF_INET;
    address.sin_addr.s_addr = INADDR_ANY;
    address.sin_port = htons(port);
    return address;
}
