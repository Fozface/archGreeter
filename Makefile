OBJ = main.o term.o ipc.o
CFLAGS = -Wall -Wextra -Werror -g




all : greet
greet : $(OBJ)
	cc $(CFLAGS) -o greet $(OBJ)

.PHONY : clean format remake debug all
clean :
	rm -f greet $(OBJ)
format :
	clang-format -i *.c *.h
debug :
	$(MAKE) clean
	$(MAKE) greet CFLAGS="$(CFLAGS) -O0"
	gdb --args ./greet 
remake :
	$(MAKE) clean
	$(MAKE) greet
