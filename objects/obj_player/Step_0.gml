scr_input()
move = key_left + key_right
image_xscale = xscale
scr_playerstates()
scr_playersounds()
if place_meeting(x,y,obj_solid) or state = states.crouch or state = states.crouchjump
	mask_index = spr_player_crouchhitbox
else
	mask_index = spr_player_hitbox
if place_meeting(x, y, obj_onewayslope) && !place_meeting(x, y + 1, obj_onewayslope)
{
with instance_place(x, y, obj_onewayslope)
{
	instance_destroy()
}
}
scr_collide()
trailbuffer--
climbbuffer--