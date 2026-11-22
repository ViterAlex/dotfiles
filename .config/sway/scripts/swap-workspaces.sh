#!/bin/sh
# Get current workspaces and outputs
# swaymsg "$(swaymsg -t get_workspaces | jq -r ' [.[] | select(.visible)] | "workspace \(.[0].name), move workspace to output \(.[1].output), " + "workspace \(.[1].name), move workspace to output \(.[0].output)"')"   
w=$(swaymsg -t get_workspaces | jq 'map(select(.visible) | {name,output})')
ws1=$( echo $w | jq '.[0].name')
ws2=$( echo $w | jq '.[1].name')
output1=$( echo $w | jq '.[0].output')
output2=$( echo $w | jq '.[1].output')
# # Move workspaces to swap outputs
swaymsg [workspace=$ws1] move workspace to output $output2
swaymsg [workspace=$ws2] move workspace to output $output1
