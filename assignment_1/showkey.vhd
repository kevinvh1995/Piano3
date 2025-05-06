--------------------------------------------------------------------
--! \file      showkey.vhd
--! \date      see top of 'Version History'
--! \brief     Showkey
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
--! 001    |20-3-2020  |WLGRW   |Inital version
--! 002    |6-7-2020   |WLGRW   |Added a todo not to modify the header of the file to represent teh students that worked on the file.
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
--------------------------------------------------------------------
ARCHITECTURE LogicFunction OF showkey IS

    -- Add declarations
    signal bit_counter 		: integer range 0 to 10 := 0;
    signal shift_register 	: std_logic_vector(10 downto 0) := (others => '0');
	 signal dig0_register 	: std_logic_vector(7 downto 0) := (others => '0');
    signal dig1_register	: std_logic_vector(7 downto 0) := (others => '0');


BEGIN 

    process(kbclock, reset)
    begin
        if reset = '0' then
            bit_counter <= 0;
            shift_register <= (others => '0');
            dig0_register <= (others => '0');
            dig1_register <= (others => '0');
            scancode <= (others => '0');
            byte_read <= '0';
        
        elsif falling_edge(kbclock) then 

            if bit_counter = 0 then
                byte_read <= '0';
            end if;

            if bit_counter <= 10 then
                shift_register(bit_counter) <= kbdata;
                bit_counter <= bit_counter + 1;
            end if;
					 
            if bit_counter = 10 then
                scancode <= shift_register(8 downto 1);						-- Set bitstring into shift register

                dig1_register <= dig0_register;
                dig0_register(3 downto 0) <= shift_register(4 downto 1); -- Low nibble
                dig0_register(7 downto 4) <= shift_register(8 downto 5); -- High nibble 

                byte_read 		<= '1';
                bit_counter 	<= 0;
            end if;
        end if;
    end process;

    -- Drive outputs from internal registers
    dig0 <= dig0_register;
    dig1 <= dig1_register;

END ARCHITECTURE LogicFunction;

