
######
######   What are we building?
######

TARGET = alertIfTooClose


# Objects that must be built in order to link

OBJECTS = main.o
OBJECTS += CDNeuralNet.o

######
######   Binaries and flags
######

CPPFLAGS = -std=c++11

CPPFLAGS += -DWITH_OPENCV 
CPPFLAGS += -DOPENCV 
#-DWITH_OPENCV4
CPPFLAGS += -I/usr/local/include/opencv4/opencv2 #OpenCV4 path
CPPFLAGS += -O3
CPPFLAGS += -g

LD = g++

#LDFLAGS = -L/usr/local/lib/
LDFLAGS = -Wall -O3 -std=c++11     -rdynamic
LDFLAGS += -pthread
LDFLAGS += -Wl,-rpath,~/MYNT-EYE-D-SDK/3rdparty/eSPDI/linux/x64 #MYNT-EYE-D SDK path
LDFLAGS += -g
LDLIBS += -lmynteye_depth
LDLIBS += $(shell pkg-config --libs opencv4)
#LDLIBS += -leSPDI


# Default target:
.PHONY: all
all: $(TARGET)


$(TARGET): $(OBJECTS)
	$(LD) $(LDFLAGS) $(OBJECTS) -o $@ $(LDLIBS)


.PHONY: clean
clean:
	rm -f $(OBJECTS)
	rm -f $(TARGET)


