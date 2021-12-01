#!/bin/bash

function event {
  eventName="${1}"
  btrfs sub sn -r / "/@/@events/${eventName}"
}

event "${1}"
