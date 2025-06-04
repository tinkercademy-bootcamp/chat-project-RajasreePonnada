-exec info registers
# Exercise 3

**Update this README with your answers to the questions below.**

## Re-using Code

- Read the code in `src/tcp_echo_client.cc`

- A new function `check_error()` has been created and `create_socket()` from 
  exercise-2 has been refactored to make use of it
#
- What are the benefits of writing code in this way?

Ans. It simplifies repetitive error handling i.e., DRY(Don't Repeat Yourself) principle and can change the code at once and for all.
#
- Are there any costs to writing code like this?

Ans. There is slight overhead from additional function calls.
#
- Apply `check_error` to all the code in `src/`


## Introduction to Compiler Explorer

- Try out the old `create_socket()` and the new `check_error()` and 
  `create_socket()` in [Compiler Explorer](https://godbolt.org) - Interactive 
  tool for exploring how C++ code compiles to assembly
  #
- What is happening here?

Ans. Compiler Explorer shows how high-level C++ code is compiled to assembly. 
Then came to a conclusion that this exercise-3 version is less-optimised than old create_socket version and the reasoning is as follows.
  1. Fewer Instructions
The older version produced significantly fewer assembly instructions.
There should be no calls to constructors/destructors like as in latest version:
```
std::__cxx11::basic_string<...>::basic_string
std::__cxx11::basic_string<...>::~basic_string
std::__new_allocator<...>::~__new_allocator
```
  2. Smaller Stack Frame
In the older version, we see:
```
sub rsp, 16
```
vs
```
sub rsp, 72
```
in the first. This shows how much stack space the function reserves — a smaller number = better.

  3. No Function Indirection
In the latest version, there's a call to a helper function:
```
call check_error
```
along with overhead for handling the string error message.

In the older version, the logic is inlined and direct:
```
cmp eax, 0
js .Lerror
mov esi, OFFSET FLAT:.LC0
mov edi, OFFSET FLAT:std::cerr
call operator<<
call exit
```
  
  4. Absence of Exception Handling
The latest version contains code like:
```
call _Unwind_Resume
```
This is completely absent in the older version, further showing it’s optimized.

  5. No Heap Allocation
std::string usually requires dynamic memory.

The older version avoids it entirely by using const char*.

#
- Can you think of any different approaches to this problem?

Ans. We can use macros, templates to reduce repetition.
#
- How can you modify your Makefile to generate assembly code instead of
  compiled code?

Ans. Adding this to the make creates a file tcp_echo_client.s correspondingly.
``` 
  %.s: %.cc
	$(CXX) $(CXX_FLAGS) -S $< -o $@
```
- **Note**: You can save the generated assembly from Compiler Explorer
- **Bonus**: Can you view assembly code using your IDE?

Ans. adding the show disassembly in the launch.json then running this command on debug console after pausing the debugging shows the entire assembly.
```
-exec disassemble
``` 
- **Bonus**: How do you see the assembly when you step through each line in
  debugging mode from your IDE?

Ans. After doing the above, enter into a breakpoint and run the below commandd to get the specific breakpoint's assembly or follow it up by the function name to view the assembly code of the function
```
-exec disassemble /m
``` 
- [x86 assembly reference](http://ref.x86asm.net/) - Comprehensive reference 
  for x86 assembly language instructions and syntax

## More About Memory Management

- Make sure you have `-fsanitize=address` in both your `CXX_FLAGS` and 
  `LD_FLAGS` in your Makefile
#
- What do `-fsanitize=address`, `CXX_FLAGS` and `LD_FLAGS` mean?

Ans. Enable AddressSanitizer to detect memory issues like overflows, leaks. CXX_FLAGS are the flags for the compiler (e.g., -g, -O0, -Wall) and the LD_FLAGS are flags for the linker.
#
- With the new tool of the Compiler Explorer, and keeping in mind what you 
  have learned about how to use debug mode

Ans. We can view the assembly code line-wise as we viewed in the compiler explorer(godbolt) also can view the registers and call-stack. 
#
- What happens when you look at a `std::string` using the above methods?

Ans. When I inspected a std::string in a debugger or compiler explorer, I didn’t see the actual text directly inside the string object because std::string is a small wrapper around a pointer and some metadata, somethink like this:
```
sub	x0, x20, #0x60
0x0000aaaaaaaa22f8 <+248>:	mov	x1, x0
0x0000aaaaaaaa22fc <+252>:	mov	w0, w23
```
#
- Where is the text in your `std::string`?

Ans. std::string stores a pointer
#
- What is `std::optional`?

Ans. A type that represents a value that may or may not be present. It acts like a safe and type-safe alternative to null pointers.
#
- How do you find out the memory layout of a `std::optional`?

Ans. Using the pahole tool if clang we can analyse the memory layout of std::optional and come to a conclusion that it is equivalent to:
```
class optional<int> { 
    int value;
    bool used;
};
```
you can see the godbolt result here:
https://godbolt.org/z/r4KTfYKoW


#
- Read https://en.cppreference.com/w/cpp/memory#Smart_pointers - Guide to modern C++ memory management using smart pointers
#
- Which pointer types are the most important to know about?

Ans. std::unique_ptr, std::shared_ptr and std::weak_ptr.
#
- Which smart pointer should you use by default if you can?

Ans. I think it's better to use std::unique_ptr by default as it is simple, efficient, expresses unique ownership clearly.
#
- Does changing your optimization level in `CXXFLAGS` from `-O0` to `-O3` have
  any impact on the answers to any of the above questions?

Ans. Yes, as optimizations may inline code, eliminate unused values, change layout.
#
## More Thinking About Performance

- After your experiments with Compiler Explorer, do you have any updates for
  your answers in exercise-2?

### Bonus: Do Not Watch Now 

- [More about Compiler Explorer](https://www.youtube.com/watch?v=bSkpMdDe4g4) - 
  Deep dive into compiler optimization and assembly analysis
  - Create a struct which contain many different data types
  - Look at the memory layout in the debugger
  - Create a `char` or `uint8_t` pointer to the beginning of the struct, 
    iterate to the end of the struct, printing out the value of each byte in 
    hexadecimal
  - Try accessing different parts of the struct and see in compiler explorer
    what the assembly looks like
  - What happens if you iterate the pointer to outside the bounds of your
    array?
  - Let's say your struct is called `Foo`
  - What is the difference between `std::vector<Foo>` and `std::vector<Foo*>`?
  - What are the tradeoffs between using `std::vector<Foo>` vs 
    `std::vector<Foo*>`? 
  - Give an example where `std::vector<Foo>` is a better choice than 
    `std::vector<Foo*>`
  - Give another example where the opposite is true
  - Can you create `std::vector<Foo&>`? 
  - Can you create `std::vector<std::optional<Foo>>`?
  - What happens if your struct contains another struct?
  - What is the difference between a struct and a class?