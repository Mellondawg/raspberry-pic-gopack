# RaspberryPIC GoPack

The GoPack is a universal control/driver pack meant for rapid prototyping of mechatronic systems. 
It houses a **Raspberry Pi Version 3 Model B**, 16 bit dsPIC33F microcontroller, and has various analog and digital inputs and outputs. Programming the GoPack is done in **MATLAB Simulink version 2017b**, and sent wirelessly through the WLAN to the Raspberry Pi.

Last updated: 12/04/2017

## Raspberry Pi Setup: 

### 1) Installing support packages: (for starting from scratch)
The RaspberryPi boots off of an SD card with the MATLAB Support Package and operating system installed.  The MATLAB support packages are downloaded in MATLAB, and written to the Pi with a USB SD reader/writer. All remaining programming is done over wifi. The package can be found in MATLAB under the Add-Ons drop-down. Choose install from internet, choose Raspberry Pi, check all packages available for Pi, and follow the instructions. You will be guided to install your micro SD card in the USB card reader, and install the Rapberry Pi OS “Raspbian” with Matlab support packages for the appropriate Pi model. The latest version of GoPack uses Pi 3 Model B. 

When installing the Raspbian image onto the SD Card, if you follow the MATLAB Hardware Support walkthrough all the way through, then you can set up WiFi and SSH access. The Pi 3 Model B has built-in WiFi capabilities. The SSH access has pi as the user and raspberry as the default password.

This requires booting the Pi up, which is done by inserting the SD card that contains the Raspbian OS, connecting any additional peripherals (none required), and plugging in a micro USB power source.

Make note of the IP address that was assigned to the Pi 3.

### 2) Connecting to Pi with SSH from the main computer: 
Now on the PC, you need to be able to log in via SSH to have access to the Pi command prompt over the WLAN. Here you can download an executable called “Putty” to do so. http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html
Save the executable in an accessible location, you will use it frequently. 
Run Putty. Click connection on the tree, and change “Seconds between keepalives” to 30 in order to keep the connection from timing out. Click Session in the tree, type in the IP address, highlight defaulty and save. You can now click open, and it will save the IP for next time. If you get a security alert, click yes. The default username and password are pi and raspberry (note the password will not show in the command window). 

If you are familiar with Bash, or any other Linux-based command lines, feel free to use those for SSH access instead.

### 3) Installing GPIO Interface Library wiringPi
The driver blocks used for PWM, ADC and Encoder inputs use the library called wiringPi www.wiringpi.com. To install wiringPi, git must first be installed. The standard image that MATLAB uses for Pi 3 already contains git.

To check if your image contains git, simply type "git" and see if you receive a help message, or an error. If you receive an error:
Boot the Pi and establish a SSH connection. Type:

`sudo apt-get install git-core`

If any errors happen, reinstall raspbian through MATLAB for the most updated copy. You can now download wiringPi. 

`git clone https://github.com/UMass-MRRL/wiringPi-GoPack.git`

