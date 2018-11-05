CXX=g++
CXXFLAGS= -Wall -g -O2
CXX_OPTS= -Wall -g -O2

PROG=mstest

%.o: %.c                                                                         
	$(CXX) $(CXXFLAGS) $(CXX_OPTS) $< -o $@ 


all: $(PROG).o 
	$(CXX) $(LDFLAGS) $(CXXFLAGS) -o $(PROG) \
		main.c \
		MotionSensor/libMotionSensor.a \
		libs/libI2Cdev.a

$(PROG).o: MotionSensor/libMotionSensor.a libs/libI2Cdev.a

MotionSensor/libMotionSensor.a:
	$(MAKE) -C MotionSensor/ CXX=$(CXX) CXXFLAGS=$(CXXFLAGS)

libs/libI2Cdev.a:
	$(MAKE) -C libs/I2Cdev CXX=$(CXX) CXXFLAGS=$(CXXFLAGS)

clean:
	cd MotionSensor && $(MAKE) clean
	cd libs/I2Cdev && $(MAKE) clean
	rm -rf *.o *~ *.mod
	rm -rf $(PROG)
