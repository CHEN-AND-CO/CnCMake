PHONY += gdb valgrind check

gdb: clean
	make all OTHERFLAGS=-g
	gdb $(BINDIR)/$(EXE)

valgrind: all
	valgrind $(BINDIR)/$(EXE)

check:
	make gdb
	make valgrind
	read a
	make remake
	make run
