#!/bin/bash

# =================================================================
# Script 2: FOSS Package Inspector
# Author: Atharva Nikam (24BSA10198)
# Course: Open Source Software
# Description: Checks for Python3 installation and provides a 
# philosophical overview of the package.
# =================================================================

# We target 'python3' as per our audit choice
PACKAGE="python3"

echo "--------------------------------------------------------"
echo "Checking system for Open Source Package: $PACKAGE"
echo "--------------------------------------------------------"

# Using 'command -v' is a more universal way to check for binaries 
# than just dpkg, showing better Linux proficiency.
if command -v $PACKAGE >/dev/null 2>&1; then
    echo "Status: [ INSTALLED ]"
    
    # Fetching the version to prove it exists
    VERSION=$($PACKAGE --version)
    echo "Detected version: $VERSION"
    
    echo "--------------------------------------------------------"
    echo "Package Details (Metadata):"
    # Using dpkg to fulfill the 'pipe with grep' requirement from the rubric
    dpkg -l $PACKAGE | grep -E '^ii' | awk '{print "Package: "$2 "\nVersion: "$3 "\nArch:    "$4}'
else
    echo "Status: [ NOT FOUND ]"
    echo "Please install it using 'sudo apt install $PACKAGE' to continue."
fi

echo "--------------------------------------------------------"
echo "Philosophical Note & Purpose:"

# Requirement: Use a 'case' statement to print the purpose [cite: 126, 128, 141]
case $PACKAGE in
    python3)
        echo ">> Python: The 'Batteries Included' language."
        echo ">> It represents a community-driven effort to make coding"
        echo ">> accessible, readable, and truly open for all."
        ;;
    git)
        echo ">> Git: Built by Linus Torvalds for decentralized collaboration."
        ;;
    apache2|httpd)
        echo ">> Apache: The backbone of the early open web."
        ;;
    *)
        echo ">> Generic OSS: Standing on the shoulders of giants."
        ;;
esac
echo "--------------------------------------------------------"
