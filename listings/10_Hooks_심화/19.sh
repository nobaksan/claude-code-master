#!/usr/bin/env bash
# .claude/hooks/mask-keys.sh — MessageDisplay 훅
jq '{hookSpecificOutput: {hookEventName: "MessageDisplay",
  displayContent: (.delta | gsub("sk-ant-[A-Za-z0-9_-]+"; "sk-ant-****"))}}'
