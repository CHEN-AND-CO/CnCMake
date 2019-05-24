PHONY += run install remake lib

run:
	@./$(BINDIR)/$(EXE) res/makefile.mk res/makefile

install: clean
	make all

remake: mrproper install

lib: clean $(OBJ)
ifeq ($(DEBUG),yes)
	make lib DEBUG=no
else
	make doc
	$(AR) $(ARFLAGS) $(LIBDIR)/$(EXE).a $(OBJ)
endif
