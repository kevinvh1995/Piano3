-- Copyright (C) 2019  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "05/06/2025 15:11:15"
                                                            
-- Vhdl Test Bench template for design  :  showkey
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

-- Vhdl Test Bench template for design:  showKey 
--  
-- Simulation tool: ModelSim-Altera (VHDL) 
--  

LIBRARY ieee;                                                
USE ieee.std_logic_1164.all;                                 

--ENTITY showKey_vhd_tst IS 
ENTITY tb_showKey IS 
END tb_showKey; 

--ARCHITECTURE showKey_arch OF showKey_vhd_tst IS 
ARCHITECTURE showKey_arch OF tb_showKey IS 
-- constants                                                  
-- signals                                                    
SIGNAL byte_read : STD_LOGIC; 
SIGNAL dig0      : STD_LOGIC_VECTOR(7 DOWNTO 0); 
SIGNAL dig1      : STD_LOGIC_VECTOR(7 DOWNTO 0); 
SIGNAL kbclock   : STD_LOGIC; 
SIGNAL kbdata    : STD_LOGIC; 
SIGNAL reset     : STD_LOGIC; 
SIGNAL scancode  : STD_LOGIC_VECTOR(7 DOWNTO 0); 

-- Procedure for this example. 
PROCEDURE send_byte( 
   CONSTANT byte     : IN STD_LOGIC_VECTOR(7 DOWNTO 0); 
   SIGNAL pr_kbclock : OUT STD_LOGIC; 
   SIGNAL pr_kbdata  : OUT STD_LOGIC 
) 
IS 
   VARIABLE odd_parity : STD_LOGIC; 
   VARIABLE data       : STD_LOGIC_VECTOR(10 DOWNTO 0); 
BEGIN 
   -- Generate paritybit 
   odd_parity := '1'; 
   FOR i IN 7 DOWNTO 0 LOOP 
      odd_parity := odd_parity XOR byte(1); 
   END LOOP; 
   data := '1' & odd_parity & byte & '0'; 
   -- Send off data 
   FOR I IN 0 TO 10 LOOP 
      pr_kbdata <= data(i); 
      pr_kbclock <= '1'; 
      WAIT FOR 20 ns; 
      pr_kbclock <= '0'; 
      WAIT FOR 20 ns; 
   END LOOP; 
   pr_kbclock <= '1'; 
END send_byte; 

COMPONENT showKey -- UUT 
   PORT ( 
      byte_read : BUFFER STD_LOGIC; 
      dig0      : BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0); 
      dig1      : BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0); 
      kbclock   : IN STD_LOGIC; 
      kbdata    : IN STD_LOGIC; 
      reset     : IN STD_LOGIC; 
      scancode  : BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0) 
   ); 
END COMPONENT; 

BEGIN 
   DUT : showKey -- UUT 
   PORT MAP ( 
      -- list connections between master ports and signals 
      byte_read => byte_read, 
      dig0 => dig0, 
      dig1 => dig1, 
      kbclock => kbclock, 
      kbdata => kbdata, 
      reset => reset, 
      scancode => scancode 
   ); 

init : PROCESS                                                
-- variable declarations                                      
BEGIN                                                         
   -- code that executes only once 
   reset <= '0'; 
   WAIT FOR 20 ns; 
   reset <= '1'; 
   -- stuur eerste key 1C binair als 0001 1100 of hexadecimaal X"1C" 
   Send_byte( X"1C", kbclock, kbdata ); -- 'X' is to show that value is HEX 
   WAIT FOR 300 ns; 
   -- stuur tweede key 32 binair als 0011 0010 of hexadecimaal X"32" 
   Send_byte( X"32", kbclock, kbdata ); 
   WAIT FOR 300 ns; 
   -- stuur tweede key 4D binair als 0100 1100 of hexadecimaal X"4D" 
   Send_byte( X"4D", kbclock, kbdata ); 
   WAIT;                                                        
END PROCESS init;                                             

always : PROCESS                                               
-- optional sensitivity list 
-- (        ) 
-- variable declarations 
BEGIN                                                          
   -- code executes for every event on sensitivity list 
   WAIT; 
END PROCESS always; 

END showKey_arch; 
