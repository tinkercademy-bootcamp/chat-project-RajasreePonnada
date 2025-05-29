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

Ans. Static Linking :
- The whole library is included in your program’s final executable hence creates a larger executable 
- No need to ship extra library files can just run the program to any other machine
- All code is bundled into one file.
- More stable at runtime.

Dynamic Linking :
- The program refers to an external library file (like `.so` or `.dll`) hence creates a smaller executable.                                          
- must have the library installed on the system else can't run the program                 
- Code is shared between programs.                                            
- Easier to update (can be just done by replacing the shared library).           
#
- What are the tradeoffs?

Ans, The tradeoffs of Static linking are larger executable size, hardships to update just one library, and those of Dynamic linking are risk of missing library at runtime, potential version conflicts (like say two files need different versions of same library)
#
- How do you enable static linking or dynamic linking in your makefile?

Ans. 
For dynamic linking as we have changed the Makefile earlier, this asks the compiler to look for .so files (here libspdlog.so, libfmt.so) 
```
LDFLAGS := -fsanitize=address -lspdlog -lfmt
```

For static linking, first we need to make sure we have the .a (static archive) versions of the libraries installed (here libspdlog.a, libfmt.a).
and add the -static flag when linking:

```
LDFLAGS := -static -fsanitize=address -lspdlog -lfmt
```
## Git Clone and Building from Source

- Where is `g++` looking for the include files and library files?
- How do you find out?

## C++ Package Managers

- Why are there so many C++ package managers?
- Which one is the best one?
- Which are the most notable ways to manage the compilation of C++ projects?