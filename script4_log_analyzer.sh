#!/bin/bash

# ==============================================================================
# Script 4: Log File & Error Analyzer
# Author: Yashraj Zaware (24BCE11157)
# Course: OSS Capstone Project - Unit 5 Focus
# Description: This script scans a specified log file for patterns like 'ERROR' 
# or 'WARNING', counting occurrences and providing a technical summary.
# ==============================================================================

# Input Handling: First argument is the file, second is the search term
TARGET_LOG=$1
SEARCH_TERM=${2:-"error"}  # Defaults to 'error' if no second argument is given
MATCH_COUNT=0

# --- Validation Logic ---
# Checking if the user actually provided a file argument
if [ -z "$TARGET_LOG" ]; then
    echo "Usage: $0 /path/to/logfile.log [keyword]"
    echo "Example: $0 /var/log/syslog critical"
    exit 1
fi

# Checking if the file exists and is a regular file
if [ ! -f "$TARGET_LOG" ]; then
    echo "[!] Error: The file '$TARGET_LOG' does not exist or is inaccessible."
    exit 1
fi

# Checking if the file is empty - a common 'real-world' student check
if [ ! -s "$TARGET_LOG" ]; then
    echo "[i] Note: The log file is currently empty. No patterns to scan."
    exit 0
fi

echo "------------------------------------------------------------"
echo "LOG ANALYSIS REPORT"
echo "Target File : $TARGET_LOG"
echo "Searching For: '$SEARCH_TERM' (case-insensitive)"
echo "------------------------------------------------------------"

# --- Processing Loop ---
# Reading the file line-by-line using a while-read loop as per Unit 5 requirements
while IFS= read -r LOG_LINE; do
    # Using grep in quiet mode to check for the pattern
    if echo "$LOG_LINE" | grep -iq "$SEARCH_TERM"; then
        MATCH_COUNT=$((MATCH_COUNT + 1))
    fi
done < "$TARGET_LOG"

# --- Results Output ---
echo "Scan Complete."
echo ">> Found $MATCH_COUNT instances of '$SEARCH_TERM'."

if [ "$MATCH_COUNT" -gt 0 ]; then
    echo -e "\nShowing the last 5 relevant entries:"
    echo "------------------------------------------------------------"
    # Fulfilling the requirement to show the last 5 matching lines
    grep -i "$SEARCH_TERM" "$TARGET_LOG" | tail -n 5
    echo "------------------------------------------------------------"
else
    echo "No matching entries were found in this log cycle."
fi

echo "Audit Timestamp: $(date)"
