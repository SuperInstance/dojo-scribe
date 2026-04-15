#!/bin/bash
# Repetition Detector — scan diary for patterns that should become scripts
# Usage: ./src/repetition_detector.sh

echo "=== Repetition Detector ==="
echo "Scanning DIARY/ for repeated thoughts..."
echo ""

# Extract all thoughts/passing observations
for f in DIARY/*.md; do
  [ -f "$f" ] || continue
  # Look for lines that start with - and contain observations
  grep "^- " "$f" 2>/dev/null | sed 's/^- //' | tr '[:upper:]' '[:lower:]'
done | sort | uniq -c | sort -rn | head -10 | while read count line; do
  if [ "$count" -gt 1 ]; then
    echo "🔄 REPEATED ($count times): $line"
    echo "   → Should become a script"
  fi
done

echo ""
echo "Checking for manual actions that could be automated..."
for action in "I keep checking" "I keep comparing" "I keep looking at" "I keep running" "I keep writing" "I keep forgetting"; do
  matches=$(grep -rl "$action" DIARY/ 2>/dev/null | wc -l)
  if [ "$matches" -gt 0 ]; then
    echo "⚡ '$action' found in $matches diary entries → AUTOMATE THIS"
  fi
done
