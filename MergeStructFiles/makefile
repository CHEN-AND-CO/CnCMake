DEBUG = no

#
#	Softwares
#
CXX = g++
CC = gcc
AR = ar
RM = rm
INFO = doxygen
ARCHIVE = tar

#
#	OS
#
ifeq ($(OS),Windows_NT)
	DETECTED_OS = Windows
else
	DETECTED_OS = $(shell uname)
endif

#
#	Folders
#
BINDIR = bin
SRCDIR = src
INCDIR = inc
OBJDIR = obj
LIBDIR = lib
DOCDIR = doc
SQLDIR = sql
RESDIR = res
TEMPDIR = $(HOME)/Bureau/Mes_Documents/Programmation/Makefiles/Templates
MAINDOCDIR = $(HOME)/Bureau/Mes_Documents/Docs

#
#	Needed files
#
BIN := $(wildcard $(BINDIR)/*)
SRC := $(wildcard $(SRCDIR)/*.cpp) $(wildcard $(SRCDIR)/*.c)
NAME := $(basename $(notdir $(SRC)))
CINC := $(wildcard $(INCDIR)/*.h)
CXXINC := $(wildcard $(INCDIR)/*.hpp)
OBJ := $(addprefix $(OBJDIR)/, $(addsuffix .o, $(NAME)))
LIB := $(wildcard $(LIBDIR)/*.a)
LIBS := $(addprefix -l, $(subst lib, , $(subst .a, , $(LIB))))
DOC := $(wildcard doc/*.doxyfile)

#
#	Output software name
#
EXE_TMP = $(shell basename $(CURDIR))

#
#	Flags
#
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

#
#	Link flags
#
UNKNOWNLIBS = -Wl,--no-as-needed

OPENGLLIBS = -lGLU -lGL
SFMLLIBS = -L/usr/local/lib -lsfml-graphics-s -lsfml-window-s -lsfml-system-s -lsfml-network-s -lsfml-audio-s $(OPENGLLIBS)

BDDLIBS = -lmysqlcppconn-static
PTHREADLIBS = -pthread -lpthread

CXXLIBS = -lm $(PTHREADLIBS) #-static

LDFLAGS = $(LIB) $(SFMLLIBS) $(BDDLIBS) $(CXXLIBS) -lOpenCL

#
#	Targets
#
ifeq ($(TARGET),rpi1)
	CXX = arm-linux-gnueabihf-g++
	CC = arm-linux-gnueabihf-gcc
	CXXFLAGS += -mcpu=arm1176jzf-s -mfloat-abi=hard -mfpu=vfp -mtune=arm1176jzf-s
	EXTENSION = -rpi1
	NETTARGET = `cat config | grep -i "$(TARGET)" | cut --delimiter='|' -f 2`
else ifeq ($(TARGET),rpi2)
	CXX = arm-linux-gnueabihf-g++
	CC = arm-linux-gnueabihf-gcc
	CXXFLAGS += -mcpu=cortex-a7 -mfloat-abi=hard -mfpu=neon-vfpv4 -mtune=cortex-a7
	EXTENSION = -rpi2
	NETTARGET = `cat config | grep -i "$(TARGET)" | cut --delimiter='|' -f 2`
else ifeq ($(TARGET),rpi3)
	CXX = arm-linux-gnueabihf-g++
	CC = arm-linux-gnueabihf-gcc
	CXXFLAGS += -mcpu=cortex-a53 -mfloat-abi=hard -mfpu=neon-fp-armv8 -mneon-for-64bits -mtune=cortex-a53
	EXTENSION = -rpi3
	NETTARGET = `cat config | grep -i "$(TARGET)" | cut --delimiter='|' -f 2`
else ifeq ($(TARGET),beaglebb)
	CXX = arm-linux-gnueabihf-g++
	CC = arm-linux-gnueabihf-gcc
	CXXFLAGS += -mcpu=cortex-a8 -mfloat-abi=hard -mfpu=neon -mtune=cortex-a8
	EXTENSION = -beaglebb
	LDFLAGS = $(CXXLIBS)
	NETTARGET = `cat config | grep -i "$(TARGET)" | cut --delimiter='|' -f 2`
endif

ifeq ($(DETECTED_OS), Windows)
	EXTENSION += .exe
endif

EXE = $(EXE_TMP)$(EXTENSION)

#
#	SymLinks
#
DOXYLN = $(MAINDOCDIR)/$(EXE).doxyfile
HTMLLN = $(MAINDOCDIR)/Web/$(EXE)-doc

#
#	Files
#
MAINFILE = main.cpp

FUNCTFILEC = functions.cpp
FUNCTFILEH = functions.hpp

OPENGLH = OpenGL.hpp
OPENGLC = OpenGL.cpp

CLASSFILEC = Class.cpp
CLASSFILEH = Class.hpp

DOXYFILE = Doxyfile

MAINWINDOWH = MainWindow.h
MAINWINDOWC = MainWindow.cpp

CMAINFILE = main.c

CFUNCTFILEC = functions.c
CFUNCTFILEH = functions.h

CONFIG = config

ERRFILE = $(RESDIR)/comperr

#
#	Others
#
SFMLIN = ~/Bureau/Algo/SFMLWidgetsTests/SFML/inc/SFML
SFMLOUT = $(INCDIR)/SFML
LIBSFMLIN = ~/Bureau/Algo/SFMLWidgetsTests/SFML/lib/SFML.a
LIBSFMLOUT = $(LIBDIR)/SFML.a
SFMLRESIN = ~/Bureau/Algo/SFMLWidgetsTests/SFML/res/*
SFMLRESOUT = $(RESDIR)/

CPPIN = ~/Bureau/Algo/C++Tests/C++/inc/C++
CPPOUT = $(INCDIR)/C++
LIBCPPIN = ~/Bureau/Algo/C++Tests/C++/lib/C++.a
LIBCPPOUT = $(LIBDIR)/C++.a

CIN = ~/Bureau/Algo/CTests/C/inc/C
COUT = $(INCDIR)/C
LIBCIN = ~/Bureau/Algo/CTests/C/lib/C.a
LIBCOUT = $(LIBDIR)/C.a

QTIN = ~/Bureau/Algo/QTTests/Widgets
QTOUT = ./Widgets

PROJECTFILE = $(wildcard *.pro)
QTLIBS = $(LIB) $(BDDLIBS) $(CXXLIBS)

#
#	Rules
#
all:
ifeq ($(DEBUG),yes)
	@echo "Génération en mode Debug"
else
	@echo "Génération en mode Release"
endif
	if [ -f $(BINDIR)/$(EXE) ]; then $(RM) $(RMFLAGS) $(BINDIR)/$(EXE); else echo ""; fi
	@echo "" > $(ERRFILE)
	make $(BINDIR)/$(EXE)

$(BINDIR)/$(EXE): $(OBJ)
	$(CXX) $(OBJ) $(LDFLAGS) -o $(BINDIR)/$(EXE)
	# 2>> $(ERRFILE)

$(OBJDIR)/%.o: $(SRCDIR)/%.c $(CINC)
	$(CC) -c $< -o $@ $(CFLAGS) $(OTHERFLAGS)
	# 2>> $(ERRFILE)

$(OBJDIR)/%.o: $(SRCDIR)/%.cpp $(CXXINC)
	$(CXX) -c $< -o $@ $(CXXFLAGS) $(OTHERFLAGS)
	# 2>> $(ERRFILE)

#
#	Implicit rules
#
.PHONY: gdb valgrind check qt clean qtClean mrproper install qtInstall dist info run qtRun remake qtRemake lib edit create createSFML createSFMLOPENGL createQt createDirs createC addClassCpp addPathfindingCpp addExceptionCpp addClassSfml addWindowSfml addWindowOpenGL remove qtRemove libcpp libsfml libqt libc move doxyfile configure doc send

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

dist: remake clean
	make configure
	$(ARCHIVE) $(ARCHFLAGS) $(EXE).tar $(BINDIR)/$(EXE) $(RESDIR)/ sql/ doc/

configure:
	autoscan
	mv configure.scan configure.ac
	aclocal
	autoheader
	mv config.h.in config.in
	autoconf

run:
	@./$(BINDIR)/$(EXE)

qtRun:
	@./$(EXE)

clean:
	$(RM) $(RMFLAGS) $(OBJDIR)/*

qtClean: clean
	make -f Makefile clean

mrproper: clean
	$(RM) $(RMFLAGS) ./$(BINDIR)/*

install: clean
	make all

info: doc
	$(INFO) $(INFOFLAGS) $(DOC)

remake: mrproper install

qtRemake: remake
	rm -rf *.pro
	rm -rf Makefile
	rm -rf moc_*
	rm -rf *.o
	rm -rf $(EXE)

lib: clean $(OBJ)
ifeq ($(DEBUG),yes)
	make lib DEBUG=no
else
	make doc
	$(AR) $(ARFLAGS) $(LIBDIR)/$(EXE).a $(OBJ)
endif

qt:
	qmake -project
	echo "\nQT += gui core widgets" >> $(PROJECTFILE)
	qmake
	echo "\nCXXFLAGS +=  -std=c++14 -Iinc" >> Makefile
	$(MAKE) -f Makefile all SUBLIBS="$(QTLIBS)"

qtInstall: qtClean qt qtClean

doxyfile:
	"$(TEMPDIR)/addDoxyfile" "$(TEMPDIR)"
	ln -sf $(CURDIR)/$(DOCDIR)/$(DOXYFILE) $(DOXYLN)
	mkdir -p $(DOCDIR)/html
	ln -sfn $(CURDIR)/$(DOCDIR)/html $(HTMLLN)

createDirs:
	mkdir -p $(BINDIR)
	mkdir -p $(DOCDIR)
	mkdir -p $(INCDIR)
	mkdir -p $(LIBDIR)
	mkdir -p $(OBJDIR)
	mkdir -p $(SQLDIR)
	mkdir -p $(SRCDIR)
	mkdir -p $(RESDIR)
	mkdir -p $(RESDIR)/imgs
	make doxyfile

remove:
	rm -rf $(BINDIR)
	rm -rf $(DOCDIR)
	rm -rf $(INCDIR)
	rm -rf $(LIBDIR)
	rm -rf $(OBJDIR)
	rm -rf $(SQLDIR)
	rm -rf $(SRCDIR)
	rm -rf $(RESDIR)
	rm -rf $(DOXYLN)
	rm -rf $(HTMLLN)
	rm -rf $(EXE).tar
	rm -rf autoscan.log
	rm -rf config.in
	rm -rf configure
	rm -rf configure.ac
	rm -rf autom4te.cache

qtRemove: remove
	rm -rf Widgets
	rm -rf *.pro
	rm -rf Makefile
	rm -rf moc_*
	rm -rf *.o
	rm -rf $(EXE)

move: createDirs
	find ./* -maxdepth 0 -perm -u+x -type f -print0 | xargs -0 -r -I FILE mv FILE $(BINDIR)/
	find ./*.o -maxdepth 0 -print0 | xargs -0 -r -I FILE mv FILE $(OBJDIR)/
	find ./*.hpp -maxdepth 0 -print0 | xargs -0 -r -I FILE mv FILE $(INCDIR)/
	find ./*.cpp -maxdepth 0 -print0 | xargs -0 -r -I FILE mv FILE $(SRCDIR)/
	find ./*.a -maxdepth 0 -print0 | xargs -0 -r -I FILE mv FILE $(LIBDIR)/
	find ./*.so -maxdepth 0 -print0 | xargs -0 -r -I FILE mv FILE $(LIBDIR)/
	find ./*.sql -maxdepth 0 -print0 | xargs -0 -r -I FILE mv FILE $(SQLDIR)/
	find ./* -maxdepth 0 -not -name makefile -type f -print0 | xargs -0 -r -I FILE mv FILE $(RESDIR)/

create: createDirs
	cp "$(TEMPDIR)/CPP$(MAINFILE)" "$(SRCDIR)/$(MAINFILE)"
	cp "$(TEMPDIR)/CPP$(FUNCTFILEC)" "$(SRCDIR)/$(FUNCTFILEC)"
	cp "$(TEMPDIR)/CPP$(FUNCTFILEH)" "$(INCDIR)/$(FUNCTFILEH)"
	cp "$(TEMPDIR)/CPP$(CONFIG)" "$(CONFIG)"
	make libcpp

createC: createDirs
	cp "$(TEMPDIR)/C$(CMAINFILE)" "$(SRCDIR)/$(CMAINFILE)"
	cp "$(TEMPDIR)/C$(CFUNCTFILEC)" "$(SRCDIR)/$(CFUNCTFILEC)"
	cp "$(TEMPDIR)/C$(CFUNCTFILEH)" "$(INCDIR)/$(CFUNCTFILEH)"
	make libc

createSFML: createDirs
	cp "$(TEMPDIR)/SFML$(MAINFILE)" "$(SRCDIR)/$(MAINFILE)"
	cp "$(TEMPDIR)/SFML$(FUNCTFILEC)" "$(SRCDIR)/$(FUNCTFILEC)"
	cp "$(TEMPDIR)/SFML$(FUNCTFILEH)" "$(INCDIR)/$(FUNCTFILEH)"
	make libsfml
	make addWindowSfml NAME_NEW_FILE="MainWindow"

createSFMLOPENGL: createDirs
	cp "$(TEMPDIR)/OPENGL$(MAINFILE)" "$(SRCDIR)/$(MAINFILE)"
	cp "$(TEMPDIR)/OPENGL$(FUNCTFILEC)" "$(SRCDIR)/$(FUNCTFILEC)"
	cp "$(TEMPDIR)/OPENGL$(FUNCTFILEH)" "$(INCDIR)/$(FUNCTFILEH)"
	make libsfml
	make addWindowOpenGL NAME_NEW_FILE="MainWindow"

createQt: createDirs
	cp "$(TEMPDIR)/QT$(MAINFILE)" "$(SRCDIR)/$(MAINFILE)"
	cp "$(TEMPDIR)/QT$(MAINWINDOWC)" "$(SRCDIR)/$(MAINWINDOWC)"
	cp "$(TEMPDIR)/QT$(MAINWINDOWH)" "$(INCDIR)/$(MAINWINDOWH)"
	make libqt

addClassCpp:
	"$(TEMPDIR)/addCPPClass" "$(TEMPDIR)"

addPathfindingCpp:
	"$(TEMPDIR)/addCPPPathfinding" "$(TEMPDIR)"

addExceptionCpp:
	"$(TEMPDIR)/addCPPException" "$(TEMPDIR)"

addClassSfml:
	"$(TEMPDIR)/addSFMLClass" "$(TEMPDIR)"

addWindowSfml:
	"$(TEMPDIR)/addSFMLWindow" "$(TEMPDIR)" "$(NAME_NEW_FILE)"

addWindowOpenGL:
	"$(TEMPDIR)/addOPENGLWindow" "$(TEMPDIR)" "$(NAME_NEW_FILE)"

addClassC:
	"$(TEMPDIR)/addCClass" "$(TEMPDIR)"

edit:
	if [ -f "$(SRCDIR)/$(MAINFILE)" ]; then gedit "$(SRCDIR)/$(MAINFILE)" &; fi
	if [ -f "$(INCDIR)/$(FUNCTFILEH)" ]; then gedit "$(INCDIR)/$(FUNCTFILEH)" &; fi
	if [ -f "$(SRCDIR)/$(FUNCTFILEC)" ]; then gedit "$(SRCDIR)/$(FUNCTFILEC)" &; fi

libcpp:
	ln -sfn $(CPPIN) $(CPPOUT)
	ln -sf $(LIBCPPIN) $(LIBCPPOUT)

libc:
	ln -sfn $(CIN) $(COUT)
	ln -sf $(LIBCIN) $(LIBCOUT)

libsfml: libcpp
	ln -sfn $(SFMLIN) $(SFMLOUT)
	ln -sf $(LIBSFMLIN) $(LIBSFMLOUT)
	cp -r $(SFMLRESIN) $(SFMLRESOUT)

libqt: libcpp
	rm -rf $(BINDIR)
	rm -rf $(OBJDIR)
	ln -sfn $(QTIN) $(QTOUT)

doc:
	doxygen $(DOCDIR)/$(DOXYFILE)

send: remake
ifeq ($(TARGET), beaglebb)
	scp $(BINDIR)/$(EXE) $(NETTARGET)
endif

