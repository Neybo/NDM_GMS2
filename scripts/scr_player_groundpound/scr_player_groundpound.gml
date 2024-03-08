// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_groundpound(){
	if sprite_index != spr_player_groundpound and sprite_index != spr_player_groundpoundstart and sprite_index != spr_player_groundpoundland and sprite_index != spr_player_groundpoundjump {
		sprite_index = spr_player_groundpoundstart
		image_index = 0
		vsp = -5
	}
	landanim = false
	jumpanim = false
	image_speed = 0.55
	if sprite_index != spr_player_groundpoundland
		movespeed = 4
	hsp = move * movespeed
	if vsp < -3
		vsp = -3
	if vsp < 20
		vsp += grav / 2
	if floor(image_index) = image_number - 1 {
		if sprite_index = spr_player_groundpoundstart
			sprite_index = spr_player_groundpound
		if sprite_index = spr_player_groundpoundland
		{
			if key_jumph
			{
				state = states.jump
				vsp = -11
				sprite_index = spr_player_groundpoundjump
				image_index=  0
			}
			else
			{
				state = states.normal
				sprite_index = spr_player_facehurtup
				image_index = 0
				facehurtanim = 100
			}
		}
	}
	if move != 0
		xscale = move
	if grounded 
	{
		if sprite_index != spr_player_groundpoundland and sprite_index != spr_player_groundpoundjump and sprite_index != spr_player_facehurtup
		{
			image_index = 0
			sprite_index = spr_player_groundpoundland
			scr_soundeffect(sfx_hitwall)
			with instance_create_depth(x,y + 10,depth + 1,obj_sjumpcanceleffect) 
			{
				image_speed = 0.5
				sprite_index = spr_groundpoundeffect
			}
		}
		else
			hsp = 0
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