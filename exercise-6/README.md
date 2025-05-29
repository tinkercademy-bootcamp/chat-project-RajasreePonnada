# Exercise 6

**Update this README with your answers to the questions below.**

## Adding Third Party Libraries or Source Code to Your Project

- There is a new file `src/spdlog-hello-world-main.cc`
- It uses the spdlog and fmt libraries. 
  [More info here](https://github.com/gabime/spdlog) - Fast C++ logging 
  library with various sink types and formatting options
#
- How do you compile this file using the `g++` CLI?

Ans. 
```
g++ src/spdlog-hello-world-main.cc -o spdlog-hello-world 
-I/path/to/spdlog/include -I/path/to/fmt/include -L/path/to/lib -lspdlog -lfmt -std=c++17
```
#
- What do you need to change in your makefile to use this library?

Ans. 
```
CXXFLAGS += -I/path/to/spdlog/include -I/path/to/fmt/include -std=c++17
LDFLAGS += -L/path/to/lib -lspdlog -lfmt
```
#
- How many different ways can this library be added into your project?

Ans. 
1. Either we can clone spdlog into project and include headers directly

2. or install the packages using spt/brew

3. or clone repo and build static/dynamic lib, and link it.
#
- What are the tradeoffs in the different ways?

Ans. 
If we use it through Header it would be hard to update/manage, system-installed would create version mismatch risks and building manual static/dynamic libraries bring high maintenance overhead.
#
- Why are there so many different ways to do it?

Ans. Because C++ has no official package manager, and a wide variety of toolchains (GCC, Clang) and low-lvel control is intended sometimes.
#
## Static Linking vs Dynamic Linking

- What are the differences between static linking and dynamic linking?
- What are the tradeoffs?
- How do you enable static linking or dynamic linking in your makefile?

## Git Clone and Building from Source

- Where is `g++` looking for the include files and library files?
- How do you find out?

## C++ Package Managers

- Why are there so many C++ package managers?
- Which one is the best one?
- Which are the most notable ways to manage the compilation of C++ projects?