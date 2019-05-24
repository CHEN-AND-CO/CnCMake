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
