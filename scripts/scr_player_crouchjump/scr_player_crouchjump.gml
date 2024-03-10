function scr_player_crouchjump() {
	//player's crouch state
	image_speed = 0.35
	hsp = move * movespeed
    movespeed = 4
	if move != 0
		xscale = move
		sprite_index = spr_player_crouchfall
	if move = 0
		movespeed = 0
	else {
		if movespeed < 4
			movespeed += 0.25
	}
	if grounded
		state = states.crouch


}
