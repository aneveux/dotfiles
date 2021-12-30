#!/usr/bin/env bash

# -----------------------------------------------------------------------------
# Info:
#   author:    Miroslav Vidovic
#   file:      web-search.sh
#   created:   24.02.2017.-08:59:54
#   revision:  ---
#   version:   1.0
# -----------------------------------------------------------------------------
# Requirements:
#   rofi
# Description:
#   Use rofi to search the web.
# Usage:
#   web-search.sh
# -----------------------------------------------------------------------------
# Script:

declare -A URLS
declare -a PLATFORMS

URLS=(
  ["duckduckgo"]="https://www.duckduckgo.com/?q="
  ["stackoverflow"]="http://stackoverflow.com/search?q="
  ["github"]="https://github.com/search?q="
  ["youtube"]="https://www.youtube.com/results?search_query="
  ["google"]="https://www.google.com/search?q="
  ["searchcode"]="https://searchcode.com/?q="
  ["openhub"]="https://www.openhub.net/p?ref=homepage&query="
  ["superuser"]="http://superuser.com/search?q="
  ["imdb"]="http://www.imdb.com/find?ref_=nv_sr_fn&q="
)

PLATFORMS=(
  "duckduckgo"
  "stackoverflow"
  "github"
  "youtube"
  "google"
  "searchcode"
  "openhub"
  "superuser"
  "imdb"
)

# List for rofi
gen_list() {
    for i in "${PLATFORMS[@]}"
    do
      echo "$i"
    done
}

main() {
  # Pass the list to rofi
  platform=$( (gen_list) | rofi -dmenu -matching fuzzy -no-custom -location 0 -p "🔎 > " -theme ~/.config/rofi/launchers/text/style_3 -config ~/.config/rofi/fuzzyconfig.rasi )

  if [[ -n "$platform" ]]; then
    query=$( (echo ) | rofi -dmenu -matching fuzzy -location 0 -p "❓ > " -theme ~/.config/rofi/launchers/text/style_3 -config ~/.config/rofi/fuzzyconfig.rasi )

    if [[ -n "$query" ]]; then
      url=${URLS[$platform]}$query
      xdg-open "$url"
    else
      exit
    fi

  else
    exit
  fi
}

main

exit 0
