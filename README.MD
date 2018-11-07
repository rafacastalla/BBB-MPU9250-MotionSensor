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

Edit all Makefiles in all directories and adjust CXX. Issue make



**Running:**

Check the I2C-2 overlay at /boot/uEnv.txt is loaded.
(BB-I2C2-FAST-00A0.dtbo) Fast refer to 400 kHz I2C.

run mstest
  
In this example, read a mpu9250 with a Beagle Bone Black with dmp at 200Hz
  
*Output Example 1:*




**Additional info:**

Current setup is to run at 200Hz, this can be adjusted in the ms_open function, 

however note that your code will need to read the values with respective speed or quicker. 

Otherwise the MPU fifo buffer will overflown.

To read MPU see ms_update - it calls 'dmp read fifo' in a while loop. 

This means that if fifo is empty this will stall until a packet is available.

-------------------------
Created by Gregory Dymarek for Raspberry Pi

Ported by Rafael Carbonell for BeagleBone Black
