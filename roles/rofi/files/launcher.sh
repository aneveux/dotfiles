#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

# Available Styles
# >> Created and tested on : rofi 1.6.0-1
#
# style_1     style_2     style_3     style_4     style_5     style_6
# style_7     style_8     style_9     style_10    style_11    style_12

theme="style_1"
dir="$HOME/.config/rofi/launchers/colorful"

# dark
ALPHA="#00000000"
BG="#282a36ff"
FG="#f8f8f2ff"
SELECT="#44475aff"

# accent colors
COLORS=('#EC7875' '#50fa7b' '#f1fa8c' '#6272a4' '#bd93f9' '#8be9fd' '#6272a4' \
		'#f1fa8c' '#ffb86c' '#ffb86c' '#6272a4' '#ff79c6' '#50fa7b' '#44475a')
ACCENT="${COLORS[$(( $RANDOM % 14 ))]}ff"

# overwrite colors file
cat > $dir/colors.rasi <<- EOF
	/* colors */

	* {
	  al:  $ALPHA;
	  bg:  $BG;
	  se:  $SELECT;
	  fg:  $FG;
	  ac:  $ACCENT;
	}
EOF

# comment these lines to disable random style


rofi -no-lazy-grab -theme $dir/"$theme" "$@"
