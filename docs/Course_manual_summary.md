This document provides a comprehensive summary of the System on a Chip (SOC) course (D-H-EHE-SOC) at HAN University of Applied Sciences, based on the provided course planning, lecture manuals, assignment descriptions, and grading rubrics.

# 1. Course Overview

The System on a Chip (SOC) course is a core component of the Embedded Hardware Engineering (H-EHE) module for the Embedded Systems Engineering (ESE) program. The course provides an introduction to hardware description using VHDL and the realization of logic circuits on Field Programmable Gate Arrays (FPGAs).

## 1.1. Learning Objectives
The primary goals of the course are for students to:
*   Understand and perform calculations with various number systems (binary, hex) and coding systems (ASCII, BCD, 2's complement).
*   Analyze, simplify (using Boolean algebra, Karnaugh maps), and design combinational and sequential logic circuits.
*   Master the fundamentals of VHDL, including concurrent and sequential syntax, for modeling and describing programmable logic.
*   Implement, test, and debug VHDL designs on an FPGA development board using an Integrated Development Environment (IDE).
*   Design and implement complex digital systems like an Arithmetic Logic Unit (ALU) and a VHDL-based piano.
*   Understand and apply concepts like Finite State Machines (FSMs), clock generation, and testbenches.
*   Manage project code using a version control system (Git).

## 1.2. Course Methodology: Flipped Classroom
The course is organized using a **Flipped Classroom (FC)** approach.
*   **Before Class (Mandatory):** Students must study the theoretical materials from the textbook and provided videos, prepare questions, and attempt example problems.
*   **During Class:** Class time is dedicated to discussing student questions, covering supplementary theory from the lecturer, and working collaboratively on exercises.
*   **After Class:** Students review the class topics and take a weekly formative (non-graded) test to gauge their understanding.

# 2. Course Logistics & Materials

## 2.1. Required Literature
1.  **Sprint 1 (Logic Circuits):**
    *   *Electrical Engineering: Principles and Applications*, 7th Edition by Allen Hambley. (ISBN-13: 978-0-273-79325-0)
2.  **Sprints 2 & 3 (VHDL):** (One of the following is required)
    *   **Preferred:** *Circuit Design and Simulation Using VHDL*, 2nd Edition by Volnei A. Pedroni. (ISBN: 978-0-262-01433-5)
    *   **Also Allowed:** *Circuit Design with VHDL*, 3rd edition by Volnei A. Pedroni. (ISBN: 9780262042642) - A conversion table for chapters is provided.

## 2.2. Required Hardware
*   **FPGA Board:** Terasic DE10-Lite (Altera MAX10 10M50DAF484C7G). This board is mandatory and can be obtained through HAN ARLE or purchased directly from Terasic.
*   **PS/2 Shield:** An Arduino-form factor shield for the DE10-Lite, providing a PS/2 keyboard connector and a speaker. This is used for the VHDL Piano assignment.

## 2.3. Required Software & Services
*   **IDE:** Intel® Quartus® Prime Lite Edition **v19.1** (Mandatory version).
*   **Version Control:**
    *   **Git for Windows:** The underlying Git engine.
    *   **TortoiseGit:** A Windows shell interface for Git.
    *   **GitLab:** A web-based Git repository manager used for project submission and collaboration. Students will create private repositories for their work.

# 3. Course Structure & Planning

The course is structured into three sprints, with weekly topics and assignments.

### Sprint 1: Logic Circuits
| Week | Date | Content | Notes |
| :--- | :--- | :--- | :--- |
| 1 | 4-feb | Basic Logic Circuits, Numerical Data in Binary Form, Arithmetic | |
| 2 | 11-feb | Combinatorial Logic Circuits & Synthesis | |
| 3 | 18-feb | Minimization of Logic Circuits & Sequential Logic Circuits | Formative test is open |
| | 25-feb | *Voorjaarsvakantie (Spring Break)* | |

### Sprint 2: Concurrent Logic in VHDL & ALU Project
| Week | Date | Content | Notes |
| :--- | :--- | :--- | :--- |
| 4 | 4-mrt | Q&A Sprint 1, Intro to VHDL & Code Structure | |
| 5 | 11-mrt | VHDL Data Types, Operators, and Attributes | |
| 6 | 18-mrt | Concurrent & Sequential Code | |
| 7 | 25-mrt | VHDL SIGNAL, VARIABLE, PACKAGE, COMPONENT | |
| 8 | 1-apr | *Herkansingweek P2 (Resit Week)* | |
| 9 | 8-apr | **Submission of ALU Project** | *Tentamen P3 (Exam Week)* |

### Sprint 3: Sequential Logic in VHDL & Piano Project
| Week | Date | Content | Notes |
| :--- | :--- | :--- | :--- |
| 10 | 15-apr | Concurrent vs sequential logic, Testbenches | |
| 11 | 22-apr | FSM (UML, Quartus), Concurrent vs sequential | |
| | 29-apr | *Meivakantie (May Break)* | |
| 12 | 6-mei | Clock generation, ripple counters, PLL | |
| 13 | 12-mei | Clock generation, ripple counters, PLL | *Vervalt (Cancelled)* |
| 14 | 20-mei | GENERATE statement, `keep` attribute, delay lines, CDC | |
| 15 | 27-mei | IP (Intellectual Property) | *Reserve* |
| 16 | 3-jun | Wrap-up/Evaluation/hands-on | |
| 17 | 10-jun | **Submission of VHDL piano** | *Herkansingsweek P3 (Resit Week)* |
| 18 | 18-jun | **Oral assessments** | *Tentamenweek P4 (Exam Week)* |
| | 24-jun | Reserve / Exam | *Lesvrij (No Classes)* |
| | 1-jul | Reserve / Exam | |

# 4. Assignments

The course features two major VHDL projects, each broken down into smaller, manageable assignments.

## 4.1. Assignment 1: Arithmetic Logic Unit (ALU) in VHDL

### 4.1.1. Objective & Overview
The goal is to design and implement a 4-bit ALU that performs a set of specified arithmetic and logical operations. The project is built using **concurrent VHDL** code, with sequential constructs only permitted for edge-sensitive registers.

### 4.1.2. Architecture & Functionality
*   **Inputs:**
    *   **Operand A (4-bit):** Primary input, also used to load the function code.
    *   **Operand B (4-bit):** Secondary input.
    *   **Function Code (F):** A 4-bit opcode that determines the operation to perform.
    *   **Control:** Manual clock inputs (KEY0, KEY1), and a mode switch (SW8) for SIGNED/UNSIGNED operations.
*   **Outputs:**
    *   **Result (R, 4-bit):** The output of the operation.
    *   **Status Flags (S, 4-bit):** CSVZ (Carry, Sign, oVerflow, Zero) flags.
*   **User Interface:**
    *   Switches SW0-SW7 are used for operand inputs.
    *   HEX displays 0, 2, and 4 show the Result, Operand B, and Operand A.
    *   HEX displays 1, 3, and 5 show the sign ('-' or other symbol) in SIGNED mode.
    *   LEDRs display status flags and operation mode.
*   **Opcodes:** The ALU supports 16 operations, including `CLR`, `INC`, `ADD`, `SUB`, `AND`, `OR`, `XOR`, `NOT`, and various shift/rotate operations (`SHL`, `ROL`, `SHR`, `ROR`).

### 4.1.3. Project Breakdown
The ALU project is divided into 9 assignments:
1.  **Obtain the board.**
2.  **Install the software** (Quartus, Git).
3.  **Getting started with GIT:** Clone the repository, create a private GitLab project.
4.  **7-segment display, testing:** Implement a 7-segment decoder.
5.  **Logic- and arithmetic unit:** Design the core functional units.
6.  **Operand- Result interpreter:** Handle SIGNED/UNSIGNED display logic.
7.  **n-bit buffer:** Implement a D-flipflop based register.
8.  **Integration, testing:** Combine all components.
9.  **Submission:** Submit the final project.

## 4.2. Assignment 2: A Piano in VHDL

### 4.2.1. Objective & Overview
The goal is to create an electronic piano that generates audible tones based on input from a PS/2 keyboard. This project focuses heavily on **sequential logic**, FSMs, and interfacing with external peripherals.

### 4.2.2. Architecture & Functionality
*   **Top-Level Components:**
    *   `readKey`: Decodes serial data from the PS/2 keyboard.
    *   `tone_generation`: Generates the audio signal based on the decoded key.
    *   `7-segment displays`: Used for debugging to show the hex codes of pressed keys.
*   **Functionality:**
    *   A PS/2 keyboard is used as input. Specific keys map to musical notes (`QWERTY` row for white keys, number row for black keys).
    *   A speaker connected via the shield produces the tones.
    *   Keys 'A' and 'Z' shift the octave up and down.
    *   HEX displays show the current and previously pressed key scancodes for debugging.
    *   KEY1 on the board acts as a reset.

### 4.2.3. Project Breakdown
The Piano project is divided into 7 assignments:
0.  **7-segment driver and structural VHDL:** A foundational component.
1.  **showKey:** Component to process raw PS/2 serial data.
2.  **Component readKey:** Higher-level key-press-and-release logic.
3.  **Component clockGenerator:** Creates different clock frequencies for octave changes.
4.  **Component key2pulselength:** Converts a key press into a pulse length (divisor) for tone generation.
5.  **Component pulselength2audio:** Generates the final audio square wave.
6.  **Component tone_generation:** Integrates clock, key, and audio generation logic.
7.  **VHDL piano top-level:** Final integration of all parts.

# 5. Assessment and Grading

Both projects are evaluated based on a combination of code quality, VHDL language proficiency, functionality, and (for the piano) an oral assessment.

## 5.1. Knock-out Criteria
*   The project **must compile** without errors.
*   **ALU Specific:** Sequential constructs (PROCESS blocks) are only allowed in the n-bit buffer component. The rest must be concurrent.

## 5.2. Grading Scale
A four-level scale is used for most criteria:
*   **U (Unsatisfactory/Onvoldoende):** Not implemented or fundamentally incorrect.
*   **W (Weak/Sufficient/Weinig):** Implemented but with significant issues or inconsistencies.
*   **S (Sufficient/Good/Voldoende):** Mostly correct and functional, perhaps with minor issues.
*   **G (Good/Goed):** Fully correct, consistent, and well-executed.

## 5.3. Common Grading Criteria

### Code Style (20% of grade)
*   **Capitol letters in reserved words:** Consistent use of uppercase for VHDL keywords (`ENTITY`, `PORT`, `SIGNAL`, etc.).
*   **Indentation:** Code is properly indented to reflect its structure, making it easily readable.
*   **Comments/Documentation:** Code is well-commented. Headers are updated with student names and activity descriptions. Explanations are clear and consistent.

### VHDL Language Use (30% of ALU grade, part of Piano grade)
*   **Use of `CONSTANT` and `GENERIC`:** Used appropriately to create universal, maintainable code.
*   **Use of `SIGNAL` vs. `VARIABLE`:** Correct usage and understanding of signals (for concurrent communication) and variables (for sequential logic).
*   **Initialization:** Signals and variables are initialized correctly to prevent unexpected behavior.
*   **Edge Detection:** Correct implementation (`rising_edge(clk)` or `clk'event and clk = '1'`) in PROCESS statements.
*   **Inferring Latches:** Avoidance of unintentional latches by ensuring all paths in `IF` or `CASE` statements have assignments. `WITH SELECT` is preferred for combinational logic to prevent latches.
*   **State Machines:** Use of `TYPE` to define states with sensible names.

### Product Functionality & Testing (50% of grade)
*   **ALU:** Correct implementation of all LOGIC, ARITHMETIC (SIGNED and UNSIGNED), and RESET/OPCODE functions. Testing must be done using waveforms.
*   **Piano:** Correct generation of audible tones, functioning octave changes, working RESET, and correct HEX display functionality.
*   **Testing:** Thorough testing is required. For the ALU, this involves waveform simulation covering all opcodes. For the piano, it involves demonstrating functionality and a testbench for components.

### Oral Assessment (30% of Piano grade)
*   **Answering questions:** Students must demonstrate a clear understanding of their code and VHDL concepts.
*   **Demonstration:** Quick and correct demonstration of the project's functionality.
*   **Understanding of VHDL:** Deep knowledge of the language constructs used.

# 6. Key Technical Concepts

The course covers a range of fundamental and advanced topics in digital design:
*   **VHDL Instantiation:** Using both `COMPONENT` declaration and direct `ENTITY` instantiation for structural design.
*   **Concurrent vs. Sequential Code:** Understanding that VHDL is inherently parallel and how `PROCESS` blocks are used to describe sequential behavior.
*   **`GENERATE` Statement:** Using `for...generate` to efficiently create regular, repetitive structures.
*   **Finite State Machines (FSM):** Designing and implementing both Moore and Mealy FSMs using the standard 3-process structure (next-state logic, current-state register, output logic).
*   **Clock Domain Crossing (CDC):** Understanding issues like metastability, data loss, and data incoherency, and implementing a 2-flip-flop synchronizer to mitigate them.
*   **Testbenches:** Creating VHDL testbenches to simulate and verify designs without hardware, using procedures and assertions.
*   **PS/2 Protocol:** Decoding the serial data protocol from a keyboard, including start bit, data bits, parity bit, and stop bit.

# 7. Tools and Workflow

*   **Project Setup:** Students clone a template repository from the course's GitLab.
*   **Private Repository:** Students create a new **private** project on their own GitLab account by importing the template repository URL. The naming convention is strict: `H-EHE-SOC-ALU_<studentGivenName><studentFamilyName>_<studentNumber>`.
*   **Collaboration:** Lecturers and TAs are added to the private repository with "Reporter" or "Developer" roles for assessment and support.
*   **Development:** Code is developed locally, compiled and simulated in Quartus Prime, and versioned with Git.
*   **Submission:** Final projects are submitted by creating a "release" on GitLab and uploading a ZIP archive of the release to the HandIn platform.