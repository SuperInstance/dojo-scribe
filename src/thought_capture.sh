#!/bin/bash
# Thought Capture — if a passing thought is worth keeping, file it.
# Usage: ./src/thought_capture.sh "I keep noticing that..."
THOUGHT="$1"
TODAY=$(date +%Y-%m-%d)
DIARY="DIARY/$TODAY.md"

if [ -z "$THOUGHT" ]; then
  echo "Usage: ./src/thought_capture.sh \"your passing thought\""
  echo ""
  echo "If this thought repeats, it becomes:"
  echo "  1st time → diary entry"
  echo "  2nd time → a script in src/"
  echo "  3rd time → a test in tests/"
  echo "  4th time → a skill in SKILLS.md"
  exit 0
fi

# Check if this thought pattern already exists
if grep -qi "$THOUGHT" DIARY/*.md 2>/dev/null; then
  echo "⚠️  SIMILAR THOUGHT FOUND BEFORE:"
  grep -i "$THOUGHT" DIARY/*.md 2>/dev/null | head -3
  echo ""
  echo "This thought has repeated. Time to make it a script."
  echo "Create: src/$(echo "$THOUGHT" | tr ' ' '-' | tr '[:upper:]' '[:lower:]' | head -c 30).sh"
else
  echo "📝 First occurrence. Logging to $DIARY"
  echo "" >> "$DIARY"
  echo "### Passing Thought" >> "$DIARY"
  echo "- $THOUGHT" >> "$DIARY"
  echo "- *If this repeats, it becomes a script.*" >> "$DIARY"
fi
