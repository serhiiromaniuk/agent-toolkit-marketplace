#!/usr/bin/env bash
# Copy selected portable toolkit skills into Codex's user skill directory.
set -euo pipefail
repo_root=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)
skills_root="$repo_root/plugins/toolkit/skills"
dest_root="${CODEX_HOME:-$HOME/.codex}/skills"
if (($# == 0)); then
  printf 'Usage: %s SKILL [SKILL ...]\n' "$0" >&2
  printf 'Available: agent-readiness assessment-report glab verify-before-done structured-technical-competency-interview\n' >&2
  exit 2
fi
for skill in "$@"; do
  case "$skill" in
    agent-readiness|assessment-report|glab|verify-before-done|structured-technical-competency-interview) ;;
    *) printf 'Unsupported skill: %s\n' "$skill" >&2; exit 2 ;;
  esac
  if [[ ! -f "$skills_root/$skill/SKILL.md" ]]; then
    printf 'Skill not found: %s\n' "$skill" >&2; exit 1
  fi
  if [[ -e "$dest_root/$skill" || -L "$dest_root/$skill" ]]; then
    printf 'Already exists, refusing to overwrite: %s\n' "$dest_root/$skill" >&2; exit 1
  fi
done
# Reject duplicate names before creating any files.
if [[ $(printf '%s\n' "$@" | sort -u | wc -l) -ne $# ]]; then
  printf 'Duplicate skill name\n' >&2; exit 2
fi
mkdir -p -- "$dest_root"
for skill in "$@"; do
  cp -R -- "$skills_root/$skill" "$dest_root/$skill"
  printf 'Installed %s to %s\n' "$skill" "$dest_root/$skill"
done
