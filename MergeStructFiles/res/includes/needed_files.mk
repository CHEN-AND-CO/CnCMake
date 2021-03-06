BIN := $(wildcard $(BINDIR)/*)
SRC := $(wildcard $(SRCDIR)/*.cpp) $(wildcard $(SRCDIR)/*.c)
NAME := $(basename $(notdir $(SRC)))
CINC := $(wildcard $(INCDIR)/*.h)
CXXINC := $(wildcard $(INCDIR)/*.hpp)
OBJ := $(addprefix $(OBJDIR)/, $(addsuffix .o, $(NAME)))
LIB := $(wildcard $(LIBDIR)/*.a)
LIBS := $(addprefix -l, $(subst lib, , $(subst .a, , $(LIB))))
DOC := $(wildcard doc/*.doxyfile)
