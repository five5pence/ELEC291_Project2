# ELEC291_Project2
Remote control and metal-detecting robot source code
OH YES

## To-do list (arbitrary order)
### Remote Control:
- JDY-40 radio serial communication
- Metal proximity indicator sound
  - Either a timer reload or DAC implementation
- LCD data formatting
  - Detector "Strength"
### Robot:
- Power system
- H-bridges for both motors
  - Debug single-motor implementation
  - Build another one (preferably on a single board with the PIC32)
- PWM for motor control
  - Somehow get data from the JDY-40 and feed the values into a PWM program
- Frequency reading from inductor coil  
  - Measure period 
### Tests:
- Metal detection threshold (what range of f counts for a valid detection)
- Motor control resistances (what values of Rt and Rc do we use)
- Straight line drive test
- Square drive test
- Figure-eight drive test
### Misc:
- Get motors lubricated
- Figure out where to do f, L calculations
- Extra features (?)
