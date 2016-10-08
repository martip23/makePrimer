#file name may be changed without affecting whole file
#THESE ARE VARIABLES, they are called by putting a 
#dollar sign before, and surrounding them in parentheses
#e.g. g++ $(TARGET) calls g++ on target.
TARGET	= hello
RM 		= rm -f

# The terms to the right on the same line
# as a command declaration are dependencies
# in this case, it is "hello"
# think of these names like functions
# all: calls hello: which is declared below
all:	hello 

# Hello has three dependencies. If one of the 
# objects changes, the whole program recompiles
# if there are no changes in any of the objects
# make does not recompile. This is good because
# you don't have to run make clean, you can just
# run make
hello: main.o factorial.o hello.o
	g++ main.cpp hello.cpp factorial.cpp -o $(TARGET)
	
main.o: main.cpp
	g++ -c main.cpp

factorial.o: factorial.cpp
	g++ -c factorial.cpp

hello.o: hello.cpp
	g++ -c hello.cpp

# this one doesn't really create any files,
# but it can be used like a command
# this makes it so you can type make run
# and it will run ./(name of executable)
# notice the variable $(TARGET)
run:
	./$(TARGET)

# This is another make command, make clean
# it deletes any files ending in o. This 
# would delete a file called file.to or 
# file .io too. Wildcards are always 
# done in commands... More on this in the
# next upload.
clean:
	rm *o hello
