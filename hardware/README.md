# PS/2 keyboard interface shield for DE10-Lite

**This page is currently being updated, please return later for full documentation**

Project templates and materials for the VHDL Piano assignment.

## Responsible disclosure 
Students and lecturers are encouraged to send in their experiences, problems, errors, any other observation while using this document or the PS/2 keyboard interface shield for DE10-Lite. Please send your feedback to one of the lecturers, so we can improve this paper. Thank you.

responsible disclosure, see: https://en.wikipedia.org/wiki/Responsible_disclosure 

## Disclaimer
The PS/2 keyboard interface shield for DE10-Lite is provided in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
  
## License
The PS/2 keyboard interface shield for DE10-Lite is part of the SOC classes for HAN Engineering Hoofdmodule Embedded Hardware Engineering.
The design of the PS/2 keyboard interface shield for DE10-Lite is free: You may redistribute it and/or modify it under the terms of a Creative  Commons Attribution-NonCommercial 4.0 International License (http://creativecommons.org/licenses/by-nc/4.0/) by Remko Welling (http://han-ese.nl/~rwelling) E-mail: remko.welling@han.nl 

<a rel="license" href="http://creativecommons.org/licenses/by-nc/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc/4.0/">Creative Commons Attribution-NonCommercial 4.0 International License</a>.

## Documentation
The shield is designed with reprodction in mind. Component selection was made to allow a introduction to working with SMD components an doldering of those. Therefore 1206 sized components are used in the design.

The shield was designed using 

![Shield on board](images/PS2SpeakerShieldOnDE10-Lite_small.png?raw=true "Shield on DE10-Lite board")

[Full size picture of Shield on DE10-Lite board](images/PS2SpeakerShieldOnDE10-Lite_small.png)


## Schematic

![Schematic thumbnail](images/PS2SpeakerShield_small.png?raw=true "Schematic thumbnail")

[Full size schematic](images/PS2SpeakerShield.png)

## PCB design

## Component overview

![Component layout](images/PS2SpeakerShield_BoardTopView_small.png?raw=true "Component layout")

[Full size component layout](images/PS2SpeakerShield_BoardTopView.png)


# BOM

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


