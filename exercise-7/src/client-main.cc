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

void read_loop(int sock) {
  char buffer[1024];
  while (true) {
    ssize_t n = read(sock, buffer, sizeof(buffer) - 1);
    if (n > 0) {
      buffer[n] = '\0';
      update_chat(std::string(buffer));
    }
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
  std::thread reader(read_loop, sock);
  


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
