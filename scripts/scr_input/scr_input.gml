function scr_input() {
	
	key_right = keyboard_check(vk_right)
	key_left = -keyboard_check(vk_left)
	
	key_jump = keyboard_check_pressed(ord("W")) or keyboard_check_pressed(ord("Y"))
	key_jumph = keyboard_check(ord("W")) or keyboard_check(ord("Y"))
	
	key_down = keyboard_check(vk_down)
	key_down2 = keyboard_check_pressed(vk_down)
	
	key_up = keyboard_check(vk_up)
	key_up2 = keyboard_check_pressed(vk_up)
	
	key_attack = keyboard_check_pressed(ord("X"))
	key_taunt = keyboard_check_pressed(ord("C"))
	key_mach = keyboard_check(vk_shift)

}
