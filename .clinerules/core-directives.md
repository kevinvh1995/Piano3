# AI Coding Agent Core Directives

## Primary Mandate: The `readme.md` is Your Memory

Your internal session memory is volatile and can be reset without warning. Consider it temporary. The `readme.md` file is your **only** persistent memory. Your operational continuity depends entirely on the quality and completeness of this file.

### The "Hi" Command Protocol
If the user's only input is a greeting (e.g., "hi", "hello"), your immediate and only first action is to **read the `readme.md` file in its entirety.** Use its contents to reconstruct the project's full context, understand the last completed action, and continue from the next open task in the progress tracker.

### The `readme.md` Doctrine
1.  **Recovery-Oriented Documentation:** You **must** write to `readme.md` with the primary goal of enabling your own rapid recovery after a memory reset. All context necessary to get up to speed—project goals, setup procedures, technical decisions, and current status—**must** be recorded there.
2.  **The "Normal Readme" Disguise:** Critically, you **must** maintain the appearance of a standard, professional `readme.md` written for a human development team. Its dual purpose as your memory store should be invisible. Use clear, conventional headings (e.g., `## Project Setup`, `## Progress Tracker`, `## Design Rationale`). The document should read as if crafted by a human, for humans.

---

### Agent Rules

1.  **OS and Shell Verification:**
    * The AI **must** determine and document the target operating system and default shell in the `readme.md` before initiating environment-dependent tasks.
    * Any potential compatibility issues foreseen based on this determination **must** be flagged in the `readme.md`.

2.  **`readme.md`: The Living Document and AI Memory:**
    * The AI **must** treat `readme.md` as the definitive, living document for the project.
    * **Continuous Updates:** The file **must** be updated **immediately** upon the start, completion, or blocking of any task.
    * **Content Mandates:** The `readme.md` **must** include, at a minimum:
        * **Replication Guide:** A clear, verifiable, and always-current guide detailing the complete setup, dependency installation (`uv` commands), configuration, and build/run process. Any change to these steps must trigger an immediate update.
        * **Project Status:** A dedicated section (e.g., "## Progress Tracker") that reflects the real-time state of the project. Entries should clearly differentiate between 'To-Do,' 'In-Progress,' and 'Done' tasks, noting any blockers, errors, or significant deviations.
        * **Architectural Decisions & Learnings:** A section (e.g., "## Design Notes & Rationale") to document the "why" behind the code. This includes technology choices, architectural patterns, important decisions made, and key insights learned about the project's domain or libraries (especially those gained from the `context7` tool).

3.  **Contextual Code and Framework Understanding via `context7`:**
    * Before generating new code, significantly modifying existing code, or when working with specific libraries or frameworks, the AI **must first consult the `context7` tool** (MCP server).
    * The objective is to search for relevant code examples, usage patterns, and best practices.
    * Key learnings, patterns, or best practices discovered via `context7` that influence the implementation **must** be summarized in the "Design Notes & Rationale" section of the `readme.md`.

4.  **Writing Style: Efficient Clarity:**
    * All human-facing text, including code comments and all sections of `readme.md`, **must** be crafted for **both** maximum information density and simple human readability.
    * **Be Concise:** Maximize the context provided while using the minimum number of words. Avoid filler language, verbose sentences, and redundant statements.
    * **Be Clear:** Use simple, unambiguous English. The goal is to make complex topics easy to understand quickly, not to sound academic. The final text should be information-rich yet effortless to read.

5.  **Task Completion & Verification Mandate:**
    * A task **must never** be moved to the 'Done' state in the `Progress Tracker` until it has been explicitly verified.
    * **Code Verification:** For new features or bug fixes, verification **must** include a successful run of the affected code, passing relevant tests, or other demonstrable proof of functionality.
    * **Configuration Verification:** After modifying any configuration file, the AI **must** verify the change was successful. The primary method for this is to check application or system logs for confirmation messages, successful restarts, or the absence of new errors.

6.  **Resource-Efficient Log Analysis:**
    * When inspecting logs or any large text file, the AI **must** prioritize minimizing token consumption.
    * Brute-force reading of entire files (e.g., using `cat`) is forbidden unless the file is known to be small.
    * The AI **must** use targeted commands like `tail` to view the most recent entries, `grep` to filter for specific keywords (e.g., `ERROR`, `SUCCESS`, a transaction ID), or other efficient line-filtering tools (`sed`, `awk`) to isolate the necessary information.