--------------------------------------------------------------------
--! \file      showkey.vhd
--! \date      see top of 'Version History'
--! \brief     Showkey
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
--! 001    |20-3-2020  |WLGRW   |Inital version
--! 002    |6-7-2020   |WLGRW   |Added a todo not to modify the header of the file to represent teh students that worked on the file.
--!
--!
--!
--!
--! # Opdracht 1: Deelopdracht showkey
--!
--! showkey will convert any PS2 Keyboard formatted serial received byte
--! in to a 8-byte parallel word on port 'scancode' When a correct byte
--! is presented at 'scancode' byte_read will present a latch signal
--! eg. '0,1'
--!
--! \verbatim
--!                            +-----------------+
--!                            |                 |
--!                   reset -->|                 |--> dig0[7..0]
--!                            |                 |
--!                            |                 |--> dig1[7..0]
--! kbclock (50 MHz domain) -->|     showkey     |
--!                            |                 |--> scancode[7..0]
--!                            |                 |
--!  kbdata (50 MHz domain) -->|                 |--> byte_read
--!                            |                 |
--!                            +-----------------+
--!
--! Figure: component showkey
--!
--! \endverbatim
--!
--! \todo Complete documentation
--!
--------------------------------------------------------------------
LIBRARY ieee;
USE     ieee.std_logic_1164.all,
        ieee.numeric_std.all;    -- For unsigned variable
--------------------------------------------------------------------
ENTITY showkey IS
   PORT(
      reset     : IN  std_logic;                    -- reset signal active low '0'
      kbclock   : IN  std_logic;                    -- clock from keyboard in 50 MHz domain
      kbdata    : IN  std_logic;                    -- serial data from the keyboard in 50 MHz domain
      dig0,                                         -- show key pressed on display in hex;
      dig1      : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); -- dig0 (MSByte) dig1 (LSByte)
      scancode  : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); -- received byte
      byte_read : OUT std_logic                     -- '1' if byte received
   );
END showkey;
--------------------------------------------------------------------
ARCHITECTURE LogicFunction OF showkey IS

      -- Add here the declarations for showkey

      SIGNAL   ps2_frame        : STD_LOGIC_VECTOR(10 DOWNTO 0);   --the complete incomming ps2 data
      SIGNAL   temp_data        : STD_LOGIC_VECTOR(10 DOWNTO 0);   --temporary storage regiser for data

BEGIN
   ps2IN: PROCESS (reset, kbclock, kbdata, temp_data) IS

      VARIABLE bit_counter : INTEGER RANGE 0 TO 15 := 0;    --Counter to to count the bits recieved and to place them in to the correct slot

BEGIN
   IF reset = '0' THEN
      byte_read   <= '0';     --reset byte_read
      bit_counter :=  0 ;     --reset counter

   ELSIF falling_edge(kbclock) THEN
      IF bit_counter = 0 THEN
         byte_read <= '0';

      END IF;

      temp_data(bit_counter) <= kbdata;   -- place the incomming bit in the temp_data
      bit_counter := bit_counter + 1;     -- add one to the bit counter

      IF bit_counter > 10 THEN      -- check if the number of incomming bits are greater then 10
         bit_counter :=  0;         -- bit_counter reset
         byte_read   <= '1';        -- byte is read
      END IF;
   END IF;

ps2_frame <= temp_data;



END PROCESS ps2In;

         scancode <= ps2_frame(8 DOWNTO 1);                                           -- assing the incomming data to scancode
         dig1     <= "0000" & ps2_frame(8 DOWNTO 5) WHEN reset = '1' ELSE "00000000"; -- debug info for in the seven seg display
         dig0     <= "0000" & ps2_frame(4 DOWNTO 1) WHEN reset = '1' ELSE "00000000"; -- debug info for in the seven seg display


end LogicFunction;
--------------------------------------------------------------------
