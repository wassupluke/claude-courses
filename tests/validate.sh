#!/usr/bin/env bash
# validate.sh — HTML and CSS consistency checks for claude-courses
# Usage: bash tests/validate.sh

set -eu
cd "$(git rev-parse --show-toplevel)"

PASS=0
FAIL=0

pass() { PASS=$((PASS + 1)); printf "  ✅ %s\n" "$1"; }
fail() { FAIL=$((FAIL + 1)); printf "  ❌ %s\n" "$1"; }

HTML_FILES=$(find . -maxdepth 1 -name '*.html' | sort)
COURSE_FILES=$(find . -maxdepth 1 -name 'claude-*-course.html' | sort)

echo "=== HTML Validation ==="

# 1. No <style> blocks (all CSS must be in assets/)
echo ""
echo "--- No inline <style> blocks ---"
for f in $HTML_FILES; do
  if grep -qi '<style' "$f"; then
    fail "$f contains a <style> block"
  else
    pass "$f"
  fi
done

# 2. No inline style= attributes (except on progress/ROI bars)
echo ""
echo "--- No inline style= attributes (except data-driven bars) ---"
for f in $HTML_FILES; do
  violations=$(grep -n 'style=' "$f" | grep -v 'style="width:' | grep -v 'style="pointer-events' || true)
  if [ -n "$violations" ]; then
    fail "$f has inline styles:"
    echo "$violations" | sed 's/^/       /'
  else
    pass "$f"
  fi
done

# 3. Required <head> structure: theme.js first, then theme.css, then styles.css
echo ""
echo "--- Asset load order (theme.js → theme.css → styles.css) ---"
for f in $HTML_FILES; do
  js_line=$(grep -n 'theme\.js' "$f" | head -1 | cut -d: -f1 || true)
  tcss_line=$(grep -n 'theme\.css' "$f" | head -1 | cut -d: -f1 || true)
  scss_line=$(grep -n 'styles\.css' "$f" | head -1 | cut -d: -f1 || true)
  if [ -z "$js_line" ] || [ -z "$tcss_line" ] || [ -z "$scss_line" ]; then
    fail "$f missing one or more asset references"
  elif [ "$js_line" -lt "$tcss_line" ] && [ "$tcss_line" -lt "$scss_line" ]; then
    pass "$f"
  else
    fail "$f assets loaded in wrong order (js:$js_line css:$tcss_line styles:$scss_line)"
  fi
done

# 4. Theme toggle is first element after <body>
echo ""
echo "--- Theme toggle is first element after <body> ---"
for f in $HTML_FILES; do
  # Get the first 10 non-blank, non-comment lines after <body> and join them
  after_body=$(sed -n '/<body/,$ p' "$f" | tail -n +2 | grep -v '^\s*$' | grep -v '^\s*<!--' | head -10 | tr '\n' ' ')
  if echo "$after_body" | grep -q 'theme-toggle'; then
    pass "$f"
  else
    fail "$f — first element after <body> is not theme-toggle"
  fi
done

# 5. Every course has a quizAnswer function
echo ""
echo "--- Course files define quizAnswer() ---"
for f in $COURSE_FILES; do
  if grep -q 'function quizAnswer' "$f"; then
    pass "$f"
  else
    fail "$f missing quizAnswer function"
  fi
done

# 6. <html lang="en"> present
echo ""
echo "--- <html lang="en"> present ---"
for f in $HTML_FILES; do
  if grep -qi '<html lang="en"' "$f"; then
    pass "$f"
  else
    fail "$f missing <html lang=\"en\">"
  fi
done

# 7. All files reference the same 3 shared assets
echo ""
echo "--- All files reference shared assets ---"
for f in $HTML_FILES; do
  missing=""
  grep -q 'assets/theme\.js' "$f"  || missing="theme.js "
  grep -q 'assets/theme\.css' "$f" || missing="${missing}theme.css "
  grep -q 'assets/styles\.css' "$f" || missing="${missing}styles.css"
  if [ -z "$missing" ]; then
    pass "$f"
  else
    fail "$f missing: $missing"
  fi
done

# 8. <meta name="description"> present
echo ""
echo "--- <meta name=\"description\"> present ---"
for f in $HTML_FILES; do
  # Handle multiline: linters may split <meta \n name="description">
  if tr '\n' ' ' < "$f" | grep -q 'meta[^>]*name="description"'; then
    pass "$f"
  else
    fail "$f missing <meta name=\"description\">"
  fi
done

echo ""
echo "=== CSS Validation ==="

# 9. theme.css has both data-theme selectors
echo ""
echo "--- theme.css has [data-theme] selectors ---"
if grep -q '\[data-theme="dark"\]' assets/theme.css; then
  pass "[data-theme=\"dark\"] found"
else
  fail "[data-theme=\"dark\"] missing"
fi
if grep -q '\[data-theme="light"\]' assets/theme.css; then
  pass "[data-theme=\"light\"] found"
else
  fail "[data-theme=\"light\"] missing"
fi

# 10. No orphaned CSS properties (lines with -- outside any selector)
echo ""
echo "--- No orphaned CSS properties outside selectors ---"
orphans=$(awk '
  /\{/ { depth++ }
  /\}/ { depth-- }
  depth == 0 && /^\s*--[a-z]/ { print NR": "$0 }
' assets/theme.css)
if [ -z "$orphans" ]; then
  pass "No orphaned properties in theme.css"
else
  fail "Orphaned CSS properties found:"
  echo "$orphans" | sed 's/^/       /'
fi

echo ""
echo "=== Results: $PASS passed, $FAIL failed ==="
[ "$FAIL" -eq 0 ] && exit 0 || exit 1
