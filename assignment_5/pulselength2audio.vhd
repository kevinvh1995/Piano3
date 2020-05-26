--------------------------------------------------------------------
--! \file      pulselength2audio.vhd
--! \date      see top of 'Version History'
--! \brief     pulselength2audio generates a audio tone based on 
--!            the clk_dev and pulselength2audio signal
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
--! # Assignment 4
--! 
--! In this assignment component key2pulselength is designed and implemented. 
--! The input-process-output diagram is presented in the Figure
--! 
--! In this assignment key is converted to the tone that is represented by 
--! an integer value: pulselength. Pulselength represents the number of 
--! times that clk_div will generate a clock pulse (single period). 
--! Doing so, pulselength specifies halve the period time of the audio tone. 
--!
--! The combination of pulselength and clk_div is implemented in 
--! pulselength2audio in Assignment 5: Component pulselength2audio.
--! To determine the right value of clk_div the theory of scales shall be used. 
--!
--! \verbatim
--! 
--!              +-------------------+
--!              |                   |
--! key[7..0] -->|                   |
--!              | pulselength2audio |--> pulselength[12..0]
--!     reset -->|                   |
--!              |                   |
--!              +-------------------+
--!
--! Figure: input-process-output diagram of pulselength2audio
--!
--! \endverbatim
--!
--! ## Instructions
--! 
--!  - Use this top level ENTITY for component key2pulselength
--!  - Design the ARCHITECTURE VHDL for component key2pulselength
--!  - Investigate the technology map in RTL viewer and share your findings
--!  - Simulate the functional operation of key2pulselength with:
--!    - reset
--!    - key <= hex 0; hex A; hex Z; hex 0D; hex 26; hex 3C; hex 54; hex 5D
--! 
--! ## Notes
--! 1. This code is tested on Quartus 19.1.0
--! 2. Ports n this code are not mapped to pins.
--------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
--------------------------------------------------------------------
ENTITY pulselength2audio IS
   PORT( 
      reset      : IN  std_logic;                 --! Reset active is '0'
      clk_dev    : IN  std_logic;                 --! clock from programmeable clock devider
      pulslength : IN  integer RANGE 0 TO 131071; --! incoming value from key2pulselength
      audiol,
      audior     : OUT std_logic                  --! Audio outputs
   );                        
END pulselength2audio;
--------------------------------------------------------------------
--! Implement here the ARCHTECTURE for ENTITY pulselength2audio
ARCHITECTURE LogicFunction OF pulselength2audio IS

BEGIN

   
END LogicFunction;
--------------------------------------------------------------------
