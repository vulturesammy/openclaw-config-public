#!/bin/bash
# Total Recall Threshold Guard
# Alerts when memory usage exceeds 80%

MEMORY_DIR="$HOME/.openclaw/workspace/memory"
THRESHOLD=80

echo "=== Memory Threshold Check ==="
echo "Time: $(date)"
echo ""

# Check active tasks file size
if [ -f "$MEMORY_DIR/active-tasks.md" ]; then
    TASK_LINES=$(wc -l < "$MEMORY_DIR/active-tasks.md")
    # Estimate ~500 lines = 100% (rough estimate)
    USAGE=$(( (TASK_LINES * 100) / 500 ))
    echo "Active tasks: $TASK_LINES lines (~${USAGE}%)"
    
    if [ "$USAGE" -ge "$THRESHOLD" ]; then
        echo "⚠️ WARNING: Active tasks at ${USAGE}% - review needed"
    fi
fi

# Check handoff file
if [ -f "$MEMORY_DIR/handoffs/main-session-latest.md" ]; then
    HANDOFF_LINES=$(wc -l < "$MEMORY_DIR/handoffs/main-session-latest.md")
    echo "Handoff: $HANDOFF_LINES lines"
fi

# Check inbox (items waiting to be processed)
INBOX_COUNT=$(ls -1 "$MEMORY_DIR/inbox/" 2>/dev/null | wc -l | tr -d ' ')
if [ "$INBOX_COUNT" -gt 0 ]; then
    echo "⚠️ Inbox has $INBOX_COUNT items - process needed"
fi

# Check quarantine
QUARANTINE_COUNT=$(ls -1 "$MEMORY_DIR/quarantine/" 2>/dev/null | wc -l | tr -d ' ')
if [ "$QUARANTINE_COUNT" -gt 5 ]; then
    echo "⚠️ Quarantine has $QUARANTINE_COUNT items - review needed"
fi

echo ""
echo "=== Check Complete ==="
