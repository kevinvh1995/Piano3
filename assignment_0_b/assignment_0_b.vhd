--------------------------------------------------------------------
--! \file      Opdracht_0_b.vhd
--! \date      see top of 'Version History'
--! \brief     4x7 segment decoder 
--! \author    Remko Welling (WLGRW) remko.welling@han.nl
--! \copyright HAN TF ELT/ESE Arnhem 
--!
--! Version History:
--! ----------------
--!
--! Nr:    |Date:      |Author: |Remarks:
--! -------|-----------|--------|-----------------------------------
--! 001    |14-2-2015  |WLGRW   |Inital version
--! 002    |5-3-2020   |WLGRW   |Update to MAX10 on DE10-Lite board 
--! 003    |31-3-2020  |WLGRW   |Adaptation for assignment_0_b 
--!
--! # 4x7 segment decoder
--!
--! - Control 4 7-segment displays using SW 0 to 9.
--! - The display driver seg7dec is being reused as component.
--!
--! - Switch 0 to 3 controls HEX0
--! - Switch 4 to 7 controls HEX1
--! - Switch 8 and 9 control HEX2
--! - HEX3 is switched off.
--!
--! See figure for use of peripherals
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
--!    7-segment hexDisplays (HEX)  |X|X|X|X|X|X|X|X|X|X| <= Leds (LEDR)
--!      +---+---+---+---+---+---+  +-+-+-+-+-+-+-+-+-+-+
--!      |   |   |   |   |   |   |                     
--!      |   |   |   |   |   |   |  +-+-+-+-+-+-+-+-+-+-+
--!      | X | X |off| 2 | 1 | 0 |  | | | | | | | | | | |
--!      |   |   |   |   |   |   |  +-+-+-+-+-+-+-+-+-+-+
--!      |   |   |   |   |   |   |  |#|#|#|#|#|#|#|#|#|#| <= Switch (SW)
--!      +---+---+---+---+---+---+  +-+-+-+-+-+-+-+-+-+-+
--!        5   4   3   2   1   0     9 8 7 6 5 4 3 2 1 0  <- Number
--!
--! \endverbatim

--------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
--------------------------------------------------------------------
ENTITY assignment_0_b IS
   PORT(
      SW    : IN  STD_LOGIC_VECTOR(0 TO 9); -- 9 switches SW0 to SW9
      HEX0,
      HEX1,
      HEX2,
      HEX3  : OUT STD_LOGIC_VECTOR(0 TO 7)  -- 4 7-segment displays HEX0 to HEX3
   );
END assignment_0_b;
--------------------------------------------------------------------
ARCHITECTURE LogicFunction OF assignment_0_b IS

   COMPONENT seg7dec IS
      PORT(
         C       : in  STD_LOGIC_VECTOR(3 DOWNTO 0);
         display : out STD_LOGIC_VECTOR(0 TO 7) 
      );
   END COMPONENT seg7dec;

   SIGNAL s_sw0,
          s_sw1,
          s_sw2 : STD_LOGIC_VECTOR(3 DOWNTO 0);
   
   SIGNAL s_disp0,
          s_disp1,
          s_disp2 : std_logic_vector(0 TO 7);

BEGIN

   -- Instantiate 3 7-segement decoders
   Display0 : seg7dec PORT MAP ( s_sw0, s_disp0 ); -- 7-segment decoder 0
   Display1 : seg7dec PORT MAP ( s_sw1, s_disp1 ); -- 7-segment decoder 1
   Display2 : seg7dec PORT MAP ( s_sw2, s_disp2 ); -- 7-segment decoder 2
   
   -- Map switches to connecting signals,
   -- 7-segment decoder 0:
   -- With this implementation the 4 individual signals are assigned either
   -- individually but also using the GENERATE statement.

--   s_sw0(0) <= SW(0);
--   s_sw0(1) <= SW(1);
--   s_sw0(2) <= SW(2);
--   s_sw0(3) <= SW(3);

   G0: FOR i IN 0 TO 3 GENERATE
      s_sw0(i) <= SW(i);
   END GENERATE;

   -- 7-segment decoder 1

   G1: FOR i IN 0 TO 3 GENERATE
      s_sw1(i) <= SW(i+4);
   END GENERATE;

   -- 7-segment decoder 2

   s_sw2(0) <= SW(8);
   s_sw2(1) <= SW(9);

   -- Map 7-segment displays to connecting signals
   
   HEX0 <= s_disp0;
   HEX1 <= s_disp1;
   HEX2 <= s_disp2;
   HEX3 <= (OTHERS => '1');

END LogicFunction;