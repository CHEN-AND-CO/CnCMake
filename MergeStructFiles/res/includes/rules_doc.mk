PHONY += doxyfile doc

doxyfile:
	"$(TEMPDIR)/addDoxyfile" "$(TEMPDIR)"
	ln -sf $(CURDIR)/$(DOCDIR)/$(DOXYFILE) $(DOXYLN)
	mkdir -p $(DOCDIR)/html
	ln -sfn $(CURDIR)/$(DOCDIR)/html $(HTMLLN)

doc:
	doxygen $(DOCDIR)/$(DOXYFILE)
