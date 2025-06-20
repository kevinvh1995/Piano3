--------------------------------------------------------------------
--! \file      seg7dec.vhd
--! \date      see top of 'Version History'
--! \brief     7-segment driver without control of dot
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
--! 001    |12-2-2015  |WLGRW   |Inital version
--! 002    |28-3-2015  |WLGRW   |Modification to set dot in display
--! 003    |13-2-2020  |WLGRW   |Update to MAX10 on DE10-Lite board
--! 004    |31-3-2020  |WLGRW   |Modification for assignment 0-a
--! 005    |6-7-2020   |WLGRW   |Added a todo not to modify the header of the file to represent teh students that worked on the file.
--!
--!
--! # 7 segment decoder
--!
--! Use constants:
--! - to make the VHDL code more readable
--! - for both numbers and alphanumeric characters
--!
--! The following constants are defined to generate alle required characters.
--! Each led in the HEX_display has been given a number for the purpose of
--! identification. See figure 1.
--!
--! \verbatim
--!
--!  Figure 1: 7-segments lay-out:
--!
--!        -0-
--!       |   |
--!       5   1
--!       |   |
--!        -6-
--!       |   |
--!       4   2
--!       |   |
--!        -3-  7 (dot)
--!
--! \endverbatim
--!
--! All LEDs are grouped in a STD_LOGIC_VECTOR where the index number is
--! equal to the LED number.
--!
--! Because the LEDs are contolled using inverted-logic we have to apply a
--! '1' to switch the LED off.
--!
--! \todo Complete documentation
--------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
--------------------------------------------------------------------
ENTITY seg7dec IS


    GENERIC (
      -- constants for controlling the leds on 7 segment display
      hex_0       : STD_LOGIC_VECTOR(0 TO 6) := "0000001";
      hex_1       : STD_LOGIC_VECTOR(0 TO 6) := "1001111";
      hex_2       : STD_LOGIC_VECTOR(0 TO 6) := "0010010";
      hex_3       : STD_LOGIC_VECTOR(0 TO 6) := "0000110";
      hex_4       : STD_LOGIC_VECTOR(0 TO 6) := "1001100";
      hex_5       : STD_LOGIC_VECTOR(0 TO 6) := "0100100";
      hex_6       : STD_LOGIC_VECTOR(0 TO 6) := "0100000";
      hex_7       : STD_LOGIC_VECTOR(0 TO 6) := "0001111";
      hex_8       : STD_LOGIC_VECTOR(0 TO 6) := "0000000";
      hex_9       : STD_LOGIC_VECTOR(0 TO 6) := "0000100";
      hex_A       : STD_LOGIC_VECTOR(0 TO 6) := "0001000";
      hex_B       : STD_LOGIC_VECTOR(0 TO 6) := "1100000";
      hex_C       : STD_LOGIC_VECTOR(0 TO 6) := "1110010";
      hex_D       : STD_LOGIC_VECTOR(0 TO 6) := "1000010";
      hex_E       : STD_LOGIC_VECTOR(0 TO 6) := "0110000";
      hex_F       : STD_LOGIC_VECTOR(0 TO 6) := "0111000";
      hex_plus    : STD_LOGIC_VECTOR(0 TO 6) := "1001110";
      hex_minus   : STD_LOGIC_VECTOR(0 TO 6) := "1111110";
      hex_off     : STD_LOGIC_VECTOR(0 TO 6) := "1111111";

      -- inputs translated to understandeble discription
      input_0     : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
      input_1     : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0001";
      input_2     : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0010";
      input_3     : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0011";
      input_4     : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0100";
      input_5     : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0101";
      input_6     : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0110";
      input_7     : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0111";
      input_8     : STD_LOGIC_VECTOR(3 DOWNTO 0) := "1000";
      input_9     : STD_LOGIC_VECTOR(3 DOWNTO 0) := "1001";
      input_A     : STD_LOGIC_VECTOR(3 DOWNTO 0) := "1010";
      input_B     : STD_LOGIC_VECTOR(3 DOWNTO 0) := "1011";
      input_C     : STD_LOGIC_VECTOR(3 DOWNTO 0) := "1100";
      input_D     : STD_LOGIC_VECTOR(3 DOWNTO 0) := "1101";
      input_E     : STD_LOGIC_VECTOR(3 DOWNTO 0) := "1110";
      input_F     : STD_LOGIC_VECTOR(3 DOWNTO 0) := "1111"
);

   port(
      C       : IN  STD_LOGIC_VECTOR(3 downto 0);
      display : OUT STD_LOGIC_VECTOR(0 to 7)
   );
END ENTITY seg7dec;
--------------------------------------------------------------------
ARCHITECTURE implementation OF seg7dec IS

   SIGNAL input: STD_LOGIC_VECTOR(3 DOWNTO 0);

BEGIN

   input <= C;

   --! Add here the ARCHITECTURE of your refactored 7-segment driver

    display(7) <= '1';  -- set dot always off

      WITH input SELECT
      display(0 TO 6) <=   hex_0   WHEN input_0, -- 0
                           hex_1   WHEN input_1, -- 1
                           hex_2   WHEN input_2, -- 2
                           hex_3   WHEN input_3, -- 3
                           hex_4   WHEN input_4, -- 4
                           hex_5   WHEN input_5, -- 5
                           hex_6   WHEN input_6, -- 6
                           hex_7   WHEN input_7, -- 7
                           hex_8   WHEN input_8, -- 8
                           hex_9   WHEN input_9, -- 9
                           hex_A   WHEN input_A, -- A
                           hex_B   WHEN input_B, -- B
                           hex_C   WHEN input_C, -- C
                           hex_D   WHEN input_D, -- D
                           hex_E   WHEN input_E, -- E
                           hex_F   WHEN input_F, -- F
                           hex_off WHEN OTHERS;





END ARCHITECTURE implementation;
--------------------------------------------------------------------