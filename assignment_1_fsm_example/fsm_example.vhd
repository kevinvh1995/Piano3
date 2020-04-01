--------------------------------------------------------------------
--! \file      fsm_example.vhd
--! \date      see top of 'Version History'
--! \brief     FSM example in VHD with 2 ARCHITECTUREs 
--! \author    Remko Welling (WLGRW) remko.welling@han.nl
--! \copyright HAN TF ELT/ESE Arnhem 
--!
--! Version History:
--! ----------------
--!
--! Nr:    |Date:      |Author: |Remarks:
--! -------|-----------|--------|-----------------------------------
--! 001    |1-4-2020   |WLGRW   |Initial version fro release
--!
--------------------------------------------------------------------
LIBRARY ieee;
USE     ieee.STD_LOGIC_1164.all;
--------------------------------------------------------------------
ENTITY fsm_example IS
   PORT (

      --! PORT declarations for this ENTITY
      clk    : IN  STD_LOGIC;
      reset  : IN  STD_LOGIC;
      input  : IN  STD_LOGIC_VECTOR(3 DOWNTO 0) ;
      output : OUT STD_LOGIC_VECTOR(3 DOWNTO 0) 
   );
END fsm_example;
--------------------------------------------------------------------
--! Select here the architecture for compilation by uncommenting the architecture:

CONFIGURATION which_architecture OF fsm_example IS
--   FOR fsm_implementation_1 --! uncomment to select implementation using SIGNAL
   FOR fsm_implementation_2 --! uncomment to select implementation using VARIABLE
   END FOR;
END CONFIGURATION;
--------------------------------------------------------------------
ARCHITECTURE fsm_implementation_1 OF fsm_example IS
   
--! "typedef" for enum state_type.
   TYPE state_type is (
      state_1,
      state_2,
      state_3
   );

--! signals of the type state_type to contain current- and next-state 
--! to allow echange of information between PROCESSes.
--! SIGNALs ar initialized with state_1 value to enforce initial state 
--! when powering FSM.

   SIGNAL current_state, 
          next_state     : state_type := state_1;

BEGIN

--! state_decoder
--! =============
--! This PROCESS is PROCESSing state changes each clk and executing async reset.

   state_decoder: PROCESS (clk, reset) IS  -- PROCESS watching reset and system clock
   BEGIN

      --! reset all output signals of FSM 
      --! set FSM to inital state
      IF reset = '0' THEN                  -- Reset (async).
         current_state <= state_1;
      ELSIF rising_edge(clk) THEN
         current_state <= next_state;
      END IF;
      
   END PROCESS;

--! input_decoder 
--! this PROCESS contains the tests and conditions for each state
   input_decoder : PROCESS (current_state) 
   BEGIN
      
      CASE current_state is
      
         WHEN state_1 =>

            IF (input = "0001") THEN
               next_state <= state_2;
            ELSE
               --! prevent inferring latches
               next_state <= current_state;
            END IF;

         WHEN state_2 =>

            IF (input = "0010") THEN
               next_state <= state_3;
            ELSE
               --! prevent inferring latches
               next_state <= current_state;
            END IF;
            
         WHEN state_3 =>
         
            next_state <= state_1;
            
         WHEN OTHERS =>
            --! prevent inferring latches
            next_state <= current_state;
            
      END CASE;

   END PROCESS;

--! output decoder 
--! this PROCESS is performing actions that apply for each state

   output_decoder : PROCESS (current_state)
   BEGIN   
      CASE current_state IS
      
         WHEN state_1 =>
            output <= "0001";
            
         WHEN state_2 =>
            output <= "0010";
            
         WHEN state_3 =>
            output <= "0011";
            
         WHEN OTHERS    =>
            output <= "1111";
            
      END CASE;
      
   END PROCESS;
   
END fsm_implementation_1;
--------------------------------------------------------------------
ARCHITECTURE fsm_implementation_2 OF fsm_example IS
   
   TYPE state_type is (
      state_1,
      state_2,
      state_3
   );

   SIGNAL current_state, 
          next_state     : state_type := state_1;

BEGIN

--! state decoder
--! =============
--! Same implementation as in ARCHITECTURE fsm_implementation_1

   state_decoder: PROCESS (clk, reset) IS
   BEGIN

      IF reset = '0' THEN
         current_state <= state_1;
      ELSIF rising_edge(clk) THEN
         current_state <= next_state;
      END IF;
      
   END PROCESS;

--! input_decoder 
--! =============
--! This PROCESS contains the tests and conditions for each state
--! to move change to the next state. In this implementation the
--! use of SIGALS is replaced by the use of a VARIABLE. The use 
--! of VARIABLEs will reduce the amount of code that is required
--! to implement the input decoder of the FSM and therefore the
--! chance on faulty code or not working FSM.
--!
--! The use of a VARIABLE in sequential code will solve the issue 
--! of multiple assignments to a single SIGNAL.

   input_decoder : PROCESS (current_state) 
      VARIABLE state : state_type := state_1;
   BEGIN

--! Assign actual value from SIGNAL to temporary VARIABLE
      
      state := current_state;
      
      CASE state is
      
         WHEN state_1 =>

            IF (input = "0001") THEN
               state := state_2;
            END IF;

         WHEN state_2 =>

            IF (input = "0010") THEN
               state := state_3;
            END IF;
            
         WHEN state_3 =>
         
            state := state_1;

      END CASE;
      
--! Assign value from VARIABLE to SIGNAL to be used outside
--! the PROCESS statement.
      
      next_state <= state;

   END PROCESS;

--! output decoder 
--! ==============
--! This implementation as in ARCHITECTURE fsm_implementation_1

   output_decoder : PROCESS (current_state)
   BEGIN   
      CASE current_state IS
      
         WHEN state_1 =>
            output <= "0001";
            
         WHEN state_2 =>
            output <= "0010";
            
         WHEN state_3 =>
            output <= "0011";
            
         WHEN OTHERS    =>
            output <= "1111";
            
      END CASE;
      
   END PROCESS;

END fsm_implementation_2;
--------------------------------------------------------------------
