ifeq ($(OS),Windows_NT)
	DETECTED_OS = Windows
else
	DETECTED_OS = $(shell uname)
endif
