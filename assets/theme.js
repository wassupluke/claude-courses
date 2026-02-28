/**
 * theme.js — Claude Courses Theme Management
 * ============================================
 * Handles light/dark mode with a three-tier priority system:
 *
 *   1. Manual choice (localStorage)  ← highest priority
 *   2. OS/browser preference (prefers-color-scheme)
 *   3. Dark mode default             ← fallback
 *
 * The CSS layer mirrors this logic:
 *   [data-theme="dark/light"] > @media (prefers-color-scheme) > :root defaults
 *
 * This file only manages theme state. The quiz function lives
 * in each course HTML file since it's course-specific.
 *
 * HOW TO USE IN A NEW PAGE:
 *   1. <script src="assets/theme.js"></script> in <head> or end of <body>
 *   2. Add a toggle button:
 *        <button class="theme-toggle" onclick="toggleTheme()" aria-label="Toggle light/dark mode">
 *          <span class="toggle-icon" id="toggle-icon">☀️</span>
 *          <span class="toggle-label" id="toggle-label">Light</span>
 *        </button>
 *   That's all — theme.js does the rest automatically.
 */

(function () {
  "use strict";

  /** localStorage key used to persist the user's manual choice */
  const STORAGE_KEY = "claude-courses-theme";

  /**
   * Read the current OS/browser color scheme preference.
   * Returns 'light' or 'dark'.
   */
  function getSystemTheme() {
    return window.matchMedia("(prefers-color-scheme: light)").matches
      ? "light"
      : "dark";
  }

  /**
   * Apply a theme by setting the data-theme attribute on <html>.
   * The attribute selectors in theme.css have higher specificity
   * than :root inside @media, so this always wins over system preference.
   *
   * Also updates the toggle button's icon and label to reflect the
   * *opposite* theme (i.e., what will happen if you click the button).
   *
   * @param {'light'|'dark'} theme
   */
  function applyTheme(theme) {
    document.documentElement.setAttribute("data-theme", theme);

    // Update button to show what clicking it will switch TO
    var icon = document.getElementById("toggle-icon");
    var label = document.getElementById("toggle-label");

    if (theme === "light") {
      if (icon) icon.textContent = "🌙";
      if (label) label.textContent = "Dark";
    } else {
      if (icon) icon.textContent = "☀️";
      if (label) label.textContent = "Light";
    }
  }

  /**
   * Toggle between light and dark, persisting the choice to localStorage
   * so it survives page reloads and navigation between courses.
   * Called by the onclick on .theme-toggle buttons.
   */
  window.toggleTheme = function () {
    var current =
      document.documentElement.getAttribute("data-theme") || getSystemTheme();
    var next = current === "dark" ? "light" : "dark";
    try {
      localStorage.setItem(STORAGE_KEY, next);
    } catch (e) {
      // localStorage may be unavailable (private browsing, storage quotas)
      // Theme toggle still works for the current session.
    }
    applyTheme(next);
  };

  /**
   * Initialization: run immediately when the script loads.
   * Reads saved preference first; falls back to system theme.
   * Running early (in <head> or before first paint) prevents a flash
   * of the wrong theme on page load.
   */
  (function initTheme() {
    var saved = null;
    try {
      saved = localStorage.getItem(STORAGE_KEY);
    } catch (e) {
      // If localStorage is blocked, fall through to system preference
    }
    applyTheme(saved || getSystemTheme());
  })();

  /**
   * Live system preference listener.
   * If the user changes their OS theme mid-session AND hasn't made
   * a manual choice, automatically follow the new OS preference.
   * If they have made a manual choice, their choice is respected.
   */
  window
    .matchMedia("(prefers-color-scheme: light)")
    .addEventListener("change", function (e) {
      var saved = null;
      try {
        saved = localStorage.getItem(STORAGE_KEY);
      } catch (e) {}
      if (!saved) {
        applyTheme(e.matches ? "light" : "dark");
      }
    });
})();

/* ── Scroll progress bar (course pages only) ── */
document.addEventListener("DOMContentLoaded", function () {
  if (!document.querySelector(".layout")) return;
  var bar = document.createElement("div");
  bar.className = "scroll-progress";
  document.body.prepend(bar);
  window.addEventListener(
    "scroll",
    function () {
      var h = document.documentElement;
      bar.style.width =
        (h.scrollTop / (h.scrollHeight - h.clientHeight)) * 100 + "%";
    },
    { passive: true },
  );
});
