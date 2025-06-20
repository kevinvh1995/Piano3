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
-- Generated on "05/27/2023 17:16:21"
                                                            
-- Vhdl Test Bench template for design  :  piano
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY piano_vhd_tst IS
END piano_vhd_tst;
ARCHITECTURE piano_arch OF piano_vhd_tst IS
-- constants                                                 
CONSTANT cycle : TIME := 20 ns;
CONSTANT keyboard_cycle : TIME := 50000 ns;
-- signals                                                   
SIGNAL arduino_io3 : STD_LOGIC;
SIGNAL arduino_io4 : STD_LOGIC;
SIGNAL arduino_io5 : STD_LOGIC;
SIGNAL HEX0 : STD_LOGIC_VECTOR(0 TO 7);
SIGNAL HEX1 : STD_LOGIC_VECTOR(0 TO 7);
SIGNAL HEX2 : STD_LOGIC_VECTOR(0 TO 7);
SIGNAL HEX3 : STD_LOGIC_VECTOR(0 TO 7);
SIGNAL HEX4 : STD_LOGIC_VECTOR(0 TO 7);
SIGNAL HEX5 : STD_LOGIC_VECTOR(0 TO 7);
SIGNAL KEY : STD_LOGIC_VECTOR(0 TO 2);
SIGNAL LEDR : STD_LOGIC_VECTOR(0 TO 9);
SIGNAL MAX10_CLK1_50 : STD_LOGIC;

PROCEDURE send_byte(
   CONSTANT byte : IN STD_LOGIC_VECTOR(7 DOWNTO 0); 
   SIGNAL pr_kbclock : OUT STD_LOGIC; 
   SIGNAL pr_kbdata : OUT STD_LOGIC 
)
IS 
   VARIABLE odd_parity : STD_LOGIC;
   VARIABLE parity : STD_LOGIC;	
   VARIABLE data : STD_LOGIC_VECTOR(10 DOWNTO 0);
BEGIN 
-- Generate paritybit
   parity := '1';
   FOR i IN 7 DOWNTO 0 LOOP
      odd_parity := odd_parity XOR byte(1);
   END LOOP;
   data := '1' & odd_parity & byte & '0';
   -- Send off data
   FOR I IN 0 TO 9 LOOP pr_kbdata <= data(i);
      pr_kbclock <= '1';
      WAIT FOR  keyboard_cycle / 2;
      pr_kbclock <= '0';
      WAIT FOR keyboard_cycle / 2;
   END LOOP;
   pr_kbclock <= '1';
END send_byte;

