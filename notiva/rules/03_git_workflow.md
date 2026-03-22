# 🌿 GIT WORKFLOW & BRANCHING

### 🏹 Branching Strategy
- **`main`**: The "Grandmaster" branch. Always stable, reflects production/ready-to-deploy state.
- **`develop`**: The integration branch. All feature branches merge here first.
- **`feature/`**, **`bugfix/`**, **`refactor/`**: Short-lived branches created from `develop`.

### 🔄 The Cycle
1. Start from `develop` (`git checkout develop && git pull`).
2. Create a new branch for every task (`git checkout -b feature/your-feature`).
3. Work, test, and commit frequently.
4. When finished, create a commit with an imperative message (`feat: add ocr service`).
5. Merge back to `develop` after peer review/approval.

### 📝 Commit Guidelines
- Use Conventional Commits:
    - `feat: ...` for new features.
    - `fix: ...` for bug fixes.
    - `docs: ...` for documentation changes.
    - `style: ...` for formatting, missing semi colons, etc.
    - `refactor: ...` for code changes that neither fix a bug nor add a feature.
    - `test: ...` for adding missing tests.
    - `chore: ...` for updating build tasks, package manager configs, etc.
