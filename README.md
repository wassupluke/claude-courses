# 🎓 Claude Courses

A curated collection of hands-on courses for learning how to use **Anthropic's Claude** products effectively — from Cowork and Claude Code to the Claude API and beyond.

Each course is a self-contained HTML file with interactive quizzes, annotated prompt examples, and real-world workflow templates. No framework, no build step — just open in a browser.

The full course content is also embedded right here on this page — click any module below to expand it and start reading without ever leaving GitHub.

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
git clone https://github.com/wassupluke/claude-courses.git
cd claude-courses
open claude-cowork-course.html   # macOS
# or: start claude-cowork-course.html   # Windows
```

No server required — everything runs locally.

---

## 📖 Mastering Claude Cowork — Full Course

> Claude Cowork (launched January 2026) is Anthropic's desktop AI agent that brings Claude Code's agentic power to non-technical users. Unlike standard chat, Cowork can execute multi-step tasks autonomously, read and write your local files, coordinate parallel sub-agents, and connect to external services through plugins and MCP connectors.
>
> This course covers everything from first launch to advanced workflow design across **8 modules**. Expand each section below to read it in full.

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

> **✅ Quick Check:** The primary architectural difference between Cowork and regular Claude chat is that Cowork executes multi-step tasks autonomously with direct file system access — not a different model, not a terminal requirement, and not macOS-only.

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

### Usage Allocation

Cowork tasks consume significantly more of your usage allocation than regular chat because each task involves many more model calls, code executions, and tool uses. To get the most from your plan, batch related work into single sessions rather than starting a new session per sub-task, use standard chat for simple questions that don't need file access, and monitor your usage at Settings → Usage.

</details>

---

<details>
<summary><strong>Module 4 — Writing Great Cowork Prompts</strong></summary>

<br>

Unlike chat prompts where Claude can ask clarifying questions easily, Cowork prompts should be **goals, not commands**. The better you describe the outcome, the less mid-task steering you'll need.

### The GOAL Framework

Think through four dimensions before you write any Cowork prompt:

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

### Reusable Templates by Use Case

**Research & Synthesis**
```
Read all files in [folder]. Extract [specific data points]. Synthesize into [output format] at [location]. Highlight any [contradictions / gaps / key themes].
```

**File Organization**
```
Review files in [folder]. Sort into [categories] based on [criteria]. Rename using [naming convention]. Do NOT delete anything. Show me a plan before executing.
```

**Report Generation**
```
Using data from [source files], generate a [type] report in [format]. Include: [sections]. Apply [style guidelines]. Save as [filename] to [location].
```

**Data Processing**
```
Load [file]. Clean it by [rules]. Compute [metrics/formulas]. Output as [xlsx/csv] with [specific sheets/columns]. Flag any rows that [condition].
```

> **✅ Quick Check:** The strongest prompt is always the one that specifies output format, file name, destination folder, and any constraints — rather than describing the task abstractly.

</details>

---

<details>
<summary><strong>Module 5 — Plugins &amp; Connectors</strong></summary>

<br>

Plugins and connectors are how you supercharge Cowork beyond local file tasks. Together they let Claude reach into external services, specialize for your industry, and automate across your entire digital stack.

### What Are Plugins?

Plugins are pre-packaged bundles that combine **skills, connectors, slash commands, and sub-agents** into a cohesive specialty. Think of them as turning Claude into a domain expert on demand. Anthropic has released 11 official open-source plugins on GitHub:

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

Open the Cowork tab in Claude Desktop, click "Plugins" in the left sidebar, browse available plugins and click to install. You can also click "Upload Plugin" to add a custom file. Once installed, type `/` in the Cowork input to see all available commands from your installed plugins. To customize a plugin, click "Customize" on any installed plugin and Claude will walk you through tailoring it to your workflow.

### Connectors: Linking External Services

Connectors are integrations to external services available through Settings → Connectors → Browse Connectors. There are two types: **Web Connectors**, which run through browser-based APIs (e.g. Google Drive, Notion, GitHub, Slack), and **Desktop Extensions**, which run locally with deeper system access (e.g. AWS CLI, local databases). In Cowork, connectors gain a powerful new dimension — filesystem integration — meaning a connector pulling from your CRM can now save that data directly to a local file, or use local files as input for external actions.

### Building Custom Plugins

Plugins are file-based and available on GitHub. Use the **Plugin Create** plugin for a guided experience where Claude builds it with you, or fork an existing plugin from Anthropic's GitHub and edit it. Then upload via the "Upload Plugin" button in the Plugins sidebar.

> ℹ️ **Coming Soon:** Org-wide plugin sharing and a private marketplace are in development. Currently, plugins are saved locally per machine.

</details>

---

<details>
<summary><strong>Module 6 — Global &amp; Folder Instructions</strong></summary>

<br>

One of Cowork's most powerful features is the ability to give Claude persistent standing instructions so you never have to repeat context. There are two levels: **global** (applies to every session) and **folder-specific** (activates when working in a particular directory).

### Global Instructions

Use global instructions for things that are always true about you, your role, and your preferences. To set them, go to **Settings → Cowork** inside Claude Desktop, click "Edit" next to Global instructions, type your instructions, and click Save.

**Example:**
```
I'm a clinical research nurse. When writing reports or summaries, use clear, professional
language suitable for study sponsors. Avoid medical jargon for non-clinician audiences.
Always save backup copies of original files before modifying them. Prefer .docx for
documents and .xlsx for data tables. My working timezone is US Central.
```

### Folder Instructions

Folder instructions add project-specific context that activates whenever Claude is working in that particular folder. This is ideal for project codenames and background, specific output naming conventions, files Claude should always consult first, and stakeholder names and preferences.

**Example (clinical trial folder):**
```
This folder contains documents for Study ABC-2024-001, a Phase II oncology trial
sponsored by Pharma Corp. PI is Dr. Jane Smith. Always reference the protocol
(protocol-v3.pdf) when making any eligibility assessments. Output any participant
data tables with de-identified IDs only (format: SUBJ-XXXX). Never include full
names in any output file.
```

### Tips for Effective Instructions

Think of the two levels as complementary layers: **Global = who you are; Folder = what this project is.** Be specific rather than vague — "Write at a 10th-grade reading level suitable for patient-facing materials" is far more useful than "Use professional tone." Set guardrails explicitly by stating what Claude should *not* do. And remember you can update instructions mid-session by simply typing a new preference in chat — Cowork incorporates it immediately.

</details>

---

<details>
<summary><strong>Module 7 — Safety &amp; Best Practices</strong></summary>

<br>

Cowork has real power — which means real consequences when things go wrong. Anthropic is transparent about the risks. This module teaches you how to use Cowork safely.

> 🚨 **Important:** By default, Claude will ask for explicit permission before permanently deleting files. However, it can edit, rename, overwrite, and reorganize files without a separate confirmation for each action. Always work in a dedicated folder — not your entire Documents or Downloads directory.

### The 5 Golden Rules of Cowork Safety

**1. Use Dedicated Folders.** Never point Cowork at your root directory or a folder containing irreplaceable files without backups. Create a `/cowork-projects/` or `/claude/` directory as your working space and keep everything there.

**2. Backup First.** Before any task that modifies existing files, back them up. You can automate this by including *"back up originals before editing"* in your global or folder instructions.

**3. Review the Plan.** Before saying "go ahead," read Claude's plan carefully. If anything looks off — wrong files, unexpected scope — redirect it immediately. The plan preview is your best defense against surprises.

**4. Be Specific About Destructive Operations.** Explicitly forbid deletion or renaming in your prompts unless you want it: *"Do NOT delete, rename, or move any file — only create new ones."*

**5. Watch for Prompt Injection.** If Claude is processing files from untrusted sources (downloaded docs, emails, web pages), be aware that malicious content could attempt to hijack Claude's instructions. Don't process untrusted files while sensitive system access is granted.

### What Cowork Cannot Do

- Access files or folders you haven't explicitly granted
- Permanently delete files without your confirmation (a permission dialog will appear)
- Access the internet beyond your plan's network egress permissions
- Store conversation history in Anthropic's cloud (it's saved locally on your machine)

### Enterprise & Compliance Notes

> ⚠️ Cowork activity is **NOT** captured in Audit Logs, Compliance API, or Data Exports. Do not use Cowork for HIPAA-regulated patient data, financial records requiring audit trails, or other regulated workloads without first consulting your compliance team.

</details>

---

<details>
<summary><strong>Module 8 — Advanced Techniques</strong></summary>

<br>

Once you've mastered the basics, these techniques will multiply your productivity and unlock use cases most users haven't discovered yet.

### Cowork + Claude in Chrome

Claude in Chrome is a separate browser agent. When you pair both tools, Claude can browse websites, extract data, and submit forms — and the web-scraped data can be saved to your local Cowork working folder automatically. This is especially powerful for competitive research, price monitoring, and gathering information from portals that don't offer APIs.

**Example combined prompt:**
```
Using Claude in Chrome, search PubMed for the 10 most recent clinical trials on
GLP-1 agonists for type 2 diabetes published in 2025. Save each abstract and key
metadata (NCT ID, phase, enrollment, primary endpoint) to pubmed-glp1-2025.csv
in my /research/ folder. Then create a Word summary report.
```

### MCP Connectors for Power Workflows

| Domain | MCP Connector | What You Can Automate |
|---|---|---|
| Project Management | Asana, Linear | Create tasks from meeting notes, update statuses, generate reports |
| CRM | Salesforce, HubSpot | Research leads, draft outreach, update records |
| Cloud Storage | Google Drive, Dropbox | Sync files, batch rename, generate indexes |
| Analytics | Honeycomb, n8n | Query observability data, trigger automated workflows |
| Dev Tools | GitHub, AWS | Analyze repos, manage resources, generate documentation |
| Meeting Intel | Fellow.ai | Extract action items, build agendas from notes |

### Skills: Office File Superpowers

Cowork includes built-in **Skills** that give it native handling for common file formats. The `.xlsx` skill supports formulas and pivot tables; `.docx` creates structured documents with headers and styles; `.pptx` generates full slide decks with layouts and speaker notes; and `.pdf` supports reading, merging, splitting, and form-filling. You can also build custom Skills using the skill-creator plugin to teach Claude specialized behaviors for your own workflow.

### Parallel Task Queuing

While Claude is working, you can keep sending tasks. Cowork handles them as a queue. This pattern is powerful for batch work — for example, queuing a data-cleaning task, then a consolidation task, then a presentation generation task all at once and letting Claude work through them sequentially (or in parallel where possible).

### Self-Maintaining Workspaces

One of the most powerful patterns is setting up a **living workspace** that Claude can update on demand. For example, you might create an `inbox/` folder where you drop raw files, a `processed/` folder for completed work, a `reports/` folder for outputs, and a `README.md` that Claude keeps updated with a running summary. Then a single prompt like *"process inbox"* kicks off a full, consistent workflow every time.

### Prompt Chaining with Files

Use files as the communication channel between sessions. Have one Cowork session output a `plan.md`, then in a subsequent session, point Claude at that plan to execute it. This decouples the planning and execution phases, which is invaluable for complex or high-stakes deliverables where you want to review the strategy before anything is written or changed.

### Context Window Maximization

Claude Opus 4.6 has a one-million-token context window. In Cowork, this means you can feed it enormous corpora in a single session. Give Claude access to large datasets up front rather than feeding them in pieces, ask Claude to build an index of your files before starting work so it can reference materials efficiently, and for large-scale analysis, ask Claude to maintain a running notes file it updates incrementally as it reads — this keeps the most important findings always in reach.

---

### 🎓 Course Complete

You've now covered everything from Cowork's underlying VM architecture to advanced multi-tool workflows. Your next steps: install Claude Desktop, set your global instructions with role context and safety guardrails, run a safe test task on a non-critical folder, install two or three relevant plugins for your domain, and then identify one recurring task in your work that Cowork could automate end-to-end.

For the latest updates, visit [support.claude.com](https://support.claude.com) and the [Cowork product page](https://claude.com/product/cowork). Cowork is a research preview and features are evolving rapidly.

</details>

---

## 🛠️ Contributing

Contributions are welcome! To add a course or fix an error:

1. Fork the repository
2. Create a branch: `git checkout -b course/your-course-name`
3. Add your HTML course file following the existing naming convention
4. Update the Course Catalog table in this README
5. Open a pull request with a brief description

Each course file should be a **single self-contained HTML file** with embedded CSS and JavaScript. Modules should follow a logical progression from beginner concepts to advanced application, and should include at least one interactive element per major section.

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
