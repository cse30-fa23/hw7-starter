# if you type 'make' without arguments, this is the default
PROG = cipher
all: $(PROG)

# associated object files 
HEAD    = main.h cipher.h rdbuf.h setup.h
OBJ     = Cmain.o Cencrypt.o Crdbuf.o setup.o main.o encrypt.o rdbuf.o

# special libraries
LIB	= libhw7.a
LIBFLAGS =-L ./ $(LIB)

# select the compiler and flags you can over-ride on command line e.g. make DEBUG= 
CC      = gcc
DEBUG	= -ggdb
CSTD	=
WARN	= -Wall -Wextra -Werror
CDEFS	=
CFLAGS	= -I. $(DEBUG) $(WARN) $(CSTD) $(CDEFS) -include SELVERS.h
AR      = ar
ARFLAGS = -rvs 

# some flags to use with assembler tools
ASLIST  = -Wa,-adhln
ASFLAGS =

# how to get an object dump of the target
DUMP   = objdump
DFLAGS = -d

$(OBJ):             $(HEAD) SELVERS.h

# specify how to assemble a .S file
%.o : %.S
	$(CC) $(CFLAGS) $(ASFLAGS)  -c -o $@ $<

# specify how to compile the target
$(PROG):    $(OBJ) $(LIB)
	$(CC) $(CFLAGS) $(OBJ) $(LIBFLAGS) -o $@

.PHONY: clean alltest test1 test2 test3 test4

# get an object dump
dump:       $(PROG)
	$(DUMP) $(DFLAGS) $^

# remove binaries
.PHONY: clean
clean:
	rm -f $(OBJ) $(PROG)
