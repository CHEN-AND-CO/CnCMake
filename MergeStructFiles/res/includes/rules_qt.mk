PHONY += qtRun qtClean qt qtInstall qtRemove createQt libqt qtRemake

createQt: createDirs
	cp "$(TEMPDIR)/QT$(MAINFILE)" "$(SRCDIR)/$(MAINFILE)"
	cp "$(TEMPDIR)/QT$(MAINWINDOWC)" "$(SRCDIR)/$(MAINWINDOWC)"
	cp "$(TEMPDIR)/QT$(MAINWINDOWH)" "$(INCDIR)/$(MAINWINDOWH)"
	make libqt

libqt: libcpp
	rm -rf $(BINDIR)
	rm -rf $(OBJDIR)
	ln -sfn $(QTIN) $(QTOUT)

qt:
	qmake -project
	echo "\nQT += gui core widgets" >> $(PROJECTFILE)
	qmake
	echo "\nCXXFLAGS +=  -std=c++14 -Iinc" >> Makefile
	$(MAKE) -f Makefile all SUBLIBS="$(QTLIBS)"

qtRemake: remake
	rm -rf *.pro
	rm -rf Makefile
	rm -rf moc_*
	rm -rf *.o
	rm -rf $(EXE)

qtClean: clean
	make -f Makefile clean

qtInstall: qtClean qt qtClean

qtRemove: remove
	rm -rf Widgets
	rm -rf *.pro
	rm -rf Makefile
	rm -rf moc_*
	rm -rf *.o
	rm -rf $(EXE)

qtRun:
	@./$(EXE)
