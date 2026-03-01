#!/bin/bash
# Total Recall Inbox Processor
# Moves items from inbox to approved/quarantine based on rules

MEMORY_DIR="$HOME/.openclaw/workspace/memory"
INBOX="$MEMORY_DIR/inbox"
APPROVED="$MEMORY_DIR/approved"
QUARANTINE="$MEMORY_DIR/quarantine"

echo "=== Inbox Processor ==="
echo "Time: $(date)"
echo ""

# Check inbox
INBOX_COUNT=$(ls -1 "$INBOX/" 2>/dev/null | wc -l | tr -d ' ')
echo "Inbox items: $INBOX_COUNT"

if [ "$INBOX_COUNT" -eq 0 ]; then
    echo "No items to process."
    exit 0
fi

# Process each item
for item in "$INBOX"/*; do
    [ -e "$item" ] || continue
    filename=$(basename "$item")
    
    echo "Processing: $filename"
    
    # Auto-approve safe content types
    case "$filename" in
        *.md)
            # Check for suspicious patterns
            if grep -qi "password\|secret\|key\|token\|credential" "$item" 2>/dev/null; then
                echo "  → QUARANTINE (contains sensitive data)"
                mv "$item" "$QUARANTINE/"
            else
                echo "  → APPROVED"
                mv "$item" "$APPROVED/"
            fi
            ;;
        *)
            echo "  → APPROVED (unknown type)"
            mv "$item" "$APPROVED/"
            ;;
    esac
done

echo ""
echo "Inbox processed."
