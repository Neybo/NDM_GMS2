with obj_player {
	if key_up || (y <= other.bbox_top && key_down) {
		state = states.ladder
		x = other.x + 18
		y = floor(y)
		if y % 2 == 1
			y -= 1
	}
}