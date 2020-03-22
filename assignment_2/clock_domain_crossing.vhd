--------------------------------------------------------------------
--! \file      clock_domain_crossing.vhd
--! \date      see top of 'Version History'
--! \brief     clock domain crossing 
--! \author    Remko Welling (WLGRW) remko.welling@han.nl
--! \copyright HAN TF ELT/ESE Arnhem 
--!
--! Version History:
--! ----------------
--!
--! Nr:    |Date:      |Author: |Remarks:
--! -------|-----------|--------|-----------------------------------
--! 001    |21-3-2020  |WLGRW   |Removed ARCHITECTURE and added documentation
--!        |           |        |Added to Git repository.
--!
--! # Assignment 2: clock-cmoain-crossing
--! 
--! Clock Domain Crossing (CDC) occurs when data is transferred from a 
--! domain driven by one clock to a domain driven by another clock. 
--! 
--! When crossing a clock domain 3 main issues can occur. These are: 
--!  1. Metastability
--!  2. Data loss
--!  3. Data Incoherency
--! 
--! With this component we solve the issue of metastability by the use of 
--! synchronizers. Synchronizers consist of 2 sequential flipflops that 
--! are driven by the same high-speed clock. This will result in a delay 
--! of one clock cycle for the applied signal before it enters the 
--! destination domain. Doing so the period in which the first flipflop 
--! might be in a metastable phase is isolated and so discarded.
--!
--! The input-process-output diagram for clock-domain-crossing is given
--! in the figure.
--!
--! \verbatim
--! 
--!                          +-----------------+
--!                          |                 |
--! input (20 kHz domain) -->|                 |
--!                          | cross-domain-   |--> output (50 MHz  domain)
--!          50 MHz clock -->|        crossing |
--!                          |                 |
--!                          +-----------------+
--!
--! Figure: single clock-domain-crossing component
--!
--! \endverbatim
--!
--! ## Instructions
--! 
--! - Use this component in the top level ENTITY readkey to solve the issues
--!   that occor with clock-domain-crossing.
--! 
--! ## Notes
--!
--! 1. This code is tested on Quartus 19.1.0


--! \brief ENTITY and ARCHITECTURE of component clock_domain_crossing
--! This componant contains the component flipflop that is instantiated
--! 4 times to implement the clock-domain-crossing function from the 
--! keyboard at 20 kHz to the FPGA at 50 MHz. 
--------------------------------------------------------------------
LIBRARY ieee;
USE     ieee.STD_LOGIC_1164.all;
--------------------------------------------------------------------
ENTITY clock_domain_crossing IS
   PORT(
      reset       : in  STD_LOGIC; --! reset signal active low '0'
      clk         : in  STD_LOGIC; --! 50 MHz clock from 50 MHz domain
      kbclock     : in  STD_LOGIC; --! clock from keyboard in 20 kHz domain
      kbdata      : in  STD_LOGIC; --! serial from keyboard in 20 kHz domain
      kbclocksync : out STD_LOGIC; --! clock from keyboard in 50 Mhz kHz domain
      kbdatasync  : out STD_LOGIC  --! serial data from keyboard in 50 MHz domain
   );
END clock_domain_crossing;
--------------------------------------------------------------------
ARCHITECTURE LogicFunction OF clock_domain_crossing IS

   COMPONENT flipflop PORT(
      D, 
      clk, 
      reset : in  STD_LOGIC; 
      Q     : out STD_LOGIC
   ); 
   END COMPONENT;

   SIGNAL kbdatasignal, 
          kbclocksignal : STD_LOGIC; --! SIGNALs to interconnect flipflops

BEGIN
   -- component instantiations
   c0: flipflop PORT MAP (kbdata,        clk, reset, kbdatasignal );
   c1: flipflop PORT MAP (kbdatasignal,  clk, reset, kbdatasync );
   c2: flipflop PORT MAP (kbclock,       clk, reset, kbclocksignal );
   c3: flipflop PORT MAP (kbclocksignal, clk, reset, kbclocksync );
      
END LogicFunction;

--! \brief ENTITY and ARCHITECTURE of component flipflop
--! This componant implements a single flipflop.
--------------------------------------------------------------------
LIBRARY ieee;
USE     ieee.STD_LOGIC_1164.all;
--------------------------------------------------------------------
ENTITY flipflop IS --! generic function of a flipflop1 
   PORT(
      D     : in  STD_LOGIC;
      clk   : in  STD_LOGIC;
      reset : in  STD_LOGIC;
      Q     : out STD_LOGIC
   );
END flipflop;
--------------------------------------------------------------------
ARCHITECTURE Logic OF flipflop IS
BEGIN

   flipflop_process: PROCESS (clk, reset) IS
   BEGIN
   
      IF reset = '0' THEN         -- Reset (async).
         Q <= '0';                -- reset Q
      ELSIF rising_edge(clk) THEN -- at clock:
         Q <= D;                  -- copy D to Q
      END IF;                     -- end if of watchlist signals

   END PROCESS;                   -- end process flipflop1_process

END Logic;                        -- end architecture
--------------------------------------------------------------------