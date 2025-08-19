#!/usr/bin/env bash

# Get the default source (microphone) information
source_info=$(pactl get-default-source)
mute_status=$(pactl get-source-mute "$source_info" | awk '{print $2}')

# Determine icon and tooltip based on mute status
if [ "$mute_status" = "yes" ]; then
    icon="<span size='large'>󰍭</span>"
    tooltip="Microphone: Muted (Click to unmute)"
    class="muted"
else
    icon="<span size='large'>󰍬</span>"
    tooltip="Microphone: Active (Click to mute)"
    class="active"
fi

# Output JSON for waybar
echo "{\"text\":\"$icon\", \"tooltip\":\"$tooltip\", \"class\":\"$class\"}"
