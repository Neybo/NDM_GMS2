if global.smoothcamera {
	targetx = lerp(targetx,target.x,0.25)
	targety = lerp(targety,target.y,0.25)
}
else {
	targetx = target.x
	targety = target.y
}
targetx = clamp(targetx,480 / zoom,room_width - 480 / zoom)
targety = clamp(targety,270 / zoom,room_height - 270 / zoom)
camera_set_view_pos(view_camera[0],targetx - 480 / zoom,targety - 270 / zoom)

camera_set_view_size(view_camera[0], 960 / zoom, 540 / zoom)
camera_set_view_angle(view_camera[0], angle)

if keyboard_check(ord("P"))
	zoom += 0.05;
else if keyboard_check(ord("O"))
	zoom -= 0.05;
else if keyboard_check(ord("L"))
	zoom = 1;
if keyboard_check(ord("I"))
	angle += 1;
else if keyboard_check(ord("U"))
	angle -= 1;
else if keyboard_check(ord("K"))
	angle = 0;
