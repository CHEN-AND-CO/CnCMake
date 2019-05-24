PHONY += dist configure

dist: remake
	make configure
	$(ARCHIVE) $(ARCHFLAGS) $(EXE).tar $(BINDIR)/$(EXE) $(RESDIR)/ sql/ doc/

configure:
	autoscan
	mv configure.scan configure.ac
	aclocal
	autoheader
	mv config.h.in config.in
	autoconf
