#!/bin/bash

killall -q polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

(sleep 3; polybar center &)

echo "Polybar launched..."
