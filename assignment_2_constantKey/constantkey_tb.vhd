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
-- Generated on "03/30/2015 19:00:31"
                                                            
-- Vhdl Test Bench template for design  :  constantkey
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

ENTITY constantkey_vhd_tst IS
END constantkey_vhd_tst;

ARCHITECTURE constantkey_arch OF constantkey_vhd_tst IS
	-- constants
	CONSTANT cycle : TIME := 20 ns;
	
	-- signals                                                   
	SIGNAL byte_read 	: STD_LOGIC;
	SIGNAL clk 			: STD_LOGIC;
	SIGNAL dig2 		: STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL dig3 		: STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL key 			: STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL reset 		: STD_LOGIC;
	SIGNAL scancode 	: STD_LOGIC_VECTOR(7 DOWNTO 0);
	
	COMPONENT constantkey PORT (
		byte_read 	: IN 	STD_LOGIC;
		clk 			: IN 	STD_LOGIC;
		dig2 			: OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		dig3 			: OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		key 			: OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		reset 		: IN 	STD_LOGIC;
		scancode 	: IN 	STD_LOGIC_VECTOR(7 DOWNTO 0)
		);
	END COMPONENT;
BEGIN
	
	-- Clock generator at 50 MHz
	clock_process : process
	begin

		clk <= '0';
		wait for cycle/2;
		clk <= '1';
		wait for cycle/2;
		
	end process clock_process;
   
	i1 : constantkey
	PORT MAP (
					-- list connections between master ports and signals
					byte_read => byte_read,
					clk => clk,
					dig2 => dig2,
					dig3 => dig3,
					key => key,
					reset => reset,
					scancode => scancode
					);
					
	init : PROCESS                                               
	-- variable declarations                                     
	BEGIN                                                        

	-- code that executes only once                      
	
	-- reset
	byte_read <= '0';
	reset <= '0';
	WAIT FOR 20 ns;
	reset <= '1';
	WAIT FOR 20 ns;
	
	-- === cycle 1 ===
	-- key stroke
	wait for 40 ns; 
	byte_read <= '0';
	wait for 50 ns;
	scancode <= "01010010"; 				-- key "A" (0x52) is pressed;
	wait for 40 ns;
	byte_read <= '1';
	
	wait for 100 ns;
	
	-- key release
	wait for 40 ns; 
	byte_read <= '0';
	wait for 50 ns;
	scancode <= "11110000"; 				-- key release;
	wait for 40 ns;
	byte_read <= '1';
	
	wait for 40 ns; 
	byte_read <= '0';
	wait for 50 ns;
	scancode <= "01010010"; 				-- key "A" (0x52) is pressed;
	wait for 50 ns;
	byte_read <= '1';
	
	wait for 100 ns;
	
	-- === cycle 2 ===
	-- key stroke
	wait for 40 ns;
	byte_read <= '0';
	wait for 50 ns;
	scancode <= "01010011"; 				-- key is pressed;
	wait for 40 ns;
	byte_read <= '1';
	
	wait for 100 ns;
	
	-- key release
	wait for 40 ns; 
	byte_read <= '0';
	wait for 50 ns;
	scancode <= "11110000"; 				-- key release;
	wait for 40 ns;
	byte_read <= '1';
	
	wait for 40 ns; 
	byte_read <= '0';
	wait for 50 ns;
	scancode <= "01010011"; 				-- key is pressed;
	wait for 40 ns;
	byte_read <= '1';
	
	
	
		
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
END constantkey_arch;
