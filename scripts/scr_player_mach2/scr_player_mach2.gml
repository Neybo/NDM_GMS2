// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_mach2(){
	if movespeed < 12 and grounded
		movespeed += 0.1
	if movespeed >= 12 {
		state = states.mach3
		sprite_index = spr_player_mach3
	}
	image_speed = 0.6
	if sprite_index != spr_player_mach2 and sprite_index != spr_player_mach1 and sprite_index != spr_player_mach2jump and sprite_index != spr_player_mach2jumpstart and sprite_index != spr_player_machspin {
		sprite_index = spr_player_mach2
		image_index = 0
	}
	if sprite_index = spr_player_mach1 and floor(image_index) = image_number - 1 {
		sprite_index = spr_player_mach2
		image_index = 0
	}
	hsp = xscale * movespeed
	landanim = false
	jumpanim = false
	if !grounded {
		if sprite_index != spr_player_mach2jump and sprite_index != spr_player_mach2jumpstart and sprite_index != spr_player_machspin {
			sprite_index = spr_player_mach2jumpstart
			image_index = 0
		}
		if sprite_index = spr_player_mach2jumpstart and floor(image_index) = image_number - 1 {
			sprite_index = spr_player_mach2jump
			image_index = 0
		}
	}
	else if sprite_index = spr_player_mach2jump or sprite_index = spr_player_mach2jumpstart
		sprite_index = spr_player_mach2
	if grounded and sprite_index = spr_player_machspin
		sprite_index = spr_player_mach2
	if grounded and !key_mach {
		state = states.machslide
		sprite_index = spr_player_mach2slidestart
		image_index = 0
		scr_soundeffect(sfx_machslide)
	}
	if grounded and move = -xscale {
		state = states.machslide
		sprite_index = spr_player_mach2turn
		image_index = 0
		scr_soundeffect(sfx_machslide)
	}
	if (grounded && (!scr_slope()) && place_meeting((x + hsp), y, obj_solid) && (!(place_meeting((x + sign(hsp)), y, obj_slope)))) {
		state = states.normal
		image_index = 0
	}
	if (((!grounded) and place_meeting((x + hsp), y, obj_solid) and (!(place_meeting((x + sign(hsp)), y, obj_slope)))) || (grounded and place_meeting((x + hsp), (y - 64), obj_solid) and place_meeting(x, (y + 1), obj_slope))) {
		state = states.climbwall
		image_index = 0
		climbbuffer = 10
	}
	if key_attack {
		state = states.attack
		with instance_create_depth(x,y,depth,obj_punchhitbox)
			playerid = id
	}
	if !instance_exists(obj_speedlines)
		instance_create_depth(x,y,depth + 1,obj_speedlines)
	if !instance_exists(obj_mach2cloud) and grounded
		instance_create_depth(x,y,depth + 1,obj_mach2cloud)
	if grounded and key_jump {
		vsp = -11
		scr_soundeffect(sfx_jump)
	}
	if trailbuffer < 0 and movespeed > 2 {
		trailbuffer = 4
		with instance_create_depth(x,y,depth + 2,obj_afterimageeffect) {
			image_xscale = other.image_xscale
			sprite_index = other.sprite_index
			image_index = other.image_index - 1
		}
	}
	scr_dotaunt()
}