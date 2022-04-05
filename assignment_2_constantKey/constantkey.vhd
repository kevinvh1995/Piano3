--------------------------------------------------------------------
--! \file      constantkey.vhd
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
--! 001    |20-3-2015  |WLGRW   |Initial version
--! 002    |28-3-2015  |WLGRW   |Corrections in output key and dig2 and dig 3
--! 003    |2-4-2015   |WLGRW   |Corrections to states to meet data stream from keyboard.
--! 004    |13-2-2020  |WLGRW   |Update to MAX10 on DE10-Lite board
--! 005    |6-7-2020   |WLGRW   |Added a todo not to modify the header of the file to represent teh students that worked on the file.
--!
--!
--!
--------------------------------------------------------------------
LIBRARY ieee;
USE     ieee.STD_LOGIC_1164.all;
--------------------------------------------------------------------
ENTITY constantkey IS
   PORT (
      reset     : IN  STD_LOGIC;                    --! reset signal active low '0'
      clk       : IN  STD_LOGIC;                    --! clock (50 MHz)
      scancode  : IN  STD_LOGIC_VECTOR(7 DOWNTO 0); --! received byte
      byte_read : IN  STD_LOGIC;                    --! Set if byte is received 
      key       : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); --! show key pressed
      dig2, 
      dig3      : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)  --! debug info, current and previous key pressed
   );
END constantkey;
--------------------------------------------------------------------
ARCHITECTURE LogicFunction OF constantkey IS

   -- Modify "typedef" for enum state_type to meet your needs
   -- Add addiditonal SIGNALs for this architecture 
   
   --! "typedef" for enum state_type.
   TYPE state_type is (
      place_holder_state_0,   -- Replace this state with a sensible name 
      place_holder_state_1    -- Replace this state with a sensible name 
                              -- Add states when required.
   );
   SIGNAL current_state, 
          next_state     : state_type; -- signals of the type state_type to hold current- and next-state
   SIGNAL memory1, 
          memory2        : STD_LOGIC_VECTOR(7 DOWNTO 0); -- temporary buffers
BEGIN

   --! The state dcoder is a PROCESS that is PROCESSing state changes 
   --! each clk and executing async reset. It will also PROCESS debug 
   --! outputs for the component.
   state_decoder: PROCESS (clk, reset) IS
   BEGIN
   
      -- Add here the VHDL code for the state_decoder
      
   END PROCESS; -- END PROCESS input_decoder

   --! The input decoder is a PROCESS that contains the tests and 
   --! conditions for each state
   input_decoder : PROCESS (current_state, scancode, byte_read)
   BEGIN

      -- Add here the VHDL code for the input_decoder of the FSM

   END PROCESS; -- END PROCESS state_decoder

   --! The output decoder ia a PROCESS that is executing actions that 
   --! apply to each individual state
   output_decoder : PROCESS (current_state, memory1)
   BEGIN   

      -- Add here the VHDL code for the output decoder 

   END PROCESS;
   
END LogicFunction;
--------------------------------------------------------------------
