ifeq ($(TARGET),rpi1)
	CXX = arm-linux-gnueabihf-g++
	CC = arm-linux-gnueabihf-gcc
	CXXFLAGS += -mcpu=arm1176jzf-s -mfloat-abi=hard -mfpu=vfp -mtune=arm1176jzf-s
	EXTENSION = -rpi1
	NETTARGET = `cat config | grep -i "$(TARGET)" | cut --delimiter='|' -f 2`
else ifeq ($(TARGET),rpi2)
	CXX = arm-linux-gnueabihf-g++
	CC = arm-linux-gnueabihf-gcc
	CXXFLAGS += -mcpu=cortex-a7 -mfloat-abi=hard -mfpu=neon-vfpv4 -mtune=cortex-a7
	EXTENSION = -rpi2
	NETTARGET = `cat config | grep -i "$(TARGET)" | cut --delimiter='|' -f 2`
else ifeq ($(TARGET),rpi3)
	CXX = arm-linux-gnueabihf-g++
	CC = arm-linux-gnueabihf-gcc
	CXXFLAGS += -mcpu=cortex-a53 -mfloat-abi=hard -mfpu=neon-fp-armv8 -mneon-for-64bits -mtune=cortex-a53
	EXTENSION = -rpi3
	NETTARGET = `cat config | grep -i "$(TARGET)" | cut --delimiter='|' -f 2`
else ifeq ($(TARGET),beaglebb)
	CXX = arm-linux-gnueabihf-g++
	CC = arm-linux-gnueabihf-gcc
	CXXFLAGS += -mcpu=cortex-a8 -mfloat-abi=hard -mfpu=neon -mtune=cortex-a8
	EXTENSION = -beaglebb
	LDFLAGS = $(CXXLIBS)
	NETTARGET = `cat config | grep -i "$(TARGET)" | cut --delimiter='|' -f 2`
endif

ifeq ($(DETECTED_OS), Windows)
	EXTENSION += .exe
endif

EXE = $(EXE_TMP)$(EXTENSION)
