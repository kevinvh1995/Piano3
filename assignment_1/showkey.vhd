--------------------------------------------------------------------
--! \file      showkey.vhd
--! \date      see top of 'Version History'
--! \brief     Showkey
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
--! 001    |20-3-2020  |WLGRW   |Inital version
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
      dig0,                                         -- show key pressed on display in hex (MSB)
      dig1      : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); -- show key pressed on display in hex (LSB)
      scancode  : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); -- received byte
      byte_read : OUT std_logic                     -- '1' if byte received 
   );
END showkey;
--------------------------------------------------------------------
ARCHITECTURE LogicFunction OF showkey IS

      -- Add here the declarations for showkey

BEGIN 

      -- Add here the VHDL code for showkey

end LogicFunction;
--------------------------------------------------------------------
