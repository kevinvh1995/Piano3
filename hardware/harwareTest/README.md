# Hardware test for PS/2 interface shield for DE10-Lite

This test is for hardware testing of the PS/2 keyboard interface shield for DE10-Lite. 2 tests are possible using this project:

 1. Receiving keyboard data trough the shield
 2. Testing the loudspeaker using a 1 khz tone.

Currently testing of sending data to the PS/2 keyboard is not implemented.

```
          PS/2 interface shield for DE10-Lite

              /-------------------------+
             |                           \
             |                /----\     |
             |               /      \    |
             |              |        |   |<= Speaker
             |              |        |   |
             |               \      /     \
             |                \----/      |
             |+------+                    |
             ||      |                    |
PS/2 conn. =>||      |                    |
             ||      |                    |      +--+
             |+------+                    |      |BB| <= KEY0
             |                            |      +--+
             |                            /      |##| <= KEY1
              \--------------------------+       +--+

                                 9 8 7 6 5 4 3 2 1 0  <- Number
                                +-+-+-+-+-+-+-+-+-+-+
   7-segment hexDisplays (HEX)  | | | | | | |D|C|B|A| <= Leds (LEDR)
     +---+---+---+---+---+---+  +-+-+-+-+-+-+-+-+-+-+
     |   |   |   |   |   |   |                     
     |   |   |   |   |   |   |  +-+-+-+-+-+-+-+-+-+-+
     |   |   |   |   |   |   |  | | | | | | | | | | |
     |   |   |   |   |   |   |  +-+-+-+-+-+-+-+-+-+-+
     |   |   |   |   |   |   |  |#|#|#|#|#|#|#|#|#|#| <= Switch (SW)
     +---+---+---+---+---+---+  +-+-+-+-+-+-+-+-+-+-+
       5   4   3   2   1   0     9 8 7 6 5 4 3 2 1 0  <- Number

         DE10-Lite KEY, SW, LED, and HEX layout
```
# Testing

The following test-script will run all primary tests:

## Test 1: Loudspeaker

Test the loudspeaker by playing an audible tone of 1 khz.

- Press KEY-0.
- A 1 kHz tone will be audible trough the speaker.
- LED 1 (indicated with function B) will light in the 1 khz rythem
  to indicate that the tone is enabled.
- When the tone is audible: **PASS**, else: **FAIL**.

## Test 2: Receiving PS/2 keyboard data.

test the sending of keyboard data trough the PS/2 interface shield.

- Connect the keyboard to the PS/2 connector on the shield.
- Press a key on the keyboard.
- LED 2 (indicated with function C) will light when data is received from the keyboard
- LED 3 (indicated with function D) will light when data is received from the keyboard
- When LED 2 and LED 3 light simultaneously when pressing or realeasing 
  a key on the keyboard: **PASS**, else **FAIL**.
- Using LED 2 and 3 it is possible to identify which signal is failing.

## Test 3: Sending data to the keyboard.

This function is currently not implemented.

## Todo 

Implement testing of sending data to the keyboard.
