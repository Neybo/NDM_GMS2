//"I call this old school!"
if obj_player.bbox_bottom < y && !created
{
	created = 1
	with instance_create_depth(x, y, 6, obj_onewayslope)
	{
		image_xscale = other.image_xscale
		image_yscale = other.image_yscale
	}
}
with obj_player
{
	if place_meeting(x, y + 1, obj_platform) && !place_meeting(x, y + 1, obj_platformslope) && grounded
	{
		with other
		{
			created = 1
			with instance_create_depth(x, y, 6, obj_onewayslope)
			{
				image_xscale = other.image_xscale
				image_yscale = other.image_yscale
			}
		}
	}
}