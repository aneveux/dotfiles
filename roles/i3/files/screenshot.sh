#!/usr/bin/env bash

## rofi-screenshot
## Author: ceuk @ github
## Licence: WTFPL
## Usage:
##    show the menu with rofi-screenshot
##    stop recording with rofi-screenshot -s

# Screenshot directory
screenshot_directory="$HOME/Pictures/Screenshots"
[ -d "$screenshot_directory" ] || mkdir -p "$screenshot_directory"

# set ffmpeg defaults
ffmpeg() {
    command ffmpeg -hide_banner -loglevel error -nostdin "$@"
}

video_to_gif() {
    ffmpeg -i "$1" -vf palettegen -f image2 -c:v png - |
    ffmpeg -i "$1" -i - -filter_complex paletteuse "$2"
}

countdown() {
  notify-send "Screenshot" "Recording in 3 seconds" -t 1000
  sleep 1
  notify-send "Screenshot" "Recording in 2 seconds" -t 1000
  sleep 1
  notify-send "Screenshot" "Recording in 1 seconds" -t 1000
  sleep 1
}

crtc() {
  notify-send "Screenshot" "Select a region to capture"
  ffcast -q $(slop -n -f '-g %g ') png /tmp/screenshot_clip.png
  xclip -selection clipboard -t image/png /tmp/screenshot_clip.png
  rm /tmp/screenshot_clip.png
  notify-send "Screenshot" "Region copied to Clipboard"
}

crtf() {
  notify-send "Screenshot" "Select a region to capture"
  dt=$(date '+%d-%m-%Y %H:%M:%S')
  ffcast -q $(slop -n -f '-g %g ') png "$screenshot_directory/$dt.png"
  notify-send "Screenshot" "Region saved to $screenshot_directory"
}

cstc() {
  ffcast -q png /tmp/screenshot_clip.png
  xclip -selection clipboard -t image/png /tmp/screenshot_clip.png
  rm /tmp/screenshot_clip.png
  notify-send "Screenshot" "Screenshot copied to Clipboard"
}

cstf() {
  dt=$(date '+%d-%m-%Y %H:%M:%S')
  ffcast -q png "$screenshot_directory/$dt.png"
  notify-send "Screenshot" "Screenshot saved to $screenshot_directory"
}

rgrtf() {
  notify-send "Screenshot" "Select a region to record"
  dt=$(date '+%d-%m-%Y %H:%M:%S')
  ffcast -q $(slop -n -f '-g %g ' && countdown) rec /tmp/screenshot_gif.mp4
  notify-send "Screenshot" "Converting to gif... (this can take a while)"
  video_to_gif /tmp/screenshot_gif.mp4 "$screenshot_directory/$dt.gif"
  rm /tmp/screenshot_gif.mp4
  notify-send "Screenshot" "Recording saved to $screenshot_directory"
}

rgstf() {
  countdown
  dt=$(date '+%d-%m-%Y %H:%M:%S')
  ffcast -q rec /tmp/screenshot_gif.mp4
  notify-send "Screenshot" "Converting to gif... (this can take a while)"
  video_to_gif /tmp/screenshot_gif.mp4 "$screenshot_directory/$dt.gif"
  rm /tmp/screenshot_gif.mp4
  notify-send "Screenshot" "Recording saved to $screenshot_directory"
}

rvrtf() {
  notify-send "Screenshot" "Select a region to record"
  dt=$(date '+%d-%m-%Y %H:%M:%S')
  ffcast -q $(slop -n -f '-g %g ' && countdown) rec "$screenshot_directory/$dt.mp4"
  notify-send "Screenshot" "Recording saved to $screenshot_directory"
}

rvstf() {
  countdown
  dt=$(date '+%d-%m-%Y %H:%M:%S')
  ffcast -q rec "$screenshot_directory/$dt.mp4"
  notify-send "Screenshot" "Recording saved to $screenshot_directory"
}

get_options() {
  echo "📷  Capture Region  Clip"
  echo "📷  Capture Region  File"
  echo "📷  Capture Screen  Clip"
  echo "📷  Capture Screen  File"
  echo "🎥  Record Region  File (GIF)"
  echo "🎥  Record Screen  File (GIF)"
  echo "🎥  Record Region  File (MP4)"
  echo "🎥  Record Screen  File (MP4)"
}

check_deps() {
  if ! hash $1 2>/dev/null; then
    echo "Error: This script requires $1"
    exit 1
  fi
}

main() {
  # check dependencies
  check_deps slop
  check_deps ffcast
  check_deps ffmpeg
  check_deps xclip
  check_deps rofi

  if [[ $1 == '--help' ]] || [[ $1 = '-h' ]]
  then
    echo ### rofi-screenshot
    echo USAGE: rofi-screenshot [OPTION]
    echo \(no option\)
    echo "    show the screenshot menu"
    echo -s, --stop
    echo "    stop recording"
    echo -h, --help
    echo "    this screen"
    exit 1
  fi

  if [[ $1 = '--stop' ]] || [[ $1 = '-s' ]]
  then
    pkill -fxn '(/\S+)*ffmpeg\s.*\sx11grab\s.*'
    exit 1
  fi

  # Get choice from rofi
  choice=$( (get_options) | rofi -dmenu -i -fuzzy -p "Screenshot" -theme ~/.config/rofi/launchers/text/style_3 -config ~/.config/rofi/fuzzyconfig.rasi )

  # If user has not picked anything, exit
  if [[ -z "${choice// }" ]]; then
      exit 1
  fi

  # run the selected command
  case $choice in
    '📷  Capture Region  Clip')
      crtc
      ;;
    '📷  Capture Region  File')
      crtf
      ;;
    '📷  Capture Screen  Clip')
      cstc
      ;;
    '📷  Capture Screen  File')
      cstf
      ;;
    '🎥  Record Region  File (GIF)')
      rgrtf
      ;;
    '🎥  Record Screen  File (GIF)')
      rgstf
      ;;
    '🎥  Record Region  File (MP4)')
      rvrtf
      ;;
    '🎥  Record Screen  File (MP4)')
      rvstf
      ;;
  esac

  # done
  set -e
}

main $1 &

exit 0

!/bin/bash

