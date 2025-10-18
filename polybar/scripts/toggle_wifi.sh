#!/bin/bash

# Function to check WiFi state
check_wifi_state() {
    state=$(iwctl station wlan0 show | grep "State" | awk '{print $2}')
    echo $state
}

# Function to turn WiFi on
turn_on_wifi() {
    iwctl station wlan0 scan on
}

# Function to turn WiFi off
turn_off_wifi() {
    iwctl station wlan0 disconnect
}

# Main script
current_state=$(check_wifi_state)

if [ "$current_state" == "connected" ]; then
    turn_off_wifi
elif [ "$current_state" == "disconnected" ]; then
    turn_on_wifi
else
    exit 1
fi

