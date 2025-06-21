# H-EHE-SOC – Assignment-2
## A piano in VHDL

[Image: Cartoon of a person at a desk with a bird typing on a typewriter]

**Remko Welling**
**HAN_UNIVERSITY OF APPLIED SCIENCES**
Arnhem, the Netherlands,
April 29, 2025

---

### Document history

| Version | Date | Reviewer | Note/Changes |
| :--- | :--- | :--- | :--- |
| **211** | 29-4-2025 | WLGRW | Revision on assignment 0 and grammar corrections. |
| **210** | 16-5-2023 | WLGRW | Textual correction |
| **209** | 19-5-2022 | WLGRW | Removed artefacts in comments referring to previous design |
| **208** | 17-5-2022 | WLGRW | Addition to user manual of piano |
| **207** | 25-5-2021 | WLGRW | Minor changes to assignment 6 and 7 |
| **205** | 8-4-2021 | WLGRW | Updates to facilitate the option of reusing a 7-segment driver. |
| **204** | 2-2-2021 | WLGRW | Release |
| **201** | 3-11-2020 | WLGRW | Start revision in preparation to SOC class 2021 |
| **103** | 8-6-2020 | WLGRW | Corrections |
| **102** | 13-5-2020 | WLGRW | Corrected figure 24, Credits to Wesley Oldenburg |
| **101** | 28-4-2020 | WLGRW | Corrections |
| **100** | 9-4-2020 | WLGRW | Initial release and publication at #00 |
| **029** | 9-4-2020 | WLGRW | Review comments processed |
| **027** | 7-4-2020 | WLGRW | First version for review |
| **005** | 1-4-2020 | WLGRW | Intermediate version |
| **004** | 3-3-2020 | WLGRW | Continued |
| **003** | 27-2-2020 | WLGRW | Continued |
| **000** | 16-2-2020 | WLGRW | Start of document |

### Todo

| Date | What | Impact |
| :--- | :--- | :--- |
| 16-2-2020 | Copyright statement shall be verified to meet HAN regulations. | Low |

---

### About this document

This document is using icons to indicate the priority or type of information. The used icons are:

[Image: Yellow warning triangle icon]
**! Attention:** Important information about the topic that will have significant effect.

[Image: Graduation cap icon]
**Learning objective:** What we will learn.

[Image: 'i' in a blue circle icon]
**i Information:** Additional information about the topic.

[Image: Lightbulb icon]
**Suggestion:** Ideas to help or to point into a specific direction.

[Image: Stack of books icon]
**Further reading:** There is more information available about this topic.

### Responsible disclosure

Students and lecturers are encouraged to send in their experiences, problems, errors, any other observation while using this document. Please send your feedback to one of the lecturers, so we can improve this paper. Thank you.

### Copyright

This paper is part of the SOC lessons at Institute Engineering of HAN University of Applied Sciences HAN in Arnhem.

