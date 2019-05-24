UNKNOWNLIBS = -Wl,--no-as-needed

OPENGLLIBS =# -lGL -lGLU
SFMLLIBS = -L/usr/local/lib -lsfml-graphics-s -lsfml-window-s -lsfml-system-s -lsfml-network-s -lsfml-audio-s $(OPENGLLIBS)

BDDLIBS = -lmysqlcppconn-static
PTHREADLIBS = -pthread -lpthread

CXXLIBS = -lm $(PTHREADLIBS) -static

LDFLAGS = $(LIB) $(SFMLLIBS) $(BDDLIBS) -lOpenCL $(CXXLIBS)
