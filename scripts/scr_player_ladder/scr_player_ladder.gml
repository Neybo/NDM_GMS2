function scr_player_ladder() {
	xscale = 1
	hsp = 0
	movespeed = 0
	landanim = false
	jumpanim = false
	if key_up {
		sprite_index = spr_player_ladderup
		vsp = -4
	}
	else if key_down {
		if !grounded {
			sprite_index = spr_player_ladderdown
			vsp = 6
		}
		else {
			state = states.normal
			image_index = 0
		}
	}
	else {
		sprite_index = spr_player_ladder
		vsp = 0
	}
	if !place_meeting(x,y,obj_ladder) {
		state = states.normal
		vsp = 0
	}
	if key_jump {
		state = states.jump
		vsp = -9
		landanim = false
		jumpanim = true
		sprite_index = spr_player_jump
		scr_soundeffect(sfx_jump)
	}
	image_speed = 0.35



}
