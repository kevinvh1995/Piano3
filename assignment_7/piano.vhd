--------------------------------------------------------------------
--! \file      piano
--! \date      see top of 'Version History'
--! \brief     top-level entity for VHDL piano
--! \author    Remko Welling (WLGRW) remko.welling@han.nl
--! \copyright HAN TF ELT/ESE Arnhem
--!
--! \todo Students that submit this code have to complete their details:
--!
--! Student 1 name         : Kevin van Hoeijen
--! Student 1 studentnumber: 2118888
--! Student 1 email address: k.vanhoeijen@student.han.nl
--!
--! Student 2 name         : Jaap-Jan Groenendijk
--! Student 2 studentnumber: 1548148
--! Student 2 email address: jj.groenendijk@student.han.nl
--!
--! Version History:
--! ----------------
--!
--! Nr:    |Date:      |Author: |Remarks:
--! -------|-----------|--------|-----------------------------------
--! 001    |23-8-2015  |WLGRW   |Inital version
--! 002    |13-2-2020  |WLGRW   |Update to MAX10 on DE10-Lite board
--! 003    |7-4-2020   |WLGRW   |Modification for assignment
--! 004    |6-7-2020   |WLGRW   |Added a todo not to modify the header of the file to represent teh students that worked on the file.
--!
--!
--! # Final assignment (7) HM-ESH-SOC
--!
--! piano is a composit of various vhdl components that is working as
--! an piano using is PS2 keyboard.
--!
--! \verbatim
--!                                                  +--+
--!      DE10-Lite KEY, SW, LED, and HEX layout      |##| <= KEY0
--!                                                  +--+
--!                                                  |##| <= KEY1
--!                                                  +--+
--!
--!                                  9 8 7 6 5 4 3 2 1 0  <- Number
--!                                 +-+-+-+-+-+-+-+-+-+-+
--!    7-segment hexDisplays (HEX)  | | | | | | | | | | | <= Leds (LEDR)
--!      +---+---+---+---+---+---+  +-+-+-+-+-+-+-+-+-+-+
--!      |   |   |   |   |   |   |
--!      |   |   |   |   |   |   |  +-+-+-+-+-+-+-+-+-+-+
--!      |   |   |   |   |   |   |  | | | | | | | | | | |
--!      |   |   |   |   |   |   |  +-+-+-+-+-+-+-+-+-+-+
--!      |   |   |   |   |   |   |  |#|#|#|#|#|#|#|#|#|#| <= Switch (SW)
--!      +---+---+---+---+---+---+  +-+-+-+-+-+-+-+-+-+-+
--!        5   4   3   2   1   0     9 8 7 6 5 4 3 2 1 0  <- Number
--!
--! \endverbatim
--!
--! \todo Complete documentation
--!
--------------------------------------------------------------------
LIBRARY ieee;
USE     ieee.STD_LOGIC_1164.all;
--------------------------------------------------------------------
ENTITY piano IS
   PORT(
         MAX10_CLK1_50 : IN  STD_LOGIC;                  --! 50 MHz clock on board the Cycone MAX 10 FPGA
         arduino_io4,                                    --! PS2 keyboard clock signal (20 KHz domain) to PS2_KBCLK
         arduino_io5   : IN  STD_LOGIC;                  --! PS2 keybourd data signal (20 KHz domain) to PS2_KBDAT
         arduino_io3   : OUT STD_LOGIC;                  --! SPEAKER
         HEX0,
         HEX1,
         HEX2,
         HEX3,
         HEX4,
         HEX5          : OUT STD_LOGIC_VECTOR(0 to 7);   -- 7-segment displays HEX0 to HEX3
         KEY           : IN  STD_LOGIC_VECTOR(0 to 2);   -- Switches for reset (2)
         LEDR          : OUT STD_LOGIC_VECTOR(0 to 9)
        );
END piano;
--------------------------------------------------------------------
ARCHITECTURE structure OF piano IS

   SIGNAL temp_key   : STD_LOGIC_VECTOR(7 DOWNTO 0);
   SIGNAL temp_dig2  : STD_LOGIC_VECTOR(7 DOWNTO 0);
   SIGNAL TEMP_dig3  : STD_LOGIC_VECTOR(7 DOWNTO 0);

BEGIN

   LEDR(0) <= KEY(1);

   L_readkey   : ENTITY work.readkey   PORT MAP(

      clk      => MAX10_CLK1_50,
      reset    => KEY(1),
      kbclock  => arduino_io4,
      kbdata   => arduino_io5,
      dig2     => temp_dig2,
      dig3     => temp_dig3,
      key      => temp_key

   );

   L_tone_generation  : ENTITY work.tone_generation   PORT MAP(

      clk      => MAX10_CLK1_50,
      reset    => KEY(1),
      key      => temp_key,
      audiol   => arduino_io3,
      audior   => LEDR(1)

   );
   L_Display0  : ENTITY work.seg7dec   PORT MAP(

      c        => temp_dig2(3 DOWNTO 0),
      display  => HEX0

   );
   L_Display1  : ENTITY work.seg7dec   PORT MAP(

      c        => temp_dig2(7 DOWNTO 4),
      display  => HEX1

   );
   L_Display2  : ENTITY work.seg7dec   PORT MAP(

      c        => temp_dig3(3 DOWNTO 0),
      display  => HEX2

   );
   L_Display3  : ENTITY work.seg7dec   PORT MAP(

      c        => temp_dig3(7 DOWNTO 4),
      display  => HEX3

   );



END structure;