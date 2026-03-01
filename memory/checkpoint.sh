#!/bin/bash
# Total Recall Checkpoint Script
# Verifies memory integrity and creates checkpoints

MEMORY_DIR="$HOME/.openclaw/workspace/memory"
LOG_FILE="$HOME/.openclaw/workspace/memory/checkpoint.log"

echo "=== Total Recall Checkpoint $(date) ===" >> "$LOG_FILE"

# 1. Verify critical memory files exist
echo "Checking critical files..." >> "$LOG_FILE"
CRITICAL_FILES=(
    "$HOME/.openclaw/workspace/MEMORY.md"
    "$HOME/.openclaw/workspace/USER.md"
    "$HOME/.openclaw/workspace/SOUL.md"
    "$MEMORY_DIR/active-tasks.md"
    "$MEMORY_DIR/handoffs/main-session-latest.md"
)

for file in "${CRITICAL_FILES[@]}"; do
    if [ -f "$file" ]; then
        echo "✓ $(basename $file)" >> "$LOG_FILE"
    else
        echo "✗ MISSING: $(basename $file)" >> "$LOG_FILE"
        touch "$file"
        echo "Created missing file: $file" >> "$LOG_FILE"
    fi
done

# 2. Check disk space
DISK_USAGE=$(df -h ~ | tail -1 | awk '{print $5}' | sed 's/%//')
echo "Disk usage: ${DISK_USAGE}%" >> "$LOG_FILE"

# 3. Verify handoff file is recent
HANDOFF_FILE="$MEMORY_DIR/handoffs/main-session-latest.md"
if [ -f "$HANDOFF_FILE" ]; then
    HANDOFF_AGE=$(($(date +%s) - $(stat -f %m "$HANDOFF_FILE" 2>/dev/null || stat -c %Y "$HANDOFF_FILE" 2>/dev/null)))
    HANDOFF_MINUTES=$((HANDOFF_AGE / 60))
    echo "Handoff age: ${HANDOFF_MINUTES} minutes" >> "$LOG_FILE"
fi

# 4. Check inbox
INBOX_COUNT=$(ls -1 "$MEMORY_DIR/inbox/" 2>/dev/null | wc -l)
echo "Inbox items: $INBOX_COUNT" >> "$LOG_FILE"

# 5. Git commit (workspace only, skip if errors)
cd ~/.openclaw/workspace
if [[ $(git status --porcelain 2>/dev/null) ]]; then
    git add memory/ 2>/dev/null && git commit -m "Checkpoint $(date +%Y-%m-%d-%H%M)" 2>/dev/null
    git push origin main 2>/dev/null || echo "Git push deferred" >> "$LOG_FILE"
    echo "✓ Checkpoint saved" >> "$LOG_FILE"
fi

echo "=== Checkpoint Complete ===" >> "$LOG_FILE"
echo "" >> "$LOG_FILE"
