--------------------------------------------------------------------
--! \file      hardware_test.vhd
--! \date      see top of 'Version History'
--! \brief     Hardware test to verify operation of the PS/2 interface shield for DE10-Lite 
--! \author    Remko Welling (WLGRW) remko.welling@han.nl
--! \copyright HAN TF ELT/ESE Arnhem 
--!
--! Version History:
--! ----------------
--!
--! Nr:    |Date:      |Author: |Remarks:
--! -------|-----------|--------|-----------------------------------
--! 001    |15-5-2020  |WLGRW   |Inital version
--! 002    |           |        |
--!
--! # Hardware test for PS/2 interface shield for DE10-Lite
--!
--! This test is for hardware  testing of the PS/2 keyboard interface shield for DE10-Lite.
--!
--! 2 tests are possible using this project:
--!
--!  1. Receiving keyboard data trough the shield
--!  2. Testing the loudspeaker using a 1 khz tone.
--!
--! Currently testing of sending data to the PS/2 keyboard is not implemented.
--!
--! # Testing
--! 
--! The following test-script will run all primary tests:
--! 
--! ## Test 1: Loudspeaker
--! 
--! Test the loudspeaker by playing an audible tone of 1 khz.
--!
--! - Press KEY-0.
--! - A 1 kHz tone will be audible trough the speaker.
--! - LED 1 (indicated with function B) will light in the 1 khz rythem
--!   to indicate that the tone is enabled.
--! - When the tone is audible: PASS, else: FAIL.
--! 
--! ## Test 2: Receiving PS/2 keyboard data.
--! 
--! test the sending of keyboard data trough the PS/2 interface shield.
--! 
--! - Connect the keyboard to the PS/2 connector on the shield.
--! - Press a key on the keyboard.
--! - LED 2 (indicated with function C) will light when data is received from the keyboard
--! - LED 3 (indicated with function D) will light when data is received from the keyboard
--! - When LED 2 and LED 3 light simultaneously when pressing or realeasing 
--!   a key on the keyboard: PASS, else FAIL.
--! - Using LED 2 and 3 it is possible to identify which signal is failing.
--! 
--! ## Test 3: Sending data to the keyboard.
--! 
--! This function is currently not implemented.
--! 
--! \todo Implement testing of sending data to the keyboard.
--! 
--! \verbatim
--!
--!           PS/2 interface shield for DE10-Lite
--!
--!               /-------------------------+
--!              |                           \
--!              |                /----\     |
--!              |               /      \    |
--!              |              |        |   |<= Speaker
--!              |              |        |   |
--!              |               \      /     \
--!              |                \----/      |
--!              |+------+                    |
--!              ||      |                    |
--! PS/2 conn. =>||      |                    |
--!              ||      |                    |      +--+
--!              |+------+                    |      |BB| <= KEY0
--!              |                            |      +--+
--!              |                            /      |##| <= KEY1
--!               \--------------------------+       +--+
--!
--!                                  9 8 7 6 5 4 3 2 1 0  <- Number
--!                                 +-+-+-+-+-+-+-+-+-+-+
--!    7-segment hexDisplays (HEX)  | | | | | | |D|C|B|A| <= Leds (LEDR)
--!      +---+---+---+---+---+---+  +-+-+-+-+-+-+-+-+-+-+
--!      |   |   |   |   |   |   |                     
--!      |   |   |   |   |   |   |  +-+-+-+-+-+-+-+-+-+-+
--!      |   |   |   |   |   |   |  | | | | | | | | | | |
--!      |   |   |   |   |   |   |  +-+-+-+-+-+-+-+-+-+-+
--!      |   |   |   |   |   |   |  |#|#|#|#|#|#|#|#|#|#| <= Switch (SW)
--!      +---+---+---+---+---+---+  +-+-+-+-+-+-+-+-+-+-+
--!        5   4   3   2   1   0     9 8 7 6 5 4 3 2 1 0  <- Number
--!
--!          DE10-Lite KEY, SW, LED, and HEX layout
--!
--! \endverbatim
--!
--!
--------------------------------------------------------------------
LIBRARY ieee;
USE     ieee.STD_LOGIC_1164.all;
--------------------------------------------------------------------
ENTITY hardware_test IS
   PORT(
      MAX10_CLK1_50 : IN  STD_LOGIC;                  --! 50 MHz clock on board the Cycone MAX 10 FPGA
      arduino_io4,                                    --! PS2 keyboard clock signal
      arduino_io5   : IN  STD_LOGIC;                  --! PS2 keybourd data signal
      arduino_io3   : OUT STD_LOGIC;                  --! SPEAKER
      KEY           : IN  STD_LOGIC_VECTOR(0 to 2);   --! Switches for reset (2)
      LEDR          : OUT STD_LOGIC_VECTOR(0 to 9)
   );
END hardware_test;
--------------------------------------------------------------------
ARCHITECTURE implementation OF hardware_test IS
   SIGNAL reset      : STD_LOGIC;
   SIGNAL PS2_KBCLK,                --! PS2 keyboard clock signal (20 KHz domain)
          PS2_KBDAT  : STD_LOGIC;   --! PS2 keyboard data signal (20 KHz domain)
   SIGNAL tone_1khz  : STD_LOGIC;   --! 1 khz tone 
   SIGNAL counter    : integer RANGE 0 TO 24999 := 0;
  

BEGIN

   -- Connect PS/2 interface ports to signals for readability
   PS2_KBCLK <= arduino_io4;
   PS2_KBDAT <= arduino_io5;
   
   -- Connect KEY(1) to reset signal and LED-0 to indicate reset state. 
   reset     <= KEY(1);
   LEDR(0)   <= KEY(1);
   
   -- Test 1: Connect PS/2 signals that carry information from the keyboard 
   -- to LED 2 (keyboard clock) and LED 3 (keyboard data) to indicate that
   -- keyboard data is received form the PS/2 interface shield.
   LEDR(2)   <= NOT PS2_KBCLK;
   LEDR(3)   <= NOT PS2_KBDAT;
   
   -- 1 khz tone generator to be used to test the speaker.
   tone_generator_1khz: PROCESS (reset, MAX10_CLK1_50)
   BEGIN
      IF (reset = '0') THEN
         tone_1khz <= '0';
         counter <= 0;
      ELSIF rising_edge(MAX10_CLK1_50) THEN
    
         IF (counter = 24999) THEN
            tone_1khz <= NOT(tone_1khz);
            counter <= 0;
         ELSE
            counter <= counter + 1;
         END IF;
    
      END IF;
   END PROCESS tone_generator_1khz;
   
   -- Connect the 1 khz test tone to the speaker and LED 1
   -- KEY 0 will enable the test tone to becom audible. 
   -- Because of negative logic of KEY it is inverted.
   LEDR(1)     <= tone_1khz AND NOT KEY(0);
   arduino_io3 <= tone_1khz AND NOT KEY(0);

END implementation;