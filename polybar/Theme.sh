polybar -q oasis -c $HOME/.config/bspwm/polybar/config.ini &

set_dunst_config() {
	sed -i "$HOME"/.config/bspwm/dunstrc \
		-e "s/transparency = .*/transparency = 0/g" \
		-e "s/frame_color = .*/frame_color = \"#1a1b26\"/g" \
		-e "s/separator_color = .*/separator_color = \"#c0caf5\"/g" \
		-e "s/font = .*/font = JetBrainsMono NF Medium 9/g" \
		-e "s/foreground='.*'/foreground='#f9f9f9'/g"
		
	sed -i '/urgency_low/Q' "$HOME"/.config/bspwm/dunstrc
	cat >> "$HOME"/.config/bspwm/dunstrc <<- _EOF_
			[urgency_low]
			timeout = 3
			background = "#1a1b26"
			foreground = "#c0caf5"

			[urgency_normal]
			timeout = 6
			background = "#1a1b26"
			foreground = "#c0caf5"

			[urgency_critical]
			timeout = 0
			background = "#1a1b26"
			foreground = "#c0caf5"
_EOF_
}

set_dunst_config
