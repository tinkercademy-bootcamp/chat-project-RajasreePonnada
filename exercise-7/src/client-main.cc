#include <arpa/inet.h>
#include <cstdlib>
#include <iostream>
#include <netinet/in.h>
#include <string>
#include <sys/socket.h>
#include <sys/types.h>
#include <unistd.h>
#include <thread>
#include <mutex>

#include <ncurses.h>

WINDOW* chat_win;
WINDOW* input_win;
std::mutex win_mutex;

void update_chat(const std::string& msg) {
  std::lock_guard<std::mutex> lock(win_mutex);
  wprintw(chat_win, "%s\n", msg.c_str());
  wrefresh(chat_win);
}

void read_loop(int sock, WINDOW* chat_win) {
    char buffer[2048];

    while (true) {
        ssize_t n = read(sock, buffer, sizeof(buffer) - 1);
        if (n <= 0) break;

        buffer[n] = '\0';
        std::string msg(buffer);

        // Try to parse format: [channel] username: message
        size_t ch_end = msg.find("] ");
        size_t user_end = msg.find(": ", ch_end + 2);

        if (msg[0] == '[' && ch_end != std::string::npos && user_end != std::string::npos) {
            std::string channel = msg.substr(1, ch_end - 1);
            std::string username = msg.substr(ch_end + 2, user_end - (ch_end + 2));
            std::string content = msg.substr(user_end + 2);

            wattron(chat_win, COLOR_PAIR(2)); // channel
            wprintw(chat_win, "[%s] ", channel.c_str());
            wattroff(chat_win, COLOR_PAIR(2));

            wattron(chat_win, COLOR_PAIR(1)); // username
            wprintw(chat_win, "%s: ", username.c_str());
            wattroff(chat_win, COLOR_PAIR(1));

            wprintw(chat_win, "%s\n", content.c_str());
        } else {
            // fallback
            wprintw(chat_win, "%s\n", msg.c_str());
        }

        wrefresh(chat_win);
    }
}


int main() {
  const int port = 8080;
  const char* server_ip = "127.0.0.1";

  // --- Set up socket ---
  int sock = socket(AF_INET, SOCK_STREAM, 0);
  sockaddr_in server_addr{};
  server_addr.sin_family = AF_INET;
  server_addr.sin_port = htons(port);
  inet_pton(AF_INET, server_ip, &server_addr.sin_addr);
  connect(sock, (sockaddr*)&server_addr, sizeof(server_addr));

  // --- Init ncurses ---
  initscr();
  // cbreak();
  // echo();
  start_color();
  init_pair(1, COLOR_CYAN, COLOR_BLACK);    // usernames
  init_pair(2, COLOR_YELLOW, COLOR_BLACK);  // channel names
  cbreak();
  int height = LINES - 3;
  chat_win = newwin(height, COLS, 0, 0);
  input_win = newwin(3, COLS, height, 0);
  scrollok(chat_win, TRUE);
  box(input_win, 0, 0);
  wrefresh(chat_win);
  wrefresh(input_win);

  // --- Start read thread ---
  WINDOW* chat_win = newwin(LINES - 3, COLS, 0, 0);  // window occupying most of the terminal
  scrollok(chat_win, TRUE);  // TRUE - Allow scrolling when text exceeds the window

  std::thread reader(read_loop, sock, chat_win);  // Passing the window to the thread

  


  // --- Input loop ---
  char input[512];
  while (true) {
    werase(input_win);
    box(input_win, 0, 0);
    mvwprintw(input_win, 1, 2, "> ");
    keypad(input_win, TRUE);
    werase(input_win);
    box(input_win, 0, 0);
    mvwprintw(input_win, 1, 2, "> ");
    wrefresh(input_win); // ← before calling wgetnstr
    wgetnstr(input_win, input, sizeof(input) - 1);


    std::string msg = input;
    if (msg == "/quit") break;

    send(sock, msg.c_str(), msg.size(), 0);
    update_chat("You: " + msg);
  }

  // --- Cleanup ---
  reader.detach();
  close(sock);
  delwin(chat_win);
  delwin(input_win);
  endwin();
  return 0;
}
