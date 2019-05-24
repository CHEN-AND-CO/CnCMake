PHONY += libcpp libc libsfml

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
