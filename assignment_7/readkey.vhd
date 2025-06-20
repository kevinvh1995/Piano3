
--  #########################################################################
--  #########################################################################
--  ##                                                                     ##
--  ##                                                                     ##
--  ## File readkey.vhd is delivered as is and is not part of assignments  ##
--  ##                                                                     ##
--  ##      No modification or adaptations by students are required        ##
--  ##                                                                     ##
--  #########################################################################
--  #########################################################################

--------------------------------------------------------------------
--! \file      readkey.vhd
--! \date      see top of 'Version History'
--! \brief     Read keys from keyboard
--! \author    Remko Welling (WLGRW) remko.welling@han.nl
--! \copyright HAN TF ELT/ESE Arnhem 
--!
--! Version History:
--! ----------------
--!
--! Nr:    |Date:      |Author: |Remarks:
--! -------|-----------|--------|-----------------------------------
--! 001    |22-3-2020  |WLGRW   | Removed ARCHITECTURE and added documentation Added to Git repository.
--! 002    |20-5-2020  |WLGRW   | Corrected coponent ENTITY missing
--! 003    |6-7-2020   |WLGRW   | Added a todo not to modify the header of the file to represent teh students that worked on the file.
--! 
--! readkey combines the following components:
--!  - clock_domain_crossing
--!  - showkey
--!  - constantkey
--!
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
   L_ClockDomainCrossing: ENTITY work.clock_domain_crossing PORT MAP(
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