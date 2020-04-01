--------------------------------------------------------------------
--! \file      seg7dec.vhd
--! \date      see top of 'Version History'
--! \brief     7-segment driver without control of dot 
--! \author    Remko Welling (WLGRW) remko.welling@han.nl
--! \copyright HAN TF ELT/ESE Arnhem 
--!
--! Version History:
--! ----------------
--!
--! Nr:    |Date:      |Author: |Remarks:
--! -------|-----------|--------|-----------------------------------
--! 001    |12-2-2015  |WLGRW   |Inital version
--! 002    |28-3-2015  |WLGRW   |Modification to set dot in display  
--! 003    |13-2-2020  |WLGRW   |Update to MAX10 on DE10-Lite board
--!
--! # 7 segment decoder
--!
--! ## Architecture 1
--!
--! These constants are used to make the VHDL code more readable.
--! Beacuse we will create both numbers and alphanumeric characters in the 
--! display the caharacters are defined as CONSTANTS in the GENERIC part of the
--! entity. This will simplify maintaining the code because CONSTANTs can be 
--! defined once and reused many times.
--! 
--! The following constants are defined to generate alle required characters.
--! Each led in the HEX_display has been given a number for the purpose of 
--! identification. See figure 2.
--!
--! \verbatim
--!
--!  Figure 2: 7-segments lay-out:
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