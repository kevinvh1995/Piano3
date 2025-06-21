--------------------------------------------------------------------
--! \file      clock_generator.vhd
--! \date      see top of 'Version History'
--! \brief     Clock generator
--! \author    [Redacted]
--! \copyright HAN TF ELT/ESE Arnhem
--!
--! \todo Students that submit this code have to complete their details:
--!
--! Student 1 name         : [Redacted]
--! Student 1 studentnumber: [Redacted]
--! Student 1 email address: [Redacted]
--!
--! Student 2 name         : [Redacted]
--! Student 2 studentnumber: [Redacted]
--! Student 2 email address: [Redacted]
--!
--! Version History:
--! ----------------
--!
--! Nr:    |Date:      |Author: |Remarks:
--! -------|-----------|--------|-----------------------------------
--! 001    |24-3-2015  |[Redacted]   |Inital version
--! 002    |13-2-2020  |[Redacted]   |Update to MAX10 on DE10-Lite board
--! 003    |6-4-2020   |[Redacted]   |Cleanup for assignment
--! 004    |6-7-2020   |[Redacted]   |Added a todo not to modify the header of the file to represent teh students that worked on the file.
--!
--!
--! # Assignment  3: clock_generator
--!
--! This clock_generator wil devide the system clock of 50 MHz 1, 1/2, 1/4, 1/8, 1/16, 1/32 and 1/64 times
--! This will produce frequencies of: 50MHz, 25 MHz, 12.5MHz, 6,25MHz, 3,125MHz, 1,5625MHz or 0,78125MHz.
--!
--!
--------------------------------------------------------------------
LIBRARY ieee;
USE     ieee.STD_LOGIC_1164.all;
USE     ieee.numeric_std.all;
--------------------------------------------------------------------
ENTITY clock_generator IS

   GENERIC (
   key_A    : STD_LOGIC_VECTOR (7 DOWNTO 0) := X"1C";
   key_Z    : STD_LOGIC_VECTOR (7 DOWNTO 0) := X"1A";
   gen_devide_nmbr : INTEGER := 6
   );

   PORT(
      reset   : in  STD_LOGIC;                    -- Reset active is '0'
      clk     : in  STD_LOGIC;                    -- 50MHz clock
      key     : in  STD_LOGIC_VECTOR(7 DOWNTO 0);
      clk_div : out STD_LOGIC
   );
END clock_generator;
--------------------------------------------------------------------
ARCHITECTURE LogicFunction OF clock_generator IS
   --! add a "typedef" for enum state_type.
   --! add SIGNALS
   --! add a signal of type state_type for the FSM

      TYPE state_type is (
      S_STATE_0,
      S_STATE_1,
      S_STATE_2,
      S_STATE_3,
      S_STATE_4,
      S_STATE_5,
      S_STATE_6
   );

   SIGNAL current_state,
          next_state     : state_type := S_STATE_3; -- signals of the type state_type to hold current- and next-state
   SHARED VARIABLE devider_nmbr : INTEGER RANGE 0 TO 6 := 0;
   SIGNAL memory1,
          memory2 : STD_LOGIC_VECTOR (7 DOWNTO 0);
   SIGNAL divider_output :STD_LOGIC_VECTOR (gen_devide_nmbr DOWNTO 0);

BEGIN

