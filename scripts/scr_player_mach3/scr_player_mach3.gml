// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_mach3(){
	
	if movespeed < 12
		movespeed = 12
	if movespeed < 18 {
		image_speed = 0.35
		if sprite_index != spr_player_mach3 and sprite_index != spr_player_mach3jump
			sprite_index = spr_player_mach3
		if floor(image_index) = image_number - 1 and sprite_index = spr_player_mach3jump
			sprite_index = spr_player_mach3
	}
	else {
		image_speed = 1
		sprite_index = spr_player_mach4
		if !instance_exists(obj_crazyruneffect)
			instance_create_depth(x, y, depth + 1, obj_crazyruneffect)
		if !instance_exists(obj_crazyruneffectother)
			instance_create_depth(x, y, depth + 1, obj_crazyruneffectother)
	}
	
	if !instance_exists(obj_mach3effect)
		instance_create_depth(x, y, depth - 1, obj_mach3effect)
		
	if !instance_exists(obj_speedlines)
		instance_create_depth(x, y, depth + 1, obj_speedlines)
		
	hsp = xscale * movespeed
	landanim = false
	jumpanim = false
	if grounded
	{
		if movespeed < 24 and move = xscale
			movespeed += 0.1
		if movespeed > 12 and move != xscale
			movespeed -= 0.075
			
		if !key_mach {
			state = states.machslide
			sprite_index = spr_player_mach2slidestart
			image_index = 0
			scr_soundeffect(sfx_machslide)
		}
		if move = -xscale {
			state = states.machslide
			sprite_index = spr_player_mach3turn
			image_index = 0
			scr_soundeffect(sfx_machslide)
		}
		
		if !scr_slope() && place_meeting(x + hsp, y, obj_solid) 
		&& !place_meeting(x + sign(hsp), y, obj_slope) {
			state = states.mach3bump
			image_index = 0
			sprite_index = spr_player_mach3bump
			vsp = -3
			movespeed = 12
			scr_soundeffect(sfx_hitwall)
		}
		
		if key_up2 {
			state = states.sjumpprep
			scr_soundeffect(sfx_sjumpprepstart)
		}
		
		if key_jump && state == states.mach3 {
			vsp = -11
			scr_soundeffect(sfx_jump)
			sprite_index = spr_player_mach3jump
			image_index = 0
		}
		
		if !instance_exists(obj_mach3cloud)
			instance_create_depth(x, y, depth + 1, obj_mach3cloud)
	}
	if key_attack {
		state = states.attack
		with instance_create_depth(x,y,depth,obj_punchhitbox)
			playerid = id
	}
	if (!grounded and place_meeting(x + hsp, y, obj_solid) 
	and (!place_meeting(x + sign(hsp), y, obj_slope))) 
	|| (grounded and place_meeting(x + hsp, y - 64, obj_solid) 
	and place_meeting(x, y + 1, obj_slope)) {
		state = states.climbwall
		image_index = 0
		climbbuffer = 10
	}
	if trailbuffer < 0 {
		trailbuffer = 4
		with instance_create_depth(x,y,depth + 2,obj_afterimageeffect) {
			image_xscale = other.image_xscale
			sprite_index = other.sprite_index
			image_index = other.image_index - 1
		}
	}
	
	scr_dotaunt()
}