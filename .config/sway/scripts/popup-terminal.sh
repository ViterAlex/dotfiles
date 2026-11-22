#!/bin/sh
# Get width and height of active workspace

app_selector="[app_id=popup_foot]"
size_and_pos=$(
    swaymsg -t get_workspaces |
  jq '.[] | select(.focused) | .rect |
    {
      width,
      w: ((.width  * 0.75) | floor),
      h: ((.height * 0.3) | floor)
    }' |
  jq '{
    x: (((.width - .w) / 2) | floor),
    y: 0,
    w,
    h
  }'
)
echo $size_and_pos
resize_message=$(echo $size_and_pos | jq '"resize set width \(.w) px height \(.h) px"')
move_message=$(echo $size_and_pos | jq '"move position \(.x) \(.y)"')
resize_message="${resize_message%\"}"
resize_message="${resize_message#\"}"
move_message="${move_message%\"}"
move_message="${move_message#\"}"
swaymsg  $app_selector scratchpad show
swaymsg $app_selector $resize_message
swaymsg $app_selector $move_message
echo "${resize_message#\"}"
echo "${move_message#\"}"
