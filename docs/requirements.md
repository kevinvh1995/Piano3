The requirements for the VHDL piano assignment that may affect your grade are comprehensively detailed across the provided sources, primarily in the assessment rubrics and assignment documentation. Your final grade for this assignment (Sprint 3) is based on a combination of your **submitted project code** (40% contribution) and your **individual performance during the oral assessment** (60% contribution).

Here is a breakdown of the requirements and how they impact your grade:

### Overall Grading Breakdown
*   **Project Code Evaluation**: This constitutes 70% of the overall assignment grade (which is 40% of the total assignment 2 grade). It is evaluated on:
    *   **Code style** (20% contribution to the project code grade).
    *   **Usage of the VHDL language** (30% contribution to the project code grade).
    *   **Good working of functionalities** (50% contribution to the project code grade).
*   **Oral Assessment**: This constitutes 30% of the overall assignment grade. It assesses your knowledge and understanding of the project.

### Knock-out Criteria
Your project must meet these fundamental criteria to be considered for grading:
*   The **project cannot be compiled**.

### Detailed Grading Criteria

#### I. Project Code Evaluation

**A. Code Style (20% of Project Code Grade)**
*   **Use of CAPITAL letters in reserved words**: Aim for **consistent use** of capital letters for VHDL reserved words.
*   **Use of indentation**: Code should be **consistently and easily readable**, with clear indentation that presents the code structure.
*   **Use of comments/Documentation**: Provide **consistent use of comments and explanations**. All headers should be modified to represent the student's names and activities.

**B. VHDL Language Usage (30% of Project Code Grade)**
*   **Use of CONSTANT**: Constants should be **consistently used** throughout the code.
*   **Use of BUFFER in PORT definitions**: **Avoid using BUFFER** in PORT definitions. The best grade is achieved when no BUFFER is used.
*   **Use of SIGNALS**: Signals should be used appropriately; **excessive use of signals** is graded lower.
*   **Use of VARIABLES**: Variables should use `INTEGER` types **delimited to prevent excessive vector length**. This is the highest standard, followed by using `INTEGER` variables, then just using `VARIABLES`, with "No use of VARIABLES" being the lowest grade.
*   **Use of initializers**: Variables should be **consistently initialized**. Some variables initialized is acceptable, but not initializing signals at all is graded poorly.
*   **Use of “(OTHERS => ‘x’)” to assign value to STD_LOGIC**: This should be used **consistently**.
*   **State machines use TYPE to provide states with sensible names**: All state machines should **use `TYPE` to provide sensible names for states**.
*   **Use of sensitivity list with PROCESS statement**: The sensitivity list should **only contain mandatory `SIGNALS` for the `PROCESS`**.
*   **Edge detection in PROCESS statement**: The recommended approach for edge detection is to **use `rising_edge(clk)`**. Using `clk'event AND clk='1'` is acceptable, but `clock = '1'` is not preferred for this purpose.
*   **Inferring latches**: Ensure that your code **does not infer unnecessary latches**. This is typically achieved using `WITH SELECT` statements over `WHEN ELSE` (for concurrent code) or by ensuring all possible input values are covered in `CASE` statements to prevent unintended memory inference.

**C. Good Working of Functionalities (50% of Project Code Grade)**
*   **Demonstration of keys generating audible tones**: The piano should **generate audible tones correctly** for all mapped keys.
*   **Demonstration of tones stepping up- and down per octave**: The keys `A` and `Z` should **correctly change tones by octaves**.
*   **HEX displays tone keys pressed**: The HEX displays (HEX0, HEX1, HEX2, HEX3) should **function correctly**, showing the hexadecimal values of the current and previous pressed keys. Extra working functionality added by the student receives higher marks.
*   **RESET works**: The reset functionality (KEY1, LED0) should **work correctly**.

#### II. Oral Assessment (30% of Total Grade)
*   **Answering questions (speed, quality)**: Provide **quick, correct answers** to questions, and if possible, add **valid and relevant comments** to the topics discussed.
*   **Quick demonstration of functionality**: Be prepared to provide a **quick and correct demonstration** of the VHDL piano's functionality, adding valid and relevant comments during the demonstration.
*   **Understanding of VHDL language**: Demonstrate a solid understanding of the VHDL language, particularly regarding the concepts implemented in your piano design (e.g., FSMs, clock generation, structural VHDL).

### Submission Requirements and Best Practices
*   **Testbenches**: Your code should be **tested with testbenches**. This includes generating stimuli and automatically verifying outputs.
*   **Structural VHDL**: The piano should be designed with a **modular architecture using structural VHDL**.
*   **Hardware Demonstration**: You will need to **physically demonstrate your hardware** during the oral exam, including a PS/2 keyboard. Recording a video and submitting the link to the teacher is also required.
*   **Git Repository**: The project must be submitted as a **release of your Git repository** through HandIn, ensuring it is a clean ZIP archive without extra files. The URL of the Git repository must also be provided.
*   **Deadline**: Projects must be submitted **one week before** your chosen oral examination date. Delayed submission will lead to a delay in assessment.
*   **Moore Machine**: The FSMs within your design should adhere to the **Moore machine** architecture, where outputs depend only on the present state.
*   **Clock Domain Crossing**: Be mindful of clock domain crossing issues and implement components to address them, typically using flip-flops.
*   **Constants for Code Quality**: Use of constants, such as for defining 7-segment display characters, is encouraged to improve code quality.
*   **RTL Viewer Verification**: After compilation, inspect the **Register Transfer Level (RTL) viewer** to validate that the synthesized hardware matches your intended design and to check for unwanted elements.

By adhering to these detailed requirements and best practices, you can maximize your grade for the VHDL piano assignment.