This paper is free: You may redistribute it and/or modify it under the terms of a Creative Commons Attribution-NonCommercial 4.0 International License (http://creativecommons.org/licenses/by-nc/4.0/) by Remko Welling (https://ese.han.nl/~rwelling/) E-mail: remko.welling@han.nl

[Image: Creative Commons BY-NC-SA logo]

Icons are not copyrighted.

### Disclaimer

The author of this paper reserves the right to apply changes at any time without prior notice. If any changes are made, the revised paper shall be posted on Onderwijs Online immediately. Please check the latest information posted herein to inform yourself of any changes.

---

### 1 Contents

*   2 Lab materials
    *   2.1 Literature
    *   2.2 Hardware
    *   2.3 Software
*   3 SOC Assignment overview
    *   3.1 `readKey` component
    *   3.2 `tone_generation` component
*   4 User interface and manual
*   5 Assignments
    *   5.1 Assignment 0: 7-segment driver and structural VHDL
    *   5.2 Assignment 1: showKey
    *   5.3 Assignment 2: Component `readKey`
    *   5.4 Assignment 3: Component `clockGenerator`
    *   5.5 Assignment 4: Component `key2pulselength`
    *   5.6 Assignment 5: Component `pulselength2audio`
    *   5.7 Assignment 6: Component `tone_generation`
    *   5.8 Assignment 7: VHLD piano top-level
*   6 References
*   7 Appendix
    *   7.1 Create testbench How to
    *   7.2 Analyse testbench How to
*   8 Worksheets
    *   8.1 Worksheet 1

---

### 2 Lab materials

This paragraph contains mandatory and optional hard- and software that is required for the assignments.

#### 2.1 Literature

[Image: Cover of "Circuit Design and Simulation with VHDL" by Volnei A. Pedroni]
*Figure 1: Theory book Pedroni*

During lab classes the following book is used for reference:

Circuit Design and Simulation Using VHDL, 2nd Edition, Copyright 2010 MIT Press, by Volnei A. Pedroni; ISBN 978-0-262-01433-5. Available through this [link](http://www.intel.com/) (Link was verified 11-6-2019).

#### 2.2 Hardware

During lab-classes the terasIC DE10-Lite Board will be used. See: [terasIC](https://www.terasic.com.tw/cgi-bin/page/archive.pl?Language=English&CategoryNo=167&No=1021) or [Intel](https://www.intel.com/content/www/us/en/programmable/products/boards_and_kits/dev-kits/altera/kit-de10-lite.html) (Links verified 12-6-2019).

[Image: Annotated diagram of the DE10-Lite prototype board, showing components like Altera MAX 10, GPIO, Accelerometer, VGA, Arduino Connector, USB-Blaster, SDRAM, 7-Segment Display, Buttons, LEDs, and Switches.]
*Figure 2: DE10-Lite prototype board (source: terasIC)*

Usage of the board is described in the document "Logic Circuits - VHDL Practical Sessions Manual" that is available through Onderwijs Online.

In the following documents you will find a description of the FPGA board (=DE10-Lite board) which we use. Among other things, you can find the available buttons, keys, LED's and displays. Use it as a help for finding the physical position of a component (SW, LEDR, KEY etc.) on the board. Get it directly from the web using the provide URL or download the pdf copy:

*   DE10-Lite_User_Manual.pdf from Onderwijs Online.
*   [DE10-Lite user manual](https://www.intel.com/content/dam/www/programmable/us/en/pdfs/literature/ug/de10-lite-user-manual.pdf) from Intel (verified 12-6-2019)

##### 2.2.1 Obtain the board

There are two ways to obtain the DE10-Lite board:

1.  Purchase through HAN ARLE: The DE10-Lite board can be purchased at HAN ARLE (through Henk Schepers or his colleagues) for € 65, -
2.  Purchase trough terasIC: The DE10-Lite board can be purchased at terasIC for $ 55,- (academic price). Follow this [link](https://www.terasic.com.tw/cgi-bin/page/archive.pl?Language=English&CategoryNo=167&No=1021&PartNo=4), keep a credit-card ready and plan for 3 weeks or more time to deliver at the address provided.

#### 2.3 Software

##### 2.3.1 IDE for FPGA

Intel® Quartus® Prime Design Software¹ is the design software that will be used to design circuits and program the DE10-Lite board. Quartus provides design entry, synthesis to optimization, verification, and simulation.

The instructions for software installation, hardware implementation, and lab files administration can be found in the following manual:

*   Logic Circuits - VHDL Practical Manual v19_007.pdf

Download the following file which is needed for FPGA pin assignment of DE10-Lite board for all Quartus II projects. Its use is explained in the manual linked above. Consult the DE10-CV FPGA board manual to see which name is connected to which component on the board.

*   pin_assignments_DE10_LITE_with_comment_v20190306_JGTP.qsf

##### 2.3.2 GIT

The project files for the assignments can be downloaded from gitlab.

*   [https://gitlab.com/wlgrw/han-soc-assignment-vhdl-piano](https://gitlab.com/wlgrw/han-soc-assignment-vhdl-piano)

It is recommended to download and install TortoiseGit to allow versioning of your assignment files.

Download TortoiseGit here: [https://tortoisegit.org/](https://tortoisegit.org/)

---
¹ Source: https://nl.mouser.com/new/Intel/intel-quartus/

---

### 3 SOC Assignment overview

In this assignment we will create an electronic piano using a PS/2 keyboard, a Terasic De10-Lite FPGA prototype board, and a small loudspeaker. The piano is represented using and input-process-output diagram in Figure 3.

[Image: Diagram showing PS/2 Keyboard as input, Piano as process, and Audio as output.]
*Figure 3: Input- Process- Output diagram of the VHDL piano*

A PS/2 keyboard shall be connected to the De10-Lite. For this an Arduino shield shaped interface board is used that will piggyback on the Arduino connectors of the DE10-lite. This board is called "the Piano-shield". The piano shield carries a speaker that will make the keystrokes on the piano audible and a PS/2 female min-din connector to which the PS/2 keyboard can be connected.

[Image: Lightbulb icon]
Using a PS/2 to USB adapter it is possible to replace the PS/2 keyboards that are rare by a generic available USB keyboard.

The PS/2 keyboard will substitute a normal instrument keyboard as being shown in Figure 7 in paragraph 4 on page 10. In this figure the notes are written on the black and white keys.

The PS/2 keyboard which we will use for this assignment has no white and black keys and the keys are not arranged as on an instrument like a piano or organ. Therefore, we will use the keys of the PS/2 keyboard in a manner that represents the instrument keyboard. This is visualized in Figure 8 paragraph 4 on page 10.

With this layout the black keys are on the row with the number-keys while the white keys are on the row with the letters "QWERTY”.

With a real instrument the musician can press multiple tones at the same time but that will not be possible with this implementation of the piano. Therefore, we will not assess the student on their musical qualities.

[Image: 'i' in a blue circle icon]
**i Background knowledge on Scales (Suits, 2020):**

*   As scale consist of 12 full and 12 half tones. The tones are A, Ais, B, C, Cis, D, Dis, E, F, Fis, G, Gis which than repeats as A+, Ais+, B+ and so on.
*   Tone 'A' has a frequency of 440 Hertz.
*   Tone 'A+' is 1 octave higher and has a frequency of 880 Hz.
*   There is a constant such that Toneᵢ₊₁ = C × Toneᵢ, while Toneᵢ₊₁₂ = 2 × Toneᵢ
*   Therefore: Toneᵢ₊₁₂ = C(C(C ... (C × Toneᵢ) ...)) = C¹² Toneᵢ
*   From these two formulas C can be retrieved. C is the 12th power root from the number 2.
*   The result is C = 1,05946.

The architecture of the VHDL piano is visualized in Figure 4. The PS/2 keyboard data is fed in to the first component (Readkey) that processes the keystrokes and presents them to the `tone_generation` component. Using the keys pressed on the keyboard `tone_generation` generates the tones that are linked to the keys on the keyboard and steps up and down in tone height (octave steps up and down).

For debugging purposes, 4 times a 7-segment display is used to show the hexadecimal values of the keystrokes on the keyboard.

[Image: Architecture diagram of VHDL Piano. Input from Keyboard goes to a VHDL Piano block. Inside, a Read Key component connects to four Display components and a Tone Generation component. The Tone Generation component outputs Audio.]
*Figure 4: Architecture diagram of VHDL Piano*

#### 3.1 readkey component

The purpose of this component is to decode the serial data that is sent from the PS/2 keyboard and present it in a parallel to `tone_generation`.

Component `readKey` is built from 3 other components: `ShowKey` is converting serial data from the PS/2 asynchrony serial data to parallel data, `ConstantKey` presents the hexadecimal value for the key being pressed for the press duration, while component `clock-domain-crossing` is converting from one clock domain to another.

The architecture of `readKey` is shown in Figure 5. The `readKey` component has 5 outputs. The first output is the code of the key that is pressed on the keyboard. The other 4 ports are used to connect 4 7-segment displays to. These displays will show the code sent from the keyboard when pressed of release a key. Hen no key is pressed the displays will show 0x00 or are beings switched off.

[Image: Architecture diagram of the readKey component. Keyboard input goes to Clock Domain crossing, then to Show Key, then to Constant Key, which outputs a Key signal.]
*Figure 5: readKey architecture*

#### 3.2 tone_generation component

Component `tone_generation` received the information for the tone to be generated from `readkey`. For the duration a key is pressed, the corresponding tone is generated. `tone_generation` is divided into the components `Key2Pulselength`, `ClockGenerator` and `Key2Audio` which is generating the actual tone. See Figure 6 for the architecture of `tone_generation`.

Generation of the audio tone is done by `Key2Pulselength` which is providing the period time for the audio tone based on a given frequency generated by `ClockGenerator`. When the frequency generated by `ClockGenerator` is multiplied or divided by 2 the audio tone will increment or decrement by an octave.

[Image: Architecture diagram of the Tone Generation component. A Key input goes to a Key to Pulselength component. This component and a Clock Generator component both feed into a Pulselength to Audio component, which outputs an Audio signal.]
*Figure 6: Architecture diagram Tone Generation*

### 4 User interface and manual

When the DE10-Lite is programmed with the VHDL-piano-code as PS/2 compatible keyboard shall be connected using a Arduino shield shaped interface board that will piggyback on the Arduino connectors of the DE10-lite. This board is called the "Piano-shield”. The piano shield also has a speaker that will make the keystrokes on the keyboard audible.

The PS/2 keyboard will substitute a normal instrument keyboard as being shown in Figure 7. In this figure the primary notes are written on the black and white keys.

[Image: Diagram of a piano keyboard showing the notes C, D, E, F, G, A, B, C on the white keys and the sharp/flat notes on the black keys.]
*Figure 7: Instrument keyboard with notes*

The PS/2 keyboard which we will use for this assignment has no white and black keys and the keys are not arranged as on an instrument like a piano or organ. Therefore, we will use the keys of the PS/2 keyboard in a manner that represents the instrument keyboard as presented in Figure 8.

[Image: Diagram showing the mapping of PS/2 keyboard keys (QWERTY row and number row) to piano notes and their hex codes.]
*Figure 8: Notes and key arrangement of the PS/2 keyboard.*

With this layout the black keys are on the row with the number-keys while the white keys are on the row with the letters "QWERTY”.

The tone keyboard is increase with one octave by pressing key A and lowered with one octave pressing key Z.

The DE10-Lite FPGA prototype board is expanded with a shield in an Arduino formfactor that has the PS/2 mini-din connector and a speaker. The user interface of VHDL piano is visualised in Figure 9.

Each keystroke, when mapped to the keys that will generate a tone, will result in the corresponding tone to be heard on the speaker. Audio is also displayed on LED1. The hexadecimal value of current key being pressed will be displayed on HEX2 and HEX3 while the hexadecimal value representing the previous key will be displayed on HEX0 and HEX1.

KEY1 of the DE10-Lite board will reset the VHDL piano. A reset is indicated with LED0 being off.

[Image: Diagram of the DE10-Lite board with the piano shield. It highlights the PS/2 connector, Speaker, 7-segment displays (HEX3-HEX0 for Current key and Previous key), LEDs (Run, Audio), and Buttons (Reset).]
*Figure 9: User interface for VHDL piano in DE10-Lite FPGA board*

---

### 5 Assignments

The construction of the VHDL piano is partitioned into 7 assignments. Each assignment will result in a built component or in combining 2 or more components into another component. In the last assignment all components will be built together into the top-level entity of the VHDL piano.

The assignments are structured in 3 parts.

1.  Theory
2.  Design description
3.  Construction directives, using a Work breakdown structure (WBS), and testing the operation using either waveform analysis or a testbench.

#### 5.1 Assignment 0: 7-segment driver and structural VHDL

Assignment 0 is divided into part a and part b. With part a the 7-segment driver is implemented while with part b, the 7-segment driver is reused as a component in 2 different ways.

[Image: Graduation cap icon]
In this assignment students will learn to use 7 out of 4 decoders as a component in a VHDL architecture. Also, the use of the GENRATE statement is exercised.

[Image: Lightbulb icon]
If you have a 7-segment driver from a previous assignment you may want to reuse this drive for this assignment.

##### 5.1.1 Theory

###### 5.1.1.1 7-segement displays

A Display Decoder (7-segment decoder) is a combinational circuit which decodes a 4-bit input value into 7 of output lines to drive a display (Electronic Tutorials, 2019). 7-segment LED displays provide a convenient way of displaying information or digital data in the form of numbers, letters or even alpha-numerical characters.

Typically, 7-segment displays consist of seven individual coloured LED's (called the segments), within one single display package. To produce the required numbers or HEX characters from 0 to 9 and A to F respectively, on the display the correct combination of LED segments need to be illuminated. BCD to 7-segment Display Decoders such as the 74LS47 do just that.

A standard 7-segment LED display generally has eight (8) input connections, one for each LED segment and one that acts as a common terminal or connection for all the internal display segments. Some single displays have an input to display a decimal point in their lower right- or left-hand corner.

In electronics there are two important types of 7-segment LED digital display:

1.  The Common Cathode Display (CCD) – In the common cathode display, all the cathode connections of the LED's are joined to logic "0" or ground. The individual segments are illuminated by application of a "HIGH", logic "1" signal to the individual Anode terminals.
2.  The Common Anode Display (CAD) – In the common anode display, all the anode connections of the LED's are joined together to logic "1" and the individual segments are illuminated by connecting the individual Cathode terminals to a “LOW”, logic "0" signal.

The displays that are used on the DE10-Lite FPGA prototype board are of the type of CAD. The display and the circuit to switch the individual LEDs on and off is shown in Figure 10.

[Image: A diagram showing a common anode 7-segment display with segment numbering and a circuit with resistors connecting to ground.]
*Figure 10: 7-segment display with example circuit for testing and segment numbering.*

The VHDL code presented in this document is designed to deliver decoder functions that can be used in in combination with any FPGA development board that used CAD type displays like the DE10-Lite.

###### 5.1.1.2 Structural VHDL

Component instantiation is a concurrent statement that can be used to connect circuit elements at a very low level or most frequently at the top level of a design. A VHDL design description written exclusively with component instantiations is known as Structural VHDL. Structural VHDL defines behaviour by describing how components are connected.

[Image: Stack of books icon]
Study Pedroni paragraph "8.3 COMPONENT"

The most common way of writing an instantiation, is by declaring a component for the entity you want to instantiate. There are a few different places where you can write your component declaration.

**Method 1: COMPONENT instantiation**

1.  Declare a VHDL Component in the VHDL Architecture

You can write the VHDL component declaration in the declarative part of the architecture. The advantage of this style is that you can see the generic list and port list of your component in the same file you are typing your instantiation. On the downside, if you want to instantiate that entity many times, you will have many copies of the component in many different places.

2.  Component instantiation

The instantiation statement connects a declared component to signals in the architecture. The instantiation has 3 key parts:

*   Label - Identifies unique instance of component
*   Component Type - Select the desired declared component
*   Port Map - Connect component to signals in the architecture

An example of COMPONENT instantiation is found in Code snippet 1.

*Code snippet 1: Code example using COMPONENT instantiation*
```vhdl
LIBRARY ieee;
USE ieee.STD_LOGIC_1164.all;

ARCHITECTURE LogicFunction OF clock_domain_crossing IS
    -- Declaration of COMPONENT in declarative part of ARCHITECTURE
    COMPONENT flipflop PORT (
        D,
        clk,
        reset : in STD_LOGIC;
        Q     : out STD_LOGIC);
    END COMPONENT;

    -- signals declarations
    SIGNAL kbdatasignal, kbclocksignal : STD_LOGIC;
BEGIN
    -- component instantiations
    c0: flipflop PORT MAP (kbdata,         clk, reset, kbdatasignal );
    c1: flipflop PORT MAP (kbdatasignal,   clk, reset, kbdatasync );
    c2: flipflop PORT MAP (kbclock,        clk, reset, kbclocksignal );
    c3: flipflop PORT MAP (kbclocksignal,  clk, reset, kbclocksync );
END LogicFunction; -- end architecture

--------------------------------------------------------------------

LIBRARY ieee;
USE ieee.STD_LOGIC_1164.all;

ENTITY flipflop IS  -- generic function of flipflop
    PORT (
        D     : in STD_LOGIC;
        clk   : in STD_LOGIC;
        reset : in STD_LOGIC;
        Q     : out STD_LOGIC
    );
END flipflop;

ARCHITECTURE Logic OF flipflop IS
BEGIN
    flipflop_process: PROCESS (clk, reset) IS
    BEGIN
        IF reset = '0' THEN
            Q <= '0';
        ELSIF rising_edge(clk) THEN
            Q <= D;
        END IF;
    END PROCESS;
END Logic;
```

**Method 2: ENTITY instantiation**

Since VHDL'93, you really don't need VHDL components anymore. You can instantiate the ENTITY directly as presented in Code snippet 2:

*Code snippet 2: Example code using ENTITY Instantiation*
```vhdl
ARCHITECTURE structure OF orgeltje IS
    -- declarative part of ARCHITECTURE
BEGIN
    -- create 7-segement decoders and connect to signals and ports
    Display0 : work.seg7dec port map ( s_sw0, HEX0 ); -- 7-segment decoder 0
    Display1 : work.seg7dec port map ( s_sw1, HEX1 ); -- 7-segment decoder 1
    Display2 : work.seg7dec port map ( s_sw2, HEX2 ); -- 7-segment decoder 2
    Display3 : work.seg7dec port map ( s_sw3, HEX3 ); -- 7-segment decoder 3
END structure;
```
In this case the ENTITY `seg7dec` is declared in a separate VHDL-file. The instantiation statement is the same as being used with COMPONENT instantiation where the component type is prefixed with "work.” to indicate that the ENTITY mentioned here is within the scope of the project.

[Image: Stack of books icon]
See paragraph "8.3 Component" in Pedroni on page 203.

###### 5.1.1.3 Generate statement

The generate statement is an efficient way to specify designs with a regular structure. It provides a mechanism for conditional compilation.

[Image: Stack of books icon]
Study Pedroni paragraph "5.5 The GENERATE Statement"

The generate statement simplifies description of regular design structures. Usually, it is used to specify a group of identical components using just one component specification and repeating it using the generate mechanism. (Renerta, 2020)

A generate statement consists of three main parts:

*   generation scheme (either for scheme or if scheme);
*   declarative part (local declarations of subprograms, types, signals, constants, components, attributes, configurations, files and groups);
*   concurrent statements.

The generation scheme specifies how the concurrent structure statement should be generated. There are two generation schemes available: `for` scheme and `if` scheme.

The `for`-generation scheme is used to describe regular structures in the design. In such a case, the generation parameter and its scope of values are generated in similar way as in the sequential loop statement.

The example in Code snippet 3 presents VHDL code that connects 4 signals from PORT `SW` to 4 SIGNALS from SIGNAL `s_sw0`. In Code snippet 4 the VHDL code from Code snippet 3 is replaced by a GENERATE statement. While in this example the efficiency gained from replacing 4 assignment statements by a GENERATE statement is negligible, with bigger and more complex structures the use of GENERATE is beneficial.

*Code snippet 3: Connecting PORS to SIGNALS using VHDL ASSIGNMENT statement*
```vhdl
s_sw0(0) <= SW(0);
s_sw0(1) <= SW(1);
s_sw0(2) <= SW(2);
s_sw0(3) <= SW(3);
```

*Code snippet 4: VHDL code using GENERATE statement.*
```vhdl
G0: FOR i IN 0 TO 3 GENERATE
    s_sw0(i) <= SW(i);
END GENERATE;
```

##### 5.1.2 Design

Binary numbers are made up using 4 data bits (a *nibble* or *half a byte*) that range from 0 through to F, shown in Figure 11.

[Image: Diagram showing a 4-bit input (A,B,C,D) going to a Binary to 7-Segment decoder, which then drives a 7-segment display.]
*Figure 11: Signals involved.*

To display the number "3" for example, segments 0, 1, 2, 3 and 6 would need to be illuminated. If we wanted to display a different number or letter, then a different set of segments would need to be illuminated. Then for a 7-segment display, we can produce a truth table giving the segments that need to be illuminated to produce the required character as shown in Table 1.

*Table 1: Conversion table form binary to 7-segment*
| Meaning | Dot | D | C | B | A | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | Display |
| :--- | :---: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :--- |
| **zero** | X | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 |
| **one** | X | 0 | 0 | 0 | 1 | 1 | 0 | 0 | 1 | 1 | 1 | 1 | 0 | 1 |
| **two** | X | 0 | 0 | 1 | 0 | 0 | 0 | 1 | 0 | 0 | 1 | 0 | 0 | 2 |
| **three** | X | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 1 | 1 | 0 | 0 | 3 |
| **four** | X | 0 | 1 | 0 | 0 | 1 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 4 |
| **five** | X | 0 | 1 | 0 | 1 | 0 | 1 | 0 | 0 | 1 | 0 | 0 | 0 | 5 |
| **six** | X | 0 | 1 | 1 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 6 |
| **seven** | X | 0 | 1 | 1 | 1 | 0 | 0 | 0 | 1 | 1 | 1 | 1 | 0 | 7 |
| **eight** | X | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 8 |
| **nine** | X | 1 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 9 |
| **a** | X | 1 | 0 | 1 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | a |
| **b** | X | 1 | 0 | 1 | 1 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | b |
| **c** | X | 1 | 1 | 0 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 1 | 0 | c |
| **d** | X | 1 | 1 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | d |
| **e** | X | 1 | 1 | 1 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | e |
| **f** | X | 1 | 1 | 1 | 1 | 0 | 1 | 1 | 1 | 0 | 0 | 0 | 0 | f |
| **off** | 0 | X | X | X | X | X | X | X | X | X | X | X | 0 | - |
| **on** | 1 | X | X | X | X | X | X | X | X | X | X | X | 1 | - |

Using K-map it is possible to derive logic functions that translates if a led shall be illuminated based on the input signals. In the case of the 7-segment display this will result in 84 K-maps and 32 SOP formulas. This is labour intensive and time consuming. Therefore, this design is using the WITH – SELECT statement in VHDL as presented in Code snippet 5.

*Code snippet 5: VHDL WITH - SELECT example*
```vhdl
-- Display decoder. This code is using "WITH - SELECT" to encode 6
-- segments on the HEX diplay. This code is using the CONSTANTS
-- that are defined at GENERIC.

WITH input SELECT
    display(0 TO 6) <=
        hex_zero  WHEN "0000", -- 0
        hex_one   WHEN "0001", -- 1
        hex_two   WHEN "0010", -- 2
        hex_three WHEN "0011", -- 3
        hex_four  WHEN "0100", -- 4
        hex_five  WHEN "0101", -- 5
        hex_six   WHEN "0110", -- 6
        hex_seven WHEN "0111", -- 7
        hex_eight WHEN "1000", -- 8
        hex_nine  WHEN "1001", -- 9
        hex_a     WHEN "1010", -- a
        hex_b     WHEN "1011", -- b
        hex_c     WHEN "1100", -- c
        hex_d     WHEN "1101", -- d
        hex_e     WHEN "1110", -- e
        hex_f     WHEN "1111", -- f
        (OTHERS =>'1') WHEN OTHERS;
```

For maintenance purpose the VHDL code is using CONSTANTS for the signal that is send to the 7-segment display.

*Code snippet 6: VHDL example using CONSTANT*
```vhdl
--! Because the LEDs are controlled using inverted logic we have to apply a
--! '1' to switch the LED off.

--                            Segment number -> 0123456
CONSTANT hex_zero:  STD_LOGIC_VECTOR(0 TO 6) := "0000001"; -- 0
CONSTANT hex_one:   STD_LOGIC_VECTOR(0 TO 6) := "1001111"; -- 1
CONSTANT hex_two:   STD_LOGIC_VECTOR(0 TO 6) := "0010010"; -- 2
CONSTANT hex_three: STD_LOGIC_VECTOR(0 TO 6) := "0000110"; -- 3
CONSTANT hex_four:  STD_LOGIC_VECTOR(0 TO 6) := "1001100"; -- 4
CONSTANT hex_five:  STD_LOGIC_VECTOR(0 TO 6) := "0100100"; -- 5
CONSTANT hex_six:   STD_LOGIC_VECTOR(0 TO 6) := "0100000"; -- 6
CONSTANT hex_seven: STD_LOGIC_VECTOR(0 TO 6) := "0001111"; -- 7
CONSTANT hex_eight: STD_LOGIC_VECTOR(0 TO 6) := "0000000"; -- 8
CONSTANT hex_nine:  STD_LOGIC_VECTOR(0 TO 6) := "0000100"; -- 9
CONSTANT hex_a:     STD_LOGIC_VECTOR(0 TO 6) := "0001000"; -- a
CONSTANT hex_b:     STD_LOGIC_VECTOR(0 TO 6) := "1100000"; -- b
CONSTANT hex_c:     STD_LOGIC_VECTOR(0 TO 6) := "0110001"; -- c
CONSTANT hex_d:     STD_LOGIC_VECTOR(0 TO 6) := "1000010"; -- d
CONSTANT hex_e:     STD_LOGIC_VECTOR(0 TO 6) := "0110000"; -- e
CONSTANT hex_f:     STD_LOGIC_VECTOR(0 TO 6) := "0111000"; -- f
```

In this assignment a 7-segment driver will be used as a component. This component will be instantiated multiple times to drive the 4- HEX-displays. To drive the HEX displays the switches SW[0..9] will be used. See architecture diagram in Figure 12.

[Image: Architecture diagram for assignment_0. An input SW is split into SW[0..3], SW[4..7], and SW[8..9], which feed into Display0, Display1, and Display2/Display3 respectively.]
*Figure 12: Assignment 0 Architecture diagram*

Because the 7-segment driver will be reused in the VHDL piano the PORT definitions provided are mandatory to ensure connectivity. The input-process-output diagram with the required ports is given in Figure 13.

[Image: Lightbulb icon]
For the implementation of the ARCHITECTURE of the 7-segment driver the 7-segment driver that was designed for the ALU can be reused.

[Image: Input-process-output diagram for a binary to 7-segment decoder. Input is a 4-bit binary code, output is 7-segments.]
*Figure 13: Input-process-output diagram for binary to 7-segment decoder*

##### 5.1.3 Realisation and verification

With this assignment a multiplexer will be implemented in VHDL to control the 7 segments of a 7-segmend LED-display using 4 control signals.

The operation of the implemented VHDL code is tested using waveform or by manually switching the switches to encode 4-bits binary data and read the characters from the display.

###### 5.1.3.1 Activity 1

[Image: Yellow warning triangle icon]
**! The following activities are mandatory to be followed while the whole assignment depends on the use of this repository.**

-   Download the files for assignment 0 from Gitlab: [https://gitlab.com/wlgrw/han-soc-assignment-vhdl-piano](https://gitlab.com/wlgrw/han-soc-assignment-vhdl-piano)
-   Open with Quartus the project “seg7dec” in folder "assignment_0" or create a new project with the top-level ENTITY name `seg7dec`.
-   Verify if the ENTITY `seg7dec` has implemented the PORTS according to the specification in Code snippet 7.

*Code snippet 7: Library and ENTITY of component seg7dec*
```vhdl
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY seg7dec IS
    port(
        c       : IN  STD_LOGIC_VECTOR(3 downto 0);
        display : OUT STD_LOGIC_VECTOR(0 to 7)
    );
END ENTITY seg7dec;
```

###### 5.1.3.2 Activity 2

[Image: 'i' in a blue circle icon]
The following activities apply for the design of a new 7-segment driver. In the case of the reuse of an existing 7-segment driver other steps are applicable to the discretion of the student.

-   Determine the functions of the display driver
-   Design the characters to be displayed.
-   Setup architecture
-   Implement functions
-   Implement the 7 out of 4 decoder or 7-segment display driver in the ARCHITECTURE of ENTITY `seg7dec`.

[Image: Stack of books icon]
The use of CONSTANTS will improve the code quality.
See paragraph “2.6 GENERIC” of Pedroni.

-   Compile the project
-   Test the Implementation of the 7-segment driver display using the truth table for the 7 out of 4 decoder and a Waveform simulation.

[Image: Lightbulb icon]
For the verification of ENTITY `seg7dec` you may use a truth table to compare the results of the individual 7-segments at a given 4-bit input using a truth table where the value of the 4- and 7-bit vector is presented as a decimal value. A truth table can be found in Worksheet 1 on page 59.

-   Test functions of the new display driver using Switches and a 7-segment display

*(The content from page 20 to 59 follows a similar pattern of theory, diagrams, code snippets, and instructions for each of the 7 assignments. The following is a condensed but complete representation of the remaining pages.)*

---

#### 5.2 Assignment 1: showKey

In this assignment we will create COMPONENT `showKey`. COMPONENT `showKey` is part of COMPONENT `readkey`. `showkey` reads the serial data from the PS/2 keyboard and presents the serial bytes parallel to `constantKey`. See the architecture diagram in Figure 17.

[Image: Graduation cap icon]
With this assignment knowledge will be gained on the PS/2 interface, the sequential processing of serial data and converting to parallel data and testing and verification using a testbench.

[Image: Architecture diagram of readKey with the Show Key component highlighted.]
*Figure 14: readKey architecture*

##### 5.2.1 Theory

###### 5.2.1.1 PS/2 serial data
The PS/2 interface uses `kbclock` and `kbdata`. Data is sent over `kbdata` and is valid when `kbclock` is low.

[Image: Timing diagram for PS/2 device-to-host communication, showing CLOCK and DATA signals for a start bit, 8 data bits, a parity bit, and a stop bit.]
*Figure 15: Device-to-host communication. (Chapweske, 2020)*

*   A pressed key generates a unique 8-bit code.
*   A released key generates two codes: `0xF0` followed by the key's code.
*   The PS/2 protocol sends 11 bits: 1 start bit, 8 data bits (LSB first), 1 parity bit, 1 stop bit.
*   `kbdata` is stable at the falling edge of `kbclock`.

... *(theory on testbenches, VHDL testbench code snippet for `showKey`, design diagrams, and implementation steps are provided)* ...

[Image: Flowchart for the ShowKey component logic.]
*Figure 17: ShowKey Flowchart*

... *(Implementation steps for `showKey` including creating a testbench)* ...

---

#### 5.3 Assignment 2: Component `readKey`

In this assignment we will create COMPONENT `constantKey` and combine it with `showKey` and `crossDomainCrossing` into the COMPONENT `readKey`.

[Image: Architecture diagram of readKey with the Constant Key component highlighted.]
*Figure 18: readKey architecture*

[Image: Graduation cap icon]
With this assignment knowledge will be gained on state machines in VHDL and Cross Domain Crossing.

##### 5.3.1 Theory

###### 5.3.1.1 State machines
Digital systems have combinational and sequential circuits. There are two types of finite state machines (FSM): Mealy and Moore.

[Image: Diagram of a Mealy FSM schematic view.]
*Figure 19: Mealy FSM schematic view*

[Image: Diagram of a Moore FSM schematic view.]
*Figure 20: Moore FSM schematic view*

... *(Theory on FSMs, UML state diagrams, VHDL implementation, and Clock Domain Crossing (CDC) is provided)* ...

[Image: State diagram for the constantKey component.]
*Figure 24: constantKey State diagram*

... *(Design and implementation steps for `constantKey` and then integrating all components into `readKey` are provided)* ...

---

#### 5.4 Assignment 3: Component `clockGenerator`

This assignment creates COMPONENT `clockGenerator`, which will be part of `tone_generation`.

[Image: Architecture diagram of Tone Generation with the Clock Generator component highlighted.]
*Figure 27: Architecture diagram Tone Generation with COMPONENT clockGenerator*

##### 5.4.1 Theory
Clock division is used to generate lower frequencies from the main 50 MHz clock. A simple divide-by-2 is shown, and then generalized.

[Image: Diagram of a 4-bit binary ripple counter.]
*Figure 28: 4-bit binary ripple counter*

... *(Theory on clock dividers, VHDL examples, and the design of a `clockGenerator` that can change octaves based on key presses 'A' and 'Z' are provided)* ...

[Image: State diagram for the clock_divider component, showing transitions between states that output different clock frequencies.]
*Figure 33: State diagram for component clock_divider*

... *(Implementation and simulation steps for `clockGenerator` are provided)* ...

---

#### 5.5 Assignment 4: Component `key2pulselength`

This assignment creates `key2pulselength`.

[Image: Architecture diagram of Tone Generation with the Key to Pulselength component highlighted.]
*Figure 34: Architecture diagram Tone Generation with COMPONENT key2pulselength*

##### 5.5.1 Theory
This section discusses creating a clock divider by a variable factor 'n', and how this is used for tone generation.

*Table 3: Conversion table from key and tone to divisor.*
| No | Key | Hex | Tone | Freq (Hz) | Divisor |
| :-- | :--- | :-- | :--- | :--- | :--- |
| **1** | TAB | 0D | A | 440 | 7102 |
| **2** | 1! | 16 | Ais | 466 | 6704 |
| **3** | Q | 15 | B | 494 | 6327 |
| ... | ... | ... | ... | ... | ... |
| **22** | Back | 41 | Fis+ | 1480 | 2112 |

... *(Design and implementation details for `key2pulselength`, which converts a key code into an integer representing a pulse length for the audio tone)* ...

---

#### 5.6 Assignment 5: Component `pulselength2audio`

This assignment creates `pulselength2audio`.

[Image: Architecture diagram of Tone Generation with the Pulselength to Audio component highlighted.]
*Figure 37: Architecture diagram Tone Generation with COMPONENT pulselength2audio*

... *(Design and implementation details for `pulselength2audio`, which takes the pulse length and a clock to generate the final square wave audio signal)* ...

---

#### 5.7 Assignment 6: Component `tone_generation`

This assignment combines `clockGenerator`, `key2pulselength`, and `pulselength2audio` into the `tone_generation` component.

[Image: Technology map of the tone_generation component showing its sub-components and their connections.]
*Figure 40: Technology map of tone_generation*

... *(Structural VHDL implementation steps to combine the previously built components)* ...

---

#### 5.8 Assignment 7: VHLD piano top-level

This final assignment brings all previous components together into the top-level VHDL piano design.

[Image: Technology map of the complete VHDL piano, showing all components from `readkey` to `tone_generation` and connections to board I/O like HEX displays and audio out.]
*Figure 41: Technology map of the VHDL piano.*

*Table 4: pin labels for I/O with DE10-Lite*
| Arduino Pin | FPGA pin | PORT label | Comment |
| :--- | :--- | :--- | :--- |
| D3 | arduino_io3 | Speaker | Audio to speaker |
| D4 | arduino_io4 | PS2_CLK | Clock from PS/2 keyboard |
| D5 | arduino_io5 | PS2_DAT | Data from PS/2 keyboard |
| D6 | arduino_io6 | PS2_CLK2 | Clock to PS/2 keyboard (not used in VHDL Piano) |
| D7 | arduino_io7 | PS2_DAT2 | Data to PS/2 keyboard (not used in VHDL Piano) |

... *(Final implementation steps, including creating the top-level entity, including all necessary VHDL files, designing the structural code, compiling, assigning pins, and final testing on hardware)* ...

---

### 6 References

Chapweske, A. (2020, 3 18). *PS/2 Mouse/Keyboard Protocol*. Retrieved from Burton Systems Software: http://www.burtonsys.com/ps2_chapweske.htm

Electronic Tutorials. (2019, 11 1). *Display Decoder*. Retrieved from Electronic Tutorials: https://www.electronics-tutorials.ws/combination/comb_6.html

Renerta. (2020, 4 1). *Generate Statement*. Retrieved from VHDL Language Reference Guide: http://vhdl.renerta.com/mobile/source/vhd00033.htm

Suits, B. (2020, 3 22). *Notes*. Retrieved from Physics of music: https://pages.mtu.edu/~suits/notefreqs.html

Verma, S., & Dabare, A. (2020, 3 18). *Understanding Clock Domain Crossing Issues*. Retrieved from EE|Times: https://www.eetimes.com/understanding-clock-domain-crossing-issues/#

Welling, R. (2019). *Logic Circuits - Final-Assingment*. Arnhem: HAN.

Wikimedia. (2020, 3 18). *PS/2 port*. Retrieved from Wikipedia: https://en.wikipedia.org/wiki/PS/2_port

---

### 7 Appendix

#### 7.1 Create testbench How to

This how to describes the creation of a testbench for simulation with Modelsim.

-   Go in the menu to: Assignments > Settings
-   In "EDA Toolsettings > Simulation" set: Output directory to "simulation/modelsim"
-   If not opened yet: Open project
-   Open VHDL code of the top-level entity.
-   In the menu go to: “Processing > Start > Start Test Bench Template Writer" to create a testbench for the top-level entity.
-   The testbench is generated and stored in: "C:\intelFPGA_lite\\<path to your project> \simulation\modelsim"
-   Copy the file "<top level entity name>.vht” to the same directory where the .vhd file is located of your top level entity.
-   Rename file "<top level entity name>.vht" to file "tb_<top level entity name>.vhd"
-   Import the testbench into your project
-   Modify the signals to your need.

#### 7.2 Analyse testbench How to

Add info from: [https://class.ece.uw.edu/271/peckol/doc/DE1-SoC-Board-Tutorials/ModelsimTutorials/QuartusII-Testbench-Tutorial.pdf](https://class.ece.uw.edu/271/peckol/doc/DE1-SoC-Board-Tutorials/ModelsimTutorials/QuartusII-Testbench-Tutorial.pdf)

---

### 8 Worksheets

#### 8.1 Worksheet 1

| | A | B | C | D | 1 | 2 | 3 | 4 | 5 | 6 | 7 |
| :-- | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: |
| **0** | | | | | | | | | | | |
| **1** | | | | | | | | | | | |
| **2** | | | | | | | | | | | |
| **3** | | | | | | | | | | | |
| **4** | | | | | | | | | | | |
| **5** | | | | | | | | | | | |
| **6** | | | | | | | | | | | |
| **7** | | | | | | | | | | | |
| **8** | | | | | | | | | | | |
| **9** | | | | | | | | | | | |
| **10** | | | | | | | | | | | |
| **11** | | | | | | | | | | | |
| **12** | | | | | | | | | | | |
| **13** | | | | | | | | | | | |
| **14** | | | | | | | | | | | |
| **15** | | | | | | | | | | | |