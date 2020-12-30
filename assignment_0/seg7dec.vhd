--------------------------------------------------------------------
--! \file      seg7dec.vhd
--! \date      see top of 'Version History'
--! \brief     7-segment driver without control of dot 
--! \author    Remko Welling (WLGRW) remko.welling@han.nl
--! \copyright HAN TF ELT/ESE Arnhem 
--!
--! \todo Students that submit this code have to complete their details:
--!
--! - Student 1 name         : 
--! - Student 1 studentnumber: 
--! - Student 1 email address: 
--!
--! - Student 2 name         : 
--! - Student 2 studentnumber: 
--! - Student 2 email address: 
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

   --! When used in the refactored 7-segement drive, 
   --! place here your CONSTANTS.

   port(
      C       : IN  STD_LOGIC_VECTOR(3 downto 0);
      display : OUT STD_LOGIC_VECTOR(0 to 7) 
   );
END ENTITY seg7dec;
--------------------------------------------------------------------
ARCHITECTURE implementation OF seg7dec IS
BEGIN

	--! Add here the ARCHITECTURE of your refactored 7-segment driver

END ARCHITECTURE implementation;
--------------------------------------------------------------------