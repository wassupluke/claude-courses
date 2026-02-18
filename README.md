# 🎓 Claude Courses

A curated collection of hands-on courses for learning how to use **Anthropic's Claude** products effectively — from Cowork and Claude Code to the Claude API and beyond.

Each course is a self-contained HTML file with interactive quizzes, annotated prompt examples, and real-world workflow templates. No framework, no build step — just open in a browser.

---

## 📚 Course Catalog

| Course | File | Modules | Level | Updated |
|---|---|---|---|---|
| Mastering Claude Cowork | `claude-cowork-course.html` | 8 | Beginner → Advanced | Feb 2026 |

More courses coming soon.

---

## 🚀 Getting Started

Clone the repo and open any course file directly in your browser:

```bash
git clone https://github.com/your-username/claude-courses.git
cd claude-courses
open claude-cowork-course.html   # macOS
# or: start claude-cowork-course.html   # Windows
```

No server required — everything runs locally.

---

## 📖 Course: Mastering Claude Cowork

**File:** `claude-cowork-course.html`

Claude Cowork (launched January 2026) is Anthropic's desktop AI agent that brings Claude Code's agentic power to non-technical users. Unlike standard chat, Cowork can execute multi-step tasks autonomously, read and write your local files, coordinate parallel sub-agents, and connect to external services through plugins and MCP connectors.

This course covers everything from first launch to advanced workflow design.

### What's Inside

- **Module 0 — Introduction:** Prerequisites, learning objectives, and what makes Cowork different.
- **Module 1 — What Is Cowork?** How it compares to chat, its VM-based architecture, and core capabilities.
- **Module 2 — Setup & First Launch:** System requirements, installation on macOS and Windows, and your first test task.
- **Module 3 — Core Workflow:** How Cowork plans, spawns sub-agents, executes, and delivers results. How to monitor and steer mid-task.
- **Module 4 — Writing Great Prompts:** The GOAL framework, weak vs. strong prompt examples, and reusable templates by use case.
- **Module 5 — Plugins & Connectors:** All 11 official Anthropic plugins, the difference between web connectors and desktop extensions, and how to build custom plugins.
- **Module 6 — Global & Folder Instructions:** How to give Claude persistent context so you never repeat yourself.
- **Module 7 — Safety & Best Practices:** The five golden rules of safe Cowork usage, what Cowork can and cannot do, and compliance considerations.
- **Module 8 — Advanced Techniques:** Combining Cowork with Claude in Chrome, MCP power workflows, parallel task queuing, self-maintaining workspaces, and context window maximization.

### Features

- Interactive knowledge-check quizzes with instant feedback
- Annotated prompt templates (weak vs. strong examples)
- Comparison tables, step-by-step guides, and card layouts
- Dark-themed, responsive design with sticky sidebar navigation
- No dependencies — single file, works offline

---

## 🛠️ Contributing

Contributions are welcome! To add a course or fix an error:

1. Fork the repository
2. Create a branch: `git checkout -b course/your-course-name`
3. Add your HTML course file following the existing naming convention
4. Update the Course Catalog table in this README
5. Open a pull request with a brief description

### Style Guide for New Courses

Each course file should be a **single self-contained HTML file** with embedded CSS and JavaScript. Aim to match the dark-theme design system used in existing courses (CSS variables are defined at the top of each file). Modules should follow a logical progression from beginner concepts to advanced application, and should include at least one interactive quiz per major section.

---

## 📄 License

MIT License — see [LICENSE](LICENSE) for details. Course content is based on official Anthropic documentation and public product announcements.

---

## 🔗 Resources

- [Claude Help Center](https://support.claude.com)
- [Cowork Getting Started Guide](https://support.claude.com/en/articles/13345190-getting-started-with-cowork)
- [Anthropic Plugin GitHub](https://github.com/anthropics/knowledge-work-plugins)
- [Claude API Docs](https://docs.claude.com)
- [Anthropic News](https://www.anthropic.com/news)

---

*Built with Claude · Last updated February 2026*
