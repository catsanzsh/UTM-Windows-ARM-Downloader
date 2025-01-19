#!/usr/bin/env bash

# Enable strict error handling
# -e: Exit immediately if a command exits with a non-zero status
# -u: Treat unset variables as errors
# -o pipefail: Catch errors in piped commands
set -euo pipefail

# -----------------------------------------------------------------------------
# Title:        optimized_script.sh
# Description:  Downloads the Spice Desktop Tools ISO and a Windows 10 ARM UTM 
#               disk image with safety checks and error handling.
# Author:       Flames 2021 (Adapted & Optimized)
# -----------------------------------------------------------------------------

# --- Functions ---

# Checks if a command exists on the system.
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# Downloads a file given a URL and output name.
# Usage: safe_download "https://example.com/file.iso" "output.iso"
safe_download() {
  local url="$1"
  local output="$2"

  # If the file already exists, rename it with a timestamp to avoid overwriting
  if [[ -f "$output" ]]; then
    local timestamp
    timestamp="$(date +%Y%m%d-%H%M%S)"
    mv "$output" "${output}.${timestamp}.bak"
    printf "Existing file %s found. Renamed to %s.\n" "$output" "${output}.${timestamp}.bak"
  fi

  # Download the file with wget
  printf "Downloading %s...\n" "$url"
  wget --no-check-certificate --show-progress -O "$output" "$url"
  printf "Downloaded: %s -> %s\n" "$url" "$output"
}

# --- Main Script ---

# 1. Check for required commands
if ! command_exists wget; then
  echo "ERROR: 'wget' is required but not installed. Exiting."
  exit 1
fi

# 2. Download Spice Desktop Tools ISO
safe_download "https://www.spice-space.org/download/spice-desktop-tools/spice-desktop-tools-latest.iso" \
             "spice-desktop-tools.iso"

# 3. Download Windows 10 ARM UTM disk from the official gallery
safe_download "https://www.utm.com/wp-content/uploads/2019/03/UTM-Windows10-ARM-x64-en-US-Installer.iso" \
             "utm.iso"

# 4. Exit
printf "All downloads complete. Exiting script.\n"
exit 0

# End of script
# (C) - Flames 2021: And then the cat ported Windows 11 to M1 Mac!
