// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_mach3bump(){
	landanim = false
	jumpanim = false
	if sprite_index != spr_player_bump
	sprite_index = spr_player_mach3bump
	hsp = -xscale * movespeed
	if movespeed > 0
		movespeed -= 0.35
	if movespeed < 0
		movespeed = 0
	if floor(image_index) = image_number - 1 {
		image_speed = 0
		if grounded {
			state = states.normal
			movespeed = 0
		}
	}
	else
		image_speed = 0.35
}