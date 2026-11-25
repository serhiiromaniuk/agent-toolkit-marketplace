# agent-toolkit-marketplace

Personal agent skill collection and Claude Code plugin marketplace — shared skills plus Claude-specific commands, hooks, and setup guidelines.

This repo is **both** a marketplace (it lists plugins) and the home of those plugins.

## Install for Claude Code

```bash
# 1. Add this marketplace
/plugin marketplace add serhiiromaniuk/agent-toolkit-marketplace

# 2. Install the toolkit plugin
/plugin install toolkit@serhii

# 3. (later) refresh the catalog and update the plugin
/plugin marketplace update serhii
claude plugin update toolkit@serhii   # then restart Claude Code
```

## Install for Codex

Codex can install the same toolkit through its native plugin marketplace. From a local clone:

```bash
codex plugin marketplace add /absolute/path/to/agent-toolkit-marketplace
codex plugin add toolkit@serhii
```

Alternatively, add the GitHub marketplace with
`codex plugin marketplace add serhiiromaniuk/agent-toolkit-marketplace` and then install
`toolkit@serhii`. Restart the app or start a new session to use newly installed skills.
The marketplace can also be opened in the desktop app's Plugins directory. See the
[official plugin packaging guide](https://developers.openai.com/plugins/build/plugins).

The toolkit installs as a bundle: it contains all listed skills, including the Claude-only
`claude-in-chrome` reference. Use that reference only with its Claude MCP integration. The
agent-readiness audit is portable, but its bundled loop and agent templates target Claude Code.
Claude slash commands and status line are Claude-specific; the Codex manifest explicitly
disables the toolkit's Claude cost-tracking hook. Installing the plugin does not install
individual skills separately or make them persistent ChatGPT instructions or memory.

To install only one skill, ask Codex to use `$skill-installer` with the repository and the
specific `plugins/toolkit/skills/<skill-name>` path,
or copy the skill directory to a supported Codex skills directory. See the
[OpenAI skill installation guidance](https://developers.openai.com/api/reference/cli).

To invoke the plugin skill, ask Codex to use `$toolkit:structured-technical-competency-interview`
or describe the interview task. A separately installed skill uses the unprefixed
`$structured-technical-competency-interview` name. For Claude Code, use
`/toolkit:structured-technical-competency-interview`.

## What you get

### Skills

Skills can be selected by description. In Claude Code, each is also invocable as `/toolkit:<name>`.

| Skill | What it does |
|---|---|
| **agent-readiness** | Audits how well a repo is adopted for autonomous / long-running agentic work — a 7-pillar maturity rubric → A–F grade + a diffable `.agent-readiness/score.json`, then plans & applies the improvements from a domain-free reference implementation (loop harness, task ledger, rules, subagents). |
| **assessment-report** | Turns findings into a scored, branded assessment (gap/risk, security, cost, due-diligence, architecture, post-incident) with an executive dashboard, rendered to PDF. Ships synthetic examples only. |
| **claude-in-chrome** | Reference for browser automation via the claude-in-chrome MCP (tabs, navigation, DOM, forms, screenshots, console/network debugging, GIF recording). |
| **glab** | GitLab CLI (`glab` ≥ 1.54) DevOps workflows — pipelines, merge requests, releases, CI/CD debugging — plus tested shell helpers. |
| **structured-technical-competency-interview** | Builds structured, level-calibrated DevOps, SRE, platform and infrastructure interviews, practical simulations and evidence-based scorecards. |
| **verify-before-done** | Blocks "done / fixed / passing" claims that aren't backed by a command run in the current message — gate function, per-claim evidence table, rationalization guards. |

### Claude Code commands

| Command | What it does |
|---|---|
| `/toolkit:cost-report [csv\|status\|backfill\|reprice]` | Local token-spend report by day, project, model and session, from the cost-tracker database. |
| `/toolkit:statusline [preview\|install\|uninstall]` | A two-row, width-aware status line: model and effort, context bar, 5-hour and weekly limits with reset countdowns, cost, git, AWS profile (and the caveman mode when that plugin is in use). `install` asks before replacing an existing status line and backs it up. |

### Claude Code hooks

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
    .claude-plugin/plugin.json    # Claude plugin manifest
    .codex-plugin/plugin.json     # Codex compatibility manifest (hooks disabled)
    skills/                       # auto-discovered skills (one dir each, SKILL.md)
    commands/                     # slash commands (/toolkit:<name>)
    hooks/                        # hooks.json + the cost-tracker it runs
    statusline/                   # status line script (installed by /toolkit:statusline)
AGENTS.md                        # shared repository guidance, imported by CLAUDE.md
templates/skill/                  # copy-to-start skill template (not shipped in the plugin)
docs/                             # human-facing notes, NOT loaded into Claude's context
```

## Adding a new skill

1. `cp -r templates/skill plugins/toolkit/skills/<skill-name>` and fill in `SKILL.md`
   (`name`, a trigger-rich `description`, optional `allowed-tools`).
2. Bundle helpers in `scripts/` and extra docs in `reference/` if needed — resolve bundled
   files relative to the installed skill directory, including outside Claude Code.
3. Add a `CHANGELOG.md` entry under Unreleased; bump both plugin manifest versions together when releasing.
4. `claude plugin validate . --strict && claude plugin validate plugins/toolkit --strict`.

## Conventions

See [`docs/conventions.md`](docs/conventions.md) for the rule of thumb on skill vs. command
vs. agent vs. hook, skill anatomy, testing, and the scope of this marketplace.

Changes land one commit per skill/functionality, so history stays granular and each addition is independently revertable.

## License

[MIT](LICENSE)
