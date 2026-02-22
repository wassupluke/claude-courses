# Claude Courses

Self-contained, interactive HTML courses for learning how to use Anthropic's Claude products effectively. Each course runs in any browser with no install, no server, and no build step required.

**Live site:** [wassupluke.github.io/claude-courses](https://wassupluke.github.io/claude-courses/)

---

## Courses

| # | Course | File | Modules | Topics |
|---|---|---|---|---|
| 1 | [Mastering Claude Cowork](https://wassupluke.github.io/claude-courses/claude-cowork-course.html) | `claude-cowork-course.html` | 8 | Setup, GOAL framework, plugins, MCP, safety, advanced workflows |
| 2 | [Claude Efficiency Masterclass](https://wassupluke.github.io/claude-courses/claude-efficiency-course.html) | `claude-efficiency-course.html` | 8 | Token economy, prompt caching, model selection, anti-patterns |
| 3 | [Choosing Your Claude](https://wassupluke.github.io/claude-courses/claude-choosing-course.html) | `claude-choosing-course.html` | 8 | Chat, Projects, Claude Code, Cowork, API, hybrid workflows, tier tips |

---

## Running Locally

```bash
git clone https://github.com/wassupluke/claude-courses.git
cd claude-courses
open index.html              # macOS — opens the course catalog
# or: start index.html       # Windows
```

Open any individual course file directly — everything is self-contained and works offline.

---

## Repo Structure

```
claude-courses/
├── index.html                      ← GitHub Pages landing page / catalog
├── README.md                       ← This file
├── claude-cowork-course.html       ← Course 1
├── claude-efficiency-course.html   ← Course 2
├── claude-choosing-course.html     ← Course 3
└── assets/
    ├── theme.css   ← All CSS custom properties (single source of truth for colors)
    ├── styles.css  ← All layout and component CSS
    └── theme.js    ← Light/dark theme toggle logic
```

---

## Adding a Course

1. Copy an existing course as your starting point: `cp claude-cowork-course.html my-course.html`
2. Update the `<head>`: change title and description. Keep the three `assets/` links and their load order (`theme.js` script tag first, then CSS links).
3. Keep the theme toggle button as the first element after `<body>`.
4. Write content in `.section` divs using components from `assets/styles.css`.
5. Define `quizAnswer()` in your course's own `<script>` block — see any existing course for the implementation.
6. Update `index.html`: add a `.course-card` to `.catalog-grid` and update the `.stat-row` numbers.
7. Update this README: add a row to the course catalog table.
8. Branch, commit, and open a PR — never push directly to `main`.

All content must be sourced from official Anthropic documentation (`docs.anthropic.com`, `docs.claude.com`, `support.claude.com`). Verify pricing and model details before publishing — they change frequently.

---

## Tech Stack

- **Hosting:** GitHub Pages (static, root of `main` branch)
- **Styling:** CSS custom properties, no preprocessor
- **Theming:** Vanilla JS + `localStorage` + `prefers-color-scheme`
- **Interactivity:** Vanilla JS (quiz function per course)
- **Dependencies:** Zero external runtime dependencies

---

## Contributing

Fork the repo, create a branch (`git checkout -b feature/course-name`), build your course following the checklist above, and open a pull request. See `assets/styles.css` for the full component library reference.

---

## Resources

- [Claude Help Center](https://support.claude.com)
- [Anthropic Developer Docs](https://docs.claude.com)
- [Claude Pricing](https://claude.com/pricing)
- [Report an Issue](https://github.com/wassupluke/claude-courses/issues)

---

*Content based on official Anthropic documentation · Not affiliated with Anthropic · Last updated February 2026*
