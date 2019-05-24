PHONY += info move edit send

info: doc
	$(INFO) $(INFOFLAGS) $(DOC)

move: createDirs
	find ./* -maxdepth 0 -perm -u+x -type f -print0 | xargs -0 -r -I FILE mv FILE $(BINDIR)/
	find ./*.o -maxdepth 0 -print0 | xargs -0 -r -I FILE mv FILE $(OBJDIR)/
	find ./*.hpp -maxdepth 0 -print0 | xargs -0 -r -I FILE mv FILE $(INCDIR)/
	find ./*.cpp -maxdepth 0 -print0 | xargs -0 -r -I FILE mv FILE $(SRCDIR)/
	find ./*.a -maxdepth 0 -print0 | xargs -0 -r -I FILE mv FILE $(LIBDIR)/
	find ./*.so -maxdepth 0 -print0 | xargs -0 -r -I FILE mv FILE $(LIBDIR)/
	find ./*.sql -maxdepth 0 -print0 | xargs -0 -r -I FILE mv FILE $(SQLDIR)/
	find ./* -maxdepth 0 -not -name makefile -type f -print0 | xargs -0 -r -I FILE mv FILE $(RESDIR)/

edit:
	if [ -f "$(SRCDIR)/$(MAINFILE)" ]; then gedit "$(SRCDIR)/$(MAINFILE)" &; fi
	if [ -f "$(INCDIR)/$(FUNCTFILEH)" ]; then gedit "$(INCDIR)/$(FUNCTFILEH)" &; fi
	if [ -f "$(SRCDIR)/$(FUNCTFILEC)" ]; then gedit "$(SRCDIR)/$(FUNCTFILEC)" &; fi
