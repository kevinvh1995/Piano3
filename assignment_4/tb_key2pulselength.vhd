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
-- Generated on "03/28/2015 09:56:59"
                                                            
-- Vhdl Test Bench template for design  :  key2pulselength
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
Use     IEEE.std_logic_textio.all;
Use     STD.textio.all;

ENTITY key2pulselength_vhd_tst IS
END key2pulselength_vhd_tst;

ARCHITECTURE key2pulselength_arch OF key2pulselength_vhd_tst IS
-- constants                                                 
-- signals                                                   
	SIGNAL key 			: STD_LOGIC_VECTOR(7 DOWNTO 0);
	-- SIGNAL pulslength : STD_LOGIC_VECTOR(15 DOWNTO 0);
	SIGNAL pulslength : integer range 0 to 65535;
	SIGNAL reset 		: STD_LOGIC;

	COMPONENT key2pulselength
		PORT (
		key 				: IN 	STD_LOGIC_VECTOR(7 DOWNTO 0);
		-- pulslength 		: OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		pulslength 		: OUT integer range 0 to 65535;
		reset 			: IN 	STD_LOGIC
		);
	END COMPONENT;
	
	signal OK : boolean;

BEGIN

	i1 : key2pulselength -- DUT
	PORT MAP (
				-- list connections between master ports and signals
				key => key,
				pulslength => pulslength,
				reset => reset
				);
	
	init : PROCESS                                               
	-- variable declarations                                     
	BEGIN                                                        
			-- code that executes only once
			-- Simulatie resultaat met: reset; en key <= hex 0; hex A; hex Z; hex 0D; hex 26; hex 3C; hex 54; hex 5D.
	-- reset		
	reset <= '0';
	OK <= true;
	WAIT FOR 20 ns;
	reset <= '1';
	
	wait for 20 ns;
	-- key <= hex 0; 
	key <= "00000000"; 				-- key "-" (0x00) is pressed;
	
	wait for 1 ns;
	if (pulslength /= 0) then
		OK <= false;
	end if;
	
	wait for 100 ns;
	-- hex A; 
	key <= "01010010"; 				-- key "A" (0x52) is pressed;
	wait for 100 ns;
	
	wait for 1 ns;
	if (pulslength /= 0) then
		OK <= false;
	end if;
	
	-- hex Z;
	key <= "01011010"; 				-- key "Z" (0x5A) is pressed;
	wait for 100 ns;
	
	wait for 1 ns;
	if (pulslength /= 0) then
		OK <= false;
	end if;
	
	-- hex 0D;
	key <= "00001101"; 				-- key "TAB" (0x5A) is pressed;
	wait for 100 ns;
	
	wait for 1 ns;
	if (pulslength /= 56818) then
		OK <= false;
	end if;
	
	-- hex 26; 
	key <= "00100110"; 				-- key "3#" (0x5A) is pressed;
	wait for 100 ns;
	
	wait for 1 ns;
	if (pulslength /= 45097) then
		OK <= false;
	end if;
	
	-- hex 3C; 
	key <= "00111100"; 				-- key "A+" (0x5A) is pressed;
	wait for 100 ns;
	
	wait for 1 ns;
	if (pulslength /= 28409) then
		OK <= false;
	end if;
	
	-- hex 54; 
	key <= "01010100"; 				-- key "E+" (0x5A) is pressed;
	wait for 100 ns;
	
	wait for 1 ns;
	if (pulslength /= 18961) then
		OK <= false;
	end if;
	
	-- hex 5D.
	key <= "01011101"; 				-- key "-" (0x5A) is pressed;
	wait for 100 ns;

	wait for 1 ns;
	if (pulslength /= 00) then
		OK <= false;
	end if;
	
		  
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
END key2pulselength_arch;
