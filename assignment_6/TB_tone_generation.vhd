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
-- Generated on "05/27/2023 14:18:31"
                                                            
-- Vhdl Test Bench template for design  :  tone_generation
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY tone_generation_vhd_tst IS
END tone_generation_vhd_tst;
ARCHITECTURE tone_generation_arch OF tone_generation_vhd_tst IS
-- constants                                                 
CONSTANT cycle : TIME := 20 ns;
-- signals                                                   
SIGNAL audiol : STD_LOGIC;
SIGNAL audior : STD_LOGIC;
SIGNAL clk : STD_LOGIC;
SIGNAL key : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL reset : STD_LOGIC;
COMPONENT tone_generation
	PORT (
	audiol : BUFFER STD_LOGIC;
	audior : BUFFER STD_LOGIC;
	clk : IN STD_LOGIC;
	key : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	reset : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : tone_generation
	PORT MAP (
-- list connections between master ports and signals
	audiol => audiol,
	audior => audior,
	clk => clk,
	key => key,
	reset => reset
	);
	clock_process : process
	begin

		clk <= '0';
		wait for cycle/2;
		clk <= '1';
		wait for cycle/2;
		
	end process clock_process;
   	
	
	init : PROCESS                                               
	-- variable declarations                                     
	BEGIN                                                        
			  -- code that executes only once
	reset <= '0';
	WAIT FOR 20 ns;
	reset <= '1';
	
wait for 20 ns;
	-- key <= hex 0; 
	key <= "00000000"; 				-- key "-" (0x00) is pressed;

	wait for 10 ms;

	-- hex 0D;
	key <= "00001101"; 				-- key "TAB" (0x5A) is pressed;
	wait for 10 ms;

	-- hex 26; 
	key <= "00100110"; 				-- key "3#" (0x5A) is pressed;
	wait for 10 ms;

	-- hex 3C; 
	key <= "00111100"; 				-- key "A+" (0x5A) is pressed;
	wait for 10 ms;

	-- hex 54; 
	key <= "01010100"; 				-- key "E+" (0x5A) is pressed;
	wait for 10 ms;
   
	-- hex 5D.
	key <= "01011101"; 				-- key "-" (0x5A) is pressed;
	wait for 10 ms;
   
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
END tone_generation_arch;
