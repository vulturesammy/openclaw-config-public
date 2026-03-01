#!/bin/bash
# Handoff updater - call this after each major interaction

set -e

MEMORY_DIR="$HOME/.openclaw/workspace/memory"
HANDOFF_FILE="$MEMORY_DIR/handoffs/main-session-latest.md"

# Update handoff with current context
cat > "$HANDOFF_FILE" << EOF
# Main Session Handoff

*Last updated: $(date '+%Y-%m-%d %H:%M PST')*

## Session Info
- Last active: $(date '+%Y-%m-%d %H:%M')
- Model: ollama/minimax-m2.5:cloud (primary), google/gemini-3-pro-preview (fallback)

## Current Context
$(cat ~/.openclaw/workspace/MEMORY.md 2>/dev/null | head -20)

## Recent Activity
- Total Recall memory system implemented
- Checkpoint script running

---

*Auto-managed by Total Recall system*
EOF

echo "Handoff updated at $(date)"
