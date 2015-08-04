# vhd-projects

~*A series of electronic simulations written in VHDL for an electronics course.*

This repo contains various files written in VHDL for use with Altera's Quartus II software.
These projects would be simulated and tested on Terasic's DE0-nano development board, using the Cyclone IV E processor.

### The Projects
* **"Simple Circuits"**
  * This folder contains a few simple and easy-to-follow vhd files that demonstrate how the language can be used to simulate the most basic electronic circuits that include AND, OR, XOR, and other gates.  Each file is paired with a circuit diagram.

* **"BCDBinaryCounter.vhd"**
  * This project makes use of the "full adder" device in order to create a 2-digit BCD to binary value converter. 
 <p><img src="http://cs.smith.edu/dftwiki/images/thumb/8/8a/FullAdder3Bits.png/300px-FullAdder3Bits.png" align="middle"> <i>A Full-Adder Diagram.</i></p> 
  * Combining two of these devices grants us the use of 8 input switches, half of which will control the tens digit, the other half controlling the ones digit, granting the user a range of number from 0-99 to use.  Once the input value is set, the output will display a binary representation of the input.

* **"ClockCounter.vhd"**
  * This project makes use of the DE0-nano processor clock in order to count on it's own from 0-9, displaying each digit on either an L.E.D. array (in binary format) or a seven-segment display.  While this project was meant to be an exercise in the use of VHDL's "when others" statement, the most difficult snag to overcome was programming the processor clock to run at a slow enough pace that the count could be readable by human eyes...

* **"DFlipFlop.vhd"**
  * In a nutshell, a "Flip-flop" is a device that can be used to temporarily store state information.  In this particular case, a D Flip-flop is meant purely to reflect the input value 'D' to the output 'Q' on a clock pulse.  Using the same clock-dividing code from the "*ClockCounter.vhd*" file, you would be able to change the state of the input value and not see the result until the following clock pulse.

* **"DQuadLatch.vhd"**
  * The D Quad Latch is a flip-flop device
  
### //TODO

* **GET GUD AT MARKDOWN**
* Ensure each project is working + tidy up code.
* Include write-ups + images on each simulated device.
  * Resize Images for README
* Include config files(?) for Quartus II simulation and device useage.
