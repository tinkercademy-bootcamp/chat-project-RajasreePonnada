# Exercise 5

**Update this README with your answers to the questions below.**

## Comparing File Changes

- What's an easy way to identify the changes in source code from one exercise
  to another?

Ans. use this command
```
 diff -u exercise-3/src/tcp_echo_client.cc exercise-4/src/tcp_echo_client.cpp
```
    
## Using Classes

- Here is one way to separate out the code into multiple files
#
- Is this the best way to do it? 

Ans. It depends. Using classes provide better organization and encapsulation, especially as code complexity grows.
#

- What are the advantages and disadvantages?

Ans. Advantages are many, including modularity, abstraction, easy testability and its resusable due to objects. Disadavantage is that in smaller programs, this creates complexity and more lines of code.

## Introduction to Namespace

- There are different ways namespace is being used in this exercise
#
- Which way is better? What are the advantages and disadvantages?

Ans. Using named namespaces is preferred over unnamed ones as it has multiple advantages such as prevention of symbol collisions, improves code organisation and readability also with downsides like code appears more verbose to write something like "network::" everywhere.
#
## Abstracting Code into Classes

- Abstract the client and server logic into a `Client` and `Server` class
#
- **Note**: You don't have to use the code in this exercise as a starting point
#
- You can use the code you wrote from previous exercises instead
#
- How should you divide the code into files?

Ans. The code must be divided into client.h, client.cc, server.h and server.cc which contains classes Client and Server and also necessary changes have to be made to already existing files client-main.cc, server-main.cc and utils.h 
#
- What namespace and directory structure should you use? Why?

Ans. Use tt::chat for general utilities and networking. Use nested namespaces like tt::chat::client and tt::chat::server for client and server logic to maintain clarity.

The directory structure for source files is:
```
exercise-5/
├── src/
│   ├── client/
│   │   ├── client.h
│   │   ├── client.cc
│   ├── server/
│   │   ├── server.h
│   │   ├── server.cc
│   ├── net/
│   │   ├── chat-sockets.h
│   │   ├── chat-sockets.cc
│   ├── utils.h
```

## Programming Sense of Taste

- How do you judge what makes a particular choice of namespace and directory
  structure? 

Ans. I judge based on clarity, scalability, how well it reflects the problem domain, and how easy it is to navigate.
#
- How do you judge what makes a good naming convention or programming style?

Ans. I judge based on consistency, readability, and more importantly community standards we specify before hand.
#
## "Senses" in Programming

- Have you ever heard of programmers referring to "code smells"? How can code
  smell?

Ans. Yes, some common code smells that I hear are repeated code segments that appear in multiple locations, violating the "don't repeat yourself" principle and making maintenance challenging or Code segments that are written but never executed, cluttering the codebase and adding unnecessary complexity.
#
- What does it mean to have a sense of taste in programming? How can code
  taste?

Ans. It refers to having intuition about clean, elegant, and efficient code design but it is easy to sense bad taste code.
#
- Is there an analogue for every sense? What other code senses can you think of?

Ans. Smell - sensing bad patterns

Taste - the style and design

Sight - the structure of code

Touch - the modifications

Hear - the logging and error handling
#
- How many senses do humans have?

Ans. Five( Smell, Taste, Touch, Hear, Sight)
#
- When would you want to see something before you touch it?

Ans. This means we understand(see) the code before we modify(touch) the code, it happens when we are dealing with large codebase or while reviewing unfamiliar PRs, that we understand the whole repo before we actually make changes to it.

#
- When would you want to touch something before you see it?

Ans. This means we modify(touch) the code before we understand(see) the code, it happens when we debug to test code behavior even if implementation isn’t clear yet.

#