SOURCES   = source source/polarssl

CFILES   := $(foreach dir, $(SOURCES), $(wildcard $(dir)/*.c))
CPPFILES := $(foreach dir, $(SOURCES), $(wildcard $(dir)/*.cpp))

OBJS      = $(CFILES:.c=.o) $(CPPFILES:.cpp=.o)

LIBS      = -static-libstdc++ -static
CXXFLAGS  = -Isource
CFLAGS    = -std=c11 -Wall -Wextra -Werror -O3 -posix -Isource
OUTPUT    = mkey
CC        = gcc

main: $(OBJS) $(POLAR_OBJS)
	g++ -o $(OUTPUT) $(LIBS) $(OBJS)

clean:
	rm -f $(OUTPUT) $(OUTPUT).exe $(OBJS)
