# Notes

https://www.win.tue.nl/~aeb/linux/kbd/scancodes-12.html#kced

One can not only talk to the keyboard controller (by writing to port 0x64), but also to the keyboard (by writing to port 0x60).

Each command (other than 0xfe) is ACKed by 0xfa. Each unknown command is NACKed by 0xfe. Some mice expect a corrected byte as reply to the 0xfe, and will double-NACK with 0xfc when also that is wrong.

## Command "0xed": Write LEDs

This command is followed by a byte indicating the desired LEDs setting. 
 - Bits 7-3: unused, '0'. 
 - Bit 2: 1: CapsLock LED on. 
 - Bit 1: 1: NumLock LED on. 
 - Bit 0: 1: ScrollLock LED on. 

When OK, both bytes are ACKed. If the second byte is recognized as a command, that command is ACKed and done instead. Otherwise a NACK is returned (and a keyboard enable may be needed). 
