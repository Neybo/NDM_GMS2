function scr_player_crouch() {
	//player's crouch state
	image_speed = 0.35
	hsp = move * movespeed
	movespeed = 4
	if move != 0
		xscale = move
	if move = 0 {
		movespeed = 0
		sprite_index = spr_player_crouch
	}
	else {
		if movespeed < 4
			movespeed += 0.5
		sprite_index = spr_player_crawl
	}
	if key_jump {
		vsp = -8
		state = states.crouchjump
	}
	if !grounded
		state = states.crouchjump
	if !key_down {
		state = states.normal
		image_index = 0
		landanim = false
		jumpanim = false
	}


}
