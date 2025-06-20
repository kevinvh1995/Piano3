--------------------------------------------------------------------
--! \file      constantkey.vhd
--! \date      see top of 'Version History'
--! \brief     Showkey
--! \author    Remko Welling (WLGRW) remko.welling@han.nl
--! \copyright HAN TF ELT/ESE Arnhem 
--!
--! \todo Students that submit this code have to complete their details:
--!
--! Student 1 name         : arjan kerkhof 
--! Student 1 studentnumber: 2103073
--! Student 1 email address: jp.kerkhof@student.han.nl
--!
--! Student 2 name         : Christiaan orth
--! Student 2 studentnumber: 608171
--! Student 2 email address: cmj.orth@student.han.nl 
--!
--! Version History:
--! ----------------
--!
--! Nr:    |Date:      |Author: |Remarks:
--! -------|-----------|--------|-----------------------------------
--! 001    |20-3-2015  |WLGRW   |Initial version
--! 002    |28-3-2015  |WLGRW   |Corrections in output key and dig2 and dig 3
--! 003    |2-4-2015   |WLGRW   |Corrections to states to meet data stream from keyboard.
--! 004    |13-2-2020  |WLGRW   |Update to MAX10 on DE10-Lite board
--! 005    |6-7-2020   |WLGRW   |Added a todo not to modify the header of the file to represent teh students that worked on the file.
--! 006    |3-5-2023   |KEVIN   |Added base line of state machine code according to assignment 2 pdf snippet and padroni.
--! 007    |3-5-2023   |KEVIN   |Added state machine code and filled in baseline according to flow chart in assignment 2 PDF.
--! 008    |4-5-2023   |KEVIN   |Removed reset because i got no output on waveform when i left it in.
--! 009    |4-5-2023   |KEVIN   |Fixed interfering latches issue for dig2 and dig3(added both to all states)
--------------------------------------------------------------------
LIBRARY ieee;
USE     ieee.STD_LOGIC_1164.all;
--------------------------------------------------------------------
ENTITY constantkey IS
   GENERIC(
      empty_data : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS=>'0')
   );

   PORT (
      reset     : IN  STD_LOGIC;                    --! reset signal active low '0'
      clk       : IN  STD_LOGIC;                    --! clock (50 MHz)
      scancode  : IN  STD_LOGIC_VECTOR(7 DOWNTO 0); --! received byte
      byte_read : IN  STD_LOGIC;                    --! Set if byte is received 
      key       : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); --! show key pressed
      dig2, 
      dig3      : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)  --! debug info, current and previous key pressed
   );
END constantkey;
--------------------------------------------------------------------
ARCHITECTURE LogicFunction OF constantkey IS

   -- Modify "typedef" for enum state_type to meet your needs
   -- Add addiditonal SIGNALs for this architecture 
   
   --! "typedef" for enum state_type.
   TYPE state_type is (
      no_key,          -- No key pressed state
      key_released,    -- Key released state 
      key_pressed,     -- Key pressed state
      key_reminder,     -- Previous key pressed reminder state
      key_reminder_2
   );
   

   SIGNAL current_state, 
          next_state     : state_type := no_key; -- signals of the type state_type to hold current- and next-state
   SIGNAL memory1, 
          memory2        : STD_LOGIC_VECTOR(7 DOWNTO 0); -- temporary buffers
	
BEGIN
   memory1 <= scancode WHEN RISING_EDGE(byte_read) ELSE UNAFFECTED; --add scancode to memory1 to later use it for key assignment
   memory2 <= scancode WHEN RISING_EDGE(byte_read) ELSE UNAFFECTED; --same for above but then for later use for dig3

   
   state_decoder: PROCESS (clk, reset) IS
   BEGIN
      IF reset = '0' THEN
         current_state <= no_key;
         
      ELSIF RISING_EDGE(clk) THEN
         current_state <= next_state;
         
   	END IF;
   END PROCESS; -- END PROCESS input_decoder

   --! The input decoder is a PROCESS that contains the tests and 
   --! conditions for each state
   input_decoder : PROCESS (current_state, scancode, byte_read)
   BEGIN
      CASE current_state IS
         WHEN no_key =>
            IF byte_read = '1' THEN          -- when byte is read go to next state
               next_state <= key_pressed;
               
            ELSE 
               next_state <= current_state;
               
            END IF;
            
         WHEN key_pressed =>
            IF (byte_read = '1' AND scancode = x"F0") THEN  -- when byte is read and scancode is the same is 0xF0 then go to next state
               next_state <= key_released;
               
            ELSE 
               next_state <= current_state;
               
            END IF;
         WHEN key_released =>
            IF (byte_read = '1' AND scancode = x"F0") THEN  -- when byte is read and scancode is the same is 0xF0 then go to next state
               next_state <= key_reminder;
               
            ELSE 
               next_state <= current_state;
               
            END IF;
         WHEN key_reminder =>
            if byte_read = '1' AND scancode /= x"F0" THEN   -- when byte is read and scancode is not the same is 0xF0 then go to next state
               next_state <= key_reminder_2;
               
            ELSE 
               next_state <= current_state;
               
            END IF;
         WHEN key_reminder_2 =>
            if byte_read = '0' THEN    -- when byte is read is false then go to no_key
               next_state <= no_key;
               
            ELSE 
               next_state <= current_state;
               
            END IF;
         WHEN OTHERS =>
            next_state <= current_state;
      END CASE;
   END PROCESS; -- END PROCESS state_decoder

   --! The output decoder ia a PROCESS that is executing actions that 
   --! apply to each individual state
   
   output_decoder : PROCESS (current_state, memory1, memory2)
   BEGIN   
      
      CASE current_state IS
         WHEN no_key =>
            key  <= empty_data;  -- set key to 0x00 (reset value)
            dig2 <= empty_data;  -- set dig2 debug info to 0x00 (reset value)
            dig3 <= empty_data;  -- set dig3 debug info to 0x00 (reset value)
            
         WHEN key_pressed =>
            key  <= memory2;     -- set key to what is currently in memory2 (scancode)
            dig2 <= memory2;     -- set dig2 debug info to what is currently in memory2 (scancode)
            dig3 <= empty_data;  -- set dig3 debug info to 0x00 (reset value)
            
         WHEN key_released =>
            key  <= empty_data;  ---set key to 0x00 (reset value)
            dig2 <= empty_data;  -- set dig2 debug info to 0x00 (reset value)
            dig3 <= empty_data;  -- set dig3 debug info to 0x00 (reset value)
            
         WHEN key_reminder =>
            key  <= empty_data;  -- set data to 0x00 (reset value)
            dig2 <= empty_data;  -- set dig 2 debug info to 0x00 (reset value)
            dig3 <= memory1;     -- set dig3 debug info to last value of scancode
            
         WHEN key_reminder_2 =>
            key  <= empty_data;  
            dig2 <= empty_data;  -- set dig 2 dedbug info to 0x00 (reset value)
            dig3 <= memory1;     -- set dig3 debug info to last value of scancode
            
         WHEN OTHERS =>
            key  <= empty_data;  -- set key to 0x00 (reset value)
            dig2 <= empty_data;  -- set dig2 debug info to 0x00 (reset value)
            dig3 <= empty_data;  -- set dig3 debug info to 0x00 (reset value)
      END CASE;
   END PROCESS;
   
END LogicFunction;
--------------------------------------------------------------------
