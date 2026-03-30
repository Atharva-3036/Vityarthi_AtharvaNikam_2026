#!/bin/bash

# =================================================================
# Script 1: System Identity & FOSS Audit Report
# Part of the OSS Capstone Project - VITyarthi
# Author: Atharva Nikam (24BSA10198)
# Description: This script gathers core system metadata to identify 
# the environment where the Open Source Audit is being performed.
# =================================================================

# Setting up variables for the report
STUDENT_NAME="Atharva Nikam"
REG_NO="24BSA10198"
AUDIT_TARGET="Python (PSF License)"

# Gathering system data using standard binaries
OS_KERNEL=$(uname -r)
CURRENT_USER=$(whoami)
UPTIME_STAT=$(uptime -p)
CURRENT_TS=$(date "+%Y-%m-%d %H:%M:%S")

# Extracting Distro info safely
if [ -f /etc/os-release ]; then
    DISTRO_NAME=$(grep ^PRETTY_NAME /etc/os-release | cut -d'"' -f2)
else
    DISTRO_NAME="Unknown Linux Distro"
fi

# Visual Output
echo "--------------------------------------------------------"
echo "        OSS CAPSTONE PROJECT: SYSTEM IDENTITY           "
echo "--------------------------------------------------------"
echo "Student Name      : $STUDENT_NAME"
echo "Registration No   : $REG_NO"
echo "Project Target    : $AUDIT_TARGET"
echo "--------------------------------------------------------"
echo "OS Kernel Version : $OS_KERNEL"
echo "Active User       : $CURRENT_USER"
echo "Operating System  : $DISTRO_NAME"
echo "System Uptime     : $UPTIME_STAT"
echo "Execution Time    : $CURRENT_TS"
echo "--------------------------------------------------------"

# Philosophical Note (Requirement: Mentioning Linux/OSS context)
echo ""
echo "Note: This system runs on the Linux Kernel, which is"
echo "distributed under the GNU General Public License (GPLv2)."
echo "This ensures the freedom to run, study, share, and modify"
echo "the core operating system."
echo "--------------------------------------------------------"
