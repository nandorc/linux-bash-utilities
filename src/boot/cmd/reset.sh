#!/bin/bash

# Dependencies
source ~/.basher/lib/inihandler.sh
source ~/.basher/lib/wrapper.sh

# Set variables and begin message
options=$(getRebuildedOptions $*)
printColoredMessage "Resetting features.ini file..." --wrap-position begin $options

# Delete current features.ini file if exists
if [ -f ~/.basher/src/boot/etc/features.ini ]; then
    rm -rf ~/.basher/src/boot/etc/features.ini
    printMessage "* Current features.ini file deleted."
fi

# Create new features.ini
touch ~/.basher/src/boot/etc/features.ini
printMessage "* New features.ini file created."

# Save default values
setINIVar ~/.basher/src/boot/etc/features.ini git on
printMessage "* Default values stored in features.ini file."

# Unset variables and end message
printColoredMessage "done" --wrap-position end $options
unset options
