function scr_player_attack() {
	//player's attack state
	image_speed = 0.45
	landanim = false
	jumpanim = false
	hsp = xscale * movespeed
	if sprite_index != spr_player_suplexdash and sprite_index != spr_player_suplexdashair and sprite_index != spr_player_suplexdashairstart {
		sprite_index = spr_player_suplexdash
		image_index = 0
		instance_create_depth(x,y,depth + 1,obj_crazyruneffectother)
		scr_soundeffect(sfx_suplexdash)
	}
	if floor(image_index) = image_number - 1 {
		if sprite_index = spr_player_suplexdash {
			if !key_mach {
				state = states.normal
				movespeed = 0
			}
			else
				state = states.mach2
		}
		if sprite_index = spr_player_suplexdashairstart
			sprite_index = spr_player_suplexdashair
	}
	if sprite_index = spr_player_suplexdash and !grounded {
		sprite_index = spr_player_suplexdashairstart
		image_index = 0
	}
	if movespeed < 10
		movespeed += 0.5
	if grounded and sprite_index = spr_player_suplexdashair {
		if !key_mach {
			state = states.normal
			movespeed = 0
		}
		else
			state = states.mach2	
	}
	if movespeed < 8
		movespeed = 8
	if trailbuffer < 0 and movespeed > 2 {
		trailbuffer = 4
		with instance_create_depth(x,y,depth + 2,obj_afterimageeffect) {
			image_xscale = other.image_xscale
			sprite_index = other.sprite_index
			image_index = other.image_index - 1
		}
	}
	if scr_solid(x + xscale,y) and !place_meeting(x + hsp,y,obj_slope) {
		if grounded {
			state = states.mach3bump
			image_index = 0
			sprite_index = spr_player_mach3bump
			vsp = -3
			scr_soundeffect(sfx_hitwall)
		}
		else {
			state = states.climbwall
			image_index = 0
			climbbuffer = 10
		}
	}
	if place_meeting(x + hsp, y, obj_solid) && !scr_slope()
	{
		state = states.mach3bump
		sprite_index = spr_player_bump
		image_index = 0
	}
	if grounded and key_jump {
		state = states.mach2
		sprite_index = spr_player_machspin
		image_index = 0
		movespeed = 10
		vsp = -9
		scr_soundeffect(sfx_sjumpcancel)
		if move != 0
			xscale = move
		instance_create_depth(x,y,depth + 1,obj_crazyruneffectother)
	}

// vvv Finish this - StS (PL) 

// tried to do suplex cancel, the obj.player.sprite_index part doesnt want to work, alternative to use: state == attack
if obj_player.sprite_index == spr_player_suplexdashair and obj_player.sprite_width = -1 and keyboard_check_pressed(vk_right) {
	state = normal
}

if obj_player.sprite_index == spr_player_suplexdashair and obj_player.sprite_width = 1 and keyboard_check_pressed(vk_left) {
	state = normal
}

// finish this ^^^

}