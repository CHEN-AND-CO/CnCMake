PHONY += send

send: remake
ifeq ($(TARGET), beaglebb)
	scp $(BINDIR)/$(EXE) $(NETTARGET)
endif