--! #### clock devider based on a integer counter: ####
--! The signal divider_output receives the integer
--! Per line on the vector a devided signal of the clock is avaialable
--! lsb is devide by 1, msb is devide by 64



   devider : PROCESS (clk, reset)
      --! use a variable for your counter
      VARIABLE counter : INTEGER RANGE 0 TO 2 **  gen_devide_nmbr := 0;
   BEGIN

      IF reset = '0' THEN                   -- Async reset

         counter := 0;                      -- set counter to 0
         divider_output <= (OTHERS => '0'); -- set counter to 0

      ELSIF rising_edge(clk) THEN           -- on clock edge

         IF (counter < (2 ** gen_devide_nmbr)) THEN       -- as long as the counter is below 2 power N
           counter := counter + 1;          -- increment counter
         ELSE                               -- as the counter reached 2 power N
           counter := 0;                    -- reset counter to 0
         END IF;

      END IF;                               -- put result of counter on signal

      divider_output <= STD_LOGIC_VECTOR(to_unsigned(counter, divider_output'length));


   END PROCESS;

--! #### state_decoder ####
--! this PROCESS is PROCESSing state changes each clk and executing async reset.
--! the PROCESS will handle coninous pressing a key as well.

   state_decoder: PROCESS (clk, reset, key) is -- PROCESS watching reset and system clock
   VARIABLE pressed_counter: INTEGER := 0;
   BEGIN
      IF reset = '0' THEN
         current_state <= S_STATE_3;

      ELSIF RISING_EDGE (clk) THEN
         IF (pressed_counter < 1) AND ((key = key_A) OR (key = key_Z)) THEN -- check if the key is still pressed
            pressed_counter := 1;
            current_state <= next_state;

         ELSIF NOT((key = key_A) OR (key = key_Z)) THEN  -- when key is released then reset pressed counter
            pressed_counter := 0;

         END IF;
      END IF;
      -- nog doorschieten wanneer key is ingedrukt verkomen

   END PROCESS;                  -- END PROCESS input_decoder

--! #### input_decoder ####
--! this PROCESS contains the tests and conditions for each state

   input_decoder : PROCESS ( key, current_state ) -- add state SIGNAL to watch-list
   BEGIN
   -- key z = 0x1A
   -- key A = 0x1C
      CASE current_state IS
         WHEN S_STATE_0 =>
            IF key = key_Z THEN              -- when key == z then go to state with lower clock frequencie
               next_state <= S_STATE_1;
            ELSE
               next_state <= current_state;
            END IF;

         WHEN S_STATE_1 =>
            IF key = key_Z THEN              -- when key == z then go to state with lower clock frequencie
               next_state <= S_STATE_2;

            ELSIF key = key_A THEN           -- when key == A then go to state with higher clock frequencie
               next_state <= S_STATE_0;

            ELSE
              next_state <= current_state;
            END IF;

         WHEN S_STATE_2 =>

            IF key = key_Z THEN              -- when key == z then go to state with lower clock frequencie
               next_state <= S_STATE_3;

            ELSIF key = key_A THEN           -- when key == A then go to state with higher clock frequencie
               next_state <= S_STATE_1;

            ELSE
              next_state <= current_state;
            END IF;

         WHEN S_STATE_3 =>
            IF key = key_Z THEN              -- when key == z then go to state with lower clock frequencie
               next_state <= S_STATE_4;

            ELSIF key = key_A THEN           -- when key == A then go to state with higher clock frequencie
               next_state <= S_STATE_2;

            ELSE
              next_state <= current_state;
            END IF;

         WHEN S_STATE_4 =>
            IF key = key_Z THEN              -- when key == z then go to state with lower clock frequencie
               next_state <= S_STATE_5;

            ELSIF key = key_A THEN           -- when key == A then go to state with higher clock frequencie
               next_state <= S_STATE_3;

            ELSE
              next_state <= current_state;
            END IF;
         WHEN S_STATE_5 =>
            IF key = key_Z THEN              -- when key == z then go to state with higher clock frequencie
               next_state <= S_STATE_6;

            ELSIF key = key_A THEN           -- when key == A then go to state with higher clock frequencie
               next_state <= S_STATE_4;
            ELSE
              next_state <= current_state;
            END IF;
         WHEN S_STATE_6 =>
            IF key = key_A THEN              -- when key == A then go to state with higher clock frequencie
               next_state <= S_STATE_5;

            ELSE
              next_state <= current_state;
            END IF;
         WHEN OTHERS =>
            next_state <= current_state;
         END CASE;

      --! Implement here the input ecoder

   END PROCESS;

--! #### state_decoder ####
--! this PROCESS is performing actions that apply for each state
--! selector logic: select the divided clock signal from the clock devider.

   output_decoder : PROCESS ( clk, divider_output) -- add divider_output SIGNAL to watch-list
   BEGIN

      CASE current_state IS
         WHEN S_STATE_0 =>
            -- 50mHz
            clk_div <= divider_output(0);

         WHEN S_STATE_1 =>
            -- 25mhz
            clk_div <= divider_output(1);
         WHEN S_STATE_2 =>
            -- 12.5mhz
            clk_div <= divider_output(2);
         WHEN S_STATE_3 =>
            --6.25mhz
            clk_div <= divider_output(3);
         WHEN S_STATE_4 =>
            -- 3.125mhz
            clk_div <= divider_output(4);
         WHEN S_STATE_5 =>
            -- 1.5625mhz
            clk_div <= divider_output(5);
         WHEN S_STATE_6 =>
            -- 0.78125mhz
            clk_div <= divider_output(6);
         WHEN OTHERS =>
            clk_div <= divider_output(3);
         END CASE;

   END PROCESS;


END LogicFunction;
--------------------------------------------------------------------