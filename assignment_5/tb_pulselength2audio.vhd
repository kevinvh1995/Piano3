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
-- Generated on "05/27/2023 12:28:00"
                                                            
-- Vhdl Test Bench template for design  :  pulselength2audio
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY pulselength2audio_vhd_tst IS
END pulselength2audio_vhd_tst;
ARCHITECTURE pulselength2audio_arch OF pulselength2audio_vhd_tst IS
-- constants                                                 
CONSTANT cycle : TIME := 160 ns;
-- signals                                                   
SIGNAL audiol : STD_LOGIC;
SIGNAL audior : STD_LOGIC;
SIGNAL clk_dev : STD_LOGIC;
SIGNAL pulslength : INTEGER RANGE 0 TO 8191;
SIGNAL reset : STD_LOGIC;
COMPONENT pulselength2audio
	PORT (
	audiol : OUT STD_LOGIC;
	audior : OUT STD_LOGIC;
	clk_dev : IN STD_LOGIC;
	pulslength : IN INTEGER RANGE 0 TO 8191;
	reset : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : pulselength2audio
	PORT MAP (
-- list connections between master ports and signals
	audiol => audiol,
	audior => audior,
	clk_dev => clk_dev,
	pulslength => pulslength,
	reset => reset
	);
   
   clock_process : PROCESS
   BEGIN

      clk_dev <= '0';
      WAIT FOR cycle/2;
      clk_dev <= '1';
      WAIT FOR cycle/2;

   END PROCESS clock_process;
   
init : PROCESS                                               
-- variable declarations                                     
BEGIN
   reset <= '0';
   WAIT FOR 20 ns;
   reset <= '1';
   
   WAIT FOR 1000 ns;
   pulslength <= 0;
   
   WAIT FOR 17000 ns;
   pulslength <= 100;

   WAIT FOR 170000 ns;
   pulslength <= 1000;

   WAIT FOR 1130000 ns;
   pulslength <= 7000;
   

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
END pulselength2audio_arch;
