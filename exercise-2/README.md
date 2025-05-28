# Exercise 2

**Update this README with your answers to the questions below.**

## Sources of Information for Questions from Before

### Socket 
- https://man7.org/linux/man-pages/man2/socket.2.html - System call reference
  for creating communication endpoints
- Or type `man socket` in terminal
- https://man7.org/linux/man-pages/man7/socket.7.html - Socket interface 
  overview and protocol families
- Or type `man 7 socket` in terminal
#
- When would you want to use a `SOCK_RAW` stream?

Ans. According to socket man page, SOCK_RAW is used when we need direct access to internal network protocol and interfaces. It is basically there to allow you to bypass some of the way that your computer handles TCP/IP. Rather than going through the normal layers of encapsulation/decapsulation that the TCP/IP stack on the kernel does,
#
### TCP and IP Protocols
- [IPv4](https://www.rfc-editor.org/info/rfc791) - Internet Protocol 
  specification defining packet structure and routing
- [IPv6](https://www.rfc-editor.org/info/rfc8200) - Next-generation Internet 
  Protocol with expanded address space
- [TCP](https://datatracker.ietf.org/doc/html/rfc9293) - Transmission Control 
  Protocol providing reliable, ordered data delivery
    
### C++
- [C++23 ISO standard draft](https://www.open-std.org/jtc1/sc22/wg21/docs/papers/2023/n4950.pdf) - 
  Working draft of the C++ language specification
- Is the above the official C++23 spec? 

Ans. No, it is still a working draft. 
#
- Where is the official C++23 spec?

Ans, There's this iso.org page: https://www.iso.org/standard/83626.html, where you can purchase it form.
#
- Why was this link chosen instead?

Ans. Since it is freely accessible to all without purchasing.
#
- Is this a helpful reference for learning C++?

Ans. This is lot more technical, so recommended for experienced C++ learners,
#
- Can the various implementations of C++ compilers be different from the
  C++ standard?

Ans. Yes, they may interpret some behaviours differently.
#
- What are the most widely used and most significant C++ compilers?

Ans. GCC, Clang
#
- Where is the equivalent spec for C++26?

Ans. There is this ongoing latex document: https://github.com/cplusplus/draft, that can be referred to find the in-progress C++26 specs.
#
- Where do you find the spec for the HTTP protocol?

Ans. The RFS 9110 documentation: https://www.rfc-editor.org/rfc/rfc9110.html 
#
- What about HTTPS? Is there a spec for that protocol?

Ans. The HTTPS over TLS spec can be found here: https://datatracker.ietf.org/doc/html/rfc2818
#

## Introduction to C++ and Sockets Programming

- Read the code in `src/`
#
- Are there any bugs in this code? 

Ans. No
#
- What can you do to identify if there are bugs in the code?

Ans. Tools like gdb, valgrind, IDE debugger or manual review can be used.

## Refactoring: Extract Function

- What is different in this code compared to exercise-1?

Ans. This code is modular with extracted functions for each responsibility than exercise-1 code.
#
- Is this code better or worse than exercise-1?

Ans. This is more better than exercise-1 as it is more readable and maintainable as testing can be more orthogonal. 
#
- What are the tradeoffs compared to exercise-1?

Ans. The only tradeoff I think this has slightly more code.
#
- Are you able to spot any mistakes or inconsistencies in the changes?

Ans. I think the error messages can be more richer.
#
  
## Thinking About Performance

- Does writing code this way have any impact on performance?

Ans. Very negligible cost for abstarction 
#
- What do we mean when we say performance?

Ans. Speed and memory usage
#
- How do we measure performance in a program?

Ans. By Logging start and end times, benchmarks, and using tools like perf, valgrind etc.
#

## Play with Git

- There isn't necessarily a single correct answer for how to abstract the 
  code from exercise-1 into functions
- Try different ways to refactor the code from exercise-1 to make it more
  readable.
- Make sure to commit each change as small and self-contained commit
- This will make it easier to revert your code if you need to
#
- What is `git tag`? How is `git tag` different from `git branch`?

Ans. A: A tag is a fixed label like v2.11.0 on a commit whereas a branch is a moving pointer to a commit.
#
- How can you use `git tag` and `git branch` to make programming easier and
  more fun?

Ans. Tags can be used in releasing versions while branches allow experimentation and parallel development
#
## Learn Basics of Debugging in Your IDE

- How do you enable debug mode in your IDE?

Ans. By building the project with -g flag.
#
- In debug mode, how do you add a watch?

Ans. By right-clicking on a variable and selecting "add watch" in the watch window.
#
- In debug mode, how do you add a breakpoint?
Ans. Click beside line number or use break command in GDB
#
- In debug mode, how do you step through code?
Ans. Use step-over, step-into, next, continue commands or UI options.
### Memory Management and Debug Mode in Your IDE

- How do you see the memory layout of a `std::string` from your IDE debug mode?

Ans. Set a breakpoint where the std::string is in scope. After starting debugging, you can see the memory layout by expanding the variable in the watch window.
#
- How do you see the memory layout of a struct from your IDE debug mode?

Ans. Similarly, set a breakpoint where the struct instance is in scope then use the Watch window or Locals window to expand the struct.