# PS/2 keyboard interface shield for DE10-Lite
All information required to build your own PS/2 keyboard interface shield for DE10-Lite.

## Responsible disclosure 
Students and lecturers are encouraged to send in their experiences, problems, errors, any other observation while using this document or the PS/2 keyboard interface shield for DE10-Lite. Please send your feedback to one of the lecturers, by raising an issue with this repository, so we can improve this paper. Thank you.

More about responsible disclosure, see: https://en.wikipedia.org/wiki/Responsible_disclosure 

## Disclaimer
The PS/2 keyboard interface shield for DE10-Lite is provided in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
  
## License
The PS/2 keyboard interface shield for DE10-Lite is part of the SOC classes for HAN Engineering Hoofdmodule Embedded Hardware Engineering.

The design of the PS/2 keyboard interface shield for DE10-Lite is free: You may redistribute it and/or modify it under the terms of a Creative  Commons Attribution-NonCommercial 4.0 International License (http://creativecommons.org/licenses/by-nc/4.0/) by Remko Welling (http://han-ese.nl/~rwelling) E-mail: remko.welling@han.nl 

<a rel="license" href="http://creativecommons.org/licenses/by-nc/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc/4.0/">Creative Commons Attribution-NonCommercial 4.0 International License</a>.

# About this documentation
In the System On Chip Classes of the University of Applied sciences of Arnhem and Nijmegen (HAN) one assignment is used to introduce the students to the use of sequential VHDL code. The assignment is constructing a electronic piano using VHDL on a DE10-Lite FPGA prototype board. 

Where some predecessors of the DE10-lite board were equipped with a PS/2 female connector, the DE10-Lite is equipped with Arduino shield compatible connectors but not the PS/2 connector. This complicates the connection of a PS/2 keyboard to the DE10-Lite significantly. Therefore a interface board was developed that will use the Arduino shield factor connectors and piggy-back on the DE10-Lite board.

![Shield on board](images/PS2SpeakerShieldOnDE10-Lite_small.png?raw=true "Shield on DE10-Lite board")

[Full size picture of Shield on DE10-Lite board](images/PS2SpeakerShieldOnDE10-Lite_small.png)

# Design
The purpose of the PS/2 keyboard interface shield to add neccessary electronics and make the levelchanges from 5V TTL to the 3,3V domain to guard the FPGA from damage.

The PS/2 keyboard interface shield is designed with reproduction in mind. Component selection was made to allow a introduction to working with SMD components an doldering of those. Therefore 1206 sized components are used in the design to introduce to SMD and regular trough-hole components.

The shield delivers:
 - PS/2 compatible interface to the FPGA on teh DE10-Lite board. Any PS/2 compatible keyboard can be connected to the shield.
 - Loudspeaker to make tones of the VHDL-piano audible.
 
### USB-keyboards
As PS/2 is depreciated, modern keyboards have a USB connector. It was out of scope to develop a USB interface for the DE10-Lite board but from experince it was found that simple USB to PS/2 adapters work fine.

## Schematic
The electronics design for the shield is copied from the DE0-CV FPGA board schematics. Follow this link to view or download the [full size schematic](images/PS2SpeakerShield.png)

![Schematic thumbnail](images/PS2SpeakerShield_small.png?raw=true "Schematic thumbnail")

The [Eagle schematic file ](eagle/HAN_DE10-Lite_PS2SpeakerShield_001.sch) is available for download.

## PCB design
The [Eagle board file ](eagle/HAN_DE10-Lite_PS2SpeakerShield_001.brd) is available for download.

## Component layout
For soldering the component layout is made availabale separately. Click on "[Full size component layout](images/PS2SpeakerShield_BoardTopView.png)" to view or download the component layout. 

![Component layout](images/PS2SpeakerShield_BoardTopView_small.png?raw=true "Component layout")

# Ordering
For PCB ordering and delivery in Europe, Aisler is recommended: https://aisler.net/

## BOM
The Bill of Materials (BOM) contains easy obtainable components that can be purchased online:
```
Part Value   Package            Description
C1   100n    C1206              CAPACITOR
C2   100n    C1206              CAPACITOR
C3   100n    C1206              CAPACITOR
C4   100n    C1206              CAPACITOR
D1   BAT54S  SOT23              Schottky barrier (double)
D2   BAT54S  SOT23              Schottky barrier (double)
D3   BAT54S  SOT23              Schottky barrier (double)
D4   BAT54S  SOT23              Schottky barrier (double)
R1   2K      M1206              RESISTOR
R2   2K      M1206              RESISTOR
R3   2K      M1206              RESISTOR
R4   2K      M1206              RESISTOR
R5   120     M1206              RESISTOR
R6   120     M1206              RESISTOR
R7   120     M1206              RESISTOR
R8   120     M1206              RESISTOR
R9   120     M1206              RESISTOR
X1   DIN6FE  M_DIN6             6-PIN MINI-DIN female connector
LS1  SPEAKER PCB_MOUNT_SPEAKER  Speaker
```

# Soldering the PS/2 keyboard shield
Soldering the PS/2 keyboard interface shield kit is fun!

 - For those who start with soldering, Sparkfun hase a nice how-to availabale: https://learn.sparkfun.com/tutorials/how-to-solder-through-hole-soldering/
 - For soldering SMD components the instructions of David Haillant are recommended: http://www.davidhaillant.com/smd-soldering/
 
## Recommended order
When soldering the recommended order is to work "from small to big".

 1. Start with soldering the SMD resisitors
 2. Than solder the SMD capacitors
 3. Finalize soldering SMD components with the diodes
 4. Solder the loadspeaker
 5. Solder the PS/2 connector
 6. Cut the pin-headers to the reqired length
 6. Solder the pin-headers

# Testing

To test the PS/2 keyboard interface shield use the Quartus project that is provided with this repository: [Hardware test for PS/2 interface shield for DE10-Lite](harwareTest/README.md)

# Conclusion
Soldering is fun! I hope you enjoy your self-made PS/2 keyboard interface shield and the joy of playing your VHDL piano.

You make me very happy when you share your pictures or video. Cu, Remko.

[![VHDL-piano with PS/2 keyboard interface shield](https://img.youtube.com/vi/MyB9OI17_hk/0.jpg)](https://www.youtube.com/watch?v=MyB9OI17_hk)


