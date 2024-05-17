#!/bin/bash
_dev=$(find /dev/input/by-id/*event-mouse | tail -1)
[ -z "${_dev}" ] && echo "Cannot find mouse event device" && exit 1
echo "Using ${_dev}"
while true; do
    sleep 60
    /usr/bin/evemu-event "${_dev}" --type EV_REL --code REL_X --value $((-1)) --sync
    sleep 0.001
    /usr/bin/evemu-event "${_dev}" --type EV_REL --code REL_X --value $((1)) --sync
    echo -n "#"
done
