#!/bin/sh
# Blink an LED on breadboard

PIN="48" # P9_15
GPIOPIN="/sys/class/gpio/gpio$PIN"

if [ -d "$GPIOPIN" ]; then
    echo "Blinking LED connected to Pin $PIN ..."
else
    echo $PIN > /sys/class/gpio/export
    echo "Blinking LED connected to Pin $PIN ..."
    sleep 1
fi

while true; do
    echo high > $GPIOPIN/direction
    sleep 2
    echo low > $GPIOPIN/direction
    sleep 2
done
