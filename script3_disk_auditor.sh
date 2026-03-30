#!/bin/bash

# =================================================================
# Script 3: Disk and Permission Auditor
# Author: Atharva Nikam (24BSA10198)
# Course: Open Source Software
# Description: Loops through critical system directories to audit 
# disk usage, ownership, and security permissions.
# =================================================================

# Defining the list of directories to audit as per project requirements
# Added /usr/local/bin as it's common for manual OSS installs
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

echo "------------------------------------------------------------"
echo "  SYSTEM AUDIT: DIRECTORY PERMISSIONS & DISK USAGE         "
echo "  Auditor: Atharva Nikam (24BSA10198)                      "
echo "------------------------------------------------------------"
echo -e "DIRECTORY\t\tPERMISSIONS\tOWNER\tGROUP\tSIZE"
echo "------------------------------------------------------------"

# Requirement: Use a 'for loop' to iterate through directories
for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        # Using ls -ld and awk to extract permissions (field 1), 
        # owner (field 3), and group (field 4)
        STATS=$(ls -ld "$DIR" | awk '{print $1"\t"$3"\t"$4}')
        
        # Using du to get human-readable size; redirecting errors to /dev/null
        # in case of permission denied issues on specific sub-folders.
        DIR_SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)
        
        echo -e "$DIR\t\t$STATS\t$DIR_SIZE"
    else
        echo -e "$DIR\t\t[!] Directory does not exist on this system."
    fi
done

echo "------------------------------------------------------------"
echo "SPECIFIC AUDIT: Python Installation Path"

# Finding the path of the python3 binary
PYTHON_LOC=$(which python3)

if [ -x "$PYTHON_LOC" ]; then
    echo "Python 3 found at: $PYTHON_LOC"
    # Show detailed long listing for the binary
    ls -lh "$PYTHON_LOC"
    echo "Note: Binaries in /usr/bin are typically owned by root for security."
else
    echo "Warning: Python 3 binary not detected in standard PATH."
fi
echo "------------------------------------------------------------"
