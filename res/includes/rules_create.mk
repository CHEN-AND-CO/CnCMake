PHONY += createDirs create createC createSFML createSFMLOPENGL

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
