# Makefile for main
# Y. Liow
#------------------------------------------------------------------------------
# Macros
#------------------------------------------------------------------------------
CXX       = g++
CXXFLAGS  = -g -Wall -fmax-errors=3
LINK      = g++
LINKFLAGS = 
OBJS      = main.o
EXE       = main.exe

#------------------------------------------------------------------------------
# Executable
#------------------------------------------------------------------------------
$(EXE):	$(OBJS)
	$(LINK) $(OBJS) -o $(EXE) $(LINKFLAGS)
	./main.exe > stdout.txt

asan: $(OBJS)
	$(LINK) $(OBJS) -o $(EXE) $(LINKFLAGS) -g -fsanitize=address
#------------------------------------------------------------------------------
# Object files
#------------------------------------------------------------------------------
main.o:	main.cpp seven_seg.h
	$(CXX) $(CXXFLAGS) main.cpp -c -o main.o

#------------------------------------------------------------------------------
# Utilities
#------------------------------------------------------------------------------
clean:
	rm -rf $(OBJS) $(EXE)
c:
	rm -rf $(OBJS) $(EXE)

run:
	ASAN_OPTIONS=detect_leaks=1 ./$(EXE)
r:
	ASAN_OPTIONS=detect_leaks=1 ./$(EXE)
