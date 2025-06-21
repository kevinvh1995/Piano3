--------------------------------------------------------------------
--! \file      key2pulselength.vhd
--! \date      see top of 'Version History'
--! \brief     The masters orgeltje
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
--! 001    |26-3-2015  |WLGRW   |Inital version
--! 002    |13-2-2020  |WLGRW   |Update to MAX10 on DE10-Lite board
--! 003    |7-4-2020   |WLGRW   |Transformation to assignment
--! 004    |6-7-2020   |WLGRW   |Added a todo not to modify the header of the file to represent teh students that worked on the file.
--!
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
   GENERIC(
      key_TAB :            STD_LOGIC_VECTOR (7 DOWNTO 0) := X"0D";
      key_1 :              STD_LOGIC_VECTOR (7 DOWNTO 0) := X"16";
      key_Q :              STD_LOGIC_VECTOR (7 DOWNTO 0) := X"15";
      key_W :              STD_LOGIC_VECTOR (7 DOWNTO 0) := X"1D";
      key_3 :              STD_LOGIC_VECTOR (7 DOWNTO 0) := X"26";
      key_E :              STD_LOGIC_VECTOR (7 DOWNTO 0) := X"24";
      key_4 :              STD_LOGIC_VECTOR (7 DOWNTO 0) := X"25";
      key_R :              STD_LOGIC_VECTOR (7 DOWNTO 0) := X"2D";
      key_T :              STD_LOGIC_VECTOR (7 DOWNTO 0) := X"2C";
      key_6 :              STD_LOGIC_VECTOR (7 DOWNTO 0) := X"36";
      key_Y :              STD_LOGIC_VECTOR (7 DOWNTO 0) := X"35";
      key_7 :              STD_LOGIC_VECTOR (7 DOWNTO 0) := X"3D";
      key_U :              STD_LOGIC_VECTOR (7 DOWNTO 0) := X"3C";
      key_8 :              STD_LOGIC_VECTOR (7 DOWNTO 0) := X"3E";
      key_I :              STD_LOGIC_VECTOR (7 DOWNTO 0) := X"43";
      key_O :              STD_LOGIC_VECTOR (7 DOWNTO 0) := X"44";
      key_0 :              STD_LOGIC_VECTOR (7 DOWNTO 0) := X"45";
      key_P :              STD_LOGIC_VECTOR (7 DOWNTO 0) := X"4D";
      key_lines :          STD_LOGIC_VECTOR (7 DOWNTO 0) := X"4E";
      key_brack_open :     STD_LOGIC_VECTOR (7 DOWNTO 0) := X"54";
      key_brack_closed :   STD_LOGIC_VECTOR (7 DOWNTO 0) := X"5B";
      key_BACK :           STD_LOGIC_VECTOR (7 DOWNTO 0) := X"41"

   );

   PORT(
      reset      : IN  STD_LOGIC;                    -- Reset active is '0'
      key        : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
      pulslength : OUT INTEGER RANGE 0 TO 8191       -- 16 bit size to store up to maximal 56818
   );
END key2pulselength;
--------------------------------------------------------------------
ARCHITECTURE implementation1 OF key2pulselength IS

BEGIN

   divisor_selecor : PROCESS (key, reset)

   BEGIN
      IF reset = '0' THEN
         pulslength <= 0;
      ELSE

         CASE key IS                -- select frequencie of sound depended on key input
            WHEN key_TAB =>
               pulslength <= 7102;  -- set the pulslength

            WHEN key_1 =>
               pulslength <= 6704;  -- set the pulslength

            WHEN key_Q =>
               pulslength <= 6327;  -- set the pulslength

            WHEN key_W =>
               pulslength <= 5972;  -- set the pulslength

            WHEN key_3 =>
               pulslength <= 5637;  -- set the pulslength

            WHEN key_E =>
               pulslength <= 5321;  -- set the pulslength

            WHEN key_4 =>
               pulslength <= 5022;  -- set the pulslength

            WHEN key_R =>
               pulslength <= 4740;  -- set the pulslength

            WHEN key_T =>
               pulslength <= 4474;  -- set the pulslength

            WHEN key_6 =>
               pulslength <= 4223;  -- set the pulslength

            WHEN key_Y =>
               pulslength <= 3986;  -- set the pulslength

            WHEN key_7 =>
               pulslength <= 3762;  -- set the pulslength

            WHEN key_U =>
               pulslength <= 3551;  -- set the pulslength

            WHEN key_8 =>
               pulslength <= 3352;  -- set the pulslength

            WHEN key_I =>
               pulslength <= 3164;  -- set the pulslength

            WHEN key_O =>
               pulslength <= 2986;  -- set the pulslength

            WHEN key_0 =>
               pulslength <= 2819;  -- set the pulslength

            WHEN key_P =>
               pulslength <= 2660;  -- set the pulslength

            WHEN key_lines =>
               pulslength <= 2511;  -- set the pulslength

            WHEN key_brack_open =>
               pulslength <= 2370;  -- set the pulslength

            WHEN key_brack_closed =>
               pulslength <= 2237;  -- set the pulslength

            WHEN key_BACK =>
               pulslength <= 2112;  -- set the pulslength

            WHEN OTHERS =>
               pulslength <= 0;     -- when no key is pressed set pulslength to 0
         END CASE;

      END IF;
   END PROCESS ;


END implementation1;
--------------------------------------------------------------------
