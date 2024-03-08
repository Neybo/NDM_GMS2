function scr_playerstates() {
	//here is the switch statement for the player's states
	switch state {
		case states.normal: scr_player_normal() break
		case states.jump: scr_player_jump() break
		case states.crouch: scr_player_crouch() break
		case states.crouchjump: scr_player_crouchjump() break
		case states.ladder: scr_player_ladder() break
		case states.taunt: scr_player_taunt() break
		case states.attack: scr_player_attack() break
		case states.mach2: scr_player_mach2() break
		case states.climbwall: scr_player_climbwall() break
		case states.machslide: scr_player_machslide() break
		case states.mach3: scr_player_mach3() break
		case states.mach3bump: scr_player_mach3bump() break
		case states.sjump: scr_player_sjump() break
		case states.sjumpprep: scr_player_sjumpprep() break
		case states.groundpound: scr_player_groundpound() break
	}
	//here is the thingymadink that handles the jumpanim and landanim
	if landanim = true {
		if sprite_index != spr_player_land and sprite_index != spr_player_land2 {
			if move = 0
				sprite_index = spr_player_land
			else
				sprite_index = spr_player_land2
			image_index = 0
		}
		if sprite_index = spr_player_land and move != 0
			sprite_index = spr_player_land2
		if sprite_index = spr_player_land2 and move = 0
			sprite_index = spr_player_land
	}
	if floor(image_index) = image_number - 1 and (sprite_index = spr_player_land or sprite_index = spr_player_land2) {
		landanim = false
		if move = 0
			sprite_index = spr_player_idle
		else
			sprite_index = spr_player_walk
	}
	if jumpanim = true {
		if floor(image_index) = image_number - 1 {
			jumpanim = false	
		}
	}




}
