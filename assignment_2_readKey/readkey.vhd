--------------------------------------------------------------------
--! \file      readkey.vhd
--! \date      see top of 'Version History'
--! \brief     Read keys from keyboard
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
--! 001    |22-3-2020  |WLGRW   |Removed ARCHITECTURE and added documentation
--!        |           |        |Added to Git repository.
--!
--! # Assignment 2: implementation of component readkey
--! 
--! readkey combines the following components:
--!  - clock_domain_crossing
--!  - showkey
--!  - constantkey
--! 
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
--! ## Instructions
--! 
--!  - 
--!  - 
--!  - 
--!  - 
--!    
--!    
--! 
--! ## Notes
--! 1. This code is tested on Quartus 19.1.0
--! 2. Ports n this code are not mapped to pins.


--------------------------------------------------------------------
LIBRARY ieee;
USE ieee.STD_LOGIC_1164.all;
USE ieee.STD_LOGIC_arith.all;
USE ieee.STD_LOGIC_unsigned.all;
--------------------------------------------------------------------
ENTITY readkey IS
   PORT(
      clk     : IN  STD_LOGIC;                    --! 50 MHz clock.
      reset   : IN  STD_LOGIC;                    --! reset '0'0 active
      kbclock : IN  STD_LOGIC;                    --! keyboard clock that comes with keyboard data (20 KHz domain)
      kbdata  : IN  STD_LOGIC;                    --! keyboard data (20 KHz domain)
      key     : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); --! hex character received from keyboard
      dig2,
      dig3    : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)  --! debug INfo, current and previous key pressed
      );
END readkey;
--------------------------------------------------------------------
architecture readkey_struct of readkey is
   SIGNAL C_scancode       : STD_LOGIC_VECTOR(7 DOWNTO 0);
   SIGNAL C_byte_read,
          C_byte_read_sync : STD_LOGIC; --! byte read indication by showkey 
   SIGNAL C_kbdata         : STD_LOGIC; --! keyboard serial data
   SIGNAL C_kbclock        : STD_LOGIC; --! keyboard clock
BEGIN
   
--! component Clock_domain_crossing to interface between 20 KHz and 50 MHz domain
   L_ClockDomainCrossing: work.clock_domain_crossing PORT MAP(
--    + component port
--    |              + Internal port or signal
--    |              |
      reset       => reset,
      clk         => clk,
      kbclock     => kbclock,
      kbdata      => kbdata,
      kbclocksync => C_kbclock,
      kbdatasync  => C_kbdata
   );

--! component showkey to convert serial data form keyboard in to parallel data
   L_Showkey: ENTITY work.showkey PORT MAP(
      reset       => reset, 
      kbclock     => C_kbclock,
      kbdata      => C_kbdata,
      scancode    => C_scancode,
      byte_read   => C_byte_read
   );
      
--! component constantkey that presents key data from keyboard as long as the key is pressed.
   L_Constantkey: ENTITY work.constantkey PORT MAP(
      reset       => reset,
      clk         => clk,
      scancode    => C_scancode,
      byte_read   => C_byte_read,
      key         => key,
      dig2        => dig2,
      dig3        => dig3
   );
      
END readkey_struct;