function scr_player_normal() {
	//player's normal/on ground state
	image_speed = 0.35
	hsp = move * movespeed
	if move != 0
	{
		facehurtanim = 0
		xscale = move
	}
	if move = 0 {
		movespeed = 0
		if jumpanim = false and landanim = false
		{
			if sprite_index != spr_player_facehurtup && sprite_index != spr_player_facehurt
			sprite_index = spr_player_idle
			else
			{
				if facehurtanim > 0
				facehurtanim--
				else
					sprite_index = spr_player_idle
				if floor(image_index) = image_number - 1 && sprite_index = spr_player_facehurtup
				{
					sprite_index = spr_player_facehurt
					image_index = 0
				}
			}
		}
	}
	else {
		if movespeed < 6
			movespeed += 0.5
		if jumpanim = false and landanim = false
			sprite_index = spr_player_walk
	}
	if key_jump {
		vsp = -11
		state = states.jump
		jumpanim = true
		landanim = false
		sprite_index = spr_player_jump
		image_index = 0
		scr_soundeffect(sfx_jump)
	}
	if !grounded {
		state = states.jump
		jumpanim = false
		landanim = false
	}
	if key_down {
		state = states.crouch
		image_index = 0
		landanim = false
		jumpanim = false
	}
	if key_attack {
		state = states.attack
		with instance_create_depth(x,y,depth,obj_punchhitbox)
			playerid = id
	}
	if (grounded and key_mach and (!(scr_solid(x + xscale,y) and !scr_slope()))) {
		state = states.mach2
		image_index = 0
		sprite_index = spr_player_mach1
		movespeed = 4
	}
	scr_dotaunt()



}
