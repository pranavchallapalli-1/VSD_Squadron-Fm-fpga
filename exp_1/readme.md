This project consists of introduction to understanding the fm mini fpga

Here there are 3 files
top.v
 
which consists the Verilog code for turning on the blue led light 
here if we have an external oscillator we can use it as input as we do not have it we are not using the declared input hw_clk
we are using oscillator drive for using the internal oscillator which operates in 12 MHz
and we are using led load drivers .
We are using these drivers for interacting with the hardware.

We are creating ad pcf file which is physical constraint file in which we are assigning the pins with respect to the pinout of the fpga

We are creating a makefile in which we write the commands which help us to convert the .v file into bin file which will be loaded into the fpga ram

Commands used for loading the file into fpga after creating these three files

In virtual box we use the devices and select ftdi connection to load the  files

1)make clean
2)make build //building the file
3)sudo make flash //load into the sram of the fpga