COMPONENT piano
	PORT (
	arduino_io3 : OUT STD_LOGIC;
	arduino_io4 : IN STD_LOGIC;
	arduino_io5 : IN STD_LOGIC;
	HEX0 : OUT STD_LOGIC_VECTOR(0 TO 7);
	HEX1 : OUT STD_LOGIC_VECTOR(0 TO 7);
	HEX2 : OUT STD_LOGIC_VECTOR(0 TO 7);
	HEX3 : OUT STD_LOGIC_VECTOR(0 TO 7);
	HEX4 : OUT STD_LOGIC_VECTOR(0 TO 7);
	HEX5 : OUT STD_LOGIC_VECTOR(0 TO 7);
	KEY : IN STD_LOGIC_VECTOR(0 TO 2);
	LEDR : OUT STD_LOGIC_VECTOR(0 TO 9);
	MAX10_CLK1_50 : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : piano
	PORT MAP (
-- list connections between master ports and signals
	arduino_io3 => arduino_io3,
	arduino_io4 => arduino_io4,
	arduino_io5 => arduino_io5,
	HEX0 => HEX0,
	HEX1 => HEX1,
	HEX2 => HEX2,
	HEX3 => HEX3,
	HEX4 => HEX4,
	HEX5 => HEX5,
	KEY => KEY,
	LEDR => LEDR,
	MAX10_CLK1_50 => MAX10_CLK1_50
	);
   
   
   
   
	clock_process : process
	begin

		MAX10_CLK1_50 <= '0';
		wait for cycle/2;
		MAX10_CLK1_50 <= '1';
		wait for cycle/2;
		
	end process clock_process;
   
   
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
	-- variable declarations                                     
                                                        
			  -- code that executes only once
	KEY <= "000";
	WAIT FOR 20 ns;
	KEY <= "010";
   

	wait for 20 ns;
	-- hex 0D;
	Send_byte( X"0D", arduino_io4, arduino_io5 ); 				-- key "TAB" (0x5A) is pressed;
   
   wait for 10 ms;
	-- hex 0D;
   Send_byte( X"F0", arduino_io4, arduino_io5 ); 				-- key "TAB" (0x5A) is released;
	Send_byte( X"0D", arduino_io4, arduino_io5 ); 				-- key "TAB" (0x5A) is released;
   
	wait for 1 ms;
	-- hex 26; 
	Send_byte( X"26", arduino_io4, arduino_io5 ); 				-- key "3#" (0x5A) is pressed;
   
	wait for 10 ms;
	-- hex 26; 
   Send_byte( X"F0", arduino_io4, arduino_io5 ); 				-- key "3#" (0x5A) is released;
	Send_byte( X"26", arduino_io4, arduino_io5 ); 				-- key "3#" (0x5A) is released;
   
	wait for 1 ms;
	-- hex 3C; 
	Send_byte( X"3C", arduino_io4, arduino_io5 ); 				-- key "A+" (0x5A) is pressed;
   
	wait for 10 ms;
	-- hex 3C; 
   Send_byte( X"F0", arduino_io4, arduino_io5 ); 				-- key "A+" (0x5A) is released
	Send_byte( X"3C", arduino_io4, arduino_io5 ); 				-- key "A+" (0x5A) is released;
   
	wait for 1 ms;
	-- hex 54; 
	Send_byte( X"54", arduino_io4, arduino_io5 ); 				-- key "E+" (0x5A) is pressed;
   
	wait for 10 ms;
	-- hex 54; 
   Send_byte( X"F0", arduino_io4, arduino_io5 ); 				-- key "E+" (0x5A) is released;
	Send_byte( X"54", arduino_io4, arduino_io5 ); 				-- key "E+" (0x5A) is released;
  
	wait for 1 ms;
	-- hex 5D.
	Send_byte( X"5D", arduino_io4, arduino_io5 ); 				-- key "-" (0x5A) is pressed;

	wait for 10 ms;
	-- hex 5D.
   Send_byte( X"F0", arduino_io4, arduino_io5 ); 				-- key "-" (0x5A) is released;
	Send_byte( X"5D", arduino_io4, arduino_io5 ); 				-- key "-" (0x5A) is released;
   
	
   wait for 10 ms;
	Send_byte( X"1C", arduino_io4, arduino_io5 );               -- key Z (0X1C) is pressed
   
   wait for 1 ms;
   Send_byte( X"F0", arduino_io4, arduino_io5 );               -- key Z (0X1C) is released
	Send_byte( X"1C", arduino_io4, arduino_io5 );               -- key Z (0X1C) is released
	
   wait for 20 ns;
	-- key <= hex 0; 
	Send_byte( X"00", arduino_io4, arduino_io5 ); 				-- key "-" (0x00) is pressed;
   
   wait for 10 ms;
	-- key <= hex 0 released 
   Send_byte( X"F0", arduino_io4, arduino_io5 ); 				-- key "-" (0x00) is released;
	Send_byte( X"00", arduino_io4, arduino_io5 ); 				-- key "-" (0x00) is released;
   

	wait for 1 ms;
	-- hex 0D;
	Send_byte( X"0D", arduino_io4, arduino_io5 ); 				-- key "TAB" (0x5A) is pressed;
   
   wait for 10 ms;
	-- hex 0D;
   Send_byte( X"F0", arduino_io4, arduino_io5 ); 				-- key "TAB" (0x5A) is released;
	Send_byte( X"0D", arduino_io4, arduino_io5 ); 				-- key "TAB" (0x5A) is released;
   
	wait for 1 ms;
	-- hex 26; 
	Send_byte( X"26", arduino_io4, arduino_io5 ); 				-- key "3#" (0x5A) is pressed;
   
	wait for 10 ms;
	-- hex 26; 
   Send_byte( X"F0", arduino_io4, arduino_io5 ); 				-- key "3#" (0x5A) is released;
	Send_byte( X"26", arduino_io4, arduino_io5 ); 				-- key "3#" (0x5A) is released;
   
	wait for 1 ms;
	-- hex 3C; 
	Send_byte( X"3C", arduino_io4, arduino_io5 ); 				-- key "A+" (0x5A) is pressed;
   
	wait for 10 ms;
	-- hex 3C; 
   Send_byte( X"F0", arduino_io4, arduino_io5 ); 				-- key "A+" (0x5A) is released
	Send_byte( X"3C", arduino_io4, arduino_io5 ); 				-- key "A+" (0x5A) is released;
   
	wait for 1 ms;
	-- hex 54; 
	Send_byte( X"54", arduino_io4, arduino_io5 ); 				-- key "E+" (0x5A) is pressed;
   
	wait for 10 ms;
	-- hex 54; 
   Send_byte( X"F0", arduino_io4, arduino_io5 ); 				-- key "E+" (0x5A) is released;
	Send_byte( X"54", arduino_io4, arduino_io5 ); 				-- key "E+" (0x5A) is released;
  
	wait for 1 ms;
	-- hex 5D.
	Send_byte( X"5D", arduino_io4, arduino_io5 ); 				-- key "-" (0x5A) is pressed;

	wait for 10 ms;
	-- hex 5D.
   Send_byte( X"F0", arduino_io4, arduino_io5 ); 				-- key "-" (0x5A) is released;
	Send_byte( X"5D", arduino_io4, arduino_io5 ); 				-- key "-" (0x5A) is released;


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
END piano_arch;
