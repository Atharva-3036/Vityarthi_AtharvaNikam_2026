#!/bin/bash

# =================================================================
# Script 4: Log File Analyzer
# Author: Atharva Nikam (24BSA10198)
# Course: Open Source Software
# Description: This script scans system logs for specific keywords.
# It includes a retry loop and displays matching entries.
# =================================================================

# Requirement: Use command-line arguments ($1) for the log file [cite: 166, 170]
LOG_INPUT=$1
# Default keyword is 'error' if $2 is not provided [cite: 171]
SEARCH_WORD=${2:-"error"}

# Initializing counter [cite: 172]
MATCH_COUNT=0

echo "--------------------------------------------------------"
echo "  LOG AUDIT: SCANNING FOR [$SEARCH_WORD]                "
echo "  Auditor: Atharva Nikam (24BSA10198)                   "
echo "--------------------------------------------------------"

# --- DO-WHILE STYLE RETRY LOGIC ---
# Requirement: Add a retry if the file is empty or missing 
# We use a loop that breaks only if a valid, non-empty file is provided.
until [ -s "$LOG_INPUT" ]; do
    echo "Error: Log file '$LOG_INPUT' is either missing or empty."
    read -p "Please enter a valid log path (e.g., /var/log/syslog) or 'q' to quit: " LOG_INPUT
    
    if [[ "$LOG_INPUT" == "q" ]]; then
        echo "Exiting audit..."
        exit 1
    fi
done

echo "Analyzing: $LOG_INPUT..."

# Requirement: Use a while-read loop to process line by line [cite: 165, 177]
while IFS= read -r LOG_LINE; do
    # Requirement: if-then inside to check for the keyword [cite: 165, 179]
    if echo "$LOG_LINE" | grep -iq "$SEARCH_WORD"; then
        MATCH_COUNT=$((MATCH_COUNT + 1))
    fi
done < "$LOG_INPUT"

echo "--------------------------------------------------------"
echo "Results: Found [$MATCH_COUNT] instances of '$SEARCH_WORD'."

# Requirement: Print the last 5 matching lines using tail + grep 
if [ $MATCH_COUNT -gt 0 ]; then
    echo "Showing the last 5 relevant entries:"
    grep -i "$SEARCH_WORD" "$LOG_INPUT" | tail -n 5
else
    echo "No matching entries found in this log."
fi

echo "--------------------------------------------------------"
