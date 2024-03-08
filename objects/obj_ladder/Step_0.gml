if place_meeting(x,y-1,obj_player){
	with obj_player {
		if key_down and grounded and place_meeting(x,y + 1,obj_platform) {
			state = states.ladder
			y += 5;
			x = other.x + 16
			y = floor(y);
			vsp = 1
			if y % 2 == 1
				y -= 1
		}
	}	
}
