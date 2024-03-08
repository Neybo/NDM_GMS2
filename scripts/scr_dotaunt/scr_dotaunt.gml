function scr_dotaunt() {
	if key_taunt and state != states.taunt {
		storedhsp = hsp
		storedvsp = vsp
		storedstate = state
		storedsprite = sprite_index
		storedimgindex = image_index
		image_index = random_range(0,11)
		taunttimer = 20
		state = states.taunt
		scr_soundeffect(sfx_taunt)
		instance_create_depth(x,y,depth,obj_taunteffect)
	}


}
