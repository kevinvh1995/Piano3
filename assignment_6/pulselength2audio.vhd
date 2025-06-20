--------------------------------------------------------------------
--! \file      pulselength2audio.vhd
--! \date      see top of 'Version History'
--! \brief     pulselength2audio generates a audio tone based on
--!            the clk_dev and pulselength2audio signal
--! \author    Remko Welling (WLGRW) remko.welling@han.nl
--! \copyright HAN TF ELT/ESE Arnhem
--!
--! \todo Students that submit this code have to complete their details:
--!
--! Student 1 name         : Kevin van Hoeijen
--! Student 1 studentnumber: 2118888
--! Student 1 email address: k.vanhoeijen@student.han.nl
--!
--! Student 2 name         : Jaap-Jan Groenendijk
--! Student 2 studentnumber: 1548148
--! Student 2 email address: jj.groenendijk@student.han.nl
--!
--! Version History:
--! ----------------
--!
--! Nr:    |Date:      |Author: |Remarks:
--! -------|-----------|--------|-----------------------------------
--! 001    |21-3-2020  |WLGRW   |Removed ARCHITECTURE and added documentation Added to Git repository.
--! 002    |6-7-2020   |WLGRW   |Added a todo not to modify the header of the file to represent teh students that worked on the file.
--!
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
      pulslength : IN  integer RANGE 0 TO 8191;   --! incoming value from key2pulselength
      audiol,
      audior     : OUT std_logic                  --! Audio outputs
   );
END pulselength2audio;
--------------------------------------------------------------------
--! Implement here the ARCHTECTURE for ENTITY pulselength2audio
ARCHITECTURE LogicFunction OF pulselength2audio IS

BEGIN

   pulselength_2_audio : PROCESS (pulslength, clk_dev, reset)
      VARIABLE counter : INTEGER RANGE 0 TO 8191 := 0;
      VARIABLE invert : BOOLEAN := false;
   BEGIN
      IF reset = '0' THEN  -- check reset pressed
         counter := 0;
         audiol <= '0';
         audior <= '0';

      ELSE
         IF (RISING_EDGE (CLK_dev)) THEN

            counter := counter +1;

            IF counter >= pulslength THEN    -- when counter is greater or equal to the pulslength then set counter to 0
               counter := 0;
               IF invert = false THEN        -- check if audiol is low
                  invert := true;

               ELSIF invert = true THEN      -- check if audior is low
                  invert := false;
               END IF;

            ELSIF counter < pulslength THEN
               IF invert = false THEN
                  -- set here the audio output
                  audiol <= '1';
                  audior <= '0';

               ELSIF invert = true THEN
                  -- set here inverted audio output
                  audior <= '1';
                  audiol <= '0';

               END IF;

            END IF;

         ELSE

         END IF;
      END IF;
   END PROCESS;

END LogicFunction;
--------------------------------------------------------------------
