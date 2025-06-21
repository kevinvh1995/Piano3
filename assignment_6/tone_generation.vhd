--------------------------------------------------------------------
--! \file      tone_generation.vhd
--! \date      see top of 'Version History'
--! \brief     combination of components to tone_generation
--! \author    [Redacted]
--! \copyright HAN TF ELT/ESE Arnhem
--!
--! \todo Students that submit this code have to complete their details:
--!
--! Student 1 name         : [Redacted]
--! Student 1 studentnumber: [Redacted]
--! Student 1 email address: [Redacted]
--!
--! Student 2 name         : [Redacted]
--! Student 2 studentnumber: [Redacted]
--! Student 2 email address: [Redacted]
--!
--! Version History:
--! ----------------
--!
--! Nr:    |Date:      |Author: |Remarks:
--! -------|-----------|--------|-----------------------------------
--! 001    |22-3-2015  |[Redacted]   |Inital version
--! 002    |13-2-2020  |[Redacted]   |Update to MAX10 on DE10-Lite board
--! 003    |7-4-2020   |[Redacted]   |Modification for use as assignment
--! 004    |6-7-2020   |[Redacted]   |Added a todo not to modify the header of the file to represent teh students that worked on the file.
--! 005    |30-5-2022  |[Redacted]   |Corrected documentation
--!
--! # assignment 6: tone_generation
--!
--! tone_generation combines the following components:
--!  - clock_generator
--!  - key2pulselength
--!  - pulselength2audio
--!
--!
--------------------------------------------------------------------
LIBRARY ieee;
USE     ieee.STD_LOGIC_1164.all;
USE     ieee.STD_LOGIC_unsigned.all;
--------------------------------------------------------------------
ENTITY tone_generation IS
   PORT(
      clk     : IN  STD_LOGIC;                     -- 50 MHz clock.
      reset   : IN  STD_LOGIC;                     -- reset '0' active
      key     : IN  STD_LOGIC_VECTOR(7 downto 0);  -- kex character received from keyboard
      audiol,
      audior  : OUT STD_LOGIC                      -- Audio output
   );
END tone_generation;
--------------------------------------------------------------------
ARCHITECTURE tone_generation_struct OF tone_generation IS

   --! Add here SIGNALS required to interconnect COMPONENTS
   SIGNAL temp_clk_div     : STD_LOGIC;
   SIGNAL temp_pulslenght  : INTEGER RANGE 0 TO 8191;
BEGIN

   L_clock_generator : ENTITY work.clock_generator PORT MAP(

      clk   => clk,
      reset => reset,
      key   => key,
      clk_div  => temp_clk_div

   );

   L_key2pulselength : ENTITY work.key2pulselength PORT MAP(

      reset       => reset,
      key         => key,
      pulslength  => temp_pulslenght

   );

   L_pulselength2audio : ENTITY work.pulselength2audio PORT MAP(

      reset       => reset,
      clk_dev     => temp_clk_div,
      pulslength  => temp_pulslenght,
      audiol      => audiol,
      audior      => audior
   );


   --! combine here COMPONENTS clock_domain_crossing,
   --! showkey and constantkey using structural VHDL

END tone_generation_struct;
--------------------------------------------------------------------
