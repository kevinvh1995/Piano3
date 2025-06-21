--! VHDL Test Bench template for design:  readkey
--! 
--! Simulation tool : ModelSim-Altera (VHDL)
--! 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY readkey_vhd_tst IS
END readkey_vhd_tst;

ARCHITECTURE readkey_arch OF readkey_vhd_tst IS
   -- constants
   CONSTANT cycle : TIME := 20 ns;
   
   -- signals                                                   
   SIGNAL clk : STD_LOGIC;
   SIGNAL dig2 : STD_LOGIC_VECTOR(7 DOWNTO 0);
   SIGNAL dig3 : STD_LOGIC_VECTOR(7 DOWNTO 0);
   SIGNAL kbclock : STD_LOGIC;
   SIGNAL kbdata : STD_LOGIC;
   SIGNAL key : STD_LOGIC_VECTOR(7 DOWNTO 0);
   SIGNAL reset : STD_LOGIC;
   
   --------Procedure to send data frame--------------------------------
   PROCEDURE send_byte(
      CONSTANT byte : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      SIGNAL pr_kbclock : OUT STD_LOGIC;
      SIGNAL pr_kbdata : OUT STD_LOGIC
      )
   IS
      VARIABLE odd_parity : STD_LOGIC;
      VARIABLE data : STD_LOGIC_VECTOR(10 DOWNTO 0);
   BEGIN
      -- Generate paritybit:
      odd_parity := '1';
      FOR i IN 7 DOWNTO 0 LOOP
         odd_parity := odd_parity XOR byte(i);
      END LOOP;
      data := '1' & odd_parity & byte & '0';
      -- Send off data frame:
      FOR I IN 0 TO 10 LOOP
         pr_kbdata <= data(i);
         pr_kbclock <= '0';
         WAIT FOR 20 ns;
         pr_kbclock <= '1';
         WAIT FOR 20 ns;
      END LOOP;
      pr_kbclock <= '1';
   END send_byte;
   
   COMPONENT readkey
      PORT (
      clk : IN STD_LOGIC;
      dig2 : BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0);
      dig3 : BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0);
      kbclock : IN STD_LOGIC;
      kbdata : IN STD_LOGIC;
      key : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      reset : IN STD_LOGIC
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

	i1 : readkey
	PORT MAP (
   -- list connections between master ports and signals
      clk  => clk,
      dig2 => dig2,
      dig3 => dig3,
      kbclock => kbclock,
      kbdata => kbdata,
      key => key,
      reset => reset
      );
   
   init : PROCESS                                               
   -- variable declarations                                     
   BEGIN   
   -- code that executes only once
      kbclock  <= '1';
      kbdata   <= '1';
      reset    <= '0';
      WAIT FOR 20 ns;
      reset    <= '1';
      WAIT FOR 150 ns;
      Send_byte( X"1D", kbclock, kbdata ); -- key "W" (0x1D) is pressed;
      WAIT FOR 300 ns;
      Send_byte( X"1D", kbclock, kbdata );
      WAIT FOR 300 ns;
      Send_byte( X"1D", kbclock, kbdata );
      WAIT FOR 300 ns; 
      Send_byte( X"1D", kbclock, kbdata );
      WAIT FOR 300 ns; 
      Send_byte( X"F0", kbclock, kbdata );
      WAIT FOR 300 ns;
      Send_byte( X"1D", kbclock, kbdata );
      WAIT FOR 600 ns;
      
      Send_byte( X"4D", kbclock, kbdata ); -- key "P" (0x4D) is pressed;
      WAIT FOR 300 ns;
      Send_byte( X"4D", kbclock, kbdata );
      WAIT FOR 300 ns;
      Send_byte( X"4D", kbclock, kbdata );
      WAIT FOR 300 ns;
      Send_byte( X"4D", kbclock, kbdata );
      WAIT FOR 300 ns;
      Send_byte( X"F0", kbclock, kbdata );
      WAIT FOR 300 ns;
      Send_byte( X"4D", kbclock, kbdata );
      WAIT FOR 600 ns;
      
      Send_byte( X"1C", kbclock, kbdata ); -- key "A" (0x1C) is pressed;
      WAIT FOR 300 ns;
      Send_byte( X"1C", kbclock, kbdata );
      WAIT FOR 300 ns;
      Send_byte( X"1C", kbclock, kbdata );
      WAIT FOR 300 ns;
      Send_byte( X"1C", kbclock, kbdata );
      WAIT FOR 300 ns;
      Send_byte( X"F0", kbclock, kbdata );
      WAIT FOR 300 ns;
      Send_byte( X"1C", kbclock, kbdata );
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
END readkey_arch;
