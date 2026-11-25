# Conventions

Human-facing notes. Files in `docs/` are not automatically loaded into agent context.

## Which primitive do I reach for?

| I want…                                             | Use a…   | Lives in…            |
|-----------------------------------------------------|----------|----------------------|
| An agent to decide *when* to apply it, by description | skill    | `skills/<name>/SKILL.md` |
| To invoke it explicitly by name (`/toolkit:foo`)    | command  | `commands/foo.md` (or a skill with `disable-model-invocation: true`) |
| Its own context window and/or restricted tool set   | subagent | `agents/foo.md`      |
| Something to run automatically on an event          | hook     | `hooks/hooks.json`   |
| To bundle an external tool                          | MCP      | `.mcp.json`          |

Rule of thumb: *model-decides → skill; I-invoke → command; needs-own-context/tools → agent;
runs-on-an-event → hook.*

## Skill anatomy

```
skills/<name>/
  SKILL.md        # required. frontmatter: name, description, [allowed-tools]
  reference/      # optional. docs the skill pulls in on demand
  scripts/        # optional. helpers; resolve relative to the installed skill directory
  assets/         # optional. templates, images, etc.
```

- Keep `description` trigger-rich — it helps compatible agents decide when to load the skill.
- In Claude Code, `allowed-tools` pre-approves tools; it does not restrict them. Read-only tools only.
- Every directory under `skills/` ships to installers. The copy-to-start template lives in
  `templates/skill/`, outside the plugin.

## Hooks

The cost-tracking hook is for Claude Code. The Codex compatibility manifest explicitly disables hook auto-discovery.

- A hook must never break a session: exit 0 on its own errors, keep stdout empty unless the
  event expects output, and finish well inside its `timeout`. Exit 2 from a `Stop` hook
  blocks Claude from stopping — never use it by accident.
- Hooks run on every matching event (a `Stop` hook runs after every turn), so do only the
  work for the current session.

## Releasing

1. Each change adds its lines under `## [Unreleased]` in `CHANGELOG.md`.
2. Release commit: rename that heading to `## [X.Y.Z] - YYYY-MM-DD`, bump `version` in
   both `plugins/toolkit/.claude-plugin/plugin.json` and `plugins/toolkit/.codex-plugin/plugin.json`, and run the checks listed in `AGENTS.md`.
3. `claude plugin tag plugins/toolkit --push` creates and pushes `toolkit--vX.Y.Z`.

## Scope

This is a personal, public marketplace. Keep plugins here general-purpose and free of
work-specific or private material — anything internal belongs in a separate, private
marketplace. Examples are written from scratch and labelled fictional; never commit a real
report or config, even with names replaced.
