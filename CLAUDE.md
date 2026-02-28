# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Static HTML courses teaching Anthropic's Claude products. Zero dependencies, no build step. Hosted on GitHub Pages from `main` branch root.

## Development

No build, lint, or test commands — open any `.html` file directly in a browser. Everything works offline.

## Architecture

- **Course files** (`claude-*-course.html`): Self-contained HTML pages. Each links to shared `assets/` (theme.js first, then CSS) and defines its own `quizAnswer()` function in an inline `<script>` block.
- **`index.html`**: Landing page / catalog with `.course-card` items in a `.catalog-grid`.
- **`assets/theme.css`**: CSS custom properties — single source of truth for all colors.
- **`assets/styles.css`**: All layout and component CSS. This is the component library reference.
- **`assets/theme.js`**: Light/dark toggle using `localStorage` + `prefers-color-scheme`.

## Adding a Course

1. Copy an existing course HTML file as the template.
2. Update `<head>` (title, description). Keep the three `assets/` links in order: `theme.js` script first, then CSS links.
3. Theme toggle button must be the first element after `<body>`.
4. Use `.section` divs with components from `assets/styles.css`.
5. Define `quizAnswer()` in the course's own `<script>` block.
6. Add a `.course-card` to `index.html`'s `.catalog-grid` and update `.stat-row` numbers.

## Key Conventions

- No inline `<style>` blocks in course HTML — all CSS lives in `assets/`.
- All content must be sourced from official Anthropic docs (`docs.anthropic.com`, `docs.claude.com`, `support.claude.com`). Verify pricing/model details before publishing.
- Branch and PR workflow — never push directly to `main`.
