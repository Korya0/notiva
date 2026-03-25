# 🚀 Speckit Workflow Guide (Notiva)

Welcome to the **Spec-Driven Development (SDD)** workflow. This guide explains how to use the automated tools and project rules contained in this repository for building features and starting new projects.

---

## 🛠️ The Speckit Toolkit (AI Skills)

You can trigger these specialized workflows by mentioning them to the AI (e.g., "Run `/speckit.specify` for a new login feature"):

| Command | When to Use | Output |
|---------|-------------|--------|
| **`/speckit.clarify`** | When a feature idea is vague or complex. | A list of structured questions to resolve ambiguities. |
| **`/speckit.specify`** | To define the **"WHAT"** of a feature. | `spec.md` (User stories, requirements, success criteria). |
| **`/speckit.plan`** | To define the **"HOW"** (Architecture). | `plan.md`, `research.md`, `data-model.md`. |
| **`/speckit.tasks`** | To break the plan into actionable steps. | `tasks.md` (Ordered, dependency-aware task list). |
| **`/speckit.implement`** | To execute the tasks and write code. | Fully implemented feature code. |
| **`/speckit.review.run`**| After implementation for quality control. | Comprehensive review (Code, Comments, Tests, Types). |
| **`/speckit.constitution`**| To set or update project-wide rules. | Updated `.specify/memory/constitution.md`. |

---

## 🔄 Standard Workflow (Adding a New Feature)

Follow these phases for any non-trivial feature to ensure high quality and architectural consistency:

1.  **Phase 0: Clarification** (`/speckit.clarify`)
    *   Discuss the idea. Resolve critical unknowns before writing a single line of spec.
2.  **Phase 1: Specification** (`/speckit.specify`)
    *   Focus on user value. No implementation details. Define acceptance criteria.
3.  **Phase 2: Technical Planning** (`/speckit.plan`)
    *   Map the feature to **Notiva's Clean Architecture**. Choose patterns and libraries.
4.  **Phase 3: Task Breakdown** (`/speckit.tasks`)
    *   Break the work into small, testable chunks organized by user story.
5.  **Phase 4: Implementation** (`/speckit.implement`)
    *   Step-by-step coding. Follow **Principle VI (Documentation)** and **VII (Testing)**.
6.  **Phase 5: Verification & Review** (`/speckit.review.run`)
    *   Verify against success criteria. Fix lint errors and architectural violations.

---

## 📂 Moving to a New Project

When starting a fresh project and you want to bring this "Senior Workflow" with you, copy these directories:

1.  **`.agent/`**: Contains all the AI skills and automation logic.
2.  **`.specify/`**: Contains your templates, memory, and constitution.
3.  **`notiva/rules/`**: (Optional) Copy these if you want to reuse the exact identity, architecture, and best practices.

**First Action in New Project:**
Run `/speckit.constitution` to initialize the project name and customize the principles.

---

## 🛠️ Integrating into an EXISTING Project

If you already have a codebase and want to start using this workflow:

1.  **Copy Folders**: Move `.agent/` and `.specify/` to your project root.
2.  **Run Constitution**: Execute `/speckit.constitution`. This will help you define the current project state and update the core principles to match your existing goals.
3.  **Baseline Review**: (Optional) Run `/speckit.review.run` on your core files to identify technical debt and architectural misalignments.
4.  **Start Small**: Don't refactor everything at once. Apply the workflow for the next NEW feature (`/speckit.specify`).
5.  **Mission Explanation**: Create a `MISSION_EXPLANATION.md` to document the "Current State" and "Future Goals" of the project.

---

## 📝 Handling Different Update Types

### 🟢 Simple Edits (UI tweaks, basic fixes)
*   **Action**: Implement directly.
*   **Requirement**: Must follow **Principle VI (Document as you go)**. Naming must be self-documenting. Use `docs: ...` commit message.
*   **Rule**: Never skip documentation just because the task is small.

### 🟡 Medium Features (New service, new screen)
*   **Action**: Run `/speckit.specify` and `/speckit.plan` at minimum.
*   **Requirement**: Update `MISSION_EXPLANATION.md` to track your rationale.

### 🔴 Large/Core Features (Auth, Sync, Database)
*   **Action**: Follow the **Full 5-Phase Cycle**.
*   **Requirement**: Mandatory peer review and `speckit.review.run` execution.

---

## 🏛️ Core Principles (The "Constitution")

Every line of code in this project must adhere to the **Notiva Constitution**:

1.  **Simple-YAGNI**: No over-engineering. patterns only for real value.
2.  **Clean Architecture**: Strict boundaries (`Presentation -> Domain -> Data`).
3.  **Mandatory Documentation**: Every feature must have rationale tracked in a Mission Explanation doc.
4.  **Mandatory Testing**: Unit tests for Cubits, Use Cases, and Repositories are non-negotiable.
5.  **Lean Dependencies**: Prioritize Flutter framework over 3rd party packages.

---

*Refer to `.specify/memory/constitution.md` for the full legal text of our development principles.*
