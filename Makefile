CC			= g++
CFLAGS		= -Wall -O3 -c -g
ifdef ver
	ifeq "$(ver)" "debug"
		CFLAGS += -DDEBUG_ON
	endif
endif
SOURCES		= netrace.cc queue.cc main.cc
OBJECTS		= $(SOURCES:.cc=.o)
EXECUTABLE	= main

all: $(SOURCES) $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS)
	$(CC) $(LDFLAGS) $(INCLUDES) $(LIBRARIES) $(OBJECTS) -o $(EXECUTABLE) $(LIBS)

.o: $(SOURCES)
	$(CC) $(CFLAGS) $(INCLUDES) $(LIBRARIES) $< -o $@ $(LIBS)

.c:
	$(CC) $(CFLAGS) $(INCLUDES) $(LIBRARIES) $< -o $@ $(LIBS)

clean:
	rm -f $(EXECUTABLE) *.o