Note: If you download wiringPi from its original source (git://git.drogon.net/wiringPi), that’s the wrong version. If updating wiringPi, type:
```
cd wiringPi-GoPack
git pull origin
```
Note: You must move the items within the wiringPi-GoPack directory that is created, up one level. Meaning the contents of the wiringPi-GoPack must be moved to the level where the wiringPi-GoPack directory is. This can be done by:

`sudo mv wiringPi-GoPack/** ./pi` (only type one asterisk, not two, MD formatting required me to type two here)

Shutting the Pi down:
When connected with SSH via Putty, type this to shut down safely.  

`sudo halt`

Click OK when Putty gives a fatal error, it thinks the connection has failed. Close Putty. 

## Interfacing the Raspberry Pi with the GoPack add-on board

### 1) Initializing the GoPack board
The GoPack board runs on a dsPIC33F microcontroller. A set of pins is provided for programming and debugging the microcontroller should you wish to modify the firmware. For the initial setup, ensure that the board is receiving power. 

**Note: Do not supply power through the GoPack terminals and the micro-USB connector on the Raspberry Pi at the same time.** The current iteration of the board does not have back-current protections should these 5V levels be slightly different.

With the board powered up, flash the microcontroller with the provided files using a PICkit3 or similar device. You can build, edit, and download this project to the hardware from within MPLAB, or program it directly with the provided .hex files. A bright red status LED should come on if the microcontroller is running successfully.

### 2) Interfacing with the Raspberry Pi
The only physical assembly required is mating the 40 pin male connector on the Raspberry Pi with the GoPack 40-pin female connector. The boards should stack directly on top of each other. The Raspberry Pi will receive power through this connection from the GoPack board. It is recommended to use standoffs between the boards to support the cantilevered end.

## Using GoPack with MATLAB and Simulink

### 1) Configure Simulink to run models on Raspberry Pi hardware
For Simulink to run models on the Raspberry Pi, it must be configured to run on external hardware. Enter the "Configuration Parameters" dialog and locate the "Hardware Implementation" tab. "Raspberry Pi" should be available on the "Hardware board" dropdown menu. Set the IP address for the Host name, supply the username and password for the Raspberry Pi, and set the Build directory to "/home/pi".

In the Solver tab, set the Solver options to discrete and fixed-step. Set the desired control loop sample time in the "Fixed step size (fundamental sample time)" field in seconds. (i.e. input a value of 0.001 for a 1 ms sample time).

In the Simulink model window, type "inf" for the simulation time, and set the mode to "external".

To run a model on the Raspberry Pi to view data and adjust the model in real-time, press the 'play' arrow button. To send a model to the Raspberry Pi to run independently of the host PC, click "Deploy to Hardware" on the far right of the control bar.

The Simulink blocks included in this repository use the WiringPi library to access Raspberry Pi functions not included in the standard blocks included with the Mathworks toolbox - specifically control over SPI communication.


Make sure that setBuildArgs.m is included in the active directory. This file is included in the Simulink Scripting section of this repository.

### 2) Using GoPack s-Functions to handle sensors and actuators
It is recommended that you familiarize yourself with the basics:
http://www.mathworks.com/help/supportpkg/raspberrypi/examples/getting-started-with-raspberry-pi-hardware.html

Three Simulink s-Function blocks are provided to allow the Simulink model to access sensor readings and dictate actuator outputs. 

The "inputs_to_SPI_bytes" block converts float or integer inputs into bytes for serial transfer. This primarily means motor duty cycle or voltage input. It also formats requests for readings from specific sensors.

The "SPI" block simply performs an SPI transfer of the byte vector assembled by the previous block. The output is a byte vector of requested sensor readings, and loopback confirmation of the requested outputs.

The "SPI_bytes_to_outputs" block converts the received byte vector into float or integer values for the requested sensor readings and looped-back outputs. Depending on the amount of samples the sensor is configured to perform per Simulink loop, outputs corresponding with each separate sensor reading can be a vector containing multiple samples. Filtering, chronological arrangement of this data, or averaging are left to the user to perform with standard Simulink blocks as needed.

Note that a single sample delay function is required before the input to the serial transfer subsystem made up of these three blocks. The model will form an algebraic loop and will not run if the delay is not included.

It is recommended to use the provided PID position control model for reference. It uses encoder feedback (500 counts/turn) to drive a DC motor while logging data from 5 simultaneous analog inputs. This controller was successfully tested with a Maxon EC30 motor using an ESCON 50/5 motor driver.

## Additional Information

### 1) MATLAB and Simulink Upgrade Troubleshooting
MATLAB versions are released bi-annually, and usually contain upgrades to Simulink as well. When installing this repository on a different version, it may require you to delete the "slprj" folder. This folder is created by MATLAB on execution, and houses "files generated by Simulink diagram updates and model builds." Becuase this folder had been procedurally generated using MATLAB, deleting it and allowing it to be re-generated should lead to successful execution.

If issues persist in the newer version, then we would recommend creating a new Simulink model, copying over the model that had worked in the previous iteration, and remaking the S-function blocks. All parameters needed for creation should be viewable from the older version.

Additionally, if the S-Function builder of Simulink is unable to detect the supported compiler that is being used, please ccheck out this MATLAB Answers link, which details how entering these two commands should help (they only have to be entered once, not every time you run the model): 
```
>> rtwMKCFG_out=rtwmakecfg
>> mex(['-I' rtwMKCFG_out.includePath{:}], ['-I' rtwMKCFG_out.sourcePath{:}], ['-L' rtwMKCFG_out.linkLibsObjs{:}], 'yourSFunctionName.c', 'yourSFunctionName_wrapper.c', '-lfixedpoint')
```
https://www.mathworks.com/matlabcentral/answers/92279-why-do-i-get-an-error-when-i-use-the-s-function-builder-in-64-bit-simulink-with-the-windows-sdk-7-1?s_tid=gn_loc_drop

### 2) Linux Tips
If you would like to learn more about basic Linux commands, and how they could be used to help navigate the Raspberry Pi, or gather RAM and CPU usage, please check out: 

Linux man page: https://linux.die.net/man/
Contains information about all of the Linux commands. Particularly useful are: cd, ls, mv, ssh, and top (which shows RAM usage).

htop: http://hisham.hm/htop/
An interactive process viewer for Unix that can show core utilization.

### 3) Hardware Specifications
This table is created from information available on http://socialcompare.com/en/comparison/raspberrypi-models-comparison and https://www.raspberrypi.org/

| Model         | Raspberry Pi Zero W | Pi 3 Model B       | Pi 2 Model B       |
|---------------|---------------------|--------------------|--------------------|
| Release Date  | Feb 28, 2017        | Feb 29, 2017       | Feb 1, 2015        |
| Price         | $10                 | $35                | $35                |
| SOC Type      | Broadcom BCM        | Broadcom BCM       | Broadcom BCM       |
| Core Type     | ARM1176JZF-S        | Cortex-A53 64-bit  | Cortex-A7          |
| No. of Cores  | 1                   | 4                  | 4                  |
| GPU           | VideoCore IV        | VideoCore IV       | VideoCore IV       |
| CPU Clock     | 1 GHz               | 1.2 GHz            | 900 MHz            |
| RAM           | 512 MB              | 1 GB               | 1 GB               |
| USB Ports     | Micro & micro OTG   | 4                  | 4                  |
| HDMI          | Mini                | Yes                | Yes                |
| I2C/SPI       | Yes                 | Yes                | Yes                |
| GPIO          | Yes                 | Yes                | Yes                |
| Camera        | Yes                 | Yes                | Yes                |
| SD            | microSD             | microSD            | microSD            |
| Wi-Fi         | 802.11n             | 802.11n            | No                 |
| Bluetooth     | 4.1                 | 4.1 LE             | No                 |
| Ethernet Port | No                  | Yes                | Yes                |
| Height        | 1.18 in (30mm)      | 2.22 in (56.5 mm)  | 3.37 in (85.6 mm)  |
| Width         | 2.55 in (65 mm)     | 3.37 in (85.6 mm)  | 2.22 in (56.5 mm)  |
| Depth         | 0.19685 in (5 mm)   | 0.66929 in (17 mm) | 0.66929 in (17 mm) |
| Weight        | 0.31746 oz. (9 g)   | 1.58 oz. (45 g)    | 1.58 oz. (45 g)    |

To gather information about the RAM and CPU usage, check out the top and htop Linux commands.
