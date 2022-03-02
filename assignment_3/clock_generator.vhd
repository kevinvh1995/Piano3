--------------------------------------------------------------------
--! \file      clock_generator.vhd
--! \date      see top of 'Version History'
--! \brief     Clock generator 
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
--! 001    |24-3-2015  |WLGRW   |Inital version
--! 002    |13-2-2020  |WLGRW   |Update to MAX10 on DE10-Lite board
--! 003    |6-4-2020   |WLGRW   |Cleanup for assignment
--! 004    |6-7-2020   |WLGRW   |Added a todo not to modify the header of the file to represent teh students that worked on the file.
--!
--!
--! # Assignment  3: clock_generator
--!
--! This clock_generator wil devide the system clock of 50 MHz 1, 1/2, 1/4, 1/8, 1/16, 1/32 and 1/64 times
--! This will produce frequencies of: 50MHz, 25 MHz, 12.5MHz, 6,25MHz, 3,125MHz, 1,5625MHz or 0,78125MHz.
--! 
--! 
--------------------------------------------------------------------
LIBRARY ieee;
USE     ieee.STD_LOGIC_1164.all;
USE     ieee.numeric_std.all;
--------------------------------------------------------------------
ENTITY clock_generator IS
   PORT(
      reset   : in  STD_LOGIC;                    -- Reset active is '0'
      clk     : in  STD_LOGIC;                    -- 50MHz clock
      key     : in  STD_LOGIC_VECTOR(7 DOWNTO 0);
      clk_div : out STD_LOGIC
   );
END clock_generator;
--------------------------------------------------------------------
ARCHITECTURE LogicFunction OF clock_generator IS
   --! add a "typedef" for enum state_type.
   --! add SIGNALS 
   --! add a signal of type state_type for the FSM
BEGIN

--! #### clock devider based on a integer counter: #### 
--! The signal divider_output receives the integer
--! Per line on the vector a devided signal of the clock is avaialable
--! lsb is devide by 1, msb is devide by 64

   devider : PROCESS (clk, reset)
      --! use a variable for your counter
   BEGIN
      
      --! Implement here the counter
     
   END PROCESS;

--! #### state_decoder ####
--! this PROCESS is PROCESSing state changes each clk and executing async reset.
--! the PROCESS will handle coninous pressing a key as well.

   state_decoder: PROCESS (clk, reset, key) is -- PROCESS watching reset and system clock
   BEGIN
      
      --! implement  here the state decoder
     
   END PROCESS;                  -- END PROCESS input_decoder

--! #### input_decoder #### 
--! this PROCESS contains the tests and conditions for each state

   input_decoder : PROCESS ( key ) -- add state SIGNAL to watch-list
   BEGIN
      
      --! Implement here the input ecoder
     
   END PROCESS;
      
--! #### state_decoder ####
--! this PROCESS is performing actions that apply for each state
--! selector logic: select the divided clock signal from the clock devider.

   output_decoder : PROCESS ( clk) -- add divider_output SIGNAL to watch-list
   BEGIN   
      
      --! Implement here the output decoder
     
   END PROCESS;
   
END LogicFunction;
--------------------------------------------------------------------