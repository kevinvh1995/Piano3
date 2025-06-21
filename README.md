# VHDL Piano Project

This project involves designing and implementing a functional digital piano on a Terasic DE10-Lite FPGA board using VHDL. The piano will read key presses from a PS/2 keyboard, generate corresponding musical tones, and display information on 7-segment displays. The design follows a modular, structural VHDL approach.

## Project Setup

* **Hardware:** Terasic DE10-Lite Board
* **Software:** Intel Quartus Prime Lite Edition
* **Language:** VHDL-2008
* **Target OS:** Windows
* **Shell:** powershell.exe

### Setup Steps

1. Ensure Intel Quartus Prime is installed.
2. Connect the DE10-Lite board to the PC via USB.
3. Connect a PS/2 keyboard to the GPIO pins using the appropriate interface shield.
4. Open the Quartus project file (`.qpf`) for the current assignment.
5. Compile the VHDL code and program the FPGA.

## Repository Structure Analysis

The repository contains a complete VHDL piano implementation with the following structure:

### Assignment Directories

* **assignment_0**: 7-segment decoder (`seg7dec`) - foundational component

* **assignment_1**: PS/2 serial-to-parallel converter (`showkey`)
* **assignment_2_constantKey**: Key state FSM (`constantkey`)
* **assignment_2_readKey**: Complete keyboard interface (`readkey`)
* **assignment_3**: Clock generator with octave control (`clock_generator`)
* **assignment_4**: Key-to-frequency mapping (`key2pulselength`)
* **assignment_5**: Audio tone generator (`pulselength2audio`)
* **assignment_6**: Integrated tone generation (`tone_generation`)
* **assignment_7**: Top-level piano integration (`piano`)

### Documentation

* **docs/assignment_2_211.md**: Latest assignment specification (v211)

