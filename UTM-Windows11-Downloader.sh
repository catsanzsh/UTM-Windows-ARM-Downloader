#!/bin/bash

# Downloading Spice Desktop Tools ISO
printf "Downloading Spice Desktop Tools ISO from website...\n"
wget -O spice-desktop-tools.iso https://www.spice-space.org/download/spice-desktop-tools/spice-desktop-tools-latest.iso
printf "Downloading Spice Desktop Tools ISO: Done\n"

# Downloading Windows 10 ARM UTM disk from the official gallery
printf "Downloading Windows 10 ARM UTM disk from UTM's official gallery...\n"
wget -O utm.iso https://www.utm.com/wp-content/uploads/2019/03/UTM-Windows10-ARM-x64-en-US-Installer.iso
printf "Downloading Windows 10 ARM UTM disk: Complete\n"

# Exiting script
printf "Exiting script\n"
exit 0

# End of script
# (C) - Flames 2021: And then the cat ported Windows 11 to M1 Mac!
