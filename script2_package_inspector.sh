#!/bin/bash

# ==============================================================================
# Script 2: FOSS Package & Philosophy Inspector
# Author: Yashraj Zaware (24BCE11157)
# Course: OSS Capstone Project
# Description: This script verifies if the audited software (Python 3) is 
# present on the local system and provides context on its role in the FOSS world.
# ==============================================================================

# Target package for the audit
AUDIT_PKG="python3"

echo "------------------------------------------------------------"
echo "Searching for FOSS Package: $AUDIT_PKG"
echo "------------------------------------------------------------"

# Using dpkg-query to check installation status (standard for Debian/Ubuntu)
# Redirecting stderr to /dev/null to keep the output clean if not found
if dpkg-query -W -f='${Status}' "$AUDIT_PKG" 2>/dev/null | grep -q "ok installed"; then
    echo "[STATUS]: $AUDIT_PKG is successfully installed on this machine."
    
    # Extracting version and summary using a pipe with grep as requested
    echo "Package Metadata:"
    dpkg -s "$AUDIT_PKG" | grep -E 'Version|Section|Maintainer'
    
    echo -e "\nRuntime Check:"
    python3 --version
else
    echo "[ALERT]: $AUDIT_PKG was not detected via dpkg."
    echo "Please ensure the package is installed using 'sudo apt install $AUDIT_PKG'."
fi

echo "------------------------------------------------------------"
echo "Software Philosophy & Purpose Note:"

# Case statement to provide context for the audited tool and alternatives
# This fulfills the Unit 2 requirement for logical branching
case "$AUDIT_PKG" in
    python3)
        echo ">> Python: A high-level language that prioritizes human readability."
        echo "   Philosophy: 'Beautiful is better than ugly.' It lowered the barrier"
        echo "   for non-programmers to contribute to open source."
        ;;
    git)
        echo ">> Git: The world's most popular distributed version control system."
        echo "   Philosophy: Built by Linus Torvalds for speed and data integrity."
        ;;
    apache2 | httpd)
        echo ">> Apache: The veteran web server that powered the early growth of the web."
        echo "   Philosophy: Robust, modular, and extremely community-centric."
        ;;
    mysql-server | mariadb-server)
        echo ">> MySQL/MariaDB: The backbone of the LAMP stack for data storage."
        echo "   Philosophy: Proved that open-source databases could rival Oracle/IBM."
        ;;
    *)
        echo ">> Unknown: This package is not currently in the audit philosophy database."
        ;;
esac

echo "------------------------------------------------------------"
