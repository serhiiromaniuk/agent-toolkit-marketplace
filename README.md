# claude-marketplace

Personal agent skill collection and Claude Code plugin marketplace — shared skills plus Claude-specific commands, hooks, and setup guidelines.

This repo is **both** a marketplace (it lists plugins) and the home of those plugins.

## Install for Claude Code

```bash
# 1. Add this marketplace
/plugin marketplace add serhiiromaniuk/claude-marketplace

# 2. Install the toolkit plugin
/plugin install toolkit@serhii

# 3. (later) refresh the catalog and update the plugin
/plugin marketplace update serhii
claude plugin update toolkit@serhii   # then restart Claude Code
```

## Install shared skills for Codex

From a local clone, choose the skills to copy into `${CODEX_HOME:-~/.codex}/skills`:

```bash
./scripts/install-codex-skills.sh glab verify-before-done
./scripts/install-codex-skills.sh structured-technical-competency-interview
```

The installer refuses to overwrite an existing skill. To update a copy, review and remove the
old copy first, then run it again. Changes in the clone do not update installed copies.
The skills become available in a subsequent Codex turn. Invoke a skill by name, such as
`$structured-technical-competency-interview`, or describe the task so Codex can select it.

`assessment-report` and `agent-readiness` can also be copied; install both for the latter's
optional branded report. The agent-readiness bundled loop and agent templates are Claude Code
specific, even though its audit can be used by other agents. `claude-in-chrome`, Claude slash
commands, hooks and the status line require Claude-specific integrations and are not installed
by this script. A skill is a reusable file, not persistent ChatGPT instructions or memory.

## What you get

### Skills

Most auto-trigger by description; each is also invocable as `/toolkit:<name>`.

| Skill | What it does |
|---|---|
| **agent-readiness** | Audits how well a repo is adopted for autonomous / long-running agentic work — a 7-pillar maturity rubric → A–F grade + a diffable `.agent-readiness/score.json`, then plans & applies the improvements from a domain-free reference implementation (loop harness, task ledger, rules, subagents). |
| **assessment-report** | Turns findings into a scored, branded assessment (gap/risk, security, cost, due-diligence, architecture, post-incident) with an executive dashboard, rendered to PDF. Ships synthetic examples only. |
| **claude-in-chrome** | Reference for browser automation via the claude-in-chrome MCP (tabs, navigation, DOM, forms, screenshots, console/network debugging, GIF recording). |
| **glab** | GitLab CLI (`glab` ≥ 1.54) DevOps workflows — pipelines, merge requests, releases, CI/CD debugging — plus tested shell helpers. |
| **verify-before-done** | Blocks "done / fixed / passing" claims that aren't backed by a command run in the current message — gate function, per-claim evidence table, rationalization guards. |

### Commands

| Command | What it does |
|---|---|
| `/toolkit:cost-report [csv\|status\|backfill\|reprice]` | Local token-spend report by day, project, model and session, from the cost-tracker database. |
| `/toolkit:statusline [preview\|install\|uninstall]` | A two-row, width-aware status line: model and effort, context bar, 5-hour and weekly limits with reset countdowns, cost, git, AWS profile (and the caveman mode when that plugin is in use). `install` asks before replacing an existing status line and backs it up. |

### Hooks

| Event | What it does |
|---|---|
| `Stop` | **cost-tracker** — after each turn, records that session's token usage into a local SQLite DB (`~/.claude-cost-tracker/usage.db`, override with `CLAUDE_COST_DB`). Never leaves the machine, never blocks a session. Disable the plugin's hooks if you don't want it. |

## Requirements

Only for the parts you use: `python3` (cost-tracker), bash ≥ 4.2 and `jq` (status line), `node` ≥ 22 and Chrome/Chromium
(assessment-report PDF rendering), `glab` ≥ 1.54 and `jq` (glab helpers), `bash`, `git`
and `make` (agent-readiness loop templates; their tests also need `jq`).

## Repository layout

```
.claude-plugin/marketplace.json   # marketplace manifest — lists the plugins below
plugins/
  toolkit/                        # the general-purpose plugin
    .claude-plugin/plugin.json    # plugin manifest (version lives here)
    skills/                       # auto-discovered skills (one dir each, SKILL.md)
    commands/                     # slash commands (/toolkit:<name>)
    hooks/                        # hooks.json + the cost-tracker it runs
    statusline/                   # status line script (installed by /toolkit:statusline)
scripts/install-codex-skills.sh  # opt-in installer for shared skills
AGENTS.md                        # shared repository guidance, imported by CLAUDE.md
templates/skill/                  # copy-to-start skill template (not shipped in the plugin)
docs/                             # human-facing notes, NOT loaded into Claude's context
```

## Adding a new skill

1. `cp -r templates/skill plugins/toolkit/skills/<skill-name>` and fill in `SKILL.md`
   (`name`, a trigger-rich `description`, optional `allowed-tools`).
2. Bundle helpers in `scripts/` and extra docs in `reference/` if needed — resolve bundled
   files relative to the installed skill directory, including outside Claude Code.
3. Add a `CHANGELOG.md` entry under Unreleased; bump the plugin version when releasing.
4. `claude plugin validate . --strict && claude plugin validate plugins/toolkit --strict`.

## Conventions

See [`docs/conventions.md`](docs/conventions.md) for the rule of thumb on skill vs. command
vs. agent vs. hook, skill anatomy, testing, and the scope of this marketplace.

Changes land one commit per skill/functionality, so history stays granular and each addition is independently revertable.

## License

[MIT](LICENSE)
