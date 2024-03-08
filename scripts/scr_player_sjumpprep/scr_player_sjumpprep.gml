// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_sjumpprep() {
	if sprite_index != spr_player_Sjumpprepright and sprite_index != spr_player_Sjumpprep and sprite_index != spr_player_Sjumpprepstart {
		sprite_index = spr_player_Sjumpprepstart
		image_index = 0
	}
	if sprite_index != spr_player_Sjumpprepstart {
		if move != 0
			sprite_index = spr_player_Sjumpprepright
		else
			sprite_index = spr_player_Sjumpprep
		hsp = xscale * movespeed
		movespeed = 6
		image_speed = 0.45
		if move != 0 {
			xscale = move
			if movespeed < 3
				movespeed += 0.1
		}
		else
			movespeed = 0
		if !key_up and grounded {
			state = states.sjump
			scr_soundeffect(sfx_sjumpstart)
			vsp = -6
			instance_create_depth(x,y,depth - 1,obj_sjumplauncheffect)
		}
		if movespeed > 3
			movespeed = 3
	}
	else {
		if floor(image_index) = image_number - 1
			sprite_index = spr_player_Sjumpprep
		hsp = xscale * movespeed
		if movespeed > 0
			movespeed -= 0.45
	}
	if movespeed < 0
		movespeed = 0
	landanim = false
	jumpanim = false
	image_speed = 0.35
}