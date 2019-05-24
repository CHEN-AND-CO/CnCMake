CCXXWARNINGS = -W -Wconversion
CCXXWARNINGS += -Wall -Wextra -pedantic

CXXWARNINGS = -Wcast-qual -Wcast-align -Wpointer-arith
CXXWARNINGS += -Woverloaded-virtual -Wctor-dtor-privacy -Wdelete-non-virtual-dtor
CXXWARNINGS += -Wshadow -Weffc++
CXXWARNINGS += -Wwrite-strings -Wredundant-decls -Wdouble-promotion -Winit-self -Wswitch-default -Wundef -Wlogical-op

CCXXFLAGS = -I$(INCDIR) $(CCXXWARNINGS)

ifeq ($(DEBUG), yes)
	CCXXFLAGS += -g -ggdb -Werror -Wfatal-errors -Og
else
	CCXXFLAGS += -O2 -s
endif

CXXFLAGS = $(CCXXFLAGS) -std=c++14  $(CXXWARNINGS) -Wold-style-cast
CFLAGS = $(CCXXFLAGS)
ARFLAGS = crf
RMFLAGS = -rf
ARCHFLAGS = cvf
