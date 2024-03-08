x = obj_player.x
y = obj_player.y
image_xscale = obj_player.image_xscale
image_speed = 0.75
if obj_player.state != states.mach3 and obj_player.state != states.mach2
	instance_destroy()
