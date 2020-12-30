-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "03/24/2015 21:45:22"
                                                            
-- Vhdl Test Bench template for design  :  clock_generator
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

-- \todo Students that submit this code have to complete their details:
--
-- - Student 1 name         : 
-- - Student 1 studentnumber: 
-- - Student 1 email address: 
--
-- - Student 2 name         : 
-- - Student 2 studentnumber: 
-- - Student 2 email address: 
--

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

-- entity
ENTITY clock_generator_vhd_tst IS
END clock_generator_vhd_tst;

-- architecture
ARCHITECTURE clock_generator_arch OF clock_generator_vhd_tst IS

-- constants 
CONSTANT cycle : TIME := 20 ns;

-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL clk_div : STD_LOGIC;
SIGNAL key : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL reset : STD_LOGIC;

COMPONENT clock_generator
	PORT (
	clk : IN STD_LOGIC;
	clk_div : OUT STD_LOGIC;
	key : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	reset : IN STD_LOGIC
	);
END COMPONENT;

BEGIN
	i1 : clock_generator
	PORT MAP (
				-- list connections between master ports and signals
				clk => clk,
				clk_div => clk_div,
				key => key,
				reset => reset
				);
	
	-- Clock generator at 50 MHz
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
	
	wait for 5000 ns;
	-- send keystroke up (Z)
	key <= "01011010"; 				-- key "Z" (0x5A) is pressed;
	wait for 2000 ns;
	key <= "00000000"; 				-- key "Z" (0x5A) is pressed;
	wait for 3000 ns;
	-- send keystroke up (Z)
	key <= "01011010"; 				-- key "Z" (0x5A) is pressed;
	wait for 2000 ns;
	key <= "00000000"; 				-- key "Z" (0x5A) is pressed;
	wait for 3000 ns;
	-- send keystroke up (Z)
	key <= "01011010"; 				-- key "Z" (0x5A) is pressed;
	wait for 2000 ns;
	key <= "00000000"; 				-- key "Z" (0x5A) is pressed;
	wait for 3000 ns;
	-- send keystroke up (Z)
	key <= "01011010"; 				-- key "Z" (0x5A) is pressed;
	wait for 2000 ns;
	key <= "00000000"; 				-- key "Z" (0x5A) is pressed;
	wait for 3000 ns;
	-- send keystroke down (A)
	key <= "01010010"; 				-- key "A" (0x52) is pressed;
	wait for 2000 ns;
	key <= "00000000"; 				-- key "Z" (0x5A) is pressed;
	wait for 3000 ns;
	-- send keystroke down (A)
	key <= "01010010"; 				-- key "A" (0x52) is pressed;
	wait for 2000 ns;
	key <= "00000000"; 				-- key "Z" (0x5A) is pressed;
	wait for 3000 ns;
	-- send keystroke down (A)
	key <= "01010010"; 				-- key "A" (0x52) is pressed;
	wait for 2000 ns;
	key <= "00000000"; 				-- key "Z" (0x5A) is pressed;
	wait for 3000 ns;
	-- send keystroke down (A)
	key <= "01010010"; 				-- key "A" (0x52) is pressed;
	wait for 2000 ns;
	key <= "00000000"; 				-- key "Z" (0x5A) is pressed;
	wait for 3000 ns;
	-- send keystroke down (A)
	key <= "01010010"; 				-- key "A" (0x52) is pressed;
	wait for 2000 ns;
	key <= "00000000"; 				-- key "Z" (0x5A) is pressed;
	wait for 3000 ns;
	-- send keystroke down (A)
	key <= "01010010"; 				-- key "A" (0x52) is pressed;
	wait for 2000 ns;
	key <= "00000000"; 				-- key "Z" (0x5A) is pressed;
	wait for 3000 ns;
	-- send keystroke down (A)
	key <= "01010010"; 				-- key "A" (0x52) is pressed;
	wait for 2000 ns;
	key <= "00000000"; 				-- key "Z" (0x5A) is pressed;
	wait for 3000 ns;
	-- send keystroke up (Z)
	key <= "01011010"; 				-- key "Z" (0x5A) is pressed;
	wait for 2000 ns;
	key <= "00000000"; 				-- key "Z" (0x5A) is pressed;
	wait for 3000 ns;
	-- send keystroke up (Z)
	key <= "01011010"; 				-- key "Z" (0x5A) is pressed;
	wait for 2000 ns;
	key <= "00000000"; 				-- key "Z" (0x5A) is pressed;
	wait for 3000 ns;
	-- send keystroke up (Z)
	key <= "01011010"; 				-- key "Z" (0x5A) is pressed;
	wait for 2000 ns;
	key <= "00000000"; 				-- key "Z" (0x5A) is pressed;
	wait for 3000 ns;
	
	
	
	
	-- send keystroke up (Z)
	key <= "01011010"; 				-- key "Z" (0x5A) is pressed;
	wait for 5120 ns;
	-- send keystroke up (Z)
	key <= "01011010"; 				-- key "Z" (0x5A) is pressed;
	wait for 5120 ns;
	-- send keystroke up (Z)
	key <= "01011010"; 				-- key "Z" (0x5A) is pressed;
	wait for 5120 ns;
	-- send keystroke up (Z)
	key <= "01011010"; 				-- key "Z" (0x5A) is pressed;
	wait for 5120 ns;
	-- send keystroke down (A)
	key <= "01010010"; 				-- key "A" (0x52) is pressed;
	wait for 5120 ns;
	-- send keystroke down (A)
	key <= "01010010"; 				-- key "A" (0x52) is pressed;
	wait for 5120 ns;
	-- send keystroke down (A)
	key <= "01010010"; 				-- key "A" (0x52) is pressed;
	wait for 5120 ns;
	-- send keystroke down (A)
	key <= "01010010"; 				-- key "A" (0x52) is pressed;
	wait for 5120 ns;
	-- send keystroke down (A)
	key <= "01010010"; 				-- key "A" (0x52) is pressed;
	wait for 5120 ns;
	-- send keystroke down (A)
	key <= "01010010"; 				-- key "A" (0x52) is pressed;
	wait for 5120 ns;
	-- send keystroke down (A)
	key <= "01010010"; 				-- key "A" (0x52) is pressed;
	wait for 5120 ns;
	-- send keystroke up (Z)
	key <= "01011010"; 				-- key "Z" (0x5A) is pressed;
	wait for 5120 ns;
	-- send keystroke up (Z)
	key <= "01011010"; 				-- key "Z" (0x5A) is pressed;
	wait for 5120 ns;
	-- send keystroke up (Z)
	key <= "01011010"; 				-- key "Z" (0x5A) is pressed;
	wait for 5120 ns;
			  
			  
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
END clock_generator_arch;
