#file name may be changed without affecting whole file
TARGET	= hello
RM 		= rm -f

# create target
all:	hello

hello: main.o factorial.o hello.o
	g++ main.cpp hello.cpp factorial.cpp -o $(TARGET)
	
main.o: main.cpp
	g++ -c main.cpp

factorial.o: factorial.cpp
	g++ -c factorial.cpp

hello.o: hello.cpp
	g++ -c hello.cpp

run:
	./$(TARGET)

clean:
	rm *o hello
