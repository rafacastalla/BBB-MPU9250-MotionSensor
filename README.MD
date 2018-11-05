PORTING IN PROGRESS

MotionSensorExample
===================

MPU6050/MPU6500/MPU9150/MPU9250 over I2c for BeagleBone Black using official Invensense libraries (v5.1)

This is a sample program for testing your MPU Motion Sensor with BeagleBone Black.
It does all the initialization and gathers:
- gyro
- accel
- quaternion
- compass (for MPU9XXX)
- temperature

and calculates Yaw, Pitch, Roll in degrees which in turn is displayed as an output.



**Wiring**

I2C uses only2 wires for data transmission: SCL and SDA

BBB pin P9_19 (I2C2_SCL) -> MPU SCL

BBB pin P9_20 (I2C2_SDA) -> MPU SDA


You will also need to provide power to your MPU. You can use external power or hook it up with BBB.
For example:

BBB pin P9_1 (GND)  -> MPU GND 

BBB pin P9_3 (3.3V) -> MPU VCC 
or
BBB pin P9_7 (5V)   -> MPU VCC 

(The power depends on your sensor VCC voltage and check SDA and SCL volatge output)



**Compilation:**

On BBB, edit MotionSensor/Makefile and adjust CXX_OPTS to specify your board 

(-DMPU6050 for MPU6050, -DMPU6500 for MPU6500, -DMPU9150 for MPU9150, -DMPU9250 for MPU9250), issue make



**Cross compiling:**

~~Edit all Makefiles in all directories and adjust CXX. Issue make~~

Edit only the main Makefile and adjust CXX. Issue make



**Running:**

  HOW TO LOAD I2C !!! CHANGE !!! FOR OVERLAY AT UENV.TXT
  run mstest
  
*Output Example 1:*

Initializing I2C devices...

Testing device connections...

MPU6050 connection successful

Initializing DMP...

Enabling DMP...

DMP ready!

Initializing IMU...

Checking... Done.

IMU init done; offset values are :

yaw = -0.169205, pitch = -1.301078, roll = -1.168776

yaw = -0.174            pitch = 1.325           roll = -1.219   t = 20.24       1       0       0

yaw = -0.179            pitch = 1.350           roll = -1.267   t = 20.22       2       0       0

yaw = -0.185            pitch = 1.372           roll = -1.314   t = 20.23       3       0       0

yaw = -0.190            pitch = 1.395           roll = -1.361   t = 20.21       4       0       0

yaw = -0.195            pitch = 1.418           roll = -1.410   t = 20.23       5       0       0

yaw = -0.201            pitch = 1.441           roll = -1.454   t = 20.23       6       0       0

yaw = -0.206            pitch = 1.465           roll = -1.498   t = 20.23       7       0       0

yaw = -0.211            pitch = 1.485           roll = -1.545   t = 20.23       8       0       0

yaw = -0.216            pitch = 1.506           roll = -1.587   t = 20.23       9       0       0

....


**Additional info:**

Current setup is to run at 40Hz, this can be adjusted in the ms_open function, 

however note that your code will need to read the values with respective speed or quicker. 

Otherwise the MPU fifo buffer will overflown.

To read MPU see ms_update - it calls 'dmp read fifo' in a while loop. 

This means that if fifo is empty this will stall until a packet is available.

-------------------------
Created by Gregory Dymarek for Raspberry Pi

Ported by Rafael Carbonell for BeagleBone Black
