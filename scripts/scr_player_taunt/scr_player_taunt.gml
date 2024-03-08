function scr_player_taunt() {
	//player's taunting state
	hsp = 0
	vsp = 0
	landanim = false
	jumpanim = false
	sprite_index = spr_player_taunt
	taunttimer--
	if taunttimer < 0 {
		state = storedstate
		hsp = storedhsp
		vsp = storedvsp
		image_index = storedimgindex
		sprite_index = storedsprite
	}


}
