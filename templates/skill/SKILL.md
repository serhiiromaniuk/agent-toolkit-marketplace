---
name: <skill-name>
description: <one sentence — WHAT it does and WHEN to use it. This helps compatible agents decide when to load the skill, so make it trigger-rich with concrete keywords.>
# allowed-tools: Read, Grep, Bash(git status *)   # optional — PRE-APPROVES these tools while the skill is active; it does not restrict others. Keep it to read-only tools.
# disable-model-invocation: true                   # optional — only the user can invoke it (/toolkit:<skill-name>)
---

# <Skill Title>

<One-paragraph summary of what this skill does.>

## When to use

- <trigger scenario>
- <trigger scenario>

## How it works

<Steps / rules Claude should follow.>

## Notes

- Bundle helpers in `scripts/`; resolve them relative to the installed skill directory. Claude Code may use `${CLAUDE_PLUGIN_ROOT}`, but portable skills must not require it.
- Put extra docs the agent should load on demand in `reference/`.
