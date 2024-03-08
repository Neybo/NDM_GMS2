// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_machslide(){
	image_speed = 0.35
	landanim = false
	jumpanim = false
	hsp = xscale * movespeed
	if movespeed > 0
		movespeed -= 0.35
	if movespeed < 0
		movespeed = 0
	if sprite_index = spr_player_mach2slidestart and floor(image_index) = image_number - 1 {
		sprite_index = spr_player_mach2slide
		image_index = 0
	}
	if sprite_index = spr_player_mach2slide and floor(image_index) = image_number - 1 {
		sprite_index = spr_player_mach2slideend
		image_index = 0
	}
	if sprite_index = spr_player_mach2slideend and floor(image_index) = image_number - 1 {
		sprite_index = spr_player_idle
		image_index = 0
		state = states.normal
		movespeed = 0
	}
	if sprite_index = spr_player_mach2turn and floor(image_index) = image_number - 1 {
		sprite_index = spr_player_mach2
		image_index = 0
		if movespeed < 6
			movespeed = 6
		state = states.mach2
		xscale *= -1
	}
	if sprite_index = spr_player_mach3turn and floor(image_index) = image_number - 1 {
		sprite_index = spr_player_mach3
		image_index = 0
		state = states.mach3
		xscale *= -1
		movespeed = 12
	}
	if place_meeting(x + hsp, y, obj_solid) && !scr_slope()
	{
		state = states.mach3bump
		sprite_index = spr_player_bump
		image_index = 0
	}
}