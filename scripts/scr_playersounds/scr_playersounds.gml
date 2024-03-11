function scr_playersounds() {
	if state = states.mach2 and grounded {
		if !audio_is_playing(sfx_mach2)
			scr_soundeffect(sfx_mach2)
	}
	else if audio_is_playing(sfx_mach2)
		audio_stop_sound(sfx_mach2)
	if state = states.mach3 {
		audio_stop_sound(sfx_mach2)
		if !audio_is_playing(sfx_mach3)
			scr_soundeffect(sfx_mach3)
	}
	else if audio_is_playing(sfx_mach3)
		audio_stop_sound(sfx_mach3)
	if sprite_index = spr_player_mach4 {
		audio_stop_sound(sfx_mach3)
		if !audio_is_playing(sfx_mach4)
			scr_soundeffect(sfx_mach4)
	}
	else if audio_is_playing(sfx_mach4)
		audio_stop_sound(sfx_mach4)
}
