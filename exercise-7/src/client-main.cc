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

    // --- Init ncurses ---
    initscr();
    if (has_colors()) {
        start_color();
        // Basic color pairs (can be expanded later)
        init_pair(1, COLOR_CYAN, COLOR_BLACK);
        init_pair(2, COLOR_YELLOW, COLOR_BLACK);
    }
    cbreak(); // Line buffering off
    echo(); 

    int terminal_rows, terminal_cols;
    getmaxyx(stdscr, terminal_rows, terminal_cols);
    int chat_win_height = terminal_rows - 3;

    g_chat_win = newwin(chat_win_height, terminal_cols, 0, 0);
    g_input_win = newwin(3, terminal_cols, chat_win_height, 0);

    if (!g_chat_win || !g_input_win) {
        if (isendwin() == FALSE) endwin();
        SPDLOG_CRITICAL("Failed to create ncurses windows.");
        std::cerr << "Error: Failed to create ncurses windows." << std::endl;
        // chat_client_ptr destructor will handle socket close
        return EXIT_FAILURE;
    }

    scrollok(g_chat_win, TRUE);
    box(g_input_win, 0, 0);
    keypad(g_input_win, TRUE); // Enable function keys for input window

    wrefresh(g_chat_win);
    wrefresh(g_input_win);

    (void)argc;
    (void)argv;


    spdlog::set_level(spdlog::level::info);
    SPDLOG_INFO("Client application starting...");

    const char* server_ip = "127.0.0.1";
    int port = 8080;

    if (argc > 1) server_ip = argv[1];
    if (argc > 2) {
        try { port = std::stoi(argv[2]); }
        catch (const std::exception& e) {
            std::cerr << "Invalid port: " << argv[2] << ". Using default " << port << std::endl;
        }
    }
    SPDLOG_INFO("Attempting to connect to server {}:{}", server_ip, port);

    std::unique_ptr<tt::chat::client::Client> chat_client_ptr;
    try {
        chat_client_ptr = std::make_unique<tt::chat::client::Client>(port, server_ip);
        SPDLOG_INFO("Successfully connected to the server.");
    } catch (const std::runtime_error& e) {
        SPDLOG_CRITICAL("Failed to connect to server: {}", e.what());
        std::cerr << "Error: Failed to connect to server: " << e.what() << std::endl;
        return EXIT_FAILURE;
    } catch (...) {
        SPDLOG_CRITICAL("An unknown error occurred during client connection.");
        std::cerr << "An unknown error occurred during client connection." << std::endl;
        return EXIT_FAILURE;
    }

    // chat_client_ptr will auto-disconnect on exit due to unique_ptr destructor

    if (g_input_win) { delwin(g_input_win); g_input_win = nullptr; }
    if (g_chat_win) { delwin(g_chat_win); g_chat_win = nullptr; }
    if (isendwin() == FALSE) endwin();

    SPDLOG_INFO("Client application finished.");
    return EXIT_SUCCESS;
}