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
--! Student 1 name         : 
--! Student 1 studentnumber: 
--! Student 1 email address: 
--!
--! Student 2 name         : 
--! Student 2 studentnumber: 
--! Student 2 email address: 
--!
--! Version History:
--! ----------------
--!
--! Nr:    |Date:      |Author: |Remarks:
--! -------|-----------|--------|-----------------------------------
--! 001    |21-3-2020  |WLGRW   |Removed ARCHITECTURE and added documentation Added to Git repository.
--! 002    |6-7-2020   |WLGRW   |Added a todo not to modify the header of the file to represent the students that worked on the file.
--! 003    |8-7-2024   |WLGRW   | Removed incorrect doucmentation
--!
--! # Assignment 4
--! 
--! In this assignment component pulselength2audio is designed and implemented. 
--! 
--! Use the details of the design in paragraph 5.6 Assignment 5: Component pulselength2audio
--!
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

   
END LogicFunction;
--------------------------------------------------------------------
