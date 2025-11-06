#!/bin/bash
#
# remove-emails.sh — Remove email addresses from clipboard text (macOS or Linux)
#
# Description:
#   This script scrubs all email addresses from your clipboard content and
#   copies the cleaned text back to the clipboard. Useful before pasting
#   email threads into AI tools (e.g., ChatGPT) to protect privacy.
#
# Usage:
#   Run the script directly, or add it as a function in your ~/.bashrc or ~/.zshrc.
#
# Author: Ianto Cannon
# Date: 2025
# License: MIT
# Repository: https://github.com/ianto-cannon/clean-clipboard
#
# Dependencies:
#   macOS: pbpaste / pbcopy
#   Linux: xclip, xsel or wl-copy / wl-clip
#

# --- Read clipboard content ---
if command -v pbpaste &>/dev/null; then
    text=$(pbpaste)
elif command -v wl-paste &>/dev/null; then
    text=$(wl-paste)
elif command -v xclip &>/dev/null; then
    text=$(xclip -selection clipboard -o)
elif command -v xsel &>/dev/null; then
    text=$(xsel --clipboard)
else
    echo "Error: No clipboard tool found. Install one of: pbpaste/pbcopy, wl-clipboard, xclip, or xsel."
    exit 1
fi

# --- Remove email addresses using a regex ---
cleaned=$(echo "$text" | sed -E 's/[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}//g')

# --- Copy cleaned text back to clipboard ---
if command -v pbcopy &>/dev/null; then
    echo "$cleaned" | pbcopy
elif command -v wl-copy &>/dev/null; then
    echo "$cleaned" | wl-copy
elif command -v xclip &>/dev/null; then
    echo "$cleaned" | xclip -selection clipboard
elif command -v xsel &>/dev/null; then
    echo "$cleaned" | xsel --clipboard
else
    echo "Error: No clipboard write tool found. Install one of: pbcopy, wl-copy, xclip, or xsel."
    exit 1
fi

echo "Email addresses removed from clipboard."

