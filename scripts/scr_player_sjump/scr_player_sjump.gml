// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_sjump(){
	sprite_index = spr_player_Sjump
	landanim = false
	jumpanim = false
	image_speed = 0.45
	movespeed = 0
	hsp = 0
	if vsp > -15
		vsp--
	if place_meeting(x,y-1,obj_solid) {
		state = states.normal
		vsp = 0
	}
	if key_attack {
		state = states.mach2
		sprite_index = spr_player_machspin
		image_index = 0
		movespeed = 10
		vsp = -9
		scr_soundeffect(sfx_sjumpcancel)
		if move != 0
			xscale = move
		instance_create_depth(x,y,depth + 1,obj_sjumpcanceleffect)
	}
	if trailbuffer < 0 and movespeed > 2 {
		trailbuffer = 4
		with instance_create_depth(x,y,depth + 2,obj_afterimageeffect) {
			image_xscale = other.image_xscale
			sprite_index = other.sprite_index
			image_index = other.image_index - 1
		}
	}
}