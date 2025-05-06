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

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY showkey_vhd_tst IS
END showkey_vhd_tst;
ARCHITECTURE showkey_arch OF showkey_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL byte_read : STD_LOGIC;
SIGNAL dig0 : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL dig1 : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL kbclock : STD_LOGIC;
SIGNAL kbdata : STD_LOGIC;
SIGNAL reset : STD_LOGIC;
SIGNAL scancode : STD_LOGIC_VECTOR(7 DOWNTO 0);
COMPONENT showkey
	PORT (
	byte_read : OUT STD_LOGIC;
	dig0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	dig1 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	kbclock : IN STD_LOGIC;
	kbdata : IN STD_LOGIC;
	reset : IN STD_LOGIC;
	scancode : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : showkey
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
END showkey_arch;
