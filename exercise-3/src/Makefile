# ---------- toolchain --------------------------------------------------------
CXX       := g++
CXXFLAGS  := -O0 -std=c++17 -fsanitize=address -fno-exceptions -fno-rtti \
             -fomit-frame-pointer -march=native -g

LDFLAGS   := -fsanitize=address

# ---------- sources / derived file lists -------------------------------------
SRCS      := tcp_echo_client.cc tcp_echo_server.cc
OBJS      := tcp_echo_client.o tcp_echo_server.o
ASMS      := $(SRCS:.cc=.s)
TARGETS   := client server

# ---------- top-level target --------------------------------------------------
all: $(TARGETS) $(ASMS)

# ---------- pattern rules ----------------------------------------------------
%.s: %.cc
	$(CXX) $(CXXFLAGS) -S $< -o $@

%.o: %.cc
	$(CXX) $(CXXFLAGS) -c $< -o $@

client: tcp_echo_client.o
	$(CXX) $(LDFLAGS) $< -o $@

server: tcp_echo_server.o
	$(CXX) $(LDFLAGS) $< -o $@


# Mark object files as intermediate
.INTERMEDIATE: $(OBJS)

# ---------- housekeeping -----------------------------------------------------
clean:
	rm -f $(OBJS) $(ASMS) $(TARGETS)

.PHONY: all clean
