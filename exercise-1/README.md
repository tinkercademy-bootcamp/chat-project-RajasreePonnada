# Exercise 1

**Update this README with your answers to the questions below.**

## Learning How to Learn

- Answer the following questions in this file and commit and push your changes.
- Bonus sections are more difficult and optional.
- How can you find the information required to complete these tasks?
- How can you tell if the source of your information is good?
- How would you define "good" in this situation?

## Learn Basics of g++ CLI

- Compile the TCP client and server using `g++` from command line.
##
- What are the most important command line arguments to learn for `g++`?

Ans. g++ -o <output_file> <file_to_be_compiled>
##
- What is the difference between debug vs release versions?

Ans. the release version is more compiler-optimised than debug version. 
##
- What are the tradeoffs between debug and release versions?

Ans. The debug version takes lesser time to compile, hence suitable to debug whereas the release version is preferredd when we are the end of debugging and need a optimised compilation.
##
- What arguments would you use in a debug build?

Ans. We can use argumments like -g to enable debugging and -O0 to set the level of optimisation to zero
##
- What about for release?

Ans. Similarly, we need -O2 -O3 to enable high levels of optimization
##
- What other kinds of build types are useful?

Ans. The other build types include RelWithDebInfo(Release with Debug info) and Coverage Build(to measure the test coverage), MinSizeRel (the smallest bianry size build)
## Learn Basics of Make

- Create a Makefile that will speed up the process.
- [Quickstart tutorial to make](https://makefiletutorial.com/) - Learn make 
  fundamentals with practical examples and common patterns.
##
- How else can you learn about make?

Ans. Can learn here at https://www.gnu.org/software/make/manual/make.html
##
- How can you tell if the resource you are using is correct?

Ans. This resource is the official GNU documentation.
##
- Create a makefile such that when you run `make` with no arguments, it will:
  - Create `build/` directory if it does not exist
  - Create executables **client** and **server** in `build/`, if needed
  #
  - How does make know when it needs to rebuild the executables?

  Ans. for example, say here:
  ```
  $(CLIENT_BIN): $(CLIENT_SRC) | $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) -o $@ $<
  ```
If build/client doesn’t exist, builds it.

If tcp_echo_client.cc is modified more recently than build/client, rebuild.

build/ is created if missing but does not trigger a rebuild if its timestamp changes.

  - Change your Makefile such that `make clean` will remove `build/` and all
    its contents
#
- What are the most important command line arguments to learn for make?

Ans. 
```
make	
make <target>
make -jN	
make -B	
make -n	
make -C dir	
make VERBOSE=1	
```
#
- What are the most important directives to learn about in Makefile?

Ans. 
```
target
all
clean
VARIABLE = val
include file
```	

#
- What are the most important commands to implement in your Makefile?

Ans.
```
all(default builds everything)
mkdir -p $(BUILD_DIR)
rm -rf $(BUILD_DIR)
```
#
- Which ones are essential, which ones are nice to haves?

Ans.
```
essential CLI Arguments:	make, make target
nice to have ones:          -j, -B, -n, -C, VAR=value
```
#
## Learn Basics of Git

- Read through the code in `src/`
- Answer any `#Questions` as a comment
- Commit and push your changes to git
- Each commit should be responding to a single task or question
#
- Why is it important to keep your commit to a single task or question?

Ans. It helps in atomising the changes and creating pull requests for each and merging in large codebases, where you might not need to include all of the many changes in a simgle commit
#
- Is it better to have a lot of very small commits, or one big commit when 
  everything is working?

Ans. Even though everything is working, it is good practice to create many commits to keep track of changes and revert back to any.
#
- What are the most important commands to know in git?

Ans. add, commit, pull, fetch, push

## Introduction to Sockets

- Read the code in `src/tcp-echo-client.cc` and add a way to change the 
  message sent using command line arguments
- **Example**: `./client "hello message from the command prompt"` should send
  `"hello message from the command prompt"` to the server
- Commit your changes into git
#
- What do all these headers do?
Ans. 
```
stdio brings stderr and cout into scope, 
string brings std::string class, 
arpa/inet.h brings inet_pton and inet_ntop, 
netinet/in.h brings sockaddr_in and sockaddr_in6 structures, 
sys/socket.h brings socket, connect, connect, bind,
sys/types.h brings socklen_t datatype, 
unistd.h brings read, write, close POSIX system calls
```
#
- How do you find out which part of the below code comes from which header?

Ans. By pressing Ctrl + clicking on any part of code with ms-vscode cpptools extension enabled take sto teh respective header file pointing out where the struct or function comes from
# 
- How do you change the code so that you are sending messages to servers other than localhost?

Ans. chamging the kServerAddress in the tcp_echo_client.cc and mkaing sure that port is chosen such that the firewall doesn't block it
#
- How do you change the code to send to a IPv6 address instead of IPv4?

Ans. Replacing sockaddr_in with sockaddr_in6, Changing address family to AF_INET6 and then use inet_pton(AF_INET6, ...) instead of inet_pton(AF_INET, ...)
#
- **Bonus**: How do you change the client code to connect by hostname instead of IP address?

Ans. Using getaddrinfo() to resolve hostname to address and subsequent required changes and kServerAddress contains the hostname like "ip-172-31-25-255"
#
## Introduction to Memory Management

- What is happening in line 26 of `tcp-echo-client.cc`? 
  `if (inet_pton(AF_INET, kServerAddress.c_str(), &address.sin_addr) <= 0) {`

Ans. inet_pton() function converts an Internet address in its standard text format into its numeric binary form. So if the conversion fails, error is thrown.
#
- What is happening in line 31 of `tcp-echo-client.cc`?
  `if (connect(my_sock, (sockaddr *)&address, sizeof(address)) < 0) {`

Ans. The client socket connects to an IP address and port just using the socket and connect function, socket creates a socket ID on the OS, and connect connects that socket to an IP address and port.
if this TCP handshake with the server fails, returns error.
#
- What is the difference between a pointer and a reference?

Ans. The point unlike reference can be reassigned to another address whereas reference cannot be changed once set. The pointer can be nullptr	but reference must always refer to a valid object. we have to use *p to access value of a pointer but we can directly use reference like normal variable.
#
- When is it better to use a pointer?

Ans. When you need to represent no-object using nullptr or while doing manual memory allocation (new, malloc) or when implementing linked-lists/trees.
#
- When is it better to use a reference?

Ans. When you want to pass an object without copying, but safely and while returning or aliasing existing objects.
#
- What is the difference between `std::string` and a C-style string?

Ans. The std::string unlike C-style string has bounds-checked, dynamic sized, and is a cpp object whereas C_style string is a null-terminated array,  
#
- What type is a C-style string?

Ans. A C-style string is a char* (pointer to character) that points to a null-terminated sequence of characters.
#
- What happens when you iterate a pointer?

Ans. The pointer when iterated moves to the next memory location, as pointer references to the address of the variable.
#
- What are the most important safety tips to know when using pointers?

Ans. The pointers needs to always initialized(Else show dangling behavior), dereferencing null pointers needs to be avoided, chekcing bounds when iterating.

# 

## Learn Basics of Creating a C++ Project in Your IDE

- How do you compile and run your project in your IDE?

Ans. By accessing it through the terminal in the IDE itself.
## Improving Interactions with LLMs

- What is the most authoritative source of information about `socket()`
  from `<sys/socket.h>`?
  
  Ans. man 2 socket
#
- What is the most authoritative source of information about the TCP and IP
  protocols?

  Ans. 
  - IPv4 - https://www.rfc-editor.org/info/rfc791
  - IPv6 - https://www.rfc-editor.org/info/rfc8200
  - TCP - https://datatracker.ietf.org/doc/html/rfc9293
# 
- What is the most authoritative source of information about the C++
  programming language?
Ans. cppreference.com, also https://isocpp.org/std/the-standard
#
- What information can you find about using Markdown when structuring prompts to LLMs?

Ans. I find multiple sources stating that using Markdown helps
increase the performance variation upto 40% but some sources also state that markdown inputs provide nothing more than readable inputs.
#
- What is the difference between LLM and AI?

Ans. An LLM (Large Language Model) is	a subset of AI, specifically a deep learning model trained on large amounts of dataset to generate and understand language. Example: GPT-4, whereas AI is a broad field that includes LLMs, but also covers game-playing agents, vision, and more.
#
- Is it grammatically correct in English to say "a LLM" or "an LLM"? Why?

Ans. It is correct to say "an LLM" because the acronym LLM starts with a vowel sound "el-" hence the article used is "an".