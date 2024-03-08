function scr_soundeffect(argument0) {
	var sound = argument0
	if audio_is_playing(sound)
		audio_stop_sound(sound)
	audio_play_sound(sound,0.6,0)



}
