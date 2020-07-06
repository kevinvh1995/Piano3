--------------------------------------------------------------------
--! \file      piano
--! \date      see top of 'Version History'
--! \brief     top-level entity for VHDL piano
--! \author    Remko Welling (WLGRW) remko.welling@han.nl
--! \copyright HAN TF ELT/ESE Arnhem 
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
--! \todo MODIFY THE HEADER OF THIS FILE TO REPRESENT THE NAMES OF THE STUDENTS WORKING ON IT.
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
ENTITY orgeltje IS
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
END orgeltje;
--------------------------------------------------------------------
ARCHITECTURE structure OF orgeltje IS
   
   --! add here SIGNALS 

BEGIN

   --! add here the structural VHDL that combines all COMPONENTS

END structure;