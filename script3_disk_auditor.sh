#!/bin/bash

# ==============================================================================
# Script 3: Disk and Permission Auditor
# Author: Yashraj Zaware (24BCE11157)
# Course: OSS Capstone Project - Unit 2 Focus
# Description: This script iterates through core Linux system directories 
# to audit disk usage, ownership, and security permissions.
# ==============================================================================

# Array of critical directories for the audit [cite: 152]
AUDIT_DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

echo "============================================================"
echo "DIRECTORY SECURITY & STORAGE AUDIT"
echo "============================================================"
printf "%-15s %-20s %-10s\n" "DIRECTORY" "PERMISSIONS (U/G)" "SIZE"
echo "------------------------------------------------------------"

# Using a for-loop to process each directory path [cite: 147]
for TARGET in "${AUDIT_DIRS[@]}"; do
    if [ -d "$TARGET" ]; then
        # Extracting Permissions, Owner, and Group using awk 
        # $1=perms, $3=owner, $4=group
        ATTRS=$(ls -ld "$TARGET" | awk '{print $1 " (" $3 ":" $4 ")"}')
        
        # Calculating disk usage - suppressing errors for restricted subdirs 
        USAGE=$(du -sh "$TARGET" 2>/dev/null | awk '{print $1}')
        
        # Formatting the output for readability 
        printf "%-15s %-20s %-10s\n" "$TARGET" "$ATTRS" "$USAGE"
    else
        echo "Warning: $TARGET directory was not found on this system." [cite: 161]
    fi
done

echo "------------------------------------------------------------"
echo "SPECIFIC AUDIT: Python 3 Binary"

# Locating the actual path of the audited software 
PY_LOC=$(which python3)

if [ -x "$PY_LOC" ]; then
    echo "Executable found at: $PY_LOC"
    # Showing detailed long-list for the binary permissions
    ls -lh "$PY_LOC"
else
    echo "Error: Python 3 executable is not in the system PATH."
fi
echo "============================================================"
