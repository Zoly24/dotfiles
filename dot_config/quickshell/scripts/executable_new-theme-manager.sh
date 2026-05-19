#!/bin/bash

matugen image "$1" -m dark -t scheme-tonal-spot --contrast -0.005 --prefer saturation --lightness-dark 0.1

notify-send -a "Theme Engine" -i "$1" "Theme Applied" "Applied: Quickshell"
