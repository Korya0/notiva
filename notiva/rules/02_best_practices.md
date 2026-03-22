# 🎯 BEST PRACTICES & SENIOR OPS (CONCISE)

### ⚡ Performance & Flutter Trends
- **Isolate.run():** Use for heavy work (JSON > 50KB, image processing).
- **Animations:** Avoid `Opacity` in animations; use `AnimatedOpacity` or `FadeTransition`. 
- **Impeller:** Remove SkSL warmup. Use `const` constructors everywhere.
- **Modern Dart:** Use Records, Patterns, Sealed Classes, and dot shorthands.

### 🔐 Security & Quality
- **Line Length:** Max 80 chars. 
- **Formatting:** `PascalCase` classes, `camelCase` vars, `snake_case` files.
- **Secrets:** No hardcoded secrets. Use `--dart-define-from-file`. `flutter_secure_storage` for tokens.
- **Logging:** No PII/tokens in logs.

### 🧪 Verification & Tooling
- **Test:** Mandatory unit tests for Cubits/Use Cases/Repos. Widget tests for shared components.
- **Tools:** Use MCP tools (`analyze_files`, `run_tests`) over raw shell commands.
- **Wait for Confirmation:** For non-trivial tasks, confirm analysis and decomposition before coding.
- **Anti-Patterns:** No unsolicited refactoring; match depth to task complexity; show only changed code.
