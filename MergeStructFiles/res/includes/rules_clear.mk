PHONY += clean mrproper remove

clean:
	$(RM) $(RMFLAGS) $(OBJDIR)/*
	$(RM) $(RMFLAGS) autoscan.log
	$(RM) $(RMFLAGS) config.in
	$(RM) $(RMFLAGS) configure
	$(RM) $(RMFLAGS) configure.ac
	$(RM) $(RMFLAGS) autom4te.cache

mrproper: clean
	$(RM) $(RMFLAGS) ./$(BINDIR)/*

remove:
	$(RM) $(RMFLAGS) $(BINDIR)
	$(RM) $(RMFLAGS) $(DOCDIR)
	$(RM) $(RMFLAGS) $(INCDIR)
	$(RM) $(RMFLAGS) $(LIBDIR)
	$(RM) $(RMFLAGS) $(OBJDIR)
	$(RM) $(RMFLAGS) $(SQLDIR)
	$(RM) $(RMFLAGS) $(SRCDIR)
	$(RM) $(RMFLAGS) $(RESDIR)
	$(RM) $(RMFLAGS) $(DOXYLN)
	$(RM) $(RMFLAGS) $(HTMLLN)
	$(RM) $(RMFLAGS) $(EXE).tar
	$(RM) $(RMFLAGS) autoscan.log
	$(RM) $(RMFLAGS) config.in
	$(RM) $(RMFLAGS) configure
	$(RM) $(RMFLAGS) configure.ac
	$(RM) $(RMFLAGS) autom4te.cache
