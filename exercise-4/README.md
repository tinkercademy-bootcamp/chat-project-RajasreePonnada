# Exercise 4

**Update this README with your answers to the questions below.**

## Learning Multi-File C++ Projects

- Move code that can be shared between `tcp_echo_server.cc` and 
  `tcp_echo_client.cc` to separate `.h` and `.cc` files
- How would you compile from the command line?

Ans.
```
g++ tcp_echo_client.cpp socket_utilities.cc -o client
g++ tcp_echo_server.cpp socket_utilities.cc -o server
```
- How would you compile using make?

Ans. By creating a make file with
```
CLIENT_SRC = tcp_echo_client.cc socket_utils.cc
SERVER_SRC = tcp_echo_server.cc socket_utils.cc
```
#
- How would you compile using VS Code?

Ans. By creating a tasks.json and click on task: run rask on command pallette, select either build client or build server
#
### Compiling vs Linking

- What is the difference between compiling and linking in C++?

Ans. Compiling: Translation of source code (.cpp) into object code (.o).

Linking: Combining object files into a final executable or library, resolving function calls and symbols.
#
- What is the difference between creating an executable and creating a library?

Ans. Executable is a program that runs. Library is a collection of code files to be reused in multiple programs.
#
- How do you compile a library, and then use that library to compile an executable?

Ans. Compile the library: ("ar" creates a static library named "libsocket_utils.a" from the object file)

```
g++ -c socket_utils.cc -o socket_utils.o
ar rcs libsocket_utils.a socket_utils.o 
```
Link with the library: (-L.: Look for libraries in the current directory)
```
g++ tcp_echo_client.cc -L. -lsocket_utils -o client
```
#

### Reminder 
[Quickstart tutorial to make](https://makefiletutorial.com/) - Learn make 
fundamentals with practical examples and common patterns.

## Experiments in Performance

- Is it better to have many small files spread across many directories, or
  a few large files across fewer directories?
- Is there a difference in compilation time between the two?
- How can you assess performance other than compilation speed?