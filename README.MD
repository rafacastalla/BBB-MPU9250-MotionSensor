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

run mstest
  
In this example, read a mpu9250 with a Beagle Bone Black with dmp at 200Hz
  
*Output Example 1:*

Initializing MPU...

Initializing compass...

Initializing is done...

Setting MPU sensors...

Setting GYRO sensitivity...

Setting ACCEL sensitivity...

Powering up MPU...

MPU6050 connection successful

Setting MPU fifo...

Loading DMP firmware...

Activating DMP...

Configuring DMP...

Setting DMP fifo rate...

Resetting fifo queue...

Checking... FIFO count: 28

FIFO count: 56

FIFO count: 84

FIFO count: 84

FIFO count: 112

FIFO count: 140

FIFO count: 168

Done.

FIFO count: 168

yaw = -0.1	pitch = -0.4	roll = 0.5	temperature = 38.1	compass = 0.0, 0.0, 0.0

FIFO count: 196

yaw = -0.1	pitch = -0.4	roll = 0.5	temperature = 38.1	compass = 0.0, 0.0, 0.0

FIFO count: 224

yaw = -0.1	pitch = -0.4	roll = 0.4	temperature = 38.1	compass = 0.0, 0.0, 0.0

FIFO count: 252

yaw = -0.1	pitch = -0.5	roll = 0.4	temperature = 38.1	compass = 0.0, 0.0, 0.0

FIFO count: 282

FIFO count: 28

yaw = -0.2	pitch = -1.0	roll = -0.2	temperature = 38.1	compass = 0.0, 0.0, 0.0

FIFO count: 28

yaw = -0.2	pitch = -0.9	roll = -0.3	temperature = 38.1	compass = 0.0, 0.0, 0.0

FIFO count: 56

yaw = -0.2	pitch = -0.9	roll = -0.4	temperature = 38.1	compass = 0.0, 0.0, 0.0

FIFO count: 84

yaw = -0.3	pitch = -0.9	roll = -0.5	temperature = 38.1	compass = 0.0, 0.0, 0.0

FIFO count: 112

yaw = -0.3	pitch = -0.9	roll = -0.6	temperature = 38.1	compass = 0.0, 0.0, 0.0

FIFO count: 140

yaw = -0.3	pitch = -0.9	roll = -0.6	temperature = 38.1	compass = 0.0, 0.0, 0.0

FIFO count: 168



**Additional info:**

Current setup is to run at 200Hz, this can be adjusted in the ms_open function, 

however note that your code will need to read the values with respective speed or quicker. 

Otherwise the MPU fifo buffer will overflown.

To read MPU see ms_update - it calls 'dmp read fifo' in a while loop. 

This means that if fifo is empty this will stall until a packet is available.

-------------------------
Created by Gregory Dymarek for Raspberry Pi

Ported by Rafael Carbonell for BeagleBone Black
