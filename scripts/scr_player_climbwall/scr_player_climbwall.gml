// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_climbwall(){
	landanim = false
	jumpanim = false
	vsp  = -movespeed
	//if movespeed > 0
	//	movespeed -= 0.25
	if movespeed < 0
		movespeed = 0
	if place_meeting(x,y-1,obj_solid) or (!key_mach and climbbuffer < 0)
		state = states.normal
	if place_meeting(x + xscale,y,obj_slope) or !place_meeting(x + xscale,y,obj_solid) {
		state = states.mach2
		vsp = 0
	}
	image_speed = 0.45
	sprite_index = spr_player_climbwall
	if key_jump {
		state = states.mach2
		xscale *= -1
		movespeed = 9
		vsp = -11
		scr_soundeffect(sfx_jump)
	}
}