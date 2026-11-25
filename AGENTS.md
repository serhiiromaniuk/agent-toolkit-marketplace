# Repository agent guidance

Shared guidance for agents working in this repository; Claude Code also loads it via `CLAUDE.md`.

## What this repo is

A **personal agent skill collection and plugin marketplace** for Claude Code and Codex. It is *both* the marketplace (a
manifest listing installable plugins) and the home of those plugins. There is no
application to build or run — the "code" is authored primarily as markdown skills
plus a few helper scripts. Contributions are prose-and-config, not a compiled program.

## Architecture

```
.claude-plugin/marketplace.json   # marketplace manifest — declares name "serhii" and lists plugins
plugins/toolkit/                  # the single (currently) plugin, installed as toolkit@serhii
  .claude-plugin/plugin.json      # Claude manifest — bump version on release
  .codex-plugin/plugin.json       # Codex compatibility manifest — same version, hooks disabled
  skills/<name>/SKILL.md          # auto-discovered skills; each also invocable as /toolkit:<name>
  commands/<name>.md              # explicit slash commands (currently: cost-report, statusline)
  agents/<name>.md                # subagents — none yet; create the dir when adding one
  hooks/hooks.json                # event automation: a Stop hook running hooks/cost-tracker/track.py
  statusline/statusline.sh        # status line script; /toolkit:statusline copies it into the config dir
templates/skill/SKILL.md          # copy-to-start skill template — outside the plugin so it never ships
docs/                             # human-facing notes — not automatically loaded
```

The marketplace manifest points at `./plugins/toolkit`. The Claude and Codex manifests
carry the same plugin name and version; do not add a version to the marketplace entry.
Codex supports the existing Claude-compatible marketplace. Its compatibility manifest
explicitly disables hook auto-discovery, because the cost tracker is Claude-specific. Skills are auto-discovered from `skills/*/SKILL.md`; they do not
need to be registered anywhere. Every directory under `skills/` ships and loads — a
leading `_` does not hide it — so templates, drafts and examples of skills live
outside `plugins/`.

### Skill anatomy

```
skills/<name>/
  SKILL.md      # required. YAML frontmatter: name, description, [allowed-tools]
  reference/    # optional. docs pulled in on demand
  scripts/      # optional. helpers (with their own tests)
  assets/       # optional. templates, html, renderers
```

- The `description` frontmatter is the trigger — make it keyword-rich, because that
  is how Claude decides to auto-load the skill.
- Resolve bundled files relative to the installed skill directory. Claude Code may use
  `${CLAUDE_PLUGIN_ROOT}`, but portable skills must also work without it; do not hardcode
  machine-specific paths. Mark agent-specific tools and features explicitly.
- `allowed-tools` **pre-approves** tools while the skill is active; it does not restrict
  the others. List only read-only tools (e.g. `Bash(glab ci status *)`), never bare
  `Bash`, and never pre-approve actions on untrusted content (browser clicks, form fills).

## Choosing a primitive (skill vs command vs agent vs hook)

- **model-decides when → skill** (`skills/<name>/SKILL.md`)
- **I-invoke explicitly → command** (`commands/<name>.md`, called `/toolkit:<name>`)
- **needs own context / restricted tools → subagent** (`agents/<name>.md`)
- **runs on an event → hook** (`hooks/hooks.json`)

## Conventions

- **One commit per skill/functionality** so history stays granular and each addition
  is independently revertable. Subjects follow the existing style:
  `feat(<skill>): …`, `fix(<skill>): …`, with `(vX.Y.Z)` when the commit releases.
- Versioning is semver; keep the Claude and Codex plugin manifest versions equal. Record each
  change in `CHANGELOG.md` under `## [Unreleased]` at the top; a release commit renames
  that heading to `## [X.Y.Z] - YYYY-MM-DD`, bumps both manifest versions, and is tagged with
  `claude plugin tag plugins/toolkit --push` (creates `toolkit--vX.Y.Z`).
- **Scope**: this is a *public* personal marketplace. Keep everything general-purpose
  and free of work-specific or private material (no employer, client, colleague,
  host, account or project names) — anything internal belongs in a separate, private
  marketplace.
- **Examples are written from scratch.** Never commit a real report, transcript or
  config, even find-and-replaced: names change but topology, versions, costs and
  findings still identify the source. Skills derived from work tooling (e.g.
  `assessment-report`) ship only synthetic, fictional examples, labelled as such.

## Testing / validating changes

No repo-wide build. Run what covers the area you changed:

- Manifests: `claude plugin validate . --strict && claude plugin validate plugins/toolkit --strict`. For Codex, test marketplace registration and `codex plugin add toolkit@serhii` using a temporary `CODEX_HOME`, then verify the installed skill and manifest.
- glab helpers: `bash plugins/toolkit/skills/glab/scripts/glab-helpers.test.sh`
  (also checks every glab call against the installed `glab --help`; skips without glab).
- agent-readiness loop scripts: `bash plugins/toolkit/skills/agent-readiness/tests/loop-scripts.test.sh`.
- cost-tracker: `python3 -m unittest discover -s plugins/toolkit/hooks/cost-tracker -p 'test_*.py'`.
  Never point a test or experiment at the real DB — set `CLAUDE_COST_DB` to a scratch path.
- status line: `bash plugins/toolkit/statusline/statusline.test.sh`.
- assessment-report renderer: render each `report-types/*/example.html` with
  `node plugins/toolkit/skills/assessment-report/assets/render.mjs` and open the PDFs.