* **docs/requirements.md**: Detailed grading criteria and requirements
* **docs/Course_manual_summary.md**: Complete course overview
* **docs/lesson_summary/**: Weekly lesson notes covering VHDL concepts
* **docs/pedroni_circuit_design/**: Reference material from textbook

### Hardware

* **hardware/**: PS/2 keyboard shield design files (Eagle & KiCad)

* **hardware/images/**: Shield photos and board layouts

## Progress Tracker

### To-Do

#### Phase 1: Component Verification & Testing

* [ ] **Assignment 0 - seg7dec Verification**
  * [ ] Open Quartus project `assignment_0/seg7dec.qpf`
  * [ ] Compile and verify synthesis without errors/warnings
  * [ ] Test all 16 input combinations (0x0-0xF) using waveform simulation
  * [ ] Verify common anode logic (0=on, 1=off) for all segments
  * [ ] Document any issues and validate against truth table
  * [ ] Test on hardware with switches if available

* [ ] **Assignment 1 - showkey Verification**
  * [ ] Open Quartus project `assignment_1/showkey.qpf`
  * [ ] Analyze PS/2 protocol implementation in `showkey.vhd`
  * [ ] Compile and resolve any synthesis issues
  * [ ] Run testbench `showkey_tb.vhd` in ModelSim
  * [ ] Verify 11-bit frame parsing (start, 8 data, parity, stop)
  * [ ] Test byte_read signal timing and scancode output
  * [ ] Validate falling edge detection of kbclock
  * [ ] Document bit counter logic and frame assembly

* [ ] **Assignment 2a - constantkey FSM Verification**
  * [ ] Open Quartus project `assignment_2_constantKey/constantkey.qpf`
  * [ ] Analyze Moore FSM implementation with 5 states
  * [ ] Verify state transition logic in RTL viewer
  * [ ] Run testbench `constantkey_tb.vhd` in ModelSim
  * [ ] Test key press/release sequence detection
  * [ ] Verify 0xF0 release code handling
  * [ ] Validate memory signals for dig2/dig3 debug outputs
  * [ ] Check for latch inference warnings

* [ ] **Assignment 2b - readkey Integration Verification**
  * [ ] Open Quartus project `assignment_2_readKey/readkey.qpf`
  * [ ] Analyze structural VHDL combining clock_domain_crossing, showkey, constantkey
  * [ ] Verify signal connections in RTL viewer
  * [ ] Run integrated testbench `readkey_tb2.vhd`
  * [ ] Test complete keyboard interface pipeline
  * [ ] Validate clock domain crossing synchronizers
  * [ ] Verify end-to-end key press to scancode output

* [ ] **Assignment 3 - clock_generator Verification**
  * [ ] Open Quartus project `assignment_3/clock_generator.qpf`
  * [ ] Analyze FSM controlling clock divider multiplexer
  * [ ] Verify 7 octave states (50MHz down to 0.78125MHz)
  * [ ] Run testbench `tb_clock_generator.vhd`
  * [ ] Test 'A' key (octave up) and 'Z' key (octave down) responses
  * [ ] Validate frequency division ratios in simulation
  * [ ] Check state machine viewer in Quartus

* [ ] **Assignment 4 - key2pulselength Verification**
  * [ ] Open Quartus project `assignment_4/key2pulselength.qpf`
  * [ ] Analyze lookup table implementation for note frequencies
  * [ ] Verify scancode to frequency divisor mapping
  * [ ] Run testbench `tb_key2pulselength.vhd`
  * [ ] Test key mappings from Table 3 (22 notes)
  * [ ] Validate integer range 0-8191 for pulselength output
  * [ ] Cross-reference with musical note frequencies

* [ ] **Assignment 5 - pulselength2audio Verification**
  * [ ] Open Quartus project `assignment_5/pulselength2audio.qpf`
  * [ ] Analyze counter-based frequency divider
  * [ ] Verify audio square wave generation logic
  * [ ] Run testbench `tb_pulselength2audio.vhd`
  * [ ] Test with various pulselength values (0, 100, 1000, 7000)
  * [ ] Measure output frequencies and validate timing
  * [ ] Verify stereo output (audiol, audior)

* [ ] **Assignment 6 - tone_generation Integration**
  * [ ] Open Quartus project `assignment_6/tone_generation.qpf`
  * [ ] Verify structural combination of clock_generator, key2pulselength, pulselength2audio
  * [ ] Run testbench `TB_tone_generation.vhd`
  * [ ] Test complete tone synthesis pipeline
  * [ ] Validate signal connections in RTL viewer
  * [ ] Verify octave shifting affects output frequency correctly

#### Phase 2: System Integration & Hardware Testing

* [ ] **Assignment 7 - Top-Level Piano Integration**
  * [ ] Open Quartus project `assignment_7/piano.qpf`
  * [ ] Analyze top-level structural VHDL connections
  * [ ] Verify pin assignments in `piano.qsf` file
  * [ ] Compile full system and resolve any errors
  * [ ] Run complete system testbench `tb_piano.vhd`
  * [ ] Validate HEX display connections (4x seg7dec instances)
  * [ ] Check Arduino shield pin mappings (io3-io5)

* [ ] **Hardware Preparation**
  * [ ] Verify DE10-Lite board availability and setup
  * [ ] Check PS/2 keyboard shield assembly
  * [ ] Test PS/2 keyboard with shield connection
  * [ ] Verify speaker output on shield
  * [ ] Program FPGA with compiled piano.sof file

* [ ] **System Validation & Testing**
  * [ ] Test reset functionality (KEY1, LED0 indicator)
  * [ ] Verify 7-segment displays show scancode values
  * [ ] Test all mapped piano keys for audio output:
    * [ ] QWERTY row (white keys): Q,W,E,R,T,Y,U,I,O,P
    * [ ] Number row (black keys): 1,2,3,4,5,6,7,8,9,0
  * [ ] Test octave controls:
    * [ ] 'A' key increases octave (higher pitch)
    * [ ] 'Z' key decreases octave (lower pitch)
  * [ ] Validate audio frequencies match expected musical notes
  * [ ] Test key press/release state management
  * [ ] Record demonstration video for submission

#### Phase 3: Code Quality & Documentation

* [ ] **VHDL Code Review & Standards Compliance**
  * [ ] Verify all reserved words use CAPITALS
  * [ ] Check consistent indentation across all files
  * [ ] Validate meaningful signal and variable names
  * [ ] Ensure proper use of CONSTANT declarations
  * [ ] Verify no BUFFER ports are used
  * [ ] Check TYPE definitions for all FSM states
  * [ ] Validate rising_edge(clk) usage over clk'EVENT
  * [ ] Review sensitivity lists for completeness
  * [ ] Check for latch inference warnings

* [ ] **Documentation & Comments Enhancement**
  * [ ] Update file headers with student information
  * [ ] Add comprehensive component documentation
  * [ ] Document all signal purposes and connections
  * [ ] Create architecture diagrams for complex components
  * [ ] Add timing diagrams for critical interfaces
  * [ ] Document design decisions and trade-offs

* [ ] **Testbench Validation & Coverage**
  * [ ] Ensure all components have working testbenches
  * [ ] Validate test coverage for edge cases
  * [ ] Add assertions for automatic verification
  * [ ] Document expected vs actual results
  * [ ] Create waveform screenshots for key tests
  * [ ] Verify ModelSim integration and wave files

#### Phase 4: Final Integration & Submission

* [ ] **Project Packaging & Git Management**
  * [ ] Create clean Git repository with proper structure
  * [ ] Add comprehensive README with setup instructions
  * [ ] Include pin assignment files and constraints
  * [ ] Package hardware test procedures
  * [ ] Create project release with ZIP archive
  * [ ] Validate all files compile without external dependencies

* [ ] **Performance Optimization & Analysis**
  * [ ] Review RTL viewer for optimal hardware utilization
  * [ ] Check timing analysis and slack margins
  * [ ] Optimize critical path delays if needed
  * [ ] Validate resource usage (LUTs, registers, RAM)
  * [ ] Document any performance bottlenecks

* [ ] **Final System Validation**
  * [ ] Perform complete end-to-end system test
  * [ ] Validate all functional requirements
  * [ ] Test edge cases and error conditions
  * [ ] Verify robust operation under various conditions
  * [ ] Create final demonstration video
  * [ ] Prepare oral presentation materials

### In-Progress

* [x] Repository analysis and documentation (COMPLETED)

* [x] Understanding project architecture and dependencies (COMPLETED)
* [x] Technical requirements identification (COMPLETED)
* [ ] Component-by-component verification starting with Assignment 0

### Done

* [x] Complete repository structure analysis

* [x] Documentation review and synthesis of all course materials
* [x] Technical requirements identification and grading criteria understanding
* [x] VHDL code analysis of key components (seg7dec, showkey, constantkey, piano)
* [x] Architecture mapping and component dependency analysis
* [x] README.md comprehensive documentation update
* [x] Progress tracker framework establishment with extensive task breakdown

## Architecture Overview

The VHDL piano consists of two main subsystems:

### 1. Keyboard Interface (`readKey`)

* **Clock Domain Crossing**: Synchronizes PS/2 signals (20kHz) to FPGA clock (50MHz)

* **Serial Decoder (`showkey`)**: Converts 11-bit PS/2 frames to 8-bit scancodes
* **State Machine (`constantkey`)**: Manages key press/release events and hold states

### 2. Tone Generation (`tone_generation`)

* **Clock Generator**: FSM-controlled frequency divider for octave selection

* **Key Mapper**: Lookup table converting scancodes to frequency divisors
* **Audio Generator**: Variable-frequency square wave generator

### 3. User Interface

* **7-Segment Displays**: Debug output showing current/previous key scancodes

* **Audio Output**: Square wave tones through Arduino shield speaker
* **Control**: Reset via KEY1, octave control via 'A'/'Z' keys

## Key Technical Concepts Implemented

### VHDL Design Patterns

* **Structural VHDL**: Hierarchical component instantiation

* **Moore FSMs**: State machines with output dependent only on current state
* **Clock Domain Crossing**: Two-flip-flop synchronizers for metastability prevention
* **Concurrent vs Sequential**: Proper use of processes vs concurrent statements

### Hardware Concepts

* **PS/2 Protocol**: 11-bit serial frames with clock/data handshaking

* **Audio Generation**: Digital frequency synthesis using counters
* **7-Segment Displays**: Common anode display driving with lookup tables

## Design Notes & Rationale

### Architecture Decisions

* All finite state machines use Moore machine architecture for predictable outputs

* Clock domain crossing properly handled with two-flip-flop synchronizers
* Signal naming follows consistent conventions (e.g., `C_` prefix for internal signals)
* Constants used for all magic numbers and configuration values
* Structural VHDL used for clear hierarchical design

### VHDL Best Practices Observed

* **Code Style**: CAPITALS for reserved words, consistent indentation

* **Language Usage**: `CONSTANT`s instead of magic numbers, avoid `BUFFER` ports
* **FSM Implementation**: `TYPE` definitions for state names, proper sensitivity lists
* **Edge Detection**: `rising_edge(clk)` preferred over `clk'EVENT AND clk='1'`
* **Testbenches**: Comprehensive verification for each component

### Frequency Calculation

Musical notes follow the equal temperament scale where each semitone is 2^(1/12) ≈ 1.05946 times the previous.
Base frequency: A4 = 440 Hz
Octave relationship: A5 = 880 Hz (2 × A4)

## Component Dependencies

```
piano (top-level)
├── readkey
│   ├── clock_domain_crossing
│   ├── showkey  
│   └── constantkey
├── tone_generation
│   ├── clock_generator
│   ├── key2pulselength
│   └── pulselength2audio
└── seg7dec (×4 instances)
```

## Key Requirements Summary

### Functional Requirements

* Generate correct musical tones for mapped keys (QWERTY row = white keys, number row = black keys)

* Octave changes with 'A' (up) and 'Z' (down) keys  
* Display current and previous key scancodes on HEX displays
* Reset functionality via KEY1 with LED0 status indication

### Technical Requirements

* **Code Style**: Use CAPITALs for reserved words, consistent indentation, meaningful comments

* **VHDL Usage**: Use `CONSTANT`s, avoid `BUFFER` ports, use `TYPE` for FSM states, use `rising_edge(clk)`
* **Architecture**: Modular structural VHDL design with Moore machine FSMs
* **Verification**: Testbenches for all components, simulation-based validation

### Grading Criteria (70% Code + 30% Oral)

* **Code Style** (20%): Formatting, comments, documentation

* **VHDL Language Usage** (30%): Proper constructs, no latches, good FSM design
* **Functionality** (50%): Working audio, octave control, displays, reset

## Courses

This library is used in the following coures:

* D-H-ESE-SOC

Please contact the lecturer of your course when the course you attend is not mentioned here.

# PS/2 interface shield

The hardware for the [PS/2 interface shield](hardware/README.md) is available.

## Disclaimer

Project templates and materials for the VHDL ALU assignment in SOC class is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; Without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

## License

VHDL examples for use in SOC class are free: You can redistribute it and/or modify it under the terms of a Creative Commons Attribution-NonCommercial 4.0 International License (<http://creativecommons.org/licenses/by-nc/4.0/>) by Remko Welling (<https://ese.han.nl/~rwelling/>) E-mail: <remko.welling@han.nl>.

<a rel="license" href="http://creativecommons.org/licenses/by-nc/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc/4.0/">Creative Commons Attribution-NonCommercial 4.0 International License</a>.
