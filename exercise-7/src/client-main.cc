// client-main.cc
#include <cstdlib>
#include <iostream>
#include <string>
#include <thread>
#include <mutex>
#include <atomic>
#include <memory> // For std::unique_ptr

#include <ncurses.h>
#include <spdlog/spdlog.h>

// Forward declare or include your client class header
#include "client/chat-client.h"

// Global ncurses windows and synchronization primitives
WINDOW* g_chat_win = nullptr;
WINDOW* g_input_win = nullptr;
std::mutex g_ncurses_mutex;
std::atomic<bool> g_client_running{true}; // Initialize to true

int main(int argc, char* argv[]) {
    // Suppress unused parameter warnings for now
    (void)argc;
    (void)argv;

    spdlog::set_level(spdlog::level::info);
    SPDLOG_INFO("Client application starting...");

    // TODO: Add client logic

    SPDLOG_INFO("Client application finished.");
    return EXIT_SUCCESS;
}