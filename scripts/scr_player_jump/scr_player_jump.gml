function scr_player_jump() {
	//player's falling state
	image_speed = 0.35
	hsp = move * movespeed
	if move != 0
		xscale = move
	if jumpanim = false {
		if sprite_index != spr_player_fall and sprite_index != spr_player_groundpoundjump
			sprite_index = spr_player_fall
		if sprite_index = spr_player_groundpoundjump and floor(image_index) = image_number - 1
			sprite_index = spr_player_fall
	}
	if move = 0 {
		movespeed = 0
	}
	else {
		if movespeed < 6
			movespeed += 0.5
	}
	if grounded and vsp >= 0 {
		landanim = true
		state = states.normal
		jumpanim = false
		scr_soundeffect(sfx_step)
	}
	if key_attack {
		state = states.attack
		with instance_create_depth(x,y,depth,obj_punchhitbox)
			playerid = id
	}
	if key_down2 {
		state = states.groundpound
		scr_soundeffect(sfx_groundpoundstart)
		sprite_index = spr_player_groundpoundstart
		image_index = 0
		vsp = -5
	}
	scr_dotaunt()



}
