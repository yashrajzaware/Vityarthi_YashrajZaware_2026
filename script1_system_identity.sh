#!/bin/bash

# ==============================================================================
# Script 1: System Identity & Environment Audit
# Author: Yashraj Zaware (24BCE11157)
# Course: OSS Capstone Project - VIT Bhopal
# Description: Generates a snapshot of the current Linux environment to 
# document the host system for the Python audit.
# ==============================================================================

# --- Variables ---
# Using specific student details for the VITyarthi submission header
STUDENT_NAME="Yashraj Zaware"
REG_NO="24BCE11157"
TARGET_SOFTWARE="Python 3"

# --- Data Gathering via Command Substitution ---
# Capturing the kernel version for Part B of the report
OS_KERNEL=$(uname -r)

# Identifying the current user context
CURRENT_USER=$(whoami)
USER_HOME=$HOME

# System status metrics
SYSTEM_UPTIME=$(uptime -p)
CURRENT_STAMP=$(date '+%A, %d %B %Y | %H:%M:%S')

# Distro detection - handling cases where lsb_release might be missing
if command -v lsb_release > /dev/null; then
    LINUX_DISTRO=$(lsb_release -ds)
else
    LINUX_DISTRO=$(grep "PRETTY_NAME" /etc/os-release | cut -d'=' -f2 | tr -d '"')
fi

# --- Visual Output / Report Generation ---
echo "------------------------------------------------------------"
echo "   OPEN SOURCE AUDIT REPORT - SYSTEM IDENTITY"
echo "------------------------------------------------------------"
echo "Student Name    : $STUDENT_NAME"
echo "Reg. Number     : $REG_NO"
echo "Audited Tool    : $TARGET_SOFTWARE"
echo "------------------------------------------------------------"

echo "Host Environment Details:"
echo " > Linux Distro : $LINUX_DISTRO"
echo " > Kernel Ver.  : $OS_KERNEL"
echo " > Logged in as : $CURRENT_USER (Home: $USER_HOME)"
echo " > System Uptime: $SYSTEM_UPTIME"
echo " > Audit Time   : $CURRENT_STAMP"

echo "------------------------------------------------------------"
# Required message regarding the OS license as per project Section 4
echo "NOTE: This Linux environment is distributed under the 
GNU General Public License (GPL), ensuring the freedoms to 
run, study, share, and modify the system software."
echo "------------------------------------------------------------"
