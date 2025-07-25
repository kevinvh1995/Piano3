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
	-- Assuming common mode, logic 0=segment on
   -- Defining states of the led segments according to truth table (inverted)
   CONSTANT CHAR_0 : STD_LOGIC_VECTOR(7 DOWNTO 0) 		:= "00000011"; -- 0
   CONSTANT CHAR_1 : STD_LOGIC_VECTOR(7 DOWNTO 0) 		:= "10011111"; -- 1
   CONSTANT CHAR_2 : STD_LOGIC_VECTOR(7 DOWNTO 0) 		:= "00100101"; -- 2
   CONSTANT CHAR_3 : STD_LOGIC_VECTOR(7 DOWNTO 0) 		:= "00001101"; -- 3
   CONSTANT CHAR_4 : STD_LOGIC_VECTOR(7 DOWNTO 0) 		:= "10011001"; -- 4
   CONSTANT CHAR_5 : STD_LOGIC_VECTOR(7 DOWNTO 0) 		:= "01001001"; -- 5
   CONSTANT CHAR_6 : STD_LOGIC_VECTOR(7 DOWNTO 0) 		:= "01000001"; -- 6
   CONSTANT CHAR_7 : STD_LOGIC_VECTOR(7 DOWNTO 0) 		:= "00011111"; -- 7
   CONSTANT CHAR_8 : STD_LOGIC_VECTOR(7 DOWNTO 0) 		:= "00000001"; -- 8
   CONSTANT CHAR_9 : STD_LOGIC_VECTOR(7 DOWNTO 0) 		:= "00001001"; -- 9
   CONSTANT CHAR_A : STD_LOGIC_VECTOR(7 DOWNTO 0) 		:= "00010001"; -- A
   CONSTANT CHAR_B : STD_LOGIC_VECTOR(7 DOWNTO 0) 		:= "11000001"; -- b
   CONSTANT CHAR_C : STD_LOGIC_VECTOR(7 DOWNTO 0) 		:= "01100011"; -- C
   CONSTANT CHAR_D : STD_LOGIC_VECTOR(7 DOWNTO 0) 		:= "10000101"; -- D
   CONSTANT CHAR_E : STD_LOGIC_VECTOR(7 DOWNTO 0) 		:= "01100001"; -- E
   CONSTANT CHAR_F : STD_LOGIC_VECTOR(7 DOWNTO 0) 		:= "01110001"; -- F
   CONSTANT CHAR_PLUS  : STD_LOGIC_VECTOR(7 DOWNTO 0)   := "10011101"; -- +
   CONSTANT CHAR_MINUS : STD_LOGIC_VECTOR(7 DOWNTO 0)   := "11111101"; -- -
   CONSTANT NONE : STD_LOGIC_VECTOR(7 DOWNTO 0) 		:= "11111111" -- Default / All segments off

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

     
        WITH input SELECT
	  display <= CHAR_0 WHEN "0000",
	             CHAR_1 WHEN "0001",
					 CHAR_2 WHEN "0010",
		          CHAR_3 WHEN "0011",
		          CHAR_4 WHEN "0100",
	  	          CHAR_5 WHEN "0101",
		          CHAR_6 WHEN "0110",
		          CHAR_7 WHEN "0111",
		          CHAR_8 WHEN "1000",
		          CHAR_9 WHEN "1001",
		          CHAR_A WHEN "1010",
		          CHAR_B WHEN "1011",
		          CHAR_C WHEN "1100",
		          CHAR_D WHEN "1101",
		          CHAR_E WHEN "1110",
		          CHAR_F WHEN "1111",
		          NONE   WHEN OTHERS;





END ARCHITECTURE implementation;
--------------------------------------------------------------------