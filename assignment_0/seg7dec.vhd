--------------------------------------------------------------------
--! \file      seg7dec.vhd
--! \date      see top of 'Version History'
--! \brief     7-segment driver without control of dot 
--! \author    Remko Welling (WLGRW) remko.welling@han.nl
--! \copyright HAN TF ELT/ESE Arnhem 
--!
--! \todo Students that submit this code have to complete their details:
--!
--! Student 1 name         : 
--! Student 1 studentnumber: 
--! Student 1 email address: 
--!
--! Student 2 name         : 
--! Student 2 studentnumber: 
--! Student 2 email address: 
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
        -- Segment patterns for Common Anode display (0=ON, 1=OFF)
        -- Segments: display(0)=a, display(1)=b, ..., display(6)=g
        hex_0   : STD_LOGIC_VECTOR(0 TO 6) := "0000001"; -- 0: a,b,c,d,e,f ON; g OFF
        hex_1   : STD_LOGIC_VECTOR(0 TO 6) := "1001111"; -- 1: b,c ON
        hex_2   : STD_LOGIC_VECTOR(0 TO 6) := "0010010"; -- 2: a,b,d,e,g ON
        hex_3   : STD_LOGIC_VECTOR(0 TO 6) := "0000110"; -- 3: a,b,c,d,g ON
        hex_4   : STD_LOGIC_VECTOR(0 TO 6) := "1001100"; -- 4: b,c,f,g ON
        hex_5   : STD_LOGIC_VECTOR(0 TO 6) := "0100100"; -- 5: a,c,d,f,g ON
        hex_6   : STD_LOGIC_VECTOR(0 TO 6) := "0100000"; -- 6: a,c,d,e,f,g ON
        hex_7   : STD_LOGIC_VECTOR(0 TO 6) := "0001111"; -- 7: a,b,c ON
        hex_8   : STD_LOGIC_VECTOR(0 TO 6) := "0000000"; -- 8: a,b,c,d,e,f,g ON
        hex_9   : STD_LOGIC_VECTOR(0 TO 6) := "0000100"; -- 9: a,b,c,d,f,g ON
        hex_A   : STD_LOGIC_VECTOR(0 TO 6) := "0001000"; -- A: a,b,c,e,f,g ON
        hex_B   : STD_LOGIC_VECTOR(0 TO 6) := "1100000"; -- b: c,d,e,f,g ON
        hex_C   : STD_LOGIC_VECTOR(0 TO 6) := "0110001"; -- C: a,d,e,f ON (Standard C)
                                                         -- Your example "1110010" for C would be: a,b,c OFF; d ON; e OFF; f ON; g OFF
        hex_D   : STD_LOGIC_VECTOR(0 TO 6) := "1000010"; -- d: b,c,d,e,g ON
        hex_E   : STD_LOGIC_VECTOR(0 TO 6) := "0110000"; -- E: a,d,e,f,g ON
        hex_F   : STD_LOGIC_VECTOR(0 TO 6) := "0111000"; -- F: a,e,f,g ON
        hex_off : STD_LOGIC_VECTOR(0 TO 6) := "1111111"; -- All segments OFF

        -- Input value constants for readability in WITH SELECT
        input_0 : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
        input_1 : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0001";
        input_2 : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0010";
        input_3 : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0011";
        input_4 : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0100";
        input_5 : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0101";
        input_6 : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0110";
        input_7 : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0111";
        input_8 : STD_LOGIC_VECTOR(3 DOWNTO 0) := "1000";
        input_9 : STD_LOGIC_VECTOR(3 DOWNTO 0) := "1001";
        input_A : STD_LOGIC_VECTOR(3 DOWNTO 0) := "1010";
        input_B : STD_LOGIC_VECTOR(3 DOWNTO 0) := "1011";
        input_C : STD_LOGIC_VECTOR(3 DOWNTO 0) := "1100";
        input_D : STD_LOGIC_VECTOR(3 DOWNTO 0) := "1101";
        input_E : STD_LOGIC_VECTOR(3 DOWNTO 0) := "1110";
        input_F : STD_LOGIC_VECTOR(3 DOWNTO 0) := "1111"
    );
    PORT (
        C       : IN  STD_LOGIC_VECTOR(3 DOWNTO 0); -- 4-bit binary code for 0-F
        display : OUT STD_LOGIC_VECTOR(0 TO 7)      -- display(0 TO 6) for segments a-g, display(7) for dot
    );
END ENTITY seg7dec;
--------------------------------------------------------------------
ARCHITECTURE implementation OF seg7dec IS
BEGIN
    -- Dot is segment 7. Fixed to OFF ('1' for common anode) for this MVP.
    display(7) <= '1';

    -- Decoder for segments 0 through 6 (a through g)
    WITH C SELECT
        display(0 TO 6) <= hex_0 WHEN input_0,
                             hex_1 WHEN input_1,
                             hex_2 WHEN input_2,
                             hex_3 WHEN input_3,
                             hex_4 WHEN input_4,
                             hex_5 WHEN input_5,
                             hex_6 WHEN input_6,
                             hex_7 WHEN input_7,
                             hex_8 WHEN input_8,
                             hex_9 WHEN input_9,
                             hex_A WHEN input_A,
                             hex_B WHEN input_B,
                             hex_C WHEN input_C, -- Uses the GENERIC hex_C. Verify this pattern.
                             hex_D WHEN input_D,
                             hex_E WHEN input_E,
                             hex_F WHEN input_F,
                             hex_off WHEN OTHERS; -- All segments off for any other input
END ARCHITECTURE implementation;
--------------------------------------------------------------------
