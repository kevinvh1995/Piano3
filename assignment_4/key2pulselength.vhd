--------------------------------------------------------------------
--! \file      key2pulselength.vhd
--! \date      see top of 'Version History'
--! \brief     The masters orgeltje 
--! \author    Remko Welling (WLGRW) remko.welling@han.nl
--! \copyright HAN TF ELT/ESE Arnhem 
--!
--! Version History:
--! ----------------
--!
--! Nr:    |Date:      |Author: |Remarks:
--! -------|-----------|--------|-----------------------------------
--! 001    |26-3-2015  |WLGRW   |Inital version
--! 002    |13-2-2020  |WLGRW   |Update to MAX10 on DE10-Lite board
--! 003    |7-4-2020   |WLGRW   |Transformation to assignment
--! 004    |6-7-2020   |WLGRW   |Added a todo not to modify the header of the file to represent teh students that worked on the file.
--!
--! \todo MODIFY THE HEADER OF THIS FILE TO REPRESENT THE NAMES OF THE STUDENTS WORKING ON IT.
--!
--! # Assignment 4:key2pulselength
--! 
--! 
--! \verbatim
--! 
--!              +-------------------+
--!              |                   |
--! key[7..0] -->|                   |
--!              | pulselength2audio |--> pulselength[12..0]
--!     reset -->|                   |
--!              |                   |
--!              +-------------------+
--!
--! Figure: input-process-output diagram of pulselength2audio
--!
--! \endverbatim
--!
--!     |       |       |         |           | @50 MHz
--!  No | Toets | (Hex) | Note    | Freq (Hz) | freq/2 (Hz)
--!  ---|-------|------ |---------|-----------|------------
--!  1  | TAB   | 0D    | A       | 440       | 7102
--!  2  | 1!    | 16    |    Ais  | 466       | 6704
--!  3  | Q     | 15    | B       | 494       | 6327
--!  4  | W     | 1D    | C       | 523       | 5972
--!  5  | 3#    | 26    |    Cis  | 554       | 5637
--!  6  | E     | 24    | D       | 587       | 5321
--!  7  | 4$    | 25    |    Dis  | 622       | 5022
--!  8  | R     | 2D    | E       | 659       | 4740
--!  9  | T     | 2C    | F       | 698       | 4474
--!  10 | 6^    | 36    |    Fis  | 740       | 4223
--!  11 | Y     | 35    | G       | 784       | 3986
--!  12 | 7&    | 3D    |    Gis  | 831       | 3762
--!  13 | U     | 3C    | A+      | 880       | 3551
--!  14 | 8*    | 3E    |    Ais+ | 932       | 3352
--!  15 | I     | 43    | B+      | 988       | 3164
--!  16 | O     | 44    |    Cis+ | 1047      | 2986
--!  17 | 0)    | 45    | C+      | 1109      | 2819
--!  18 | P     | 4D    |    Dis+ | 1175      | 2660
--!  19 | -_    | 4E    | D+      | 1245      | 2511
--!  20 | [{    | 54    | E+      | 1319      | 2370
--!  21 | ]}    | 5B    | F+      | 1397      | 2237
--!  22 | Back  | 41    |    Fis+ | 1480      | 2112
--!  
--------------------------------------------------------------------
LIBRARY ieee;
USE     ieee.STD_LOGIC_1164.all;
USE     ieee.numeric_std.all;
--------------------------------------------------------------------
ENTITY key2pulselength is

   --! Use CONSTANTS here
   
   PORT(
      reset      : IN  STD_LOGIC;                    -- Reset active is '0'
      key        : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
      pulslength : OUT integer RANGE 0 TO 8191       -- 16 bit size to store up to maximal 56818
   );
END key2pulselength;
--------------------------------------------------------------------
ARCHITECTURE implementation1 OF key2pulselength IS
BEGIN

   --! Implement here the divisor selector
   
END implementation1;
--------------------------------------------------------------------
