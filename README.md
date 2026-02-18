# 🎓 Claude Courses

A curated collection of hands-on courses for learning how to use **Anthropic's Claude** products effectively — from Cowork and Claude Code to the Claude API and beyond.

Each course is a self-contained HTML file with interactive quizzes, annotated prompt examples, and real-world workflow templates. No framework, no build step — just open in a browser.

---

## 📚 Course Catalog

| Course | Live Version | File | Modules | Level | Updated |
|---|---|---|---|---|---|
| Mastering Claude Cowork | [🌐 Open Course](https://wassupluke.github.io/claude-courses/claude-cowork-course.html) | `claude-cowork-course.html` | 8 | Beginner → Advanced | Feb 2026 |

---

## 🌐 View Courses Online

Each course is hosted via GitHub Pages with full styling, interactive quizzes, and dark-theme design — no cloning required:

**[→ Mastering Claude Cowork (Full Interactive Version)](https://wassupluke.github.io/claude-courses/claude-cowork-course.html)**

---

## 🚀 Run Locally

Clone the repo and open any course file directly in your browser for the full offline experience:

```bash
git clone https://github.com/wassupluke/claude-courses.git
cd claude-courses
open claude-cowork-course.html   # macOS
# or: start claude-cowork-course.html   # Windows
```

---

## 📖 Mastering Claude Cowork — Read Inline

Prefer to read without leaving GitHub? Expand any module below. For the fully styled version with interactive quizzes, use the [live link above](https://wassupluke.github.io/claude-courses/claude-cowork-course.html).

---

<details>
<summary><strong>Module 0 — Welcome to the Course</strong></summary>

<br>

Claude Cowork launched in January 2026 and immediately triggered a **$285 billion software stocks selloff**. The reason? It's the first AI tool that doesn't just answer questions — it finishes work. This course teaches you everything you need to move from curious beginner to confident power user.

> **What you'll need:** A paid Claude subscription (Pro, Max, Team, or Enterprise), the Claude Desktop app for macOS or Windows (x64), and an active internet connection. Cowork is *not* available on web or mobile.

### Learning Objectives

By the end of this course you will be able to:

- Understand how Cowork differs from standard Claude chat
- Set up and launch Cowork on your machine
- Write effective, safe prompts for multi-step tasks
- Use plugins and connectors to extend Claude's capabilities
- Configure global and folder-level instructions for persistent context
- Apply safety practices to prevent data loss or unintended actions
- Build advanced workflows combining Cowork, Claude in Chrome, and MCP connectors

</details>

---

<details>
<summary><strong>Module 1 — What Is Claude Cowork?</strong></summary>

<br>

Cowork is Anthropic's answer to a simple observation: people were using **Claude Code** — a developer terminal tool — for everything from sorting vacation photos to building slide decks. Rather than force non-technical users into a command line, Anthropic wrapped Claude's agentic architecture in a friendly desktop interface. The result transforms Claude from a chatbot into a *digital coworker*.

### Chat vs. Cowork: The Core Difference

| Dimension | Standard Chat | Cowork |
|---|---|---|
| Execution model | One prompt → one response | One goal → multi-step autonomous execution |
| File access | Manual upload/paste | Direct read/write to your local folders |
| Output | Text in chat window | Real files saved to your computer |
| Duration | Single conversation turn | Long-running tasks (minutes to hours) |
| Parallelism | None | Sub-agents work concurrently on sub-tasks |
| Best for | Questions, drafts, quick analysis | Completing entire deliverables |

### Key Capabilities

**📂 Direct File Access** — Read, write, edit, rename, and organize files in folders you choose — no uploads required.

**🤖 Sub-agent Coordination** — Claude spawns parallel sub-agents for complex tasks, coordinating multiple workstreams simultaneously.

**📄 Professional Outputs** — Generates real `.xlsx`, `.docx`, `.pptx`, and `.pdf` files — not just text descriptions of them.

**🔌 Plugins & Connectors** — Connect to external services, CRMs, calendars, and databases through MCP connectors.

**🌐 Browser Integration** — Pair with Claude in Chrome to complete tasks requiring web browsing or form submission.

**⏳ Long-running Tasks** — No session timeouts. Describe a goal, step away, and return to finished work.

### Under the Hood

Cowork is built on the same **Claude Agent SDK** that powers Claude Code. When you give it a folder, your files are mounted into an isolated **Linux virtual machine** (using Apple's Virtualization Framework on macOS). Code runs in that sandbox — real file changes are then written back out to your machine. This means Claude cannot access files outside the folders you explicitly grant, and the underlying model is **Claude Opus 4.6** with a one-million-token context window.

</details>

---

<details>
<summary><strong>Module 2 — Setup &amp; First Launch</strong></summary>

<br>

### Requirements

| Requirement | Details |
|---|---|
| Paid Claude subscription | Pro, Max, Team, or Enterprise |
| Claude Desktop (macOS) | Download at `claude.com/download` |
| Claude Desktop (Windows) | x64 only — arm64 is **not** supported |
| Active internet connection | Must remain connected throughout each session |
| Desktop app stays open | Closing the app ends the current session |

### Installation Steps

**Step 1 — Download Claude Desktop.** Visit `claude.com/download` and grab the latest version for your OS. If you already have it, make sure it's fully up to date — especially on Windows, where older versions may lack Cowork entirely.

**Step 2 — Sign in with your paid account.** Cowork only appears for Pro, Max, Team, or Enterprise subscribers. Free accounts do not have access.

**Step 3 — Locate the Cowork tab.** In the Claude Desktop interface, look for the mode selector at the top. You'll see "Chat" alongside a "Cowork" (or "Tasks") tab. Click it to enter agent mode.

**Step 4 — Grant folder access.** Click the folder icon or attachment button to select a working folder. This is the directory Claude can read and write. Choose a dedicated project folder — not your entire home directory — for safety.

**Step 5 — Run your first task.** Type a clear task description and click send. Claude will plan, then begin executing. You'll see live progress indicators as it works.

> 💡 **First Task Suggestion:** For your very first run, try something safe and reversible: *"List all files in this folder and create a summary.md file describing what each one contains."* This demonstrates what Cowork can do without any risk of data loss.

</details>

---

<details>
<summary><strong>Module 3 — Core Workflow: How Cowork Thinks</strong></summary>

<br>

Understanding Cowork's internal execution model makes you a dramatically better user. Here's exactly what happens after you press send.

**Stage 1 — Analysis & Planning.** Claude reads your goal, inspects any files you've provided access to, and forms a detailed plan. It breaks large work into concrete sub-tasks. You'll see this plan before execution begins — this is your chance to redirect if something looks off.

**Stage 2 — Sub-agent Spawning.** For complex tasks, Claude spins up multiple sub-agents that work in parallel. One might be summarizing documents while another builds a spreadsheet structure. This dramatically reduces total execution time.

**Stage 3 — Execution in the VM.** Code, shell commands, and file operations run in the isolated virtual machine. Live progress indicators appear in the interface so you can see exactly what Claude is doing at each step.

**Stage 4 — Check-ins & Permission Requests.** For significant or potentially destructive actions — like deleting files — Claude pauses and asks for your explicit permission. A prompt appears and you must click "Allow" to proceed.

**Stage 5 — Output Delivery.** Finished files are written directly to your file system in the working folder. Claude then summarizes what was done and highlights any decisions it made during execution.

### Monitoring & Steering Mid-Task

You don't have to watch. But you can — and sometimes should. If Claude's plan looks wrong, type a correction at any point. The agent will incorporate your feedback into its remaining work. Think of it like leaving a voicemail for a colleague; they'll hear it and adjust.

### Queuing Tasks

You can queue up tasks before Claude finishes the current one. Type your next request in the input area and send it. Claude will add it to its work queue and tackle it after completing the current task — or in parallel, if appropriate.

> ⚠️ **Keep the app open.** Closing Claude Desktop ends your Cowork session immediately. Long tasks require an open app. If you need to run multi-hour jobs, adjust your system's sleep and screen-lock settings accordingly.

</details>

---

<details>
<summary><strong>Module 4 — Writing Great Cowork Prompts</strong></summary>

<br>

Unlike chat prompts where Claude can ask clarifying questions easily, Cowork prompts should be **goals, not commands**. The better you describe the outcome, the less mid-task steering you'll need.

### The GOAL Framework

- **G — Goal:** What finished state do you want?
- **O — Output:** What format or file type should the result be in?
- **A — Approach/Constraints:** Any rules, style, or limitations Claude should follow?
- **L — Location:** Where should outputs go? Which folders should be used?

### Prompt Examples: Weak vs. Strong

**Document Summarization**

❌ *Weak:* `Summarize my documents.`

✅ *Strong:* `Read all .md and .txt files in the /notes folder. For each file, write a 2–3 sentence summary. Compile all summaries into a single Word document called "notes-overview.docx" saved in the same folder. Use a clean heading for each source file name.`

**Expense Spreadsheet**

❌ *Weak:* `Make a spreadsheet from my receipts.`

✅ *Strong:* `I have a folder of receipt photos (JPEGs) in /receipts/2025. Read each image and extract: merchant name, date, amount, and category (Food, Travel, Office, Other). Create expenses.xlsx with one row per receipt, a SUM formula at the bottom, and a second sheet with a pivot table by category. Save to /receipts/.`

**File Organization**

❌ *Weak:* `Clean up my downloads folder.`

✅ *Strong:* `Look at my /Downloads folder. Sort files into subfolders by type: Images/, Documents/, Installers/, Archives/, Other/. Rename files with creation dates prepended (YYYY-MM-DD_filename). Do NOT delete anything. Show me a plan first before making any changes.`

### Reusable Templates

**Research & Synthesis**
```
Read all files in [folder]. Extract [specific data points]. Synthesize into
[output format] at [location]. Highlight any [contradictions / gaps / key themes].
```

**Report Generation**
```
Using data from [source files], generate a [type] report in [format].
Include: [sections]. Apply [style guidelines]. Save as [filename] to [location].
```

**Data Processing**
```
Load [file]. Clean it by [rules]. Compute [metrics/formulas]. Output as
[xlsx/csv] with [specific sheets/columns]. Flag any rows that [condition].
```

</details>

---

<details>
<summary><strong>Module 5 — Plugins &amp; Connectors</strong></summary>

<br>

Plugins and connectors are how you supercharge Cowork beyond local file tasks. Together they let Claude reach into external services, specialize for your industry, and automate across your entire digital stack.

### The 11 Official Plugins

| Plugin | What It Does |
|---|---|
| 📅 Productivity | Manage tasks, calendars, and daily workflows |
| 🔍 Enterprise Search | Find info across company tools and docs |
| 💼 Sales | Research prospects, prep deals, follow your sales process |
| 💰 Finance | Analyze financials, build models, track key metrics |
| 📊 Data | Query, visualize, and interpret datasets |
| ⚖️ Legal | Review documents, flag risks, track compliance |
| 📣 Marketing | Draft content, plan campaigns, manage launches |
| 🎧 Customer Support | Triage issues, draft responses, surface solutions |
| 🗺️ Product Management | Write specs, prioritize roadmaps, track progress |
| 🔬 Biology Research | Search literature, analyze results, plan experiments |
| 🛠️ Plugin Create | Build your own custom plugins from scratch |

### Installing a Plugin

Open the Cowork tab → click "Plugins" in the left sidebar → browse and click Install. Once installed, type `/` in the Cowork input to invoke any plugin command. Click "Customize" on any installed plugin to tailor it to your specific workflow.

### Connectors

Connectors link Claude to external services (Settings → Connectors → Browse). **Web Connectors** use browser-based APIs (Google Drive, Notion, Slack). **Desktop Extensions** run locally with deeper system access (AWS CLI, local databases). In Cowork, both types gain filesystem integration — data pulled from an external service can be saved directly to your working folder.

> ℹ️ Org-wide plugin sharing and a private marketplace are in development. Currently plugins are saved locally per machine.

</details>

---

<details>
<summary><strong>Module 6 — Global &amp; Folder Instructions</strong></summary>

<br>

Give Claude persistent standing instructions so you never have to repeat context. There are two levels: **global** (every session) and **folder-specific** (a particular project directory).

### Setting Global Instructions

Go to Settings → Cowork → click "Edit" next to Global instructions. Use this for your role, preferred output formats, timezone, and standing safety rules.

```
I'm a clinical research nurse. Use professional language suitable for study
sponsors. Prefer .docx for documents and .xlsx for data. Always back up
original files before modifying them. Never delete files without asking first.
```

### Setting Folder Instructions

Folder instructions activate whenever Claude is working in a specific directory — ideal for project context, naming conventions, and compliance rules.

```
This folder is for Study ABC-2024-001 (Phase II oncology, Pharma Corp).
Always reference protocol-v3.pdf for eligibility decisions. Use de-identified
IDs only (SUBJ-XXXX). Never include participant names in any output file.
```

Think of the two levels as: **Global = who you are. Folder = what this project is.**

</details>

---

<details>
<summary><strong>Module 7 — Safety &amp; Best Practices</strong></summary>

<br>

> 🚨 Cowork can edit, rename, and overwrite files without per-action confirmation. It will ask before **permanently deleting** files. Always work in a dedicated folder, never your root or Documents directory.

### The 5 Golden Rules

**1. Use dedicated folders.** Create a `/cowork-projects/` workspace and keep all Cowork activity there.

**2. Backup first.** Add *"back up originals before editing"* to your global instructions to automate this.

**3. Review the plan.** Read Claude's proposed plan before saying "go ahead." This is your best defense against surprises.

**4. Be explicit about destructive operations.** Include *"Do NOT delete, rename, or move any file"* in prompts where you only want new files created.

**5. Watch for prompt injection.** Don't process files from untrusted sources (downloaded docs, scraped web pages) while sensitive folders are accessible.

### What Cowork Cannot Do

- Access files or folders you haven't explicitly granted
- Permanently delete files without showing a confirmation prompt
- Store conversation history in Anthropic's cloud (it's local only)

> ⚠️ **Compliance note:** Cowork activity is NOT captured in Audit Logs or Data Exports. Do not use it for HIPAA-regulated data or other regulated workloads without consulting your compliance team first.

</details>

---

<details>
<summary><strong>Module 8 — Advanced Techniques</strong></summary>

<br>

### Cowork + Claude in Chrome

Pair Cowork with Claude in Chrome and Claude gains browser access — it can scrape websites, fill forms, and extract data, saving results directly to your working folder. Ideal for competitive research, gathering data from portals without APIs, or any workflow that crosses the desktop/web boundary.

### MCP Connectors for Power Workflows

| Domain | Connector | What You Can Automate |
|---|---|---|
| Project Management | Asana, Linear | Create tasks from meeting notes, status updates, reports |
| CRM | Salesforce, HubSpot | Lead research, outreach drafts, record updates |
| Cloud Storage | Google Drive, Dropbox | Sync, batch rename, index generation |
| Analytics | Honeycomb, n8n | Observability queries, automated workflow triggers |
| Dev Tools | GitHub, AWS | Repo analysis, resource management, documentation |

### Parallel Task Queuing

Send your next task before the current one finishes. Cowork queues them and works through them in order (or in parallel where possible). This is especially powerful for chained workflows: clean data → consolidate → generate report → build presentation, all queued at once.

### Self-Maintaining Workspaces

Set up an `inbox/` → `processed/` → `reports/` folder structure, with a `README.md` Claude keeps updated. A single prompt like *"process inbox"* then kicks off a complete, consistent workflow every time — no repeated instructions needed.

### Prompt Chaining with Files

Use files as the bridge between sessions. Have Session 1 output a `plan.md` outlining the approach, review it yourself, then have Session 2 execute against that plan. This decouples planning from execution, which is invaluable for high-stakes or complex deliverables.

### Context Window Maximization

Claude Opus 4.6 has a one-million-token context window. Feed it large corpora up front rather than in pieces, ask it to build a file index before starting work, and for very large datasets ask it to maintain a running `notes.md` it updates incrementally — keeping key findings always in reach without losing context.

---

### 🎓 Course Complete

For the fully styled, interactive version of this course visit the **[live GitHub Pages link](https://wassupluke.github.io/claude-courses/claude-cowork-course.html)**. For the latest Cowork updates see [support.claude.com](https://support.claude.com).

</details>

---

## 🛠️ Contributing

Contributions are welcome! Fork the repo, create a branch (`git checkout -b course/your-course-name`), add your self-contained HTML course file, update the Course Catalog table above, and open a pull request with a brief description.

---

## 📄 License

MIT License — course content is based on official Anthropic documentation and public product announcements.

---

## 🔗 Resources

- [Claude Help Center](https://support.claude.com)
- [Cowork Getting Started Guide](https://support.claude.com/en/articles/13345190-getting-started-with-cowork)
- [Anthropic Plugin GitHub](https://github.com/anthropics/knowledge-work-plugins)
- [Claude API Docs](https://docs.claude.com)

---

*Built with Claude · Last updated February 2026*
