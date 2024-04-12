#!/bin/sh

set -e

# Find and tail all log files in the specified path, and redirect output to a file
tail -f $(find "$LOGPATH" -type f -iname "*.log") | wtee -d -b 0.0.0.0:8080 | nl > /dev/null 2>&1

