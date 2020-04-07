--------------------------------------------------------------------
--! \file      clockdivider_example.vhd
--! \date      see top of 'Version History'
--! \brief     Clock generator 
--! \author    Remko Welling (WLGRW) remko.welling@han.nl
--! \copyright HAN TF ELT/ESE Arnhem 
--!
--! Version History:
--! ----------------
--!
--! Nr:    |Date:      |Author: |Remarks:
--! -------|-----------|--------|-----------------------------------
--! 001    |6-4-2020   |WLGRW   |Initial version
--!
--! clock devider based on a integer counter:
--!
--! This clock_generator wil devide the clock 1, 1/2, 1/4, 1/8, 1/16, 1/32 and 1/64 times
--!
--! - The signal divider_output receives the integer
--! - Per signal on the vector a devided signal of the clock is avaialable
--! - lsb is devide by 1, msb is devide by 2 power N--! 
--------------------------------------------------------------------
LIBRARY ieee;
USE     ieee.STD_LOGIC_1164.all;
USE     ieee.numeric_std.all;
--------------------------------------------------------------------
ENTITY clockdivider_example IS

   GENERIC(
      N: INTEGER := 4
   );

   PORT(
      reset   : in  STD_LOGIC;
      clk     : in  STD_LOGIC;
      clk_sel : in  STD_LOGIC_VECTOR(N DOWNTO 0);
      clk_div : out STD_LOGIC
   );

END clockdivider_example;
--------------------------------------------------------------------
ARCHITECTURE LogicFunction OF clockdivider_example IS

   SIGNAL divider_output : STD_LOGIC_VECTOR(N DOWNTO 0);
   SIGNAL selector : INTEGER RANGE 0 TO 2 ** N := 0;
   
BEGIN

   devider : PROCESS (clk, reset)
      --! integer for counting delimited to 64 there for 6 lines on vector.
      VARIABLE counter : INTEGER RANGE 0 TO 2 ** N := 0;

   BEGIN
   
      IF reset = '0' THEN                   -- Async reset
      
         counter := 0;                      -- set counter to 0
         divider_output <= (OTHERS => '0'); -- set counter to 0 
         
      ELSIF rising_edge(clk) THEN           -- on clock edge
      
         IF (counter < (2 ** N)) THEN       -- as long as the counter is below 2 power N
           counter := counter + 1;          -- increment counter
         ELSE                               -- as the counter reached 2 power N
           counter := 0;                    -- reset counter to 0
         END IF;
         
      END IF;                               -- put result of counter on signal
      
      divider_output <= STD_LOGIC_VECTOR(to_unsigned(counter, divider_output'length));
      
   END PROCESS;
   
   selector <= to_integer(unsigned(clk_sel));
   
   WITH selector SELECT 
      clk_div <= divider_output(0) WHEN 0,
                 divider_output(1) WHEN 1,
                 divider_output(2) WHEN 2,
                 divider_output(3) WHEN 3,
                 '0' WHEN OTHERS;

END LogicFunction;
--------------------------------------------------------------------