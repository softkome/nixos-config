#!/usr/bin/env bash

# First menu - power options
chosen=$(printf "󰜉 Reboot\n⏻ Shutdown" | fuzzel -d --prompt "What do you want to do?")

case "$chosen" in
  "󰜉 Reboot")
    # Confirmation menu for reboot
    confirm=$(printf "✓ Reboot now\n✗ Cancel" | fuzzel -d --prompt "Reboot computer?")
    if [ "$confirm" = "✓ Reboot now" ]; then
      systemctl reboot
    fi
    ;;
  "⏻ Shutdown")
    # Confirmation menu for shutdown
    confirm=$(printf "✓ Shutdown now\n✗ Cancel" | fuzzel -d --prompt "Shutdown computer?")
    if [ "$confirm" = "✓ Shutdown now" ]; then
      systemctl poweroff
    fi
    ;;
  *)
    # Handle escape/cancel or any other input
    exit 0
    ;;
esac
