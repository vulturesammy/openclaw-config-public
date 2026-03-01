#!/bin/bash
# Total Recall Rehydration Script
# Rebuilds session state from memory files

MEMORY_DIR="$HOME/.openclaw/workspace/memory"
WORKSPACE="$HOME/.openclaw/workspace"

echo "=== Total Recall Rehydration ==="
echo "Time: $(date)"
echo ""

# 1. Check critical files exist
echo "1. Checking critical files..."
CRITICAL_FILES=(
    "$WORKSPACE/MEMORY.md"
    "$WORKSPACE/USER.md"
    "$WORKSPACE/SOUL.md"
    "$MEMORY_DIR/active-tasks.md"
    "$MEMORY_DIR/handoffs/main-session-latest.md"
)

for file in "${CRITICAL_FILES[@]}"; do
    if [ -f "$file" ]; then
        echo "  ✓ $(basename $file)"
    else
        echo "  ✗ MISSING: $(basename $file)"
    fi
done

# 2. Rehydrate MEMORY.md to context
echo ""
echo "2. Rehydrating from MEMORY.md..."
if [ -f "$WORKSPACE/MEMORY.md" ]; then
    echo "  ✓ MEMORY.md loaded ($(wc -l < "$WORKSPACE/MEMORY.md") lines)"
else
    echo "  ✗ MEMORY.md not found"
fi

# 3. Rehydrate active tasks
echo ""
echo "3. Loading active tasks..."
if [ -f "$MEMORY_DIR/active-tasks.md" ]; then
    cat "$MEMORY_DIR/active-tasks.md"
else
    echo "  (no active tasks)"
fi

# 4. Rehydrate handoff
echo ""
echo "4. Loading handoff context..."
if [ -f "$MEMORY_DIR/handoffs/main-session-latest.md" ]; then
    cat "$MEMORY_DIR/handoffs/main-session-latest.md"
else
    echo "  (no handoff)"
fi

# 5. Check recent daily logs
echo ""
echo "5. Recent daily logs..."
ls -t "$MEMORY_DIR"/2026-*.md 2>/dev/null | head -3 | while read f; do
    echo "  - $(basename $f)"
done

echo ""
echo "=== Rehydration Complete ==="